package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.ProjectConstant;
import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLog;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.LogService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by elite on 2018/1/10.
 */
@Controller
@RequestMapping(value = "/log")
public class LogController {

    @Autowired
    LogService logService;

    @RequestMapping(value = "/searchLog", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String searchLog(@RequestParam(value = "pageCode", required = false) Integer pageCode,
                            HttpSession httpSession){
        if (pageCode == null)
            pageCode = 1;
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        PageBean<SystemLog> data = logService.getLogPageList(user,10,pageCode);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("data", data);
        return JSON.toJSONString(jsonObj,true);
    }
}
