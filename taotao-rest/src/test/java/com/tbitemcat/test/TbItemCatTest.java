package com.tbitemcat.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.taotao.mapper.TbItemCatMapper;
import com.taotao.pojo.TbItemCat;
import com.taotao.pojo.TbItemCatExample;
import com.taotao.pojo.TbItemCatExample.Criteria;

public class TbItemCatTest {
	@Autowired
	private TbItemCatMapper itemCatMapper;

	@Test
	public void test_ItemCat() {
		// ApplicationContext context=new Web
		// WebApplicationContext ac = WebApplicationContextUtils
		// .getWebApplicationContext(ServletActionContext.getServletContext());
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		
		// 创建查询条件
		TbItemCatExample example = new TbItemCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(0L);
		// 执行查询
		List<TbItemCat> list = itemCatMapper.selectByExample(example);
	}
}
