package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.TargetList;
import cn.com.ctbri.ctbigdata.smarteyes.model.TargetListExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TargetListMapper {
    int countByExample(TargetListExample example);

    int deleteByExample(TargetListExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TargetList record);

    int insertSelective(TargetList record);

    List<TargetList> selectByExample(TargetListExample example);

    TargetList selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TargetList record, @Param("example") TargetListExample example);

    int updateByExample(@Param("record") TargetList record, @Param("example") TargetListExample example);

    int updateByPrimaryKeySelective(TargetList record);

    int updateByPrimaryKey(TargetList record);

    List<TargetList> selectByUserId(@Param("id")Long id, @Param("startPage")int startPage, @Param("pageSize")int pageSize);

}