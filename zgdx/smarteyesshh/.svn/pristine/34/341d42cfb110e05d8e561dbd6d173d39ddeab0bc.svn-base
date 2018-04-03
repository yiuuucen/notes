package cn.com.ctbri.ctbigdata.smarteyes.service;

import cn.com.ctbri.ctbigdata.smarteyes.model.SystemLog;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import com.alibaba.fastjson.JSONArray;

import java.util.List;
import java.util.Set;

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

    /**
     * 按天统计日志条数
     * @param user
     * @param startTime
     * @param endTime
     * @return
     */
    public List<Integer> getDayLogCount(User user,String startTime, String endTime);

    /**
     * 获取top10人员操作次数
     * @param user
     * @param startTime
     * @param endTime
     * @return
     */
    public JSONArray getPersonLogCount(User user, String startTime, String endTime);

    /**
     * 查询日志，并根据用户名字进行筛选
     * @param user
     * @param pageSize
     * @param pageCode
     * @return
     */
    public PageBean<SystemLog> getLogByNameList(User user, int pageSize, int pageCode, String userName);

    /**
     * 根据用户姓名统计日志条数
     * @param user
     * @return
     */
    public int getLogCountByName(User user, String userName);

    /**
     * 获得所有操作者姓名
     * @param user
     * @return
     */
    public Set<String> getLogAllNames(User user);

}
