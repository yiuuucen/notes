package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.Mapping;
import cn.com.ctbri.ctbigdata.smarteyes.model.MappingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MappingMapper {
    int countByExample(MappingExample example);

    int deleteByExample(MappingExample example);

    int insert(Mapping record);

    int insertSelective(Mapping record);

    List<Mapping> selectByExample(MappingExample example);

    int updateByExampleSelective(@Param("record") Mapping record, @Param("example") MappingExample example);

    int updateByExample(@Param("record") Mapping record, @Param("example") MappingExample example);
}