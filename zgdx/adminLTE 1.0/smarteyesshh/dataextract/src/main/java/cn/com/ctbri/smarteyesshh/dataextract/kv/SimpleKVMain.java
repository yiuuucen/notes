package cn.com.ctbri.smarteyesshh.dataextract.kv;

import cn.com.ctbri.smarteyesshh.dataextract.AESUtil;
import com.alibaba.fastjson.JSONObject;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

/**
 * @author zeromem
 * @date 2018/1/10
 * 从上海平台kv取数，账号、密码、token、基础代码是全硕之前给的
 * 数据存在上海dengta_main的kv表中，
 * 取数时，发送http请求，指定一个key，返回内容中包含key对应的value。
 * 返回内容是base64编码的，需要先解码一次，才得到自己存入的内容。
 *
 * 两类数据：联系人信息、位置信息。（参看daily_task脚本）
 * key规则：
 * smarteyes_20180402_count 表示20180402这天处理得到的联系人数据的条数
 * smarteyes_20180402_loc_count 表示20180402这天处理得到的位置数据的条数
 *
 * smarteyes_20180402_${i} 表示这天第i条联系人数据（i小于count）
 * smarteyes_20180402_loc_${i} 表示这天第i条位置数据(i小于count)
 *
 * 取回来的数据，base64解码后，是加密数据(参看daily_task的EncryptResult4KV.scala)，需要解密
 * AESUtil为解密工具代码。解密时，密匙一定要和EncryptResult4KV.scala中的相同
 * EncryptResult4KV 和EncryptPcmdResult4KV功能相同，只是处理的数据不同。
 * EncryptResult4KV处理联系人信息，EncryptPcmdResult4KV处理位置信息。
 *
 *
 * 解密后为明文数据，可调用MysqlUtil工具代码，向mysql中插入数据。
 *
 */
public class SimpleKVMain {
    public static final String username = "research_beijing";
    public static final String password = "adfj12xj";
    public static final String apiKey = "f1fbc34113dc9af2f2cfca56157d00dc";
    public static final String table = "dengta_main";
    private static String sign;
    private static String token;

    private static String TOKEN_URL = "http://61.129.39.71/telecom-dmp/getToken?apiKey=%s&sign=%s";
    private static String KV_URL = "http://61.129.39.71/telecom-dmp/kv/getValueByKey?token=%s&table=%s&key=%s";

    static {
        try {
            sign = StrUtils.kvSign(password, username + apiKey);
            token = JSONObject.parseObject(get(String.format(TOKEN_URL, apiKey, sign))).getString("result");
            System.out.println("sign: " + sign);
            System.out.println("token: " + token);
        } catch (NoSuchAlgorithmException | InvalidKeyException | IOException e) {
            System.out.println("Exception! exit.");
            e.printStackTrace();
            System.exit(2);
        }
    }


    /**
     * @param args args[0]需要指定一个文件输出路径，将取回来的数据临时存放，用于debug，无他用。
     */
    public static void main(String[] args) throws IOException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        if (args == null || args[0].equals("")) {
            System.out.println("please input output path to store result.");
            System.exit(1);
        }

        String cdrOutput = args[0];
        String pcmdOutput = cdrOutput + ".pcmd";
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        date = "20180331";
        kvCdrData(cdrOutput, date);
        kvLocationData(pcmdOutput, date);
    }


    /**
     * kv联系人数据
     * @param output
     * @param date
     * @throws IOException
     * @throws IllegalBlockSizeException
     * @throws InvalidKeyException
     * @throws BadPaddingException
     * @throws NoSuchAlgorithmException
     * @throws NoSuchPaddingException
     * @throws SQLException
     */
    public static void kvCdrData(String output, String date) throws IOException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        String cdrKeyCount = "smarteyes_" + date + "_count";

        // smarteyes_YESTERDAY_count -> records size.
        String urlCount = String.format(KV_URL, token, table, cdrKeyCount);
        JSONObject jo = JSONObject.parseObject(get(urlCount)).getJSONObject("result");
        if (jo == null) {
            System.out.println("No Cdr Count Information.");
            return;
        }
        String baseCount = jo.getString("value");
        Integer count = Integer.valueOf(baseDecode(baseCount));

        if (count == null) {
            System.out.println("No cdr count information.");
            return;
        }
        System.out.println("cdr kv records size: " + count);

        // hold all result.
        List<String> data = new LinkedList<>();
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(output)));

        for (int i = 0; i < count; i++) {
            String key = "smarteyes_" + date + "_" + i;
            String url = String.format(KV_URL, token, table, key);
            String response = get(url);
            JSONObject res = JSONObject.parseObject(response).getJSONObject("result");
            if (res == null) {
                System.out.println("no this key's result: " + key);
                continue;
            }
            String result = res.getString("value");

            // 上海kv做了一层base64编码, base解码后才是我们加密的数据
            String myEncrypt = baseDecode(result);

            String value = AESUtil.aesDecrypt(AESUtil.KEY, myEncrypt);
            // 数据长度超过mysql TEXT限制，截断
            if (value.length() >= 65535) {
                value = value.substring(0, value.indexOf(',', 65450));
            }
            System.out.println(key + "=== " + value);
            writer.write(value + "\n");
            data.add(value);
        }
        writer.close();
        MysqlUtil.batchInsertCdrData(data);
        System.out.println("cdr kv over.");
    }


    /**
     * kv位置数据
     * @param output
     * @param date
     * @throws IOException
     * @throws IllegalBlockSizeException
     * @throws InvalidKeyException
     * @throws BadPaddingException
     * @throws NoSuchAlgorithmException
     * @throws NoSuchPaddingException
     * @throws SQLException
     */
    public static void kvLocationData(String output, String date) throws IOException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        String pcmdKeyCount = "smarteyes_" + date + "_loc_count";

        // smarteyes_YESTERDAY_loc_count -> records size.
        String urlCount = String.format(KV_URL, token, table, pcmdKeyCount);
        JSONObject jo = JSONObject.parseObject(get(urlCount)).getJSONObject("result");
        if (jo == null) {
            System.out.println("No pcmd Count Information.");
            return;
        }
        String baseCount = jo.getString("value");
        Integer count = Integer.valueOf(baseDecode(baseCount));

        if (count == null) {
            System.out.println("No pcmd count information.");
            return;
        }
        System.out.println("pcmd kv records size: " + count);

        // hold all result.
        List<String> data = new LinkedList<>();
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(output)));

        for (int i = 0; i < count; i++) {
            String key = "smarteyes_" + date + "_loc_" + i;
            String url = String.format(KV_URL, token, table, key);
            String response = get(url);
            JSONObject res = JSONObject.parseObject(response).getJSONObject("result");
            if (res == null) {
                System.out.println("no this key's result: " + key);
                continue;
            }
            String result = res.getString("value");

            // 上海kv做了一层base64编码, base解码后才是我们加密的数据
            String myEncrypt = baseDecode(result);

            String value = AESUtil.aesDecrypt(AESUtil.KEY, myEncrypt);
            System.out.println(key + "=== " + value);
            writer.write(value + "\n");
            data.add(value);
        }
        writer.close();
        MysqlUtil.batchInsertPcmdData(data);
        System.out.println("pcmd kv over.");
    }


    public static String baseDecode(String input) {
        return new String(Base64.getDecoder().decode(input));
    }

    public static String get(String s) throws IOException {
        URL url = new URL(s);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String line;
        StringBuilder response = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();
        return response.toString();
    }
}
