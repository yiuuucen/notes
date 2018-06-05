package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.Suspect;
import cn.com.ctbri.ctbigdata.smarteyes.model.SuspectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SuspectMapper {
    int countByExample(SuspectExample example);

    int deleteByExample(SuspectExample example);

    int deleteByPrimaryKey(String mdnEncrypt);

    int insert(Suspect record);

    int insertSelective(Suspect record);

    List<Suspect> selectByExample(SuspectExample example);

    Suspect selectByPrimaryKey(String mdnEncrypt);

    int updateByExampleSelective(@Param("record") Suspect record, @Param("example") SuspectExample example);

    int updateByExample(@Param("record") Suspect record, @Param("example") SuspectExample example);

    int updateByPrimaryKeySelective(Suspect record);

    int updateByPrimaryKey(Suspect record);
}