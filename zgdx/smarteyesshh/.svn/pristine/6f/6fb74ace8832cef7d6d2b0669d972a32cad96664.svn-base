package cn.com.ctbri.ctbigdata.smarteyes.service;

import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLog;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;

/**
 * Created by elite on 2018/1/10.
 */
public interface LogService {

    /**
     * 新建一条日志
     * @param userId
     * @param targetPhone
     * @return
     */
    public int createLog(long userId, String userNick, String targetPhone);

    /**
     * 分页查询日志
     * @param user
     * @param pageSize
     * @param pageCode
     * @return
     */
    public PageBean<SystemLog> getLogPageList(User user, int pageSize, int pageCode);

    /**
     * 统计日志条数
     * @param user
     * @return
     */
    public int getLogCount(User user);
}
