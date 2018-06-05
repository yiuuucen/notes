package cn.com.ctbri.smarteyesshh.dataextract;

import java.io.*;
import java.util.Arrays;
import java.util.HashSet;

/**
 * @author zeromem
 * @date 2018/1/19
 * 运营商归属
 */
public class OperatorBelong {
    static HashSet<String> mobile = new HashSet<>();
    static HashSet<String> unicom = new HashSet<>();
    static HashSet<String> telocm = new HashSet<>();
    static String MOBILE = "中国移动";
    static String UNICOM = "中国联通";
    static String TELCOM = "中国电信";
    static {
        mobile.addAll(Arrays.asList("134,135,136,137,138,139,150,151,152,157,158,159,147,182,183,184,187,188,1705,178".split(",")));
        unicom.addAll(Arrays.asList("130,131,132,145,155,156,185,186,176,1709,171,1708,1707,1718,1719".split(",")));
        telocm.addAll(Arrays.asList("133,153,180,181,189,1700,177,173".split(",")));
    }
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\坚果云\\我的坚果云\\电信研究院\\上海网安\\上海手机号5K.csv")));
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D:\\坚果云\\我的坚果云\\电信研究院\\上海网安\\上海手机号5K运营商.csv")));
        String line;
        reader.readLine();
        while ((line = reader.readLine()) != null) {
            String[] arr = line.split(",");
            if (arr.length <= 1) {
                continue;
            }
            String mdn = arr[1];

            if (mdn == null || mdn.equals("")) {
                continue;
            }
            String head3 = mdn.substring(0, 3);
            String out = line;
            if (mobile.contains(head3)) {
                out += MOBILE;
            } else if (unicom.contains(head3)) {
                out += UNICOM;
            } else if (telocm.contains(head3)) {
                out += TELCOM;
            } else {
                String head4 = mdn.substring(0, 4);
                if (mobile.contains(head4)) {
                    out += MOBILE;
                } else if (unicom.contains(head4)) {
                    out += UNICOM;
                } else if (telocm.contains(head4)) {
                    out += TELCOM;
                }
            }
            writer.write(out + "\n");
        }
        reader.close();
        writer.close();
    }
}
