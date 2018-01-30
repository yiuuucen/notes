package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.TargetListMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.TargetList;
import cn.com.ctbri.ctbigdata.smarteyes.model.TargetListExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.TargetService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by elite on 2018/1/12.
 */
@Service
public class TargetServiceImpl implements TargetService {

    @Autowired
    TargetListMapper targetListMapper;

    @Override
    public int insertTarget(User user, String targetPhone, String personType, String searchType) {
        TargetList targetList = new TargetList();
        targetList.setUserId(user.getId());
        targetList.setUserNick(user.getNickname());
        targetList.setTargetPhone(targetPhone);
        targetList.setPersonType(personType);
        targetList.setSearchType(searchType);
        targetList.setCreateTime(new Date());
        targetList.setStatus("已提交");
        return targetListMapper.insert(targetList);
    }

    @Override
    public PageBean<TargetList> getTargetPageList(User user, int pageSize, int pageCode) {
        int totalNum = getTargetCount(user);
        PageBean<TargetList> pageBean = new PageBean<>(pageCode,totalNum,pageSize);
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
        List<TargetList> list = null;
        if (user.getType() == 0)  //0为管理员
        {
            list = targetListMapper.selectByUserId(null,(pageCode - 1) * pageSize,pageSize);
        }else {
            list = targetListMapper.selectByUserId(user.getId(),(pageCode - 1) * pageSize,pageSize);
        }
        pageBean.setDatas(list);
        return pageBean;
    }

    @Override
    public int getTargetCount(User user) {
        TargetListExample targetListExample = new TargetListExample();
        if (user.getType() >= 1) {
            targetListExample.createCriteria().andUserIdEqualTo(user.getId());
        }else {
            targetListExample.createCriteria();
        }
        return targetListMapper.countByExample(targetListExample);
    }
}
