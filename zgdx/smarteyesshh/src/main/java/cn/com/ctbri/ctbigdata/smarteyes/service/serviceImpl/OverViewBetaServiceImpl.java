package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactInfoMapper;
import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactListMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.*;
import cn.com.ctbri.ctbigdata.smarteyes.service.OverViewBetaService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ScoreUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by elite on 2017/12/15.
 */
@Service
public class OverViewBetaServiceImpl implements OverViewBetaService {

    @Autowired
    ContactInfoMapper contactInfoMapper;

    @Autowired
    ContactListMapper contactListMapper;

    @Override
    public JSONArray getFirstAndSecondContact(String targetPhone, String searchTime, String type) {
        //1.获取一度联系人
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeGreaterThanOrEqualTo(searchTime+"000000");
        List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);

        //3.一度联系人打分，并装到结果集中
        HashMap<String, Double> hashMap = new HashMap<>();
        JSONArray jsonArray = new JSONArray();
        list.forEach(contactInfo -> {
            ContactInfoExample example = new ContactInfoExample();
            example.createCriteria().andIdEqualTo(targetPhone).andOtherEqualTo(contactInfo.getOther());
            List<ContactInfo> temp_list = contactInfoMapper.selectByExample(example);
            double score = ScoreUtil.rate(temp_list);
            hashMap.put(contactInfo.getOther(),score);
        });
        for (Map.Entry<String, Double> entry : hashMap.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("category", 1);
            jsonObject.put("tag", "一般人员");
            jsonObject.put("exp", entry.getValue());
            jsonArray.add(jsonObject);
        }

        //2.获取二度联系人
        ContactListExample contactListExample = new ContactListExample();
        List<String> firstContactList = list.stream().map(ContactInfo::getOther).collect(Collectors.toList());
        if (firstContactList == null || firstContactList.size() == 0){
            return jsonArray;
        }
        contactListExample.createCriteria().andIdIn(firstContactList);
        List<ContactListWithBLOBs> lst = contactListMapper.selectByExampleWithBLOBs(contactListExample);

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
        });
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (hashMap.containsKey(entry.getKey())){
                continue;
            }
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("category", 2);
            jsonObject.put("tag", "一般人员");
            jsonObject.put("exp", hashMap.getOrDefault(entry.getValue(),0.0002)/2.0);
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    @Override
    public List<Double> getDairyDutation(String targetPhone, String startTime, String endTime) {
        int start = Integer.valueOf(startTime);
        int end = Integer.valueOf(endTime);
        LinkedList<Double> linkList = new LinkedList<>();
        for (int day = start; day <= end; day++){
            ContactInfoExample contactInfoExample = new ContactInfoExample();
            contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeBetween(day+"000000",day+"235959");
            List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);
            Optional<ContactInfo> optional = list.stream().reduce((acc, x)->{
                acc.setDuration(acc.getDuration() + x.getDuration());
                return acc;
            });
            if (optional.isPresent()){
                linkList.add(optional.get().getDuration() >= 60*24*60 ? 60*24 : optional.get().getDuration()/60.0);
            }else {
                linkList.add(0d);
            }
        }
        return linkList;
    }

    @Override
    public JSONObject getDayDutation(String targetPhone, String searchDay) {
        String dayTime = searchDay + "00";
        LinkedList<Double> duration_list = new LinkedList<>();
        LinkedList<Double> count_list = new LinkedList<>();
        for (int hour = 0; hour < 24; hour++){
            int time = Integer.valueOf(dayTime);
            ContactInfoExample contactInfoExample = new ContactInfoExample();
            contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeBetween(time+hour+"0000",time+hour+"5959");
            List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);
            Optional<ContactInfo> optional = list.stream().reduce((acc, x)->{
                acc.setDuration(acc.getDuration() + x.getDuration());
                return acc;
            });
            duration_list.add(optional.isPresent()?optional.get().getDuration()/60.0 : 0d);
            count_list.add((double) list.size());
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("duration",duration_list);
        jsonObject.put("count",count_list);
        return jsonObject;
    }
}