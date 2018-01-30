package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by elite on 2018/1/10.
 */
@Controller
@RequestMapping(value = "/log")
public class LogController {

    @Autowired
    LogService logService;

    @RequestMapping(value = "/insertLog", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String insertLog(@RequestParam(value = "targetPhone") String username,
                           @RequestParam(value = "password") String password){

        return null;
    }
}
