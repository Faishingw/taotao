package web;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;

public class ServiceTest {

	@Test
	public void getSessionFactory() {
		// ApplicationContext context = (ApplicationContext) event.getServletContext()
		// .getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) context.getBean("sqlSessionFactory");
		System.out.println(sqlSessionFactory);
	}

	@Test
	public void getSessionFactory_wrong() {
		// ApplicationContext context = (ApplicationContext) event.getServletContext()
		// .getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) context.getBean("sqlSessionFactory");
		System.out.println(sqlSessionFactory);
	}

	@Test
	public void getDataSource() {
		// ApplicationContext context = (ApplicationContext) event.getServletContext()
		// .getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/appliactionContext-dao.xml");
		DataSource dataSource = (DataSource) context.getBean("dataSource");
		System.out.println(dataSource);
	}

}
