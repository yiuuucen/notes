package cn.com.ctbri.ctbigdata.smarteyes.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * Created by luis on 2017/12/2.
 */
public class ShuffleUtil {
    public static String shuffleStr(String str) {
        char[] c = str.toCharArray();
        List<Character> lst = new ArrayList<Character>();
        for (int i = 0; i < c.length; i++) {
            lst.add(c[i]);
        }
        Collections.shuffle(lst);
        String resultStr = "";
        for (int i = 0; i < lst.size(); i++) {
            resultStr += lst.get(i);
        }
        if (resultStr.length() < 12){
            Random rondom = new Random();
            for (int i = resultStr.length(); i <= 12; i++){
                resultStr += rondom.nextInt(10);
            }
        }
        if (resultStr.length() > 12){
            resultStr = resultStr.substring(0,12);
        }
        return resultStr;
    }

    public static String encryptStr(String str) {
        if (str.length() < 5){
            return str;
        }
        String part1 = str.substring(0,5);
        String part2 = str.substring(5,str.length());
        StringBuilder part1Builder = new StringBuilder(part1);
        StringBuilder part2Builder = new StringBuilder(part2);
        part1Builder.reverse();
        part2Builder.reverse();
        return part1Builder.toString() + part2Builder.toString();
    }

    public static String desStr(String str) {
        if (str.length() < 5){
            return str;
        }
        String des1 = str.substring(0,5);
        String des2 = str.substring(5,str.length());
        StringBuilder des1Builder = new StringBuilder(des1);
        StringBuilder des2Builder = new StringBuilder(des2);
        des1Builder.reverse();
        des2Builder.reverse();
        return des1Builder.toString()+des2Builder.toString();
    }
}
