package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactDayListMapper;
import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactInfoMapper;
import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactListMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactDayList;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactDayListExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfo;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfoExample;
import cn.com.ctbri.ctbigdata.smarteyes.service.OverViewBetaService;
import cn.com.ctbri.ctbigdata.smarteyes.service.SuspectService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ScoreUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

    @Autowired
    ContactDayListMapper contactDayListMapper;

    @Autowired
    SuspectService suspectService;

    private static final DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");

    @Override
    public JSONArray getFirstAndSecondContact(String targetPhone, String startTime, String endTime) {
        //1.获取一度联系人
        ContactInfoExample contactInfoExample = new ContactInfoExample();
        contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeBetween(startTime+"000000",endTime+"235959");
        List<ContactInfo> list = contactInfoMapper.selectByExample(contactInfoExample);

        //3.一度联系人打分，并装到结果集中
        HashMap<String, Double> hashMap = new HashMap<>();
        JSONArray jsonArray = new JSONArray();
        list.forEach(contactInfo -> {
            ContactInfoExample example = new ContactInfoExample();
            example.createCriteria().andIdEqualTo(targetPhone).andOtherEqualTo(contactInfo.getOther()).andStartTimeBetween(startTime+"000000",endTime+"235959");
            List<ContactInfo> temp_list = contactInfoMapper.selectByExample(example);
            double score = ScoreUtil.rate(temp_list);
            hashMap.put(contactInfo.getOther(),score);
        });
        for (Map.Entry<String, Double> entry : hashMap.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("category", 1);
            jsonObject.put("tag", suspectService.isEncSuspect(entry.getKey()) ? "重点人员" : "一般人员");
            jsonObject.put("exp", entry.getValue());
            jsonArray.add(jsonObject);
        }

        //2.获取二度联系人
        ContactDayListExample contactDayListExample = new ContactDayListExample();
        List<String> firstContactList = list.stream().map(ContactInfo::getOther).collect(Collectors.toList());
        if (firstContactList == null || firstContactList.size() == 0){
            return jsonArray;
        }
        contactDayListExample.createCriteria().andIdIn(firstContactList).andDatelabelBetween(startTime,endTime);
        List<ContactDayList> lst = contactDayListMapper.selectByExampleWithBLOBs(contactDayListExample);

        //4二度联系人打分，并装到结果集中
        HashMap<String,String> map = new HashMap<>();  //key:主叫 value:被叫
        lst.forEach(contactDayList -> {
            String phones = contactDayList.getList();
            List<String> phone_list = Arrays.asList(phones.split(","));
            phone_list.forEach(s -> map.put(s,contactDayList.getId()));
        });
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (hashMap.containsKey(entry.getKey())){
                continue;
            }
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", entry.getKey());
            jsonObject.put("category", 2);
            jsonObject.put("tag", suspectService.isEncSuspect(entry.getKey()) ? "重点人员" : "一般人员");
            jsonObject.put("exp", hashMap.getOrDefault(entry.getValue(),0.0002)/2.0);
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    @Override
    public List<Double> getDairyDutation(String targetPhone, String startTime, String endTime) {

        LocalDate start = LocalDate.parse(startTime,format);
        LocalDate end = LocalDate.parse(endTime,format);
        LinkedList<Double> linkList = new LinkedList<>();
        for (;start.isBefore(end)||start.isEqual(end); start = start.plusDays(1)){
            ContactInfoExample contactInfoExample = new ContactInfoExample();
            contactInfoExample.createCriteria().andIdEqualTo(targetPhone).andStartTimeBetween(start.format(format)+"000000",start.format(format)+"235959");
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
            duration_list.add(optional.map(contactInfo -> contactInfo.getDuration() / 60.0).orElse(0d));
            count_list.add((double) list.size());
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("duration",duration_list);
        jsonObject.put("count",count_list);
        return jsonObject;
    }
}
