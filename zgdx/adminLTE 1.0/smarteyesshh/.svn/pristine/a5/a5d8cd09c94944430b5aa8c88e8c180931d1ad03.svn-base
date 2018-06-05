package cn.com.ctbri.smarteyesshh.dataextract.kv;

import cn.com.ctbri.smarteyesshh.dataextract.AESUtil;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;


/**
 * @author zeromem
 * @date 2018/1/17
 */
public class LocalFile2DB {
    public static void main(String[] args) throws IOException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        List<String> data;
        try (
                BufferedReader reader = new BufferedReader(
                        new InputStreamReader(new FileInputStream("D:\\output.txt"))
                )
        ) {
            String line;
            reader.readLine(); // skip header.
            data = new LinkedList<>();
            while ((line = reader.readLine()) != null) {
//                String value = line.split("\\s+")[1];
//                String plain = AESUtil.aesDecrypt(AESUtil.KEY, value);
                String plain = line;
                // 数据长度超过mysql TEXT限制，截断
                if (plain.length() > 65535) {
                    plain = plain.substring(0, plain.indexOf(',', 65450));
                }
                System.out.println(plain);
                data.add(plain);
            }
        }
        MysqlUtil.batchInsertCdrData(data);
    }
}
