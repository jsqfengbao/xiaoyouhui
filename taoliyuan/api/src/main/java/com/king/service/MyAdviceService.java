package com.king.service;

import com.king.dao.MyAdviceDao;
import com.king.entity.MyAdviceEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/21 11:07
 * @Modified By
 **/
@Service
public class MyAdviceService {
    @Autowired
    private MyAdviceDao myAdviceDao;

    public int  submitAdvice(MyAdviceEntity myAdviceEntity){
        return myAdviceDao.save(myAdviceEntity);
    }

}
