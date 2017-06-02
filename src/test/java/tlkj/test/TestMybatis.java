package tlkj.test;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;

import tlkj.model.Normal;
import tlkj.service.NormalServiceI;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class TestMybatis {

	private static final Logger logger = Logger.getLogger(TestMybatis.class);
	//private ApplicationContext ac;
	private NormalServiceI normalService;

	@Autowired
	public void setNormalService(NormalServiceI normalService) {
		this.normalService = normalService;
	}

//	@Before
//	public void berfore() {
//		//ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
//		normalService = (NormalServiceI) ac.getBean("normalService");
//	}

	@Test
	public void Test1() {
//		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
//		NormalServiceI normalService = (NormalServiceI) ac.getBean("normalService");
		Normal n = normalService.getNormalById(1);
		System.out.println(n.getPersonname());
	}
	
	@Test
	public void Test2(){
		Normal n = normalService.getNormalById(1);
		logger.info(JSON.toJSONStringWithDateFormat(n, "yyyy-MM-dd HH:mm:ss"));
	}
	
	@Test
	public void Test3(){
		List<Normal> l = normalService.getAll();
		logger.info(JSON.toJSONStringWithDateFormat(l, "yyyy-MM-dd HH:mm:ss"));
	}
}
