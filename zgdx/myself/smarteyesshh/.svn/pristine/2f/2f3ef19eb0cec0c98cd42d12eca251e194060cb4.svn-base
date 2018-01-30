package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.ContactSummaryMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummary;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummaryExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummaryKey;
import cn.com.ctbri.ctbigdata.smarteyes.service.OverViewService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.LocationUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;

/**
 * Created by elite on 2017/11/21.
 */
@Service
public class OverViewServiceImpl implements OverViewService {

    @Autowired
    private ContactSummaryMapper contactSummaryMapper;

    @Override
    public JSONObject getTitleData(String targetPhone, String dataTime) {
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        contactSummaryExample.createCriteria().andCallingEqualTo(targetPhone);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);

        Optional<ContactSummary> optional = list.parallelStream().reduce((acc, x) -> {
            acc.setMsgCounter(acc.getMsgCounter() +x.getMsgCounter());
            acc.setDurationLength(acc.getDurationLength() +x.getDurationLength());
            return acc;
        });

        if (!optional.isPresent()){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("valid_contact",0);
            jsonObject.put("valid_message",0);
            jsonObject.put("duration_length",0);
            ArrayList<double[]> lst = new ArrayList<>();
            Random random = new Random(Long.valueOf(targetPhone));
            lst.add(LocationUtil.randomShhArr(random));
            lst.add(LocationUtil.randomShhArr(random));
            jsonObject.put("top_location", lst);
            return jsonObject;
        }

        ContactSummary contactSummary = optional.get();

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("valid_contact",list.size());
        jsonObject.put("valid_message",contactSummary.getMsgCounter());
        jsonObject.put("duration_length",contactSummary.getDurationLength()/60000);
        ArrayList<double[]> lst = new ArrayList<>();
        Random random = new Random(Long.valueOf(targetPhone));
        lst.add(LocationUtil.randomShhArr(random));
        lst.add(LocationUtil.randomShhArr(random));
        jsonObject.put("top_location", lst);

        return jsonObject;
    }

    @Override
    public List<String> getContactList(String targetPhone, String dataTime) {
        ContactSummaryExample contactSummaryExample = new ContactSummaryExample();
        contactSummaryExample.createCriteria().andCallingEqualTo(targetPhone);
        List<ContactSummary> list = contactSummaryMapper.selectByExample(contactSummaryExample);

        List res = list.stream().map(ContactSummaryKey::getCalled).collect(Collectors.toList());
        return res;
    }

    @Override
    public JSONArray getHeatMap(String targetPhone, String dataTime) {
        Random random = new Random(Long.valueOf(targetPhone));
        JSONArray jsonArray = new JSONArray();
        double[] point1 = LocationUtil.randomShhArr(random);
        for (int i = 30; i > 0; i--){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("coord",point1);
            jsonArray.add(jsonObject);
        }
        double[] point2 = LocationUtil.randomShhArr(random);
        for (int i = 30; i > 0; i--){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("coord",point2);
            jsonArray.add(jsonObject);
        }
        double[] point3 = LocationUtil.randomShhArr(random);
        for (int i = 20; i > 0; i--){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("coord",point3);
            jsonArray.add(jsonObject);
        }

        List<double[]> p1 = LocationUtil.randomNearbyList(random, point1);
        List<double[]> p2 = LocationUtil.randomNearbyList(random, point2);
        List<double[]> p3 = LocationUtil.randomNearbyList(random, point3);
        p1.addAll(p2);
        p1.addAll(p3);
        p1.forEach(x -> {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("coord",x);
            jsonArray.add(jsonObject);
        });
        for (int i = 10; i > 0; i--){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("coord",LocationUtil.randomShhArr(random));
            jsonArray.add(jsonObject);
            jsonArray.add(jsonObject);
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}
