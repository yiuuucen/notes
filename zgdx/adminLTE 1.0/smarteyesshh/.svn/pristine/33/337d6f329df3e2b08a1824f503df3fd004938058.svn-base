package cn.com.ctbri.ctbigdata.smarteyes.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.List;

/**
 * Created by elite on 2017/11/28.
 */
public interface ContactService {

    /**
     * 获取一度联系人
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONArray getFirstContact(String targetPhone, String dataTime);

    /**
     * 获取二度联系人
     * @param targetPhones
     * @param dataTime
     * @return
     */
    JSONArray getSecondContact(List<String> targetPhones, String dataTime);

    /**
     * 获取联系人信息
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONObject getContactInfo(String targetPhone, String dataTime);

    /**
     * 获取联系人信息,更改逻辑
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONObject getContactInfoReal(String targetPhone, String searchPhone, String dataTime);

    /**
     * 获取通话时长、频次
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONObject getTeleInfo(String targetPhone, String dataTime);

    /**
     * 获取通话时长、频次，更改逻辑
     * @param targetPhone
     * @param searchPhone
     * @param dataTime
     * @return
     */
    JSONObject getTeleInfoReal(String targetPhone, String searchPhone, String dataTime);

    /**
     * 获取一度关系图
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONObject getFirstgetGraph(String targetPhone, String dataTime);

    /**
     * 获取二度关系图
     * @param targetPhones
     * @param dataTime
     * @return
     */
    JSONObject getSecondGraph(List<String> targetPhones, String dataTime);

    /**
     * 获取关系图
     * @param targetPhone
     * @param dataTime
     * @return
     */
    JSONObject getGraph(String targetPhone, String dataTime);
}
