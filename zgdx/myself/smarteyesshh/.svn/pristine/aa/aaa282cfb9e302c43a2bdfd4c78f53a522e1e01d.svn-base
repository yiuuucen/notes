package cn.com.ctbri.ctbigdata.smarteyes.service;

import cn.com.ctbri.ctbigdata.smarteyes.dao.MappingMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.Mapping;
import cn.com.ctbri.ctbigdata.smarteyes.model.MappingExample;
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
}
