package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.ContactDayList;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactDayListExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactDayListKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ContactDayListMapper {
    int countByExample(ContactDayListExample example);

    int deleteByExample(ContactDayListExample example);

    int deleteByPrimaryKey(ContactDayListKey key);

    int insert(ContactDayList record);

    int insertSelective(ContactDayList record);

    List<ContactDayList> selectByExampleWithBLOBs(ContactDayListExample example);

    List<ContactDayList> selectByExample(ContactDayListExample example);

    ContactDayList selectByPrimaryKey(ContactDayListKey key);

    int updateByExampleSelective(@Param("record") ContactDayList record, @Param("example") ContactDayListExample example);

    int updateByExampleWithBLOBs(@Param("record") ContactDayList record, @Param("example") ContactDayListExample example);

    int updateByExample(@Param("record") ContactDayList record, @Param("example") ContactDayListExample example);

    int updateByPrimaryKeySelective(ContactDayList record);

    int updateByPrimaryKeyWithBLOBs(ContactDayList record);
}