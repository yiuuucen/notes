package cn.com.ctbri.ctbigdata.smarteyes.service;

import cn.com.ctbri.ctbigdata.smarteyes.model.TargetList;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;

/**
 * Created by elite on 2018/1/12.
 */
public interface TargetService {

    /**
     * 新增一个目标人员
     * @param user
     * @param targetPhone
     * @param personType
     * @param searchType
     * @return
     */
    public int insertTarget(User user, String targetPhone, String personType, String searchType);

    /**
     * 分页查询日志
     * @param user
     * @param pageSize
     * @param pageCode
     * @return
     */
    public PageBean<TargetList> getTargetPageList(User user, int pageSize, int pageCode);

    /**
     * 统计日志条数
     * @param user
     * @return
     */
    public int getTargetCount(User user);

}
