package com.mxbc.util;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mxbc.dao.CustomerDao;

public class Test {
	public static void main(String[] args) {
		
//		//读取配置文件
//		Configuration cf = new Configuration().configure();
//		
//		//生成数据库
//		//数据库设计方案
//		SchemaExport export = new SchemaExport(cf);
//		
//		//1.是否显示SQL
//		//2.是否覆盖原有数据库
//		export.create(true, true);
		
//		BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext*.xml");
//		CustomerDao customerDao = (CustomerDao)beanFactory.getBean("customerDao");
//		System.out.println(customerDao.findAllByAreaDao(1).get(0).getC_name());
//		System.out.println(System.getProperty("user.dir"));
	}
}