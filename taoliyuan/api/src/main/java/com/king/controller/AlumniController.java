package com.king.controller;

import com.king.annotation.LoginUser;
import com.king.annotation.RegisterUser;
import com.king.entity.MyAlumniAdminEntity;
import com.king.entity.MyUserEntity;
import com.king.entity.ViewUserSchoolEntity;
import com.king.enums.UserStatusEnum;
import com.king.service.MyAlumniAdminService;
import com.king.service.MyUserService;
import com.king.service.ViewUserSchoolService;
import com.king.util.ApiBaseAction;
import com.king.util.ApiPageUtils;
import com.king.util.LocationUtils;
import com.king.utils.Query;
import com.king.vo.AlumniPersonVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/23 20:43
 * @Modified By
 **/
@RestController
@RequestMapping("/api/alumni")
@Api(value = "校友汇管理", tags = { "API校友汇相关接口" })
public class AlumniController extends ApiBaseAction {
    @Autowired
    private MyUserService myUserService;
    @Autowired
    private ViewUserSchoolService viewUserSchoolService;
    @Autowired
    private MyAlumniAdminService myAlumniAdminService;


    /**
     * 按距离显示各个校友列表
     * @param userEntity
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("getAlumniList")
    public Object getAlumniList(@RegisterUser MyUserEntity userEntity,
                                @RequestParam Integer schoolAreaId,
                                @RequestParam(required = false) String queryName,
                                @RequestParam(value = "page", defaultValue = "1") Integer page,
                                @RequestParam(value = "size", defaultValue = "10") Integer size){
        Map<String,Object> param = new HashMap<>();
        double myLatitude = userEntity.getLatitude();
        double myLongitude = userEntity.getLongitude();
        List<ViewUserSchoolEntity> viewUserSchoolEntityList = viewUserSchoolService.getUserSchoolListBySchoolAreaId(queryName,schoolAreaId, UserStatusEnum.APPLIED.getValue());

        List<AlumniPersonVo> alumniPersonVoList = new ArrayList<AlumniPersonVo>();
        List<AlumniPersonVo> alumniPersonVoNoDistanceList = new ArrayList();
        for(ViewUserSchoolEntity vuse : viewUserSchoolEntityList){
            double thatLatitude = vuse.getLatitude();
            double thatlongitude = vuse.getLongitude();
            //判断是否获取到经纬度
            if(thatLatitude > 0.0001 && thatlongitude > 0.0001){
                double distance = LocationUtils.getDistance(myLatitude,myLongitude,thatLatitude,thatlongitude);

                AlumniPersonVo apv = new AlumniPersonVo();
                apv.setUserId(vuse.getUserId());
                apv.setAvatar(vuse.getAvatar());
                apv.setLatitude(vuse.getLatitude());
                apv.setLongitude(vuse.getLongitude());
                apv.setDistance(distance+"");
                apv.setEducation(vuse.getEducation());
                apv.setDepart(vuse.getDepart());
                apv.setInSchool(vuse.getInShool());
                apv.setName(vuse.getName());

                alumniPersonVoList.add(apv);
            }else{
                AlumniPersonVo nodistancePersonVo = new AlumniPersonVo();
                nodistancePersonVo.setUserId(vuse.getUserId());
                nodistancePersonVo.setAvatar(vuse.getAvatar());
                nodistancePersonVo.setLatitude(vuse.getLatitude());
                nodistancePersonVo.setLongitude(vuse.getLongitude());
                nodistancePersonVo.setDistance("没有定位");
                nodistancePersonVo.setDepart(vuse.getDepart());
                nodistancePersonVo.setEducation(vuse.getEducation());
                nodistancePersonVo.setInSchool(vuse.getInShool());
                nodistancePersonVo.setName(vuse.getName());

                alumniPersonVoNoDistanceList.add(nodistancePersonVo);
            }
        }
        alumniPersonVoList.sort(new Comparator<AlumniPersonVo>() {
            @Override
            public int compare(AlumniPersonVo o1, AlumniPersonVo o2) {

                //按照距离进行升序排列
                if (Double.parseDouble(o1.getDistance()) > Double.parseDouble(o2.getDistance())) {
                    return 1;
                }
                if (o1.getDistance().equals(o2.getDistance())) {
                    return 0;
                }
                return -1;
            }
        });

        alumniPersonVoList.addAll(alumniPersonVoNoDistanceList);

        if(myLatitude < 0.0001 && myLongitude < 0.0001){
            alumniPersonVoList.clear();
            for(ViewUserSchoolEntity vuse : viewUserSchoolEntityList){
                AlumniPersonVo apv = new AlumniPersonVo();

                apv.setUserId(vuse.getUserId());
                apv.setAvatar(vuse.getAvatar());
                apv.setLatitude(vuse.getLatitude());
                apv.setLongitude(vuse.getLongitude());
                apv.setDistance("---");
                apv.setDepart(vuse.getDepart());
                apv.setEducation(vuse.getEducation());
                apv.setInSchool(vuse.getInShool());
                apv.setName(vuse.getName());

                alumniPersonVoList.add(apv);
            }
        }
        param.put("page", page);
        param.put("limit", size);
        param.put("sidx", "id");
        param.put("order", "desc");
        //查询列表数据
        Query query = new Query(param);
        List<AlumniPersonVo> newList = ApiPageUtils.listSplit(alumniPersonVoList,query.getPage(),query.getLimit());
        ApiPageUtils pageUtil = new ApiPageUtils(newList, alumniPersonVoList.size(), query.getLimit(), query.getPage());
        return toResponseSuccess(pageUtil);
    }

    /**
     * 获取全国校友会成员的经纬度信息
     * @param userEntity
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("getAllLonAndLat")
    public Object getAllLonAndLat(@RegisterUser MyUserEntity userEntity,
                                @RequestParam(value = "page", defaultValue = "1") Integer page,
                                @RequestParam(value = "size", defaultValue = "10") Integer size){
        if(userEntity.getLatitude() < 0.01 && userEntity.getLongitude() < 0.01){
            return toResponseSuccess(null);
        }
        int schoolId = userEntity.getSchoolParentId();
        List<ViewUserSchoolEntity> userSchoolEntityList = viewUserSchoolService.getUserSchoolListByPosition(schoolId,UserStatusEnum.APPLIED.getValue());
        ApiPageUtils pageUtil = new ApiPageUtils(userSchoolEntityList, userSchoolEntityList.size(), 1, 9999999);

        return toResponseSuccess(pageUtil);
    }

    /**
     * 获取校友会管理员列表
     * @param userEntity
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("getAlumniAdmin")
    public Object getAlumniAdmin(@RegisterUser MyUserEntity userEntity,
                                 @RequestParam(value = "page", defaultValue = "1") Integer page,
                                 @RequestParam(value = "size", defaultValue = "10") Integer size){

        Map<String,Object> param = new HashMap<>();

        param.put("page", page);
        param.put("limit", size);
        param.put("sidx", "id");
        param.put("order", "desc");
        //查询列表数据
        Query query = new Query(param);

        query.put("schoolParentId",userEntity.getSchoolParentId());
        List<MyAlumniAdminEntity> myAlumniAdminEntityList = myAlumniAdminService.getAlumniAdminList(query);
        int total = myAlumniAdminService.queryTotal(query);
        if(null != myAlumniAdminEntityList){
            ApiPageUtils pageUtil = new ApiPageUtils(myAlumniAdminEntityList, total, query.getLimit(), query.getPage());
            return toResponseSuccess(pageUtil);
        }
        return toResponseFail("消息为空！");
    }

    /**
     * 更新用户的经纬度
     * @param userEntity
     * @return
     */
    @RequestMapping("updateLatAndLon")
    public Object updateLatAndLon(@LoginUser MyUserEntity userEntity,@RequestParam Double latitude,@RequestParam Double longitude){
        userEntity.setLatitude(latitude);
        userEntity.setLongitude(longitude);
        myUserService.update(userEntity);

        return toResponseMsgSuccess("更新成功!");
    }

}
