package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.SystemLogMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLog;
import cn.com.ctbri.ctbigdata.smarteyes.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

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
}
