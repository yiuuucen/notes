package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.ProjectConstant;
import cn.com.ctbri.ctbigdata.smarteyes.model.TargetList;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.TargetService;
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
 * Created by elite on 2018/1/12.
 */
@Controller
@RequestMapping(value = "/target")
public class TargetController {

    @Autowired
    TargetService targetService;

    @RequestMapping(value = "/insertTarget", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String insertTarget(@RequestParam(value = "loadPhone", required = false) String loadPhone,
                               @RequestParam(value = "personType", required = false) String personType,
                               @RequestParam(value = "searchType", required = false) String searchType,
                            HttpSession httpSession){
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        int res = targetService.insertTarget(user,loadPhone,personType,searchType);
        JSONObject jsonObj = new JSONObject();
        if (res > 0) {
            jsonObj.put("res", "提交成功！");
        } else {
            jsonObj.put("res", "提交失败，请联系管理员");
        }
        return JSON.toJSONString(jsonObj,true);
    }

    @RequestMapping(value = "/searchTarget", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String searchTarget(@RequestParam(value = "pageCode", required = false) Integer pageCode,
                            HttpSession httpSession){
        if (pageCode == null)
            pageCode = 1;
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        PageBean<TargetList> pageBean = targetService.getTargetPageList(user,10,pageCode);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("result",pageBean);
        return JSON.toJSONString(jsonObj,true);
    }
}
