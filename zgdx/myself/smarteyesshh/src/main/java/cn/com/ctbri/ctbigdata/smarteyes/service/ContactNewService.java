package cn.com.ctbri.ctbigdata.smarteyes.service;

import com.alibaba.fastjson.JSONObject;

/**
 * Created by elite on 2018/3/6.
 */
public interface ContactNewService {

    JSONObject getAllContact(String targetPhone, String startTime, String endTime);

    JSONObject getGraph(String targetPhone, String startTime, String endTime);
}
