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


    public static void main(String[] args) throws IOException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        if (args == null || args[0].equals("")) {
            System.out.println("please input output path to store result.");
            System.exit(1);
        }
        String output = args[0];
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String keyCount = "smarteyes_" + date + "_count";

        // smarteyes_YESTERDAY_count -> records size.
        String urlCount = String.format(KV_URL, token, table, keyCount);
        JSONObject jo = JSONObject.parseObject(get(urlCount)).getJSONObject("result");
        if (jo == null) {
            System.out.println("No Count Information.");
            System.exit(3);
        }
        String baseCount = jo.getString("value");
        Integer count = Integer.valueOf(baseDecode(baseCount));

        if (count == null) {
            System.out.println("No count information.");
            return;
        }
        System.out.println("kv records size: " + count);

        // hold all result.
        List<String> data = new LinkedList<>();
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(output)));

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
            System.out.println(key + "=== " + value);
            writer.write(value + "\n");
            data.add(value);
        }
        writer.close();

        MysqlUtil.batchInsert(data);
        System.out.println("over.");
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