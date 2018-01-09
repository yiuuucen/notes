package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import cn.com.ctbri.ctbigdata.smarteyes.service.OverViewBetaService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by elite on 2017/12/21.
 */
@Controller
@RequestMapping(value = "/beta")
public class OverViewBetaController {

    @Autowired
    OverViewBetaService overViewBetaService;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @RequestMapping(value = "/relationGraph",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String relationGraph(@RequestParam(value="targetPhone")String targetPhone,
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
        JSONArray jsonArray = overViewBetaService.getFirstAndSecondContact(targetPhone,startTime,type);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("nodes",jsonArray);
        return JSON.toJSONString(jsonObject);
    }

    @RequestMapping(value = "/dairyDuration",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String dairyDuration(@RequestParam(value="targetPhone")String targetPhone,
                                @RequestParam(value="startTime")String startTime,
                                @RequestParam(value="endTime")String endTime){
        targetPhone = mdnToEncrypt.mdnTtoEnc(targetPhone);
        List<Double> list = overViewBetaService.getDairyDutation(targetPhone,startTime,endTime);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("duration",list);
        return JSON.toJSONString(jsonObject);
    }

    @RequestMapping(value = "/dayDuration",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String dayDuration(@RequestParam(value="targetPhone")String targetPhone,
                                @RequestParam(value="searchTime")String searchTime){
        targetPhone = mdnToEncrypt.mdnTtoEnc(targetPhone);
        JSONObject jsonObject = overViewBetaService.getDayDutation(targetPhone,searchTime);
        return JSON.toJSONString(jsonObject);
    }
}
