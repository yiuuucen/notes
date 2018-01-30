package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactInfoMapper;
import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactListMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfo;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfoExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactListExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactListWithBLOBs;
import cn.com.ctbri.ctbigdata.smarteyes.service.ContactBetaService;
import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import cn.com.ctbri.ctbigdata.smarteyes.utils.MapUtil;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ScoreUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by elite on 2017/12/21.
 */
@Service
public class ContactBetaServiceImpl implements ContactBetaService {

    @Autowired
    ContactInfoMapper contactInfoMapper;

    @Autowired
    ContactListMapper contactListMapper;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    private static final DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

    @Override
    public JSONObject getFirstAndSecondContact(String targetPhone, String searchTime, String type) {
        //1.获取一度联系人
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeGreaterThanOrEqualTo(searchTime+"000000");
        List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);

        JSONArray first_jsonArray = new JSONArray();
        JSONArray second_jsonArray = new JSONArray();
        if (list == null || list.size() == 0){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("firstContact",first_jsonArray);
            jsonObject.put("secondContact",second_jsonArray);
            return jsonObject;
        }
        //2.获取二度联系人
        ContactListExample contactListExample = new ContactListExample();
        List<String> firstContactList = list.stream().map(ContactInfo::getOther).collect(Collectors.toList());
        contactListExample.createCriteria().andIdIn(firstContactList);
        List<ContactListWithBLOBs> lst = contactListMapper.selectByExampleWithBLOBs(contactListExample);

        //3.一度联系人打分，并装到结果集中
        HashMap<String, Double> hashMap = new HashMap<>();
        list.forEach(contactInfo -> {
            ContactInfoExample example = new ContactInfoExample();
            example.createCriteria().andIdEqualTo(targetPhone).andOtherEqualTo(contactInfo.getOther());
            List<ContactInfo> temp_list = contactInfoMapper.selectByExample(example);
            double score = ScoreUtil.rate(temp_list);
            hashMap.put(contactInfo.getOther(),score);
        });
        for (Map.Entry<String, Double> stringDoubleEntry : hashMap.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", stringDoubleEntry.getKey());
            jsonObject.put("tag", "一般人员");
            jsonObject.put("exp", stringDoubleEntry.getValue());
            first_jsonArray.add(jsonObject);
        }

        //4二度联系人打分，并装到结果集中
        HashMap<String,String> map = new HashMap<>();  //key:主叫 value:被叫
        lst.forEach(contactListWithBLOBs -> {
            String phones = contactListWithBLOBs.getMonthList();
            List<String> phone_list = Arrays.asList(phones.split(","));
            if (type.equals("week")){
                phone_list = phone_list.subList(0,phone_list.size()/2);
            }
            if (type.equals("day")){
                phone_list = phone_list.subList(0,phone_list.size()/4);
            }
            phone_list.forEach(s -> map.put(s,contactListWithBLOBs.getId()));

/*            phone_list.forEach(s -> {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("name", s);
                jsonObject.put("tag", "一般人员");
                jsonObject.put("exp", hashMap.getOrDefault(contactListWithBLOBs.getId(),0.00002)/2.0);
                second_jsonArray.add(jsonObject);
            });*/
        });

        for (Map.Entry<String, String> entry : map.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("tag", "一般人员");
            jsonObject.put("exp", hashMap.getOrDefault(entry.getValue(),0.00002)/2.0);
            second_jsonArray.add(jsonObject);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("firstContact",first_jsonArray);
        jsonObject.put("secondContact",second_jsonArray);
        return jsonObject;
    }

    @Override
    public JSONObject getGraph(String targetPhoneOrigin, String searchTime, String type) {
        //1.获取一度联系人
        String targetPhone = mdnToEncrypt.mdnTtoEnc(targetPhoneOrigin);
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeGreaterThanOrEqualTo(searchTime+"000000");
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
            linkObj.put("source",targetPhoneOrigin);
            linkObj.put("target",entry.getKey());
            linkObj.put("value","一度联系人");
            links_array.add(linkObj);
        }

