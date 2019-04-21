package com.king;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2019/1/23 15:16
 * @Modified By
 **/
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)//表示整合JUnit4进行测试
@ContextConfiguration(locations={"classpath:spring-mvc.xml","classpath:spring-jdbc.xml"})//加载spring配置文件
public class BaseJUnitTest{
}
