package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.service.ContactBetaService;
import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by elite on 2017/12/21.
 */
@Controller
@RequestMapping(value = "/beta")
public class ContactListBetaController {

    @Autowired
    ContactBetaService contactBetaService;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @RequestMapping(value = "/getContacts",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getContacts(@RequestParam(value="targetPhone")String targetPhone,
                              @RequestParam(value="startTime")String startTime,
                              @RequestParam(value="endTime")String endTime){
        String type = "day";
        if (Integer.valueOf(endTime) - Integer.valueOf(startTime) >= 7){
            type = "week";
        }
        if (Integer.valueOf(endTime) - Integer.valueOf(startTime) >= 30){
            type = "month";
        }
        targetPhone = mdnToEncrypt.mdnTtoEnc(targetPhone);
        JSONObject jsonObject = contactBetaService.getFirstAndSecondContact(targetPhone,startTime,type);
        return JSON.toJSONString(jsonObject);
    }

    @RequestMapping(value = "/getGraph", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getGraph(@RequestParam(value="targetPhone")String targetPhone,
                           @RequestParam(value="startTime")String startTime,
                           @RequestParam(value="endTime")String endTime){
        JSONObject jsonObject = new JSONObject();
        JSONArray nodeArray = new JSONArray();

        JSONObject object = new JSONObject();
        object.put("name", targetPhone);
        object.put("category", 0);
        object.put("exp", 1);
        nodeArray.add(object);

        String type = "day";
        if (Integer.valueOf(endTime) - Integer.valueOf(startTime) >= 7){
            type = "week";
        }
        if (Integer.valueOf(endTime) - Integer.valueOf(startTime) >= 30){
            type = "month";
        }
        JSONObject nodetemp = contactBetaService.getGraph(targetPhone,startTime,type);

        try{
            nodeArray.addAll((JSONArray) nodetemp.get("nodes"));
            JSONArray linkArray = (JSONArray) nodetemp.get("links");
            jsonObject.put("nodes",nodeArray);
            jsonObject.put("links",linkArray);
        }catch (Exception e){
            e.printStackTrace();
        }
        return JSON.toJSONString(jsonObject, SerializerFeature.PrettyFormat,SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping(value = "/getPerInfo", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPerInfo(@RequestParam(value = "targetPhone") String targetPhone,
                             @RequestParam(value = "searchPhone") String searchPhone,
                             @RequestParam(value="startTime")String startTime,
                             @RequestParam(value="endTime")String endTime){
        JSONObject jsonObject = new JSONObject();
        targetPhone = mdnToEncrypt.mdnTtoEnc(targetPhone);
        jsonObject.put("contactInfo",contactBetaService.getContactInfo(targetPhone,searchPhone,startTime,endTime));
        jsonObject.put("teleInfo",contactBetaService.getTeleInfo(targetPhone,searchPhone,startTime,endTime));
        return JSON.toJSONString(jsonObject, true);
    }
}
