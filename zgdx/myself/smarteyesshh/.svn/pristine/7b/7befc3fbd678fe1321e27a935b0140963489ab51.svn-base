package cn.com.ctbri.smarteyesshh.dataextract;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.archivers.tar.TarArchiveInputStream;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.zip.GZIPInputStream;

/**
 * @author zeromem
 * @date 2017/11/20
 */
public class CC {
    private static final DruidDataSource source = new DruidDataSource();
    private static final HashMap<String, Summary> result = new HashMap<>();
    private static int INC = 0;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /*static {
        source.setDriverClassName("com.mysql.jdbc.Driver");
        source.setUsername("smarteyesshh");
        source.setPassword("smarteyesshh2017");
        source.setUrl("124.127.117.104");
        source.setInitialSize(5);
        source.setMinIdle(1);
        source.setMaxActive(50);

        // 为了防止长时间空闲后丢失connection
        source.setTestOnBorrow(false);
        source.setTestOnReturn(false);
        source.setTestWhileIdle(true);
        source.setValidationQuery("select 1");
        source.setTimeBetweenEvictionRunsMillis(60000);
        source.setNumTestsPerEvictionRun(10);
        source.setMinEvictableIdleTimeMillis(1800000);

        conn = source.getConnection();
        Runtime.getRuntime().addShutdownHook(new Thread(source::close));
    }*/


    public static void main(String[] args) throws IOException, SQLException {
        List<Path> list = Files.list(Paths.get("D:\\ctbri\\data")).collect(Collectors.toList());
        for (Path path : list) {
            if (path.toString().endsWith(".tar.gz")) {
                System.out.println(path);
                CC.processGz(path.toString());
            }
        }
        batchStore(result);
    }

    public static void processGz(String gzPath) {
        try (
                FileInputStream fis = new FileInputStream(new File(gzPath));
                GZIPInputStream gis = new GZIPInputStream(new BufferedInputStream(fis));
                TarArchiveInputStream tis = new TarArchiveInputStream(gis);
                InputStreamReader isr = new InputStreamReader(tis, "UTF-8");
                BufferedReader reader = new BufferedReader(isr)
        ) {
            TarArchiveEntry entry;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH");
            while ((entry = tis.getNextTarEntry()) != null) {
                if (entry.isFile() && entry.getName().startsWith("home/xjdxnoc/source/a1_cc_bdr/")) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] cc = line.split(",");
                        if (cc.length != 50) {
                            continue;
                        }
                        String calling = cc[9];
                        if (calling == null || calling.length() < 5) {
                            continue;
                        }
                        if (calling.startsWith("86")) {
                            calling = calling.substring(2);
                        }
                        String called = cc[12];
                        if (called == null || called.length() < 5) {
                            continue;
                        }
                        if (called.startsWith("86")) {
                            called = called.substring(2);
                        }
                        String key = calling + "_" + called;
                        result.putIfAbsent(key, Summary.createNew());
                        Summary summary = result.get(key);
                        Integer duration1 = Integer.valueOf(cc[45]);
                        Integer duration2 = Integer.valueOf(cc[46]);
                        Integer duration = 0;
                        if (duration1 > 0) {
                            duration = duration1;
                        } else if (duration2 > 0) {
                            duration = duration2;
                        }

                        // duration.
                        summary.duration += duration;

                        // under 15 seconds or above 3 minutes duration counter.
                        if (duration < 15 * 1000) {
                            summary.under15SecCounter++;
                        } else if (duration > 3 * 60 * 1000) {
                            summary.above3MinCounter++;
                        }

                        // work or rest call counter.
                        String dateStr = line.substring(0, 13);
                        LocalDateTime date = LocalDateTime.parse(dateStr, formatter);
                        DayOfWeek dayOfWeek = date.getDayOfWeek();
                        int hour = date.getHour();
                        if (hour >= 20 || hour <= 6 || dayOfWeek == DayOfWeek.SATURDAY || dayOfWeek == DayOfWeek.SUNDAY) {
                            summary.restCallCounter++;
                        } else {
                            summary.workCallCounter++;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void batchStore(HashMap<String, Summary> data) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:mysql://124.127.117.104:3306/smarteyesshh?user=smarteyesshh&password=smarteyesshh2017");
        System.out.println("data size: " + data.size() + " entries.");
        String sql = "INSERT INTO t_contact_summary(" +
                "calling, called, duration_length, msg_counter, work_call_counter, rest_call_counter, " +
                "under_fifteen_seconds_counter, above_three_min_counter, top_location) " +
                "VALUES (?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE " +
                "duration_length = duration_length + ?, msg_counter = msg_counter + ?, " +
                "work_call_counter = work_call_counter + ?, rest_call_counter = rest_call_counter + ?, " +
                "under_fifteen_seconds_counter = under_fifteen_seconds_counter + ?, " +
                "above_three_min_counter = above_three_min_counter + ?;";

        PreparedStatement ps = conn.prepareStatement(sql);
        for (Map.Entry<String, Summary> pair : data.entrySet()) {
            String key = pair.getKey();
            Summary summary = pair.getValue();
            String[] cc = key.split("_");
            ps.setString(1, cc[0]);
            ps.setString(2, cc[1]);
            ps.setInt(3, summary.duration.intValue());
            ps.setInt(4, summary.msgCounter.intValue());
            ps.setInt(5, summary.workCallCounter.intValue());
            ps.setInt(6, summary.restCallCounter.intValue());
            ps.setInt(7, summary.under15SecCounter.intValue());
            ps.setInt(8, summary.above3MinCounter.intValue());
            // 位置先不用做，后期接入上海数据再做真的
            ps.setString(9, "");
            ps.setInt(10, summary.duration.intValue());
            ps.setInt(11, summary.msgCounter.intValue());
            ps.setInt(12, summary.workCallCounter.intValue());
            ps.setInt(13, summary.restCallCounter.intValue());
            ps.setInt(14, summary.under15SecCounter.intValue());
            ps.setInt(15, summary.above3MinCounter.intValue());
            ps.addBatch();

            INC++;
            if (INC % 500 == 0) {
                System.out.println(INC + " process over.");
                ps.executeBatch();
            }
        }
        ps.executeBatch();

        ps.close();
        conn.close();
    }
}
