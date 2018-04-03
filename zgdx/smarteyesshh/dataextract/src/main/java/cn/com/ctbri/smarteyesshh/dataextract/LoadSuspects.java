package cn.com.ctbri.smarteyesshh.dataextract;

import cn.com.ctbri.smarteyesshh.dataextract.kv.MysqlUtil;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 * @author zeromem
 * @date 2018/3/19
 */
public class LoadSuspects {
    public static final String key = "smarteyesshh2018";

    public static void main(String[] args) throws SQLException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        String path = "D:\\坚果云\\我的坚果云\\电信研究院\\上海网安\\公安提供的数据.txt";

        List<String> data = new LinkedList<>();
        try (
                BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(path)))
        ) {
            reader.readLine();
            String line;
            while ((line = reader.readLine()) != null) {
                String[] arr = line.split("\\s+");
                if (arr.length < 2) {
                    continue;
                }
                String type = arr[0];
                String mdn = "86" + arr[1].trim();
                String mdn_encrypt = AESUtil.aesEncrypt(key, mdn);
                System.out.println(type + " " + mdn + " " + mdn_encrypt);
                data.add(mdn_encrypt + "_" + type);
            }
            MysqlUtil.batchInsertSuspect(data);
            MysqlUtil.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
