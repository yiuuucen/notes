package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfo;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfoExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactInfoKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ContactInfoMapper {
    int countByExample(ContactInfoExample example);

    int deleteByExample(ContactInfoExample example);

    int deleteByPrimaryKey(ContactInfoKey key);

    int insert(ContactInfo record);

    int insertSelective(ContactInfo record);

    List<ContactInfo> selectByExample(ContactInfoExample example);

    ContactInfo selectByPrimaryKey(ContactInfoKey key);

    int updateByExampleSelective(@Param("record") ContactInfo record, @Param("example") ContactInfoExample example);

    int updateByExample(@Param("record") ContactInfo record, @Param("example") ContactInfoExample example);

    int updateByPrimaryKeySelective(ContactInfo record);

    int updateByPrimaryKey(ContactInfo record);
}