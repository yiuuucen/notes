package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.SystemLogMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLog;
import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLogExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.LogService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by elite on 2018/1/10.
 */
@Service
public class LogServiceImpl implements LogService {

    @Autowired
    SystemLogMapper systemLogMapper;

    @Override
    public int createLog(long userId,String userNick, String targetPhone) {
        SystemLog systemLog = new SystemLog();
        systemLog.setUserId(userId);
        systemLog.setTargetPhone(targetPhone);
        systemLog.setUserNickname(userNick);
        systemLog.setSearchTime(new Date());
        systemLog.setPersonType("一般人员");
        systemLog.setSearchType("XX");
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
}
