package cn.com.ctbri.smarteyesshh.dataextract.kv;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import static cn.com.ctbri.smarteyesshh.dataextract.AESUtil.KEY;
import static cn.com.ctbri.smarteyesshh.dataextract.AESUtil.aesDecrypt;

/**
 * @author zeromem
 * @date 2018/2/27
 */
public class InsertPcmdID {
    private static final String database = "smarteyesshh";
    private static final String user = "smarteyesshh";
    private static final String password = "smarteyesshh2018";
    static Connection con = null;

    static {
        String url = String.format(
                "jdbc:mysql://124.127.117.104:3306/%s?user=%s&password=%s&useUnicode=true&characterEncoding=UTF8",
                database, user, password
        );
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException, SQLException {
        List<String> list = new LinkedList<>();
        String fileName = "D:\\坚果云\\我的坚果云\\电信研究院\\上海网安\\pcmd_mdn.encrypt.list";
        try (
                FileInputStream fis = new FileInputStream(fileName);
                InputStreamReader isr = new InputStreamReader(fis);
                BufferedReader reader = new BufferedReader(isr);

        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] arr = line.split("\t");
                String enPcmd = arr[0];
                String enMdn = arr[1];
                String shaPcmd = aesDecrypt(KEY, enPcmd);
                String plainMdn = aesDecrypt(KEY, enMdn);
                list.add(shaPcmd + "," + plainMdn);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        batchUpdate(list);
    }

    public static void batchUpdate(List<String> list) throws SQLException {
        String sql = "update t_mapping set pcmd_encrypt=? where mdn=?;";
        PreparedStatement ps = con.prepareStatement(sql);
        for (String pair : list) {
            String[] arr = pair.split(",");
            String pcmd = arr[0];
            String mdn = arr[1];
            ps.setString(1, pcmd);
            ps.setString(2, mdn);
            ps.addBatch();
        }
        ps.executeBatch();
        ps.close();
        con.close();
    }

}
