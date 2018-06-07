package cn.com.ctbri.ctbigdata.smarteyes.service;

import cn.com.ctbri.ctbigdata.smarteyes.dao.MappingMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.Mapping;
import cn.com.ctbri.ctbigdata.smarteyes.model.MappingExample;
import cn.com.ctbri.ctbigdata.smarteyes.utils.AESUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by elite on 2017/12/21.
 */
@Service
public class MdnToEncrypt {

    @Autowired
    MappingMapper mappingMapper;

    public String mdnTtoEnc(String phone) {
        String res = "";
        MappingExample mappingExample = new MappingExample();
        mappingExample.createCriteria().andMdnEqualTo(phone);
        List<Mapping> list = mappingMapper.selectByExample(mappingExample);
        if (list.size() > 0){
            res = list.get(0).getTelecomEncrypt();
        }
        return res;
    }

    public String mdnTtoPCMDEnc(String phone) {
        String res = "";
        MappingExample mappingExample = new MappingExample();
        mappingExample.createCriteria().andMdnEqualTo(phone);
        List<Mapping> list = mappingMapper.selectByExample(mappingExample);
        if (list.size() > 0){
            res = list.get(0).getPcmdEncrypt();
        }
        return res;
    }

    public String AesToEnc(String phone) {
        String res = "";
        MappingExample mappingExample = new MappingExample();
        try {
            mappingExample.createCriteria().andMdnEncryptEqualTo(AESUtil.aesEncrypt(AESUtil.DENGTA_KEY,phone));
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Mapping> list = mappingMapper.selectByExample(mappingExample);
        if (list.size() > 0){
            res = list.get(0).getTelecomEncrypt();
        }
        return res;
    }
    
    public String EncToAES(String telecomEnc) {
        String res = "";
        try {
        	MappingExample mappingExample = new MappingExample();
        	mappingExample.createCriteria().andTelecomEncryptEqualTo(telecomEnc);
        	List<Mapping> list = mappingMapper.selectByExample(mappingExample);
        	if (list.size() > 0){
        		res = AESUtil.aesDecrypt(AESUtil.DENGTA_KEY,list.get(0).getMdnEncrypt());
        	}
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return res;
    }

    public String AesToPCMDEnc(String phone) {
        String res = "";
        MappingExample mappingExample = new MappingExample();
        try {
            mappingExample.createCriteria().andMdnEncryptEqualTo(AESUtil.aesEncrypt(AESUtil.DENGTA_KEY,phone));
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Mapping> list = mappingMapper.selectByExample(mappingExample);
        if (list.size() > 0){
            res = list.get(0).getPcmdEncrypt();
        }
        return res;
    }
}