package cn.com.ctbri.ctbigdata.smarteyes.service;

import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;

/**
 * Created by elite on 2018/1/8.
 */
public interface UserService {

    /**
     * 创建用户
     * @param user
     */
    public User createUser(User user);

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User findByUsername(String username);

    /**
     * 更新用户
     * @param user
     * @return
     */
    public int updateUser(User user);

    /**
     * 分页查询用户
     * @param pageSize
     * @param pageCode
     * @return
     */
    public PageBean<User> getUserPageList(int pageSize, int pageCode);

    /**
     * 统计用户人数
     * @return
     */
    public int getLogCount();


    /**
     * 根据id查找user
     * @param id
     * @return
     */
    public User selectById(Long id);
}
