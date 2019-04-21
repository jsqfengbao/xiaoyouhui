package com.king.service;

import com.king.dao.MyApprovalDao;
import com.king.entity.MyApprovalEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/23 17:10
 * @Modified By
 **/
@Service
public class MyApprovalService {
    @Autowired
    private MyApprovalDao myApprovalDao;

    public MyApprovalEntity queryByUserId(int userId){
        return myApprovalDao.queryByUserId(userId);
    }

    public int save(MyApprovalEntity approvalEntity){
        return myApprovalDao.save(approvalEntity);
    }
}
