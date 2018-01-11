package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.UserMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.model.UserExample;
import cn.com.ctbri.ctbigdata.smarteyes.service.UserService;
import cn.com.ctbri.ctbigdata.smarteyes.shiro.PasswordHelper;
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
}
