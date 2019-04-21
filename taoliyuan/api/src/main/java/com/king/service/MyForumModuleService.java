package com.king.service;

import com.king.dao.MyForumModuleDao;
import com.king.dao.MyForumModuleSubclassDao;
import com.king.entity.MyForumModuleEntity;
import com.king.entity.MyForumModuleSubclassEntity;
import com.king.vo.ModuleWithSonAndStatusVO;
import com.king.vo.ModuleWithSonVO;
import com.king.vo.SubModuleVO;
import com.king.vo.SubModuleWithStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Service接口
 *
 * @author jsq
 * @email jsqfengbao@qq.com
 * @date 2019-02-22 10:54:21
 */
@Service
public class MyForumModuleService {

    @Autowired
    private MyForumModuleDao myForumModuleDao;

    @Autowired
    private MyForumModuleSubclassDao myForumModuleSubclassDao;

    public List<MyForumModuleEntity> queryList(Map<String,Object> map){
        return myForumModuleDao.queryList(map);
    }

    public List<ModuleWithSonVO> getModuleListWithSon(){
        List<MyForumModuleEntity> moduleListWithSon = myForumModuleDao.getModuleListWithSon();
        List<ModuleWithSonVO> moduleListWithSonVOList = new ArrayList<>();

        for (MyForumModuleEntity module : moduleListWithSon) {
            ModuleWithSonVO moduleWithSonVO = new ModuleWithSonVO();
            moduleWithSonVO.setModuleName(module.getName());
            moduleWithSonVO.setModuleId(module.getId());
            List<SubModuleVO> subModuleVOList = new ArrayList<>();
            for (MyForumModuleSubclassEntity subModule : module.getMyForumModuleSubclassEntityList()) {

                SubModuleVO subModuleVO = new SubModuleVO();
                subModuleVO.setId(subModule.getId());
                subModuleVO.setTypeName(subModule.getName());

                subModuleVOList.add(subModuleVO);

            }
            moduleWithSonVO.setSubModuleList(subModuleVOList);
            moduleListWithSonVOList.add(moduleWithSonVO);
        }
        return moduleListWithSonVOList;
    }

    public List getModuleListWithSonAndStatus(Integer userId){

        List<MyForumModuleEntity> moduleListWithSon = myForumModuleDao.getModuleListWithSon();

        List<MyForumModuleSubclassEntity> followedSubModuleList = myForumModuleSubclassDao.getFollowedSubModuleList(userId);



        List<ModuleWithSonAndStatusVO> moduleListWithSonAndStatusVOList = new ArrayList<>();
        for (MyForumModuleEntity module : moduleListWithSon) {
            ModuleWithSonAndStatusVO moduleWithSonAndStatusVO = new ModuleWithSonAndStatusVO();
            moduleWithSonAndStatusVO.setName(module.getName());
            moduleWithSonAndStatusVO.setModuleId(module.getId());
            List<SubModuleWithStatusVO> subModuleWithStatusVOList = new ArrayList<>();
            for (MyForumModuleSubclassEntity subModule : module.getMyForumModuleSubclassEntityList()) {

                SubModuleWithStatusVO subModuleWithStatusVO = new SubModuleWithStatusVO();
                subModuleWithStatusVO.setId(subModule.getId());
                subModuleWithStatusVO.setTypeName(subModule.getName());
                subModuleWithStatusVO.setFollowed(0);
                for (MyForumModuleSubclassEntity followedSubModule : followedSubModuleList) {

                    if (subModule.getId().equals(followedSubModule.getId())){
                        subModuleWithStatusVO.setFollowed(1);
                    }
                }
                subModuleWithStatusVOList.add(subModuleWithStatusVO);

            }
            moduleWithSonAndStatusVO.setSubModuleWithStatusList(subModuleWithStatusVOList);
            moduleListWithSonAndStatusVOList.add(moduleWithSonAndStatusVO);
        }
        return moduleListWithSonAndStatusVOList;

    }
}
