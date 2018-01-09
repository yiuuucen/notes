package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.ContactListExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactListKey;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactListWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ContactListMapper {
    int countByExample(ContactListExample example);

    int deleteByExample(ContactListExample example);

    int deleteByPrimaryKey(ContactListKey key);

    int insert(ContactListWithBLOBs record);

    int insertSelective(ContactListWithBLOBs record);

    List<ContactListWithBLOBs> selectByExampleWithBLOBs(ContactListExample example);

    List<ContactListKey> selectByExample(ContactListExample example);

    ContactListWithBLOBs selectByPrimaryKey(ContactListKey key);

    int updateByExampleSelective(@Param("record") ContactListWithBLOBs record, @Param("example") ContactListExample example);

    int updateByExampleWithBLOBs(@Param("record") ContactListWithBLOBs record, @Param("example") ContactListExample example);

    int updateByExample(@Param("record") ContactListKey record, @Param("example") ContactListExample example);

    int updateByPrimaryKeySelective(ContactListWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ContactListWithBLOBs record);
}