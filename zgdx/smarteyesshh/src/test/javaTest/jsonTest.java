package javaTest;

import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by elite on 2017/11/27.
 */
public class jsonTest {
    public static void main(String[] args) {
        JSONObject jsonObject = new JSONObject();
        int[] sum = new int[2];
        jsonObject.put("sum",sum);
        System.out.println(jsonObject);

        List<String> list = new ArrayList<>();
        list.add("ok");
        list.add("ok1");
        list.add("ok2");
        list = list.stream().map(x -> AESUtil.encrypt(x, "123456")).collect(Collectors.toList());
        System.out.println(list);
    }
}