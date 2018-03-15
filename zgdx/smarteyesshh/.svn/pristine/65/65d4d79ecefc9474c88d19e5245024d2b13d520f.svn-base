package cn.com.ctbri.ctbigdata.smarteyes.controller;

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
public class LocationController {

    @Autowired
    LocationService locationService;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @RequestMapping(value = "/getHeatMap", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getHeatMap(@RequestParam(value = "targetPhone", required = false) String targetPhone,
                             @RequestParam(value = "startTime", required = false) String startTime,
                             @RequestParam(value = "endTime", required = false) String endTime){
        targetPhone = mdnToEncrypt.mdnTtoPCMDEnc(targetPhone);
        JSONArray jsonArray = locationService.getActiveArea(targetPhone,startTime,endTime);
        return JSON.toJSONString(jsonArray, SerializerFeature.PrettyFormat,SerializerFeature.DisableCircularReferenceDetect);
    }

}
