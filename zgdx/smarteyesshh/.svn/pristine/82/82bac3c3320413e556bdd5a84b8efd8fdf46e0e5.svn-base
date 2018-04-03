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
public class UpdateMdnEncrypt {
    public static void main(String[] args) throws IOException, IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        String path = "C:/Users/zeromem/Desktop/mdn.txt";
        try (
                BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(path)))
        ) {
            List<String> data = new LinkedList<>();
            String line;
            while ((line = reader.readLine()) != null) {
                String mdn = line.trim();
                String mdnEncrypt = AESUtil.aesEncrypt(LoadSuspects.key, mdn);
                data.add(mdn + "_" + mdnEncrypt);
            }
            MysqlUtil.batchUpdateEncryptMdn(data);
            MysqlUtil.close();
        }
    }
}
