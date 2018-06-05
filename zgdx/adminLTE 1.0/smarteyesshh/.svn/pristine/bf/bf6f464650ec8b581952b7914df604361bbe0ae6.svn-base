package cn.com.ctbri.ctbigdata.smarteyes.utils;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author zeromem
 * @date 2017/12/22
 * 将上海文本结果入到mysql
 */
public class LoadDataUtil {
    static Connection con1 = null;
    static Connection con2 = null;
    static {
        String url = "jdbc:mysql://124.127.117.104:3306/smarteyesshh?user=smarteyesshh&password=smarteyesshh2017&useUnicode=true&characterEncoding=UTF8";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con1 = DriverManager.getConnection(url);
            con2 = DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) throws IOException, SQLException {
        insert("D:\\坚果云\\我的坚果云\\电信研究院\\上海网安\\数据处理结果\\5cb24c0b05f7b3fa8065de9375f08d88b20d4a37a7c51bbfcaae06da72结果.txt");
    }

    public static void insert(String file) throws IOException, SQLException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
        String sql1 = "insert into t_contact_info(id, other, type, start_time, duration, location) values(?,?,?,?,?,?);";
        String sql2 = "insert into t_contact_list(id, type, month_list) values(?,?,?);";
        PreparedStatement ps1 = con1.prepareStatement(sql1);
        PreparedStatement ps2 = con2.prepareStatement(sql2);
        String line;
        while ((line = reader.readLine()) != null) {
            String[] arr = line.split("\\s+");
            if (arr.length == 7) {
                ps1.setString(1, arr[0]);
                ps1.setString(2, arr[1]);
                ps1.setInt(3, Integer.valueOf(arr[2]));
                ps1.setString(4, arr[3]);
                ps1.setInt(5, Integer.valueOf(arr[4]));
                ps1.setString(6, arr[5] + "_" + arr[6]);
                ps1.addBatch();
            } else if (arr.length == 3) {
                ps2.setString(1, arr[0]);
                ps2.setInt(2, Integer.valueOf(arr[1]));
                ps2.setString(3, arr[2].replace('_', ','));
                ps2.addBatch();
            } else {
                System.out.print("Wrong arr size!");
            }
            System.out.println();
        }
        ps1.executeBatch();
        ps2.executeBatch();

        ps1.close();
        ps2.close();
        con1.close();
        con2.close();
    }
}
