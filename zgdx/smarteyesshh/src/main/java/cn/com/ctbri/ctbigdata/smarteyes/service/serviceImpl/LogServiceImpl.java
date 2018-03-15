package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.SystemLogMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLog;
import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLogExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.LogService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.DateUtils;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static java.util.stream.Collectors.counting;
import static java.util.stream.Collectors.groupingBy;

/**
 * Created by elite on 2018/1/10.
 */
@Service
public class LogServiceImpl implements LogService {

    @Autowired
    SystemLogMapper systemLogMapper;

    private static final DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");

    @Override
    public int createLog(long userId,String userNick, String targetPhone) {
        SystemLog systemLog = new SystemLog();
        systemLog.setUserId(userId);
        systemLog.setTargetPhone(targetPhone);
        systemLog.setUserNickname(userNick);
        systemLog.setSearchTime(new Date());
        systemLog.setPersonType("一般人员");
        systemLog.setSearchType("涉案");
        systemLog.setStatus("1");
        return systemLogMapper.insertSelective(systemLog);
    }

    @Override
    public PageBean<SystemLog> getLogPageList(User user, int pageSize, int pageCode) {
        int totalNum = getLogCount(user);
        PageBean<SystemLog> pageBean = new PageBean<>(pageCode,totalNum,pageSize);
        if (pageCode < 1) {
            pageCode = 1;
            pageBean.setPageCode(pageCode);
        }else if( pageCode > pageBean.getTotalPage()){
            if(pageBean.getTotalPage()==0){
                pageCode=1;
            }else{
                pageCode=pageBean.getTotalPage();
            }
            pageBean.setPageCode(pageCode);
        }
        List<SystemLog> list = null;
        if (user.getType() == 0)  //0为管理员
        {
            list = systemLogMapper.selectByUserId(null,(pageCode - 1) * pageSize,pageSize);
        }else {
            list = systemLogMapper.selectByUserId(user.getId(),(pageCode - 1) * pageSize,pageSize);
        }
        pageBean.setDatas(list);
        return pageBean;
    }

    @Override
    public int getLogCount(User user) {
        SystemLogExample systemLogExample = new SystemLogExample();
        if (user.getType() >= 1) {
            systemLogExample.createCriteria().andUserIdEqualTo(user.getId());
        }else {
            systemLogExample.createCriteria();
        }
        return systemLogMapper.countByExample(systemLogExample);
    }

    @Override
    public List<Integer> getDayLogCount(User user, String startTime, String endTime) {
        LocalDate start = LocalDate.parse(startTime,format);
        LocalDate end = LocalDate.parse(endTime,format);
        LinkedList<Integer> linkList = new LinkedList<>();
        for (;start.isBefore(end)||start.isEqual(end); start = start.plusDays(1)){
            SystemLogExample systemLogExample = new SystemLogExample();
            systemLogExample.createCriteria().andSearchTimeBetween(DateUtils.getStringToDate(start.format(format)+"000000"),DateUtils.getStringToDate(start.format(format)+"235959"));
            linkList.add(systemLogMapper.countByExample(systemLogExample));
        }
        return linkList;
    }

    @Override
    public JSONArray getPersonLogCount(User user, String startTime, String endTime) {
        SystemLogExample systemLogExample = new SystemLogExample();
        systemLogExample.createCriteria().andSearchTimeBetween(DateUtils.getStringToDate(startTime+"000000"),DateUtils.getStringToDate(endTime+"235959"));
        List<SystemLog> list = systemLogMapper.selectByExample(systemLogExample);
        //根据name分组，并统计次数
        Map<String, Long> map = list.stream().collect(groupingBy(SystemLog::getUserNickname,counting()));
        //排序并取top10
        List<Map.Entry<String, Long>> map_list = new LinkedList<>(map.entrySet());
        map_list.sort((o1, o2) -> (o2.getValue()).compareTo(o1.getValue()));
        JSONArray jsonArray = new JSONArray();
        map_list.parallelStream().limit(10).forEach(entry -> {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name",entry.getKey());
            jsonObject.put("number",entry.getValue());
            jsonArray.add(jsonObject);
        });
        return jsonArray;
    }
}
