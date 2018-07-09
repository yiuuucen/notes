package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.TargetListMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.TargetList;
import cn.com.ctbri.ctbigdata.smarteyes.model.TargetListExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.User;
import cn.com.ctbri.ctbigdata.smarteyes.service.TargetService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.AESUtil;
import cn.com.ctbri.ctbigdata.smarteyes.utils.PageBean;
import cn.com.ctbri.ctbigdata.smarteyes.utils.WebPageUtil;

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
        targetList.setUserNick(user.getNickname());//该用户名已经加密
        try {
            targetList.setTargetPhone(AESUtil.aesEncrypt(AESUtil.DENGTA_KEY,targetPhone));
        } catch (Exception e) {
            targetList.setTargetPhone(targetPhone);
        }
        try {
        	targetList.setSearchType(AESUtil.aesEncrypt(AESUtil.DENGTA_KEY,searchType));
        } catch (Exception e) {
        	targetList.setSearchType(searchType);
        }
        targetList.setPersonType(personType);
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
        
        list.parallelStream().forEach(targetList -> {
        	targetList.setUserId(targetList.getUserId()+10000);
        	//手机号解密并隐藏中间四位
        	String phone = WebPageUtil.phoneDecryptHide(targetList.getTargetPhone());
        	targetList.setTargetPhone(phone);
        	//涉案类型解密
        	String searchType = targetList.getSearchType();
        	try {
        		searchType = AESUtil.aesDecrypt(AESUtil.DENGTA_KEY, searchType);
        	} catch (Exception e) {
        		searchType = targetList.getSearchType();
        	}
        	targetList.setSearchType(searchType);
        	//用户姓名解密并隐藏中间四位
        	String userName = WebPageUtil.nameDecryptHide(targetList.getUserNick());
        	targetList.setUserNick(userName);
        });
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
