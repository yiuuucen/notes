package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.UserService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.LoggerUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by elite on 2018/1/8.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    final static Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    UserService userService;

    @RequestMapping(value = "/register", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String register(@RequestParam(value = "username") String username,
                           @RequestParam(value = "password") String password){
        User user = new User(username,password);
        JSONObject jsonObject = new JSONObject();
        if (userService.findByUsername(username) != null){
            jsonObject.put("result",0);
            return JSON.toJSONString(jsonObject);
        }
        user.setType(1);
        user.setStatus(1);
        userService.createUser(user);
        if (user.getId() != null || user.getId() > 0){
            jsonObject.put("result",1);
        }
        return JSON.toJSONString(jsonObject);
    }

    @RequestMapping(value = "/login", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String login(@RequestParam(value = "username") String username,
                        @RequestParam(value = "password") String password,
                        HttpServletRequest httpServletRequest,
                        HttpServletResponse response) throws ServletException, IOException {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        String res = null;
        try {
            subject.login(token);
        } catch (IncorrectCredentialsException e){
            res = "用户名/密码错误!";
            LoggerUtil.consumerI(new Date() + ": login failed. IP is: " + httpServletRequest.getRemoteAddr());
        } catch (ExcessiveAttemptsException e){
            res = "登录失败多次，账户锁定10分钟!";
        } catch (AuthenticationException e){
            res = "认证错误！";
        }
        JSONObject jsonObject = new JSONObject();
        if (res != null){
            httpServletRequest.setAttribute("res",res);
            jsonObject.put("status",0);
            jsonObject.put("res",res);
//            httpServletRequest.getRequestDispatcher("/index.jsp").forward(httpServletRequest,response);
            return JSON.toJSONString(jsonObject);
        } else {
            jsonObject.put("status",1);
            return JSON.toJSONString(jsonObject);
        }
    }
}

