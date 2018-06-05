package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.XssSqlBinderController;
import cn.com.ctbri.ctbigdata.smarteyes.service.LocationService;
import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by elite on 2018/3/15.
 */
@Controller
@RequestMapping(value = "/location")
public class LocationController extends XssSqlBinderController {

    @Autowired
    LocationService locationService;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @RequestMapping(value = "/getHeatMap", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getHeatMap(@RequestParam(value = "targetPhone", required = false) String targetPhone,
                             @RequestParam(value = "startTime", required = false) String startTime,
                             @RequestParam(value = "endTime", required = false) String endTime,
                             @RequestParam(value = "type", required = false) String type){
        targetPhone = mdnToEncrypt.AesToPCMDEnc(targetPhone);
        if (targetPhone == null || targetPhone.length() == 0){
            return JSON.toJSONString(new JSONArray());
        }
        JSONArray jsonArray = locationService.getActiveArea(targetPhone,startTime,endTime,type);
        return JSON.toJSONString(jsonArray, SerializerFeature.PrettyFormat,SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping(value = "/getReginHeatMap", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getReginHeatMap(@RequestParam(value = "targetPhone", required = false) String targetPhone){
        targetPhone = mdnToEncrypt.AesToPCMDEnc(targetPhone);
        if (targetPhone == null || targetPhone.length() == 0){
            return JSON.toJSONString(new JSONArray());
        }
        JSONArray jsonArray = locationService.getHeatMap(targetPhone);
        return JSON.toJSONString(jsonArray, SerializerFeature.PrettyFormat,SerializerFeature.DisableCircularReferenceDetect);
    }

}
