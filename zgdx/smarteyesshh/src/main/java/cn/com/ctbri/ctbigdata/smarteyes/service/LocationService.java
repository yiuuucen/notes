package cn.com.ctbri.ctbigdata.smarteyes.service;

import com.alibaba.fastjson.JSONArray;

/**
 * Created by elite on 2018/3/15.
 */
public interface LocationService {

    JSONArray getActiveArea(String targetPhone, String startTime, String endTime);

}
