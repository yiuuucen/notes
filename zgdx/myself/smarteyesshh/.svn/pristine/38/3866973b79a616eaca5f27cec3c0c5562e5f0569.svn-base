package cn.com.ctbri.ctbigdata.smarteyes.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.List;

/**
 * Created by elite on 2017/11/21.
 */
public interface OverViewService {

    /**
     * 输入目标人员手机号，查询title各项统计指标
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONObject getTitleData(String targetPhone, String dataTime);

    /**
     * 核心联系人关系图
     * @param targetPhone
     * @return
     */
    List<String> getContactList(String targetPhone, String dataTime);

    /**
     * 获取常活动区域
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONArray getHeatMap(String targetPhone, String dataTime);

}
