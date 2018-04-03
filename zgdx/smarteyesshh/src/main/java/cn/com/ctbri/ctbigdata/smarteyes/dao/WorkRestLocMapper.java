package cn.com.ctbri.ctbigdata.smarteyes.dao;

import cn.com.ctbri.ctbigdata.smarteyes.model.WorkRestLoc;
import cn.com.ctbri.ctbigdata.smarteyes.model.WorkRestLocExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WorkRestLocMapper {
    int countByExample(WorkRestLocExample example);

    int deleteByExample(WorkRestLocExample example);

    int insert(WorkRestLoc record);

    int insertSelective(WorkRestLoc record);

    List<WorkRestLoc> selectByExample(WorkRestLocExample example);

    int updateByExampleSelective(@Param("record") WorkRestLoc record, @Param("example") WorkRestLocExample example);

    int updateByExample(@Param("record") WorkRestLoc record, @Param("example") WorkRestLocExample example);
}