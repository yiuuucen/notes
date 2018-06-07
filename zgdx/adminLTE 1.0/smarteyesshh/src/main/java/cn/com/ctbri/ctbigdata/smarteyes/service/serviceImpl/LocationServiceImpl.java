package cn.com.ctbri.ctbigdata.smarteyes.service.serviceImpl;

import cn.com.ctbri.ctbigdata.smarteyes.dao.LocationMapper;
import cn.com.ctbri.ctbigdata.smarteyes.dao.WorkRestLocMapper;
import cn.com.ctbri.ctbigdata.smarteyes.model.Location;
import cn.com.ctbri.ctbigdata.smarteyes.model.LocationExample;
import cn.com.ctbri.ctbigdata.smarteyes.model.WorkRestLoc;
import cn.com.ctbri.ctbigdata.smarteyes.model.WorkRestLocExample;
import cn.com.ctbri.ctbigdata.smarteyes.service.LocationService;
import cn.com.ctbri.ctbigdata.smarteyes.service.MdnToEncrypt;
import cn.com.ctbri.ctbigdata.smarteyes.utils.LocationUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import static java.time.temporal.ChronoUnit.DAYS;

/**
 * Created by elite on 2018/3/15.
 */
@Service
public class LocationServiceImpl implements LocationService {

    @Autowired
    LocationMapper locationMapper;

    @Autowired
    WorkRestLocMapper workRestLocMapper;

    @Autowired
    MdnToEncrypt mdnToEncrypt;

    @Override
    public JSONArray getActiveArea(String targetPhone, String startTime, String endTime, String type) {
        LocationExample locationExample = new LocationExample();
        locationExample.createCriteria().andPcmdEncryptIdEqualTo(targetPhone).andCalltimeBetween(startTime+"000000",endTime+"235959");
        List<Location> locationList = locationMapper.selectByExample(locationExample);

        //区分上午、中午、晚上
        if (type.equals("morning")){
            locationList = locationList.stream().filter(location -> location.getCalltime().substring(8).compareTo("120000") < 0 &&
                    location.getCalltime().substring(8).compareTo("060000") > 0).collect(Collectors.toList());
        }else if (type.equals("afternoon")){
            locationList = locationList.stream().filter(location -> location.getCalltime().substring(8).compareTo("180000") < 0 &&
                    location.getCalltime().substring(8).compareTo("120000") > 0).collect(Collectors.toList());
        }else if (type.equals("evening")){
            locationList = locationList.stream().filter(location -> (location.getCalltime().substring(8).compareTo("235959") < 0 &&
                    location.getCalltime().substring(8).compareTo("180000") > 0) ||
                    (location.getCalltime().substring(8).compareTo("060000") < 0 &&
                    location.getCalltime().substring(8).compareTo("000000") > 0)).collect(Collectors.toList());
        }

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

    @Override
    public JSONArray getWorkRestArea(String targetPhoneOrigin) {
    	JSONArray jsonArray = new JSONArray();
        String targetPhone = mdnToEncrypt.AesToPCMDEnc(targetPhoneOrigin);
        if (targetPhone == null || targetPhone.length() == 0){
//        	Random random = new Random(Long.valueOf(targetPhoneOrigin));
//            double[] point1 = LocationUtil.randomShhArr(random);
//            double[] point2 = LocationUtil.randomShhArr(random);
//            double[] point3 = LocationUtil.randomShhArr(random);
//            jsonArray.add(point1);
//            jsonArray.add(point2);
//            jsonArray.add(point3);
            return jsonArray;
        }
        WorkRestLocExample workRestLocExample = new WorkRestLocExample();
        workRestLocExample.createCriteria().andPcmdEncryptIdEqualTo(targetPhone);
        List<WorkRestLoc> locs = workRestLocMapper.selectByExample(workRestLocExample);

        if (locs == null || locs.size() == 0){
//            Random random = new Random(Long.valueOf(targetPhoneOrigin));
//            double[] point1 = LocationUtil.randomShhArr(random);
//            double[] point2 = LocationUtil.randomShhArr(random);
//            double[] point3 = LocationUtil.randomShhArr(random);
//            jsonArray.add(point1);
//            jsonArray.add(point2);
//            jsonArray.add(point3);
            return jsonArray;
        }

        try {
            //工作地
            List<WorkRestLoc> workList = locs.stream().filter(workRestLoc -> workRestLoc.getType().equals("work")).collect(Collectors.toList());
            workList.sort((a, b) -> b.getCnt().compareTo(a.getCnt()));
            int index = 0;
            while (index < workList.size() && (workList.get(index) == null || workList.get(index).getLocation().equals("NULL_NULL"))) {
                index++;
            }
            String[] point = workList.get(index).getLocation().split("_");
            double[] workPoint = new double[2];
            workPoint[0] = Double.parseDouble(point[0]);
            workPoint[1] = Double.parseDouble(point[1]);
            jsonArray.add(workPoint);

            //居住地
            List<WorkRestLoc> restList = locs.stream().filter(workRestLoc -> workRestLoc.getType().equals("rest")).collect(Collectors.toList());
            restList.sort((a, b) -> b.getCnt().compareTo(a.getCnt()));
            int index2 = 0;
            while (index2 < restList.size() && (restList.get(index2) == null || restList.get(index2).getLocation().equals("NULL_NULL"))) {
                index2++;
            }
            String[] point2 = restList.get(index2).getLocation().split("_");
            double[] restPoint = new double[2];
            restPoint[0] = Double.parseDouble(point2[0]);
            restPoint[1] = Double.parseDouble(point2[1]);
            jsonArray.add(restPoint);

            //嫌疑地
            String[] point3 = restList.get(index2+1).getLocation().split("_");
            double[] suspectPoint = new double[2];
            suspectPoint[0] = Double.parseDouble(point3[0]);
            suspectPoint[1] = Double.parseDouble(point3[1]);
            jsonArray.add(suspectPoint);

        }catch (Exception e){
            e.printStackTrace();
            //Random random = new Random(Long.valueOf(targetPhoneOrigin));
            jsonArray = new JSONArray();
//            double[] point1 = LocationUtil.randomShhArr(random);
//            double[] point2 = LocationUtil.randomShhArr(random);
//            double[] point3 = LocationUtil.randomShhArr(random);
//            jsonArray.add(point1);
//            jsonArray.add(point2);
//            jsonArray.add(point3);
        }
        return jsonArray;
    }

    @Override
    public JSONArray getHeatMap(String targetPhone) {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
        LocalDate end = LocalDate.now();
        LocalDate start = end.minus(30,DAYS);
        LocationExample locationExample = new LocationExample();
        locationExample.createCriteria().andPcmdEncryptIdEqualTo(targetPhone).andCalltimeBetween(start.format(format)+"000000",end.format(format)+"235959");
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