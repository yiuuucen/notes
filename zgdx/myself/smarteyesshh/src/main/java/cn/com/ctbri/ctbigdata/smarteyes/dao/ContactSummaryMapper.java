package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummary;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummaryExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.ContactSummaryKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ContactSummaryMapper {
    int countByExample(ContactSummaryExample example);

    int deleteByExample(ContactSummaryExample example);

    int deleteByPrimaryKey(ContactSummaryKey key);

    int insert(ContactSummary record);

    int insertSelective(ContactSummary record);

    List<ContactSummary> selectByExample(ContactSummaryExample example);

    ContactSummary selectByPrimaryKey(ContactSummaryKey key);

    int updateByExampleSelective(@Param("record") ContactSummary record, @Param("example") ContactSummaryExample example);

    int updateByExample(@Param("record") ContactSummary record, @Param("example") ContactSummaryExample example);

    int updateByPrimaryKeySelective(ContactSummary record);

    int updateByPrimaryKey(ContactSummary record);
}