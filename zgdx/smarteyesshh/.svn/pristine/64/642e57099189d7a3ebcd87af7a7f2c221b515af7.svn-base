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
    static Connection con1 = null;
    static Connection con2 = null;
    static Connection con3 = null;

    static {
        String url = String.format(
                "jdbc:mysql://124.127.117.104:3306/%s?user=%s&password=%s&useUnicode=true&characterEncoding=UTF8",
                database, user, password
        );
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con1 = DriverManager.getConnection(url);
            con2 = DriverManager.getConnection(url);
            con3 = DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


    public static void batchInsert(List<String> data) throws SQLException, IOException {
        String sql1 = "insert into t_contact_info(id, other, type, start_time, duration, location) values(?,?,?,?,?,?);";
        String sql2 = "insert into t_contact_day_list(id, datelabel, type, list) values(?,?,?,?);";
        String sql3 = "insert into t_mapping values(?,?);";
        PreparedStatement ps1 = con1.prepareStatement(sql1);
        PreparedStatement ps2 = con2.prepareStatement(sql2);
        PreparedStatement ps3 = con3.prepareStatement(sql3);
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
        con1.close();
        con2.close();
        con3.close();
    }

    public static void main(String[] args) throws IOException, SQLException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\output.txt")));
        String line;
        List<String> data = new LinkedList<>();
        while ((line = reader.readLine()) != null) {
            data.add(line);
        }
        batchInsert(data);
    }
}
