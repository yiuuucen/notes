package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.XssSqlBinderController;
import cn.com.ctbri.ctbigdata.smarteyes.service.ContactService;
import cn.com.ctbri.ctbigdata.smarteyes.service.OverViewService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ShuffleUtil;
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
 * Created by elite on 2017/11/28.
 */
@Controller
@RequestMapping(value = "/contact")
public class ContactListController extends XssSqlBinderController {

    @Autowired
    private OverViewService overViewService;

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = "/getContacts", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getContacts(@RequestParam(value = "targetPhone") String targetPhone){
        JSONObject jsonObject = new JSONObject();
        JSONArray firstContact = contactService.getFirstContact(targetPhone,"");
        JSONArray secondContact = contactService.getSecondContact(overViewService.getContactList(targetPhone,""),"");
        jsonObject.put("firstContact",firstContact);
        jsonObject.put("secondContact",secondContact);
        return JSON.toJSONString(jsonObject, true);
    }

    @RequestMapping(value = "/getPerInfo", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getPerInfo(@RequestParam(value = "targetPhone") String targetPhone
            ,@RequestParam(value = "searchPhone") String searchPhone){
        JSONObject jsonObject = new JSONObject();
        if (searchPhone.length() > 5) {
            searchPhone = ShuffleUtil.desStr(searchPhone);
        }
        jsonObject.put("contactInfo",contactService.getContactInfoReal(targetPhone,searchPhone,""));
        jsonObject.put("teleInfo",contactService.getTeleInfoReal(targetPhone,searchPhone,""));
        return JSON.toJSONString(jsonObject, true);
    }

    @RequestMapping(value = "/getGraph_old", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getGraph(@RequestParam(value = "targetPhone") String targetPhone){
        JSONObject jsonObject = new JSONObject();

        JSONArray nodeArray = new JSONArray();
        JSONArray linkArray = new JSONArray();

        JSONObject object = new JSONObject();
        object.put("name", targetPhone);
        object.put("category", 0);
        object.put("exp", 1);
        nodeArray.add(object);

        //增加一度、二度node,link
        JSONObject nodetemp = contactService.getFirstgetGraph(targetPhone,"");
        try{
            nodeArray.addAll((JSONArray)nodetemp.get("nodes"));
            linkArray.addAll((JSONArray) nodetemp.get("links"));
        }catch (Exception e){
            e.printStackTrace();
        }

        JSONObject nodetemp2 = contactService.getSecondGraph(overViewService.getContactList(targetPhone,""),"");
        try {
            nodeArray.addAll((JSONArray)nodetemp2.get("nodes"));
            linkArray.addAll((JSONArray) nodetemp2.get("links"));
        }catch (Exception e){
            e.printStackTrace();
        }
        if (linkArray.size()>0){
            jsonObject.put("links",linkArray);
        }
        jsonObject.put("nodes",nodeArray);
        return JSON.toJSONString(jsonObject, SerializerFeature.PrettyFormat,SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping(value = "/getGraph", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getGraphNew(@RequestParam(value = "targetPhone") String targetPhone){
        JSONObject jsonObject = new JSONObject();

        JSONArray nodeArray = new JSONArray();
        JSONArray linkArray = new JSONArray();

        JSONObject object = new JSONObject();
        object.put("name", targetPhone);
        object.put("category", 0);
        object.put("exp", 1);
        nodeArray.add(object);

        JSONObject nodetemp = contactService.getGraph(targetPhone,"");

        nodeArray.addAll((JSONArray) nodetemp.get("nodes"));
        linkArray = (JSONArray) nodetemp.get("links");
        jsonObject.put("nodes",nodeArray);
        if (linkArray.size()>0){
            jsonObject.put("links",linkArray);
        }
        return JSON.toJSONString(jsonObject, SerializerFeature.PrettyFormat,SerializerFeature.DisableCircularReferenceDetect);
    }
}
