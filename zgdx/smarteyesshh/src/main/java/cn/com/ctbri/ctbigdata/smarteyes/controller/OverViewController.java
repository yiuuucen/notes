package cn.com.ctbri.ctbigdata.smarteyes.controller;

import cn.com.ctbri.ctbigdata.smarteyes.constants.ProjectConstant;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.LogService;
import cn.com.ctbri.ctbigdata.smarteyes.service.OverViewService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.ShuffleUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by elite on 2017/11/21.
 */
@Controller
public class OverViewController {

    @Autowired
    private OverViewService overViewService;

    @Autowired
    private LogService logService;

    @RequestMapping(value = "/overview")
    public String overview(@RequestParam(value="targetPhone")String targetPhone, HttpServletRequest request,
                           HttpSession httpSession){
        request.setAttribute("targetPhone",targetPhone);
        User user = (User) httpSession.getAttribute(ProjectConstant.CURRENT_USER);
        System.out.println("luis test: " + user);
        logService.createLog(user.getId(),user.getNickname(),targetPhone);
        return "overview";
    }

    @RequestMapping(value = "/contact")
    public String contactList(@RequestParam(value="targetPhone",required = false)String targetPhone, HttpServletRequest request){
        request.setAttribute("targetPhone",targetPhone);
        return "contact";
    }

    @RequestMapping(value = "/region")
    public String region(@RequestParam(value="targetPhone",required = false)String targetPhone, HttpServletRequest request){
        request.setAttribute("targetPhone",targetPhone);
        return "region";
    }

    @RequestMapping(value = "/system")
    public String system(@RequestParam(value="targetPhone",required = false)String targetPhone, HttpServletRequest request){
        request.setAttribute("targetPhone",targetPhone);
        return "system";
    }

    @RequestMapping(value = "/person")
    public String person(@RequestParam(value="targetPhone",required = false)String targetPhone, HttpServletRequest request){
        request.setAttribute("targetPhone",targetPhone);
        return "person";
    }

    @RequestMapping(value = "/personlist")
    public String personlist(@RequestParam(value="targetPhone",required = false)String targetPhone, HttpServletRequest request){
        request.setAttribute("targetPhone",targetPhone);
        return "personlist";
    }

    @RequestMapping(value = "/search")
    public String search(HttpServletRequest request){

        return "search";
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request){
        return "login";
    }

    @RequestMapping(value = "/getOverView", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getOverView(@RequestParam(value = "targetPhone") String targetPhone){
        JSONObject jsonObject = overViewService.getTitleData(targetPhone,"");
        return JSON.toJSONString(jsonObject,true);
    }

    @RequestMapping(value = "/getContactList", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getContactList(@RequestParam(value = "targetPhone") String targetPhone){
        List<String> list = overViewService.getContactList(targetPhone,"").stream().limit(10).collect(Collectors.toList());
        if (list == null || list.size() == 0){
            JSONArray nodeArray = new JSONArray();
            JSONObject object = new JSONObject();
            object.put("name",targetPhone);
            nodeArray.add(object);
            JSONObject res = new JSONObject();
            res.put("nodes",nodeArray);
            JSONArray edgeArray = new JSONArray();
            JSONObject jsonObj = new JSONObject();
            jsonObj.put("source",targetPhone);
            jsonObj.put("target","");
            edgeArray.add(jsonObj);
            res.put("edges",edgeArray);
            return JSON.toJSONString(res,true);
        }

//        list = list.stream().map(s -> AESUtil.encrypt(s, ProjectConstant.AES_PASSWORD)).collect(Collectors.toList());
        list = list.stream().map(ShuffleUtil::encryptStr).collect(Collectors.toList());

        JSONArray nodeArray = new JSONArray();
        JSONArray edgeArray = new JSONArray();
        JSONObject obj = new JSONObject();
        obj.put("name",targetPhone);
        nodeArray.add(obj);
        list.forEach(x -> {
            JSONObject jsonObj = new JSONObject();
            jsonObj.put("name",x);
            nodeArray.add(jsonObj);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("source",targetPhone);
            jsonObject.put("target",x);
            edgeArray.add(jsonObject);
        });
        JSONObject res = new JSONObject();
        res.put("edges",edgeArray);
        res.put("nodes",nodeArray);
        return JSON.toJSONString(res,true);
    }

    @RequestMapping(value = "/getHeatMap", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getHeatMap(@RequestParam(value = "targetPhone", required = false) String targetPhone){
        JSONArray jsonArray = overViewService.getHeatMap(targetPhone,"");
        return JSON.toJSONString(jsonArray, SerializerFeature.PrettyFormat,SerializerFeature.DisableCircularReferenceDetect);
    }
}
