package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactSummaryMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummary;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummaryExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummaryKey;
import cn.com.ctbri.ctbigdata.smarteyes.service.ContactService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.MapUtil;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ScoreUtil;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ShuffleUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by elite on 2017/11/28.
 */
@Service
public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactSummaryMapper contactSummaryMapper;

    @Override
    public JSONArray getFirstContact(String targetPhone, String dataTime) {
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        contactSummaryExample.createCriteria().andCallingEqualTo(targetPhone);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);
        JSONArray jsonArray = new JSONArray();
        list.forEach(contactSummary -> {
            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("name", AESUtil.encrypt(contactSummary.getCalled(), ProjectConstant.AES_PASSWORD));
            jsonObject.put("name", ShuffleUtil.encryptStr(contactSummary.getCalled()));
            jsonObject.put("tag", "一般人员");
            jsonObject.put("exp", ScoreUtil.rate(contactSummary));
            jsonArray.add(jsonObject);
        });
        return jsonArray;
    }

    @Override
    public JSONArray getSecondContact(List<String> targetPhones, String dataTime) {
        JSONArray jsonArray = new JSONArray();
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        if (targetPhones == null || targetPhones.size() == 0){
            return jsonArray;
        }
        contactSummaryExample.createCriteria().andCallingIn(targetPhones);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);
        list.forEach(contactSummary -> {
            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("name", AESUtil.encrypt(contactSummary.getCalled(), ProjectConstant.AES_PASSWORD));
            jsonObject.put("name", ShuffleUtil.encryptStr(contactSummary.getCalled()));
            jsonObject.put("tag", "一般人员");
            jsonObject.put("exp", ScoreUtil.rate(contactSummary));
            jsonArray.add(jsonObject);
        });
        return jsonArray;
    }

    @Override
    public JSONObject getContactInfo(String targetPhone, String dataTime) {
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        contactSummaryExample.createCriteria().andCallingEqualTo(targetPhone);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);
        JSONObject jsonObject = new JSONObject();
        Optional<ContactSummary> optional = list.stream().reduce((acc, x) -> {
            acc.setAboveThreeMinCounter(acc.getAboveThreeMinCounter() +x.getAboveThreeMinCounter());
            acc.setUnderFifteenSecondsCounter(acc.getUnderFifteenSecondsCounter() +x.getUnderFifteenSecondsCounter());
            acc.setWorkCallCounter(acc.getWorkCallCounter() +x.getWorkCallCounter());
            acc.setRestCallCounter(acc.getRestCallCounter() +x.getRestCallCounter());
            return acc;
        });
        if (!optional.isPresent()){
            JSONObject obj = new JSONObject();
            obj.put("AboveThreeMin",0);
            obj.put("UnderFifteenSeconds",0);
            obj.put("WorkCall",0);
            obj.put("RestCall",0);
            obj.put("totalCall",0);
            return obj;
        }
        ContactSummary res = optional.get();
        jsonObject.put("AboveThreeMin",res.getAboveThreeMinCounter());
        jsonObject.put("UnderFifteenSeconds",res.getUnderFifteenSecondsCounter());
        jsonObject.put("WorkCall",res.getWorkCallCounter());
        jsonObject.put("RestCall",res.getRestCallCounter());
        jsonObject.put("totalCall",list.size());
        return jsonObject;
    }

    @Override
    public JSONObject getContactInfoReal(String targetPhone, String searchPhone, String dataTime) {
        ContactSummaryKey contactSummaryKey1 = new ContactSummaryKey();
        contactSummaryKey1.setCalling(targetPhone);
        contactSummaryKey1.setCalled(searchPhone);
        ContactSummary contactSummary1 = contactSummaryMapper.selectByPrimaryKey(contactSummaryKey1);
        if (contactSummary1 == null){
            contactSummary1 = new ContactSummary();
        }

        ContactSummaryKey contactSummaryKey2 = new ContactSummaryKey();
        contactSummaryKey2.setCalling(searchPhone);
        contactSummaryKey2.setCalled(targetPhone);
        ContactSummary contactSummary2 = contactSummaryMapper.selectByPrimaryKey(contactSummaryKey2);
        if (contactSummary2 == null){
            contactSummary2 = new ContactSummary();
        }

        JSONObject obj = new JSONObject();
        obj.put("AboveThreeMin",contactSummary1.getAboveThreeMinCounter() + contactSummary2.getAboveThreeMinCounter());
        obj.put("UnderFifteenSeconds",contactSummary1.getUnderFifteenSecondsCounter() + contactSummary2.getUnderFifteenSecondsCounter());
        obj.put("WorkCall",contactSummary1.getWorkCallCounter() + contactSummary2.getWorkCallCounter());
        obj.put("RestCall",contactSummary1.getRestCallCounter() + contactSummary2.getRestCallCounter());
        obj.put("totalCall",contactSummary1.getWorkCallCounter() + contactSummary2.getWorkCallCounter() + contactSummary1.getRestCallCounter() + contactSummary2.getRestCallCounter());

        return obj;
    }

    @Override
    public JSONObject getTeleInfo(String targetPhone, String dataTime) {
        JSONObject jsonObject = new JSONObject();
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        contactSummaryExample.createCriteria().andCallingEqualTo(targetPhone);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);
        int calling = 0;
        if (list.size() > 0){
            calling = list.stream().mapToInt(ContactSummary::getDurationLength).sum();
        }

        ContactSummaryExample example = new ContactSummaryExample();
        example.createCriteria().andCalledEqualTo(targetPhone);
        List<ContactSummary> list2 = contactSummaryMapper.selectByExample(example);
        int called = 0;
        if (list2.size() > 0){
            called = list.stream().mapToInt(ContactSummary::getDurationLength).sum();
        }

        jsonObject.put("callingTime",calling/60000);
        jsonObject.put("calledTime",called/60000);
        jsonObject.put("callingCount",list.size());
        jsonObject.put("calledCount",list2.size());

        return jsonObject;
    }

    @Override
    public JSONObject getTeleInfoReal(String targetPhone, String searchPhone, String dataTime) {
        ContactSummaryKey contactSummaryKey1 = new ContactSummaryKey();
        contactSummaryKey1.setCalling(targetPhone);
        contactSummaryKey1.setCalled(searchPhone);
        ContactSummary contactSummary1 = contactSummaryMapper.selectByPrimaryKey(contactSummaryKey1);
        if (contactSummary1 == null){
            contactSummary1 = new ContactSummary();
        }

        ContactSummaryKey contactSummaryKey2 = new ContactSummaryKey();
        contactSummaryKey2.setCalling(searchPhone);
        contactSummaryKey2.setCalled(targetPhone);
        ContactSummary contactSummary2 = contactSummaryMapper.selectByPrimaryKey(contactSummaryKey2);
        if (contactSummary2 == null){
            contactSummary2 = new ContactSummary();
        }

        JSONObject jsonObject = new JSONObject();
        DecimalFormat df = new DecimalFormat("#0.00");
        jsonObject.put("callingTime",df.format(contactSummary1.getDurationLength()/60000.0));
        jsonObject.put("calledTime",df.format(contactSummary2.getDurationLength()/60000.0));
        jsonObject.put("callingCount",contactSummary1.getRestCallCounter() + contactSummary1.getWorkCallCounter());
        jsonObject.put("calledCount",contactSummary2.getRestCallCounter() + contactSummary2.getWorkCallCounter());

        return jsonObject;
    }

    @Override
    public JSONObject getFirstgetGraph(String targetPhone, String dataTime) {
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        contactSummaryExample.createCriteria().andCallingEqualTo(targetPhone);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);
        list = list.stream().limit(20).collect(Collectors.toList());
        JSONArray jsonArray = new JSONArray();
        JSONArray linkArray = new JSONArray();
        list.forEach(contactSummary -> {
            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("name", AESUtil.encrypt(contactSummary.getCalled(), ProjectConstant.AES_PASSWORD));
            jsonObject.put("name", ShuffleUtil.encryptStr(contactSummary.getCalled()));
            jsonObject.put("category", 1);
            jsonObject.put("exp", ScoreUtil.rate(contactSummary));
            jsonArray.add(jsonObject);

            JSONObject linkObj = new JSONObject();
            linkObj.put("source",targetPhone);
//            linkObj.put("target",AESUtil.encrypt(contactSummary.getCalled(), ProjectConstant.AES_PASSWORD));
            linkObj.put("target",ShuffleUtil.encryptStr(contactSummary.getCalled()));
            linkObj.put("value","一度联系人");
            linkArray.add(linkObj);
        });

        JSONObject res = new JSONObject();
        res.put("nodes",jsonArray);
        res.put("links",linkArray);
        return res;
    }

    @Override
    public JSONObject getSecondGraph(List<String> targetPhones, String dataTime) {
        JSONObject res = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        JSONArray linkArray = new JSONArray();

        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        if (targetPhones == null || targetPhones.size() == 0){
            return res;
        }
        contactSummaryExample.createCriteria().andCallingIn(targetPhones);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);
        list = list.stream().limit(10).collect(Collectors.toList());
        list.forEach(contactSummary -> {
            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("name", AESUtil.encrypt(contactSummary.getCalled(), ProjectConstant.AES_PASSWORD));
            jsonObject.put("name", ShuffleUtil.encryptStr(contactSummary.getCalled()));
            jsonObject.put("category", 2);
            jsonObject.put("exp", ScoreUtil.rate(contactSummary));
            jsonArray.add(jsonObject);

            JSONObject linkObj = new JSONObject();
//            linkObj.put("source",AESUtil.encrypt(contactSummary.getCalling(),ProjectConstant.AES_PASSWORD));
            linkObj.put("source",ShuffleUtil.encryptStr(contactSummary.getCalling()));
//            linkObj.put("target",AESUtil.encrypt(contactSummary.getCalled(), ProjectConstant.AES_PASSWORD));
            linkObj.put("target",ShuffleUtil.encryptStr(contactSummary.getCalled()));
            linkObj.put("value","二度联系人");
            linkArray.add(linkObj);
        });

        res.put("nodes",jsonArray);
        res.put("links",linkArray);
        return res;
    }

    @Override
    public JSONObject getGraph(String targetPhone, String dataTime) {
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        contactSummaryExample.createCriteria().andCallingEqualTo(targetPhone);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);

        //处理一度联系人
        JSONArray jsonArray = new JSONArray();
        JSONArray linkArray = new JSONArray();
        final Map<ContactSummary,Double> hashmap = new HashMap<>();
        HashMap<String,Double> first_socre = new HashMap<>();
        list.forEach(contactSummary -> hashmap.put(contactSummary,ScoreUtil.rate(contactSummary)));
        Map<ContactSummary,Double> map = MapUtil.sortByValueDes(hashmap);
        HashMap<String,Double> res_map = new HashMap<>();
        List<String> firstNode = new LinkedList<>();
        int count = 20;
        for (Map.Entry<ContactSummary, Double> entry : map.entrySet()) {
            if (count <= 0){
                break;
            }
            count--;
            first_socre.put(entry.getKey().getCalled(),entry.getValue());
            firstNode.add(entry.getKey().getCalled());
            res_map.put(entry.getKey().getCalled(),entry.getValue());

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", ShuffleUtil.encryptStr(entry.getKey().getCalled()));
            jsonObject.put("category", 1);
            jsonObject.put("exp", entry.getValue());
            jsonArray.add(jsonObject);

            JSONObject linkObj = new JSONObject();
            linkObj.put("source",targetPhone);
            linkObj.put("target",ShuffleUtil.encryptStr(entry.getKey().getCalled()));
            linkObj.put("value","一度联系人");
            linkArray.add(linkObj);
        }

        //处理二度联系人
        ContactSummaryExample example = new ContactSummaryExample();
        if (firstNode.size() == 0){
            JSONObject res = new JSONObject();
            res.put("nodes",jsonArray);
            res.put("links",linkArray);
            return res;
        }
        example.createCriteria().andCallingIn(firstNode);
        JSONArray jsonArray2 = new JSONArray();
        JSONArray linkArray2 = new JSONArray();
        List<ContactSummary> list_second = contactSummaryMapper.selectByExample(example);

        HashMap<String,Double> second_score = new HashMap<>();
        list_second.forEach(contactSummary -> {
            if (res_map.containsKey(contactSummary.getCalled())){
                return;
            }
            Double score = ScoreUtil.rate(contactSummary) + second_score.getOrDefault(contactSummary.getCalled(),0d);
            score *= first_socre.getOrDefault(contactSummary.getCalling(),1d);
            second_score.put(contactSummary.getCalled(),score);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", ShuffleUtil.encryptStr(contactSummary.getCalled()));
            jsonObject.put("category", 2);
            jsonObject.put("exp", score);
            jsonArray2.add(jsonObject);

            JSONObject linkObj = new JSONObject();
            linkObj.put("source",ShuffleUtil.encryptStr(contactSummary.getCalling()));
            linkObj.put("target",ShuffleUtil.encryptStr(contactSummary.getCalled()));
            linkObj.put("value","二度联系人");
            linkArray2.add(linkObj);
        });
        try{
            jsonArray.addAll(jsonArray2);
            linkArray.addAll(linkArray2);
        }catch (Exception e){
            e.printStackTrace();
        }
        JSONObject res = new JSONObject();
        res.put("nodes",jsonArray);
        res.put("links",linkArray);
        return res;
    }
}
