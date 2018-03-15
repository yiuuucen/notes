package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.LocationMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.Location;
import cn.com.ctbri.ctbigdata.smarteyes.model.LocationExample;
import cn.com.ctbri.ctbigdata.smarteyes.service.LocationService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by elite on 2018/3/15.
 */
@Service
public class LocationServiceImpl implements LocationService {

    @Autowired
    LocationMapper locationMapper;

    @Override
    public JSONArray getActiveArea(String targetPhone, String startTime, String endTime) {
        LocationExample locationExample = new LocationExample();
        locationExample.createCriteria().andPcmdEncryptIdEqualTo(targetPhone).andCalltimeBetween(startTime+"000000",endTime+"235959");
        List<Location> locationList = locationMapper.selectByExample(locationExample);
        JSONArray jsonArray = new JSONArray();
        locationList.forEach(location -> {
            String str = location.getLocation();
            if (str != null && !str.equals("NULL_NULL")){
                String[] point = str.split("_");
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("coord",point);
                jsonArray.add(jsonObject);
            }
        });
        return jsonArray;
    }
}
