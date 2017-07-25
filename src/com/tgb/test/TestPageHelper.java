package com.tgb.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tgb.mapper.UserMapper;
import com.tgb.model.User;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-common.xml")
public class TestPageHelper {
	@Autowired
	private UserMapper userMapper;
	
	@Test
    public void testPageHelper() {
        // 创建一个spring容器
        //ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*");
        // 从spring容器中获取mapper代理对象
        //Object mapper = context.getBean("userMapper");
        // 执行查询并分页,TbItemExample是逆向工程自动生成的，用来进行条件查询，这里不设置则表示无条件
        //TbItemExample example = new TbItemExample();
        //分页处理，显示第一页的10条数据
        PageHelper.startPage(2, 2);
        List<User> list = userMapper.findAll();
        //List<User> list = mapper.selectByExample(example);//查询
        // 取商品列表
        for(User item : list) {
            System.out.println(item.getUserName());
        }
        // 取分页信息
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        long total = pageInfo.getTotal(); //获取总记录数
        System.out.println("共有：" + total);
    }

}
