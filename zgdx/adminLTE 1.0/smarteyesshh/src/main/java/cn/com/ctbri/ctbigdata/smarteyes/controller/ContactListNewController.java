package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.XssSqlBinderController;
import cn.com.ctbri.ctbigdata.smarteyes.service.ContactNewService;
import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import cn.com.ctbri.ctbigdata.smarteyes.utils.WebPageUtil;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/**
 * Created by elite on 2018/3/7.
 */
@Controller
@RequestMapping(value = "/new")
public class ContactListNewController extends XssSqlBinderController {

    @Autowired
    ContactNewService contactNewService;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @RequestMapping(value = "/getAllContacts",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getContacts(@RequestParam(value="targetPhone")String targetPhone,
                              @RequestParam(value="startTime")String startTime,
                              @RequestParam(value="endTime")String endTime){
        targetPhone = mdnToEncrypt.AesToEnc(targetPhone);
        JSONObject jsonObject = contactNewService.getAllContact(targetPhone,startTime,endTime);
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
        String targetPhoneHide =targetPhone.startsWith("86")?targetPhone.replaceFirst("86",""):targetPhone;
        targetPhoneHide = WebPageUtil.phoneHide(targetPhoneHide);
        object.put("name", targetPhoneHide);
        object.put("phone", targetPhoneHide);
        object.put("category", "当前重点人员");
        object.put("exp", 1);
        object.put("tag", 0);
        nodeArray.add(object);
        JSONObject nodetemp = contactNewService.getGraph(targetPhone,startTime,endTime);
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

    //导出联系人列表信息
    @RequestMapping(value = "/download", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public ResponseEntity<byte[]> getCsvData(@RequestParam(value="targetPhone")String targetPhone,
                                             @RequestParam(value="startTime")String startTime,
                                             @RequestParam(value="endTime")String endTime) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", "contactList.csv");
        String result = "编号" + "," + "描述" + "," + "关联度" + "," +
                "关联指数" + "\n" +
                contactNewService.getDownload(targetPhone, startTime, endTime);
        return new ResponseEntity<>(result.getBytes("GBK"), headers, HttpStatus.OK);
    }
}
