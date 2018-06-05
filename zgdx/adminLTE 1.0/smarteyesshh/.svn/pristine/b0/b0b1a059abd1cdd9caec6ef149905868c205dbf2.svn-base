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
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;


/**
 * @author zeromem
 * @date 2018/1/17
 */
public class LocalFile2DB {
    public static void main(String[] args) throws IOException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\encrypt.contact_list")));
        String line;
        reader.readLine(); // skip header.
        int i = 0;
        List<String> data = new LinkedList<>();
        while ((line = reader.readLine()) != null) {
            String value = line.split("\\s+")[1];
            String plain = AESUtil.aesDecrypt(AESUtil.KEY, value);
            data.add(plain);
        }
        MysqlUtil.batchInsert(data);
    }

    public static String baseDecode(String input) {
        return new String(Base64.getDecoder().decode(input));
    }
}
