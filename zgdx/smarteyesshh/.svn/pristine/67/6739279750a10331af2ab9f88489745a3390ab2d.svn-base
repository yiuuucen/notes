package cn.com.ctbri.smarteyesshh.dataextract.kv;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * @author zeromem
 * @date 2018/1/10
 */
public class MysqlUtil {
    private static final String database = "smarteyesshh";
    private static final String user = "smarteyesshh";
    private static final String password = "smarteyesshh2018";
    static Connection conInfo = null;
    static Connection conList = null;
    static Connection conMap = null;
    static Connection conPcmd = null;
    static Connection conSuspect = null;

    static {
        String url = String.format(
                "jdbc:mysql://124.127.117.104:3306/%s?user=%s&password=%s&useUnicode=true&characterEncoding=UTF8",
                database, user, password
        );
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conInfo = DriverManager.getConnection(url);
            conList = DriverManager.getConnection(url);
            conMap = DriverManager.getConnection(url);
            conPcmd = DriverManager.getConnection(url);
            conSuspect = DriverManager.getConnection(url);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close() throws SQLException {
        conInfo.close();
        conList.close();
        conMap.close();
        conSuspect.close();
        conPcmd.close();
    }


    public static void batchInsertCdrData(List<String> data) throws SQLException, IOException {
        String sql1 = "INSERT INTO t_contact_info(id, other, type, start_time, duration, location) VALUES(?,?,?,?,?,?);";
        String sql2 = "INSERT INTO t_contact_day_list(id, datelabel, type, list) VALUES(?,?,?,?);";
        String sql3 = "INSERT INTO t_mapping VALUES(?,?);";
        PreparedStatement ps1 = conInfo.prepareStatement(sql1);
        PreparedStatement ps2 = conList.prepareStatement(sql2);
        PreparedStatement ps3 = conMap.prepareStatement(sql3);
        int[] counts = new int[3];
        for (String line : data) {
            String[] arr = line.split("\\s+");
            if (arr.length == 7) {
                ps1.setString(6, arr[5] + "_" + arr[6]);
                ps1.setString(1, arr[0]);
                ps1.setString(2, arr[1]);
                ps1.setInt(3, Integer.valueOf(arr[2]));
                ps1.setString(4, arr[3]);
                ps1.setInt(5, Integer.valueOf(arr[4]));
                ps1.addBatch();
                counts[0]++;
            } else if (arr.length == 4) {
                ps2.setString(1, arr[0]);
                ps2.setString(2, arr[1]);
                ps2.setInt(3, Integer.valueOf(arr[2]));
                ps2.setString(4, arr[3].replace('_', ','));
                ps2.addBatch();
                counts[1]++;
            } else if (arr.length == 2) {
                ps3.setString(1, arr[1]);
                ps3.setString(2, arr[0]);
                ps3.addBatch();
                counts[2]++;
            } else {
                System.out.print("Wrong arr size.");
            }
        }
        System.out.println("each type's records size: " + Arrays.toString(counts));
        ps1.executeBatch();
        ps2.executeBatch();
        ps3.executeBatch();

        ps1.close();
        ps2.close();
        ps3.close();
        conInfo.close();
        conList.close();
        conMap.close();
    }


    public static void batchInsertPcmdData(List<String> data) throws SQLException, IOException {
        String sql = "INSERT INTO t_location(pcmd_encrypt_id, calltime, location) VALUES(?,?,?);";
        PreparedStatement ps = conPcmd.prepareStatement(sql);
        int count = 0;
        for (String line : data) {
            String[] arr = line.split("\\s+");
            ps.setString(1, arr[0]);
            ps.setString(2, arr[1].substring(0, 14));
            ps.setString(3, arr[2] + "_" + arr[3]);
            ps.addBatch();
            count++;
        }
        System.out.println("location records size: " + count);
        ps.executeBatch();

        ps.close();
        conPcmd.close();
    }

    public static void batchUpdateEncryptMdn(List<String> data) throws SQLException {
        String sql = "UPDATE t_mapping SET mdn_encrypt = ? WHERE mdn = ?;";
        PreparedStatement ps = conSuspect.prepareStatement(sql);
        int count = 0;
        for (String line : data) {
            String[] arr = line.split("_");
            String mdn = arr[0];
            String mdnEncrypt = arr[1];
            ps.setString(1, mdnEncrypt);
            ps.setString(2, mdn);
            ps.addBatch();
            count++;
        }
        System.out.println("update mdn encrypt records size: " + count);
        ps.executeBatch();
        ps.close();
        conSuspect.close();
    }

    public static void batchInsertSuspect(List<String> data) throws SQLException {
        String sql = "INSERT INTO t_suspect(mdn_encrypt, type) VALUES (?,?) ON DUPLICATE KEY UPDATE type=concat(type,?)";
        PreparedStatement ps = conSuspect.prepareStatement(sql);
        int count = 0;
        for (String line : data) {
            String[] arr = line.split("_");
            String mdnEncrypt = arr[0];
            String type = arr[1];
            ps.setString(1, mdnEncrypt);
            ps.setString(2, type);
            ps.setString(3, "," + type);
            ps.addBatch();
            count++;
        }
        System.out.println("suspect records size: " + count);
        ps.executeBatch();
        ps.close();
        conSuspect.close();
    }

    public static void main(String[] args) throws IOException, SQLException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\output.txt")));
        String line;
        List<String> data = new LinkedList<>();
        while ((line = reader.readLine()) != null) {
            data.add(line);
        }
        batchInsertCdrData(data);
    }
}
