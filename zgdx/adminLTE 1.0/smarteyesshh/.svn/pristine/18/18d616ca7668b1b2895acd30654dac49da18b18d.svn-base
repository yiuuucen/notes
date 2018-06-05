package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.XssSqlBinderController;
import cn.com.ctbri.ctbigdata.smarteyes.service.LocationService;
import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import cn.com.ctbri.ctbigdata.smarteyes.utils.LocationUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

/**
 * Created by elite on 2017/12/5.
 */
@Controller
@RequestMapping(value = "/region")
public class RegionController extends XssSqlBinderController {

    @Autowired
    LocationService locationService;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @RequestMapping(value = "/getRegion_bak", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getRegion_bak(@RequestParam(value = "targetPhone") String targetPhone){
        Random random = new Random(Long.valueOf(targetPhone));
        JSONArray jsonArray = new JSONArray();
        double[] point1 = LocationUtil.randomShhArr(random);
        double[] point2 = LocationUtil.randomShhArr(random);
        double[] point3 = LocationUtil.randomShhArr(random);
        jsonArray.add(point1);
        jsonArray.add(point2);
        jsonArray.add(point3);
        return JSON.toJSONString(jsonArray, true);
    }

    @RequestMapping(value = "/getRegion", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getRegion(@RequestParam(value = "targetPhone") String targetPhone){
        JSONArray jsonArray = locationService.getWorkRestArea(targetPhone);
        return JSON.toJSONString(jsonArray, true);
    }
}
