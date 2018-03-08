package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactDayListMapper;
import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactInfoMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.*;
import cn.com.ctbri.ctbigdata.smarteyes.service.ContactNewService;
import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import cn.com.ctbri.ctbigdata.smarteyes.utils.MapUtil;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ScoreUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by elite on 2018/3/6.
 */
@Service
public class ContactNewServiceImpl implements ContactNewService {

    @Autowired
    ContactInfoMapper contactInfoMapper;

    @Autowired
    ContactDayListMapper contactDayListMapper;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @Override
    public JSONObject getAllContact(String targetPhone, String startTime, String endTime) {
        //1.获取一度联系人
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeBetween(startTime+"000000",endTime+"235959");
        List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);

        JSONArray jsonArray = new JSONArray();
        if (list == null || list.size() == 0){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("contactList",jsonArray);
            return jsonObject;
        }

        //2.获取二度联系人
        ContactDayListExample contactDayListExample = new ContactDayListExample();
        List<String> firstContactList = list.stream().map(ContactInfo::getOther).collect(Collectors.toList());
        contactDayListExample.createCriteria().andDatelabelBetween(startTime,endTime).andIdIn(firstContactList);
        List<ContactDayList> lst = contactDayListMapper.selectByExampleWithBLOBs(contactDayListExample);

        //3.一度联系人打分，并装到结果集中
        HashMap<String, Double> hashMap = new HashMap<>();
        list.forEach(contactInfo -> {
            ContactInfoExample example = new ContactInfoExample();
            example.createCriteria().andStartTimeBetween(startTime+"000000",endTime+"235959").andIdEqualTo(targetPhone).andOtherEqualTo(contactInfo.getOther());
            List<ContactInfo> temp_list = contactInfoMapper.selectByExample(example);
            double score = ScoreUtil.rate(temp_list);
            hashMap.put(contactInfo.getOther(),score);
        });

        for (Map.Entry<String, Double> stringDoubleEntry : hashMap.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", stringDoubleEntry.getKey());
            jsonObject.put("tag", "一般人员");
            jsonObject.put("type", "一度");
            jsonObject.put("exp", stringDoubleEntry.getValue());
            jsonArray.add(jsonObject);
        }

        //4二度联系人打分，并装到结果集中
        HashMap<String,String> map = new HashMap<>();  //key:主叫 value:被叫
        lst.forEach(contactDayList -> {
            String phones = contactDayList.getList();
            List<String> phone_list = Arrays.asList(phones.split(","));
            phone_list.forEach(s -> map.put(s,contactDayList.getId()));
        });

        for (Map.Entry<String, String> entry : map.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("tag", "一般人员");
            jsonObject.put("type", "二度");
            jsonObject.put("exp", hashMap.getOrDefault(entry.getValue(),0.00002)/2.0);
            jsonArray.add(jsonObject);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("contactList",jsonArray);
        return jsonObject;
    }

    @Override
    public JSONObject getGraph(String targetPhoneOrigin, String startTime, String endTime) {
        String targetPhone = mdnToEncrypt.mdnTtoEnc(targetPhoneOrigin);
        //1.获取一度联系人
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeBetween(startTime+"000000",endTime+"235959");
        List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);

        JSONArray nodes_array = new JSONArray();
        JSONArray links_array = new JSONArray();
        if (list.size() == 0){
            JSONObject res = new JSONObject();
            res.put("nodes",nodes_array);
            res.put("links",links_array);
            return res;
        }

        //2.一度联系人打分，并取分最高的前20个装到结果集中
        final Map<String, Double> hashMap = new HashMap<>();
        list.forEach(contactInfo -> {
            ContactInfoExample example = new ContactInfoExample();
            example.createCriteria().andIdEqualTo(targetPhone).andOtherEqualTo(contactInfo.getOther());
            List<ContactInfo> temp_list = contactInfoMapper.selectByExample(example);
            double score = ScoreUtil.rate(temp_list);
            hashMap.put(contactInfo.getOther(),score);
        });
        LinkedList<String> first_res = new LinkedList<>();
        Map<String, Double> res_Map = MapUtil.sortByValueDes(hashMap);
        int count = 20;
        for (Map.Entry<String, Double> entry : res_Map.entrySet()) {
            if (count <= 0){
                break;
            }
            count--;
            first_res.add(entry.getKey());
            //node
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("category", 1);
            jsonObject.put("exp", entry.getValue());
            nodes_array.add(jsonObject);
            //link
            JSONObject linkObj = new JSONObject();
            linkObj.put("source",targetPhone);
            linkObj.put("target",entry.getKey());
            linkObj.put("value","一度联系人");
            links_array.add(linkObj);
        }

        //3.获取二度联系人
        ContactDayListExample contactDayListExample = new ContactDayListExample();
        List<String> firstContactList = list.stream().map(ContactInfo::getOther).collect(Collectors.toList());
        contactDayListExample.createCriteria().andDatelabelBetween(startTime,endTime).andIdIn(firstContactList);
        List<ContactDayList> lst = contactDayListMapper.selectByExampleWithBLOBs(contactDayListExample);
        if (lst.size() == 0){
            JSONObject res = new JSONObject();
            res.put("nodes",nodes_array);
            res.put("links",links_array);
            return res;
        }

        //4二度联系人打分，并装到结果集中
        HashMap<String,String> map = new HashMap<>();  //key:主叫 value:被叫
        lst.forEach(contactDayList -> {
            String phones = contactDayList.getList();
            List<String> phone_list = Arrays.asList(phones.split(","));
            phone_list.forEach(s -> map.put(s,contactDayList.getId()));
        });

        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (first_res.contains(entry.getKey())) {
                continue;
            }
            //node
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("category", 2);
            jsonObject.put("exp", res_Map.getOrDefault(entry.getValue(),0.0002)/2.0);
            nodes_array.add(jsonObject);
            //link
            JSONObject linkObj = new JSONObject();
            linkObj.put("source",entry.getValue());
            linkObj.put("target",entry.getKey());
            linkObj.put("value","二度联系人");
            links_array.add(linkObj);
        }

        //5.返回最终结果
        JSONObject res = new JSONObject();
        res.put("nodes",nodes_array);
        res.put("links",links_array);
        return res;
    }
}