        //3.获取二度联系人
        ContactListExample contactListExample = new ContactListExample();
        contactListExample.createCriteria().andIdIn(first_res);
        List<ContactListWithBLOBs> lst = contactListMapper.selectByExampleWithBLOBs(contactListExample);
        if (lst.size() == 0){
            JSONObject res = new JSONObject();
            res.put("nodes",nodes_array);
            res.put("links",links_array);
            return res;
        }

        //4二度联系人打分，并装到结果集中
        HashMap<String,String> map = new HashMap<>();  //key:主叫 value:被叫
        lst.forEach(contactListWithBLOBs -> {
            String phones = contactListWithBLOBs.getMonthList();
            List<String> phone_list = Arrays.asList(phones.split(","));
            if (type.equals("week")){
                phone_list = phone_list.subList(0,phone_list.size()/2);
            }
            if (type.equals("day")){
                phone_list = phone_list.subList(0,phone_list.size()/4);
            }
            phone_list.forEach(s -> map.put(s,contactListWithBLOBs.getId()));
           /* phone_list.forEach(s -> {
                if (res_Map.containsKey(s)){
                    return;
                }
                //node
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("name", s);
                jsonObject.put("category", 1);
                jsonObject.put("exp", res_Map.getOrDefault(contactListWithBLOBs.getId(),0.00002)/2.0);
                nodes_array.add(jsonObject);
                //link
                JSONObject linkObj = new JSONObject();
                linkObj.put("source",contactListWithBLOBs.getId());
                linkObj.put("target",s);
                linkObj.put("value","二度联系人");
                links_array.add(linkObj);
            });*/
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

    @Override
    public JSONObject getContactInfo(String targetPhone, String searchPhone, String startTime, String endTime) {
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andOtherEqualTo(searchPhone).andStartTimeBetween(startTime+"000000",endTime+"235959");
        List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);

        Integer aboveThreeMin = 0;
        Integer underFifteenSeconds = 0;
        Integer workCall = 0;
        Integer restCall = 0;
        Integer totalCall;

        for (ContactInfo contactInfo : list) {
            if (contactInfo.getDuration() >= 5 * 60){
                aboveThreeMin++;
            }
            if (contactInfo.getDuration() <= 15){
                underFifteenSeconds++;
            }
            String callTime = contactInfo.getStartTime();
            LocalDateTime time = LocalDateTime.parse(callTime, format);
            DayOfWeek dayOfWeek = time.getDayOfWeek();
            int hour = time.getHour();
            if (dayOfWeek == DayOfWeek.SUNDAY || dayOfWeek == DayOfWeek.SATURDAY || hour >= 20 || hour <= 6) {
                restCall++;
            } else {
                workCall++;
            }
        }
        totalCall = list.size();
        JSONObject obj = new JSONObject();
        obj.put("AboveThreeMin",aboveThreeMin);
        obj.put("UnderFifteenSeconds",underFifteenSeconds);
        obj.put("WorkCall",workCall);
        obj.put("RestCall",restCall);
        obj.put("totalCall",totalCall);
        return obj;
    }

    @Override
    public JSONObject getTeleInfo(String targetPhone, String searchPhone, String startTime, String endTime) {
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andOtherEqualTo(searchPhone).andStartTimeBetween(startTime+"000000",endTime+"235959");
        List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);
        double callingTime = 0d;
        double calledTime = 0d;
        double callingCount = 0d;
        double calledCount = 0d;
        for (ContactInfo contactInfo : list) {
            if (contactInfo.getType() == 1){
                callingCount++;
                callingTime += contactInfo.getDuration()/60.0;
            }
            if (contactInfo.getType() == 2){
                calledCount++;
                calledTime += contactInfo.getDuration()/60.0;
            }
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("callingTime",callingTime);
        jsonObject.put("calledTime",calledTime);
        jsonObject.put("callingCount",callingCount);
        jsonObject.put("calledCount",calledCount);
        return jsonObject;
    }
}
