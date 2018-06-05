package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.ProjectConstant;
import cn.com.ctbri.ctbigdata.smarteyes.constants.XssSqlBinderController;
import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLog;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.LogService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

/**
 * Created by elite on 2018/1/10.
 */
@Controller
@RequestMapping(value = "/log")
public class LogController extends XssSqlBinderController {

    @Autowired
    LogService logService;

    @RequestMapping(value = "/searchLog", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String searchLog(@RequestParam(value = "pageCode", required = false) Integer pageCode,
                            @RequestParam(value = "userName", required = false) String username,
                            HttpSession httpSession){
        if (pageCode == null)
            pageCode = 1;
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        PageBean<SystemLog> data;
        if (username != null && username.length() > 0){
            data = logService.getLogByNameList(user,10,pageCode,username);
        }else {
            data = logService.getLogPageList(user,10,pageCode);
        }
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("data", data);
        return JSON.toJSONString(jsonObj,true);
    }

    @RequestMapping(value = "/daysLog", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String daysLog(@RequestParam(value = "startTime", required = false) String startTime,
                          @RequestParam(value = "endTime", required = false) String endTime,
                          HttpSession httpSession){
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        List<Integer> result = logService.getDayLogCount(user,startTime,endTime);
        return JSON.toJSONString(result,true);
    }

    @RequestMapping(value = "/personLog", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String personLog(@RequestParam(value = "startTime", required = false) String startTime,
                          @RequestParam(value = "endTime", required = false) String endTime,
                          HttpSession httpSession){
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        JSONArray result = logService.getPersonLogCount(user,startTime,endTime);
        return JSON.toJSONString(result,true);
    }

    @RequestMapping(value = "/getNames", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getNames(HttpSession httpSession){
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        Set<String> result = logService.getLogAllNames(user);
        return JSON.toJSONString(result,true);
    }
}
