package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.MappingMapper;
import cn.com.ctbri.ctbigdata.smarteyes.dao.SuspectMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.Mapping;
import cn.com.ctbri.ctbigdata.smarteyes.model.MappingExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.SuspectExample;
import cn.com.ctbri.ctbigdata.smarteyes.service.SuspectService;
import cn.com.ctbri.ctbigdata.smarteyes.utils.AESUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by elite on 2018/3/20.
 */
@Service
public class SuspectServiceImpl implements SuspectService {

    @Autowired
    SuspectMapper suspectMapper;

    @Autowired
    MappingMapper mappingMapper;

    @Override
    public boolean isSuspect(String targetPhone) {
        SuspectExample suspectExample = new SuspectExample();
        int count = 0;
        try {
            suspectExample.createCriteria().andMdnEncryptEqualTo(AESUtil.aesEncrypt(AESUtil.DENGTA_KEY,targetPhone));
            count = suspectMapper.countByExample(suspectExample);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count > 0;
    }

    @Override
    public boolean isEncSuspect(String targetPhoneEnc) {
        MappingExample mappingExample = new MappingExample();
        mappingExample.createCriteria().andTelecomEncryptEqualTo(targetPhoneEnc);
        List<Mapping> list = mappingMapper.selectByExample(mappingExample);
        if (list == null || list.size() == 0)
            return false;

        SuspectExample suspectExample = new SuspectExample();
        int count = 0;
        try {
            suspectExample.createCriteria().andMdnEncryptEqualTo(list.get(0).getMdnEncrypt());
            count = suspectMapper.countByExample(suspectExample);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count > 0;
    }

    @Override
    public String getSuspectType(String targetPhone) {
        SuspectExample suspectExample = new SuspectExample();
        String res = null;
        try {
            suspectExample.createCriteria().andMdnEncryptEqualTo(AESUtil.aesEncrypt(AESUtil.DENGTA_KEY,targetPhone));
            res = suspectMapper.selectByExample(suspectExample).get(0).getType();
            
        } catch (Exception e) {
            e.printStackTrace();
            return "未知";
        }
        
        //解密
        String[] typeArray = res.split(",");
        String type ="";
        for(String t: typeArray){
        	try{
        		t = AESUtil.aesDecrypt(AESUtil.DENGTA_KEY, t);
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        	type +=","+t;
        }
        
        return type.substring(1);
    }

	@Override
	public String getSuspectTypeEncrypt(String targetPhone) {
		 SuspectExample suspectExample = new SuspectExample();
	        String res = "";
	        try {
	            suspectExample.createCriteria().andMdnEncryptEqualTo(AESUtil.aesEncrypt(AESUtil.DENGTA_KEY,targetPhone));
	            res = suspectMapper.selectByExample(suspectExample).get(0).getType();
	        } catch (Exception e) {
	            e.printStackTrace();
	            try {
					res = AESUtil.aesEncrypt(AESUtil.DENGTA_KEY, "未知");
				} catch (Exception e1) {
					e1.printStackTrace();
				} 
	        }
	        return res;
	}

}
