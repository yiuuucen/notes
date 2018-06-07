package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.UserMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.model.UserExample;
import cn.com.ctbri.ctbigdata.smarteyes.service.UserService;
import cn.com.ctbri.ctbigdata.smarteyes.shiro.PasswordHelper;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by elite on 2018/1/8.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    PasswordHelper passwordHelper;

    @Autowired
    UserMapper userMapper;

    @Override
    public User createUser(User user) {
        //加密密码
        passwordHelper.encryptPassword(user);
        userMapper.insertSelective(user);
        return user;
    }

    @Override
    public User findByUsername(String username) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUsernameEqualTo(username);
        List<User> list = userMapper.selectByExample(userExample);
        if (list.size() == 0)
            return null;
        return list.get(0);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public PageBean<User> getUserPageList(int pageSize, int pageCode) {
        int totalNum = getLogCount();
        PageBean<User> pageBean = new PageBean<>(pageCode,totalNum,pageSize);
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
        List<User> list = userMapper.selectByPage((pageCode - 1) * pageSize,pageSize);
        list.forEach(user -> {
            user.setId(user.getId()+10000);
            String phone = user.getUsername();
            if (phone != null && phone.length() > 8){
                phone = phone.substring(0,phone.length() - 8) + "****" + phone.substring(phone.length() - 4);
            }
            user.setUsername(phone);
        });
        pageBean.setDatas(list);
        return pageBean;
    }

    @Override
    public int getLogCount() {
        UserExample userExample = new UserExample();
        userExample.createCriteria();
        return userMapper.countByExample(userExample);
    }

    @Override
    public User selectById(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }
}