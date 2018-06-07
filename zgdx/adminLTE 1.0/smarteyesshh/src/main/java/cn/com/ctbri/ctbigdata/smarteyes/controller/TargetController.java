package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.ProjectConstant;
import cn.com.ctbri.ctbigdata.smarteyes.constants.XssSqlBinderController;
import cn.com.ctbri.ctbigdata.smarteyes.model.TargetList;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.TargetService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by elite on 2018/1/12.
 */
@Controller
@RequestMapping(value = "/target")
public class TargetController extends XssSqlBinderController {

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

    @RequestMapping(value = "/uploadPhone", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String uploadPhone(@RequestParam("csvfile") MultipartFile file,
                              HttpSession httpSession) throws IOException {
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        // 手机号验证规则
        String regEx = "[1][3-8]{1}\\d{9}($|[^0-9]{1})";
        // 编译正则表达式
        Pattern pattern = Pattern.compile(regEx);
        //解析file文件
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(file.getInputStream(), "GBK"));
        String innerStr = null;
        int i = 0;
        while ((innerStr = bufferedReader.readLine()) != null) {
            String[] strs = innerStr.split(",");
            // 编译正则表达式
            Matcher matcher = pattern.matcher(strs[0]);
            // 字符串是否与正则表达式相匹配
            boolean rs = matcher.matches();
            // 如果匹配，则写入数据库
            if(rs){
                i += targetService.insertTarget(user,strs[0],strs[1],strs[2]);
            }
        }
        JSONObject jsonObject = new JSONObject();
        if (i > 0){
            jsonObject.put("result",1);
        } else {
            jsonObject.put("result",0);
        }
        return JSON.toJSONString(jsonObject,true);
    }

    //下载csv模板
    @RequestMapping(value = "/download", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public ResponseEntity<byte[]> getCsvData() throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", "templet.csv");
        String result = "189xxxx5678,一般人员,涉毒" + "\n" + "189xxxx6789,重点人员,盗窃";
        return new ResponseEntity<>(result.getBytes("GBK"), headers, HttpStatus.OK);
    }
}