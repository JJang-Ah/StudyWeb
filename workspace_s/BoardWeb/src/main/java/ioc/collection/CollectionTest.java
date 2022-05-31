package ioc.collection;
import java.util.*;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionTest {

	public static void main(String[] args) {
		// 1. List
//		CollectionBean list = (CollectionBean) factory.getBean("listBean");
//		List<String> list = bean.getList();
//		System.out.println(list);
		
		
		
		
		// 4. prop
		CollectionBean bean = (CollectionBean) factory.getBean("propBean");
		Properties prop = bean.getProp();
		System.out.println(prop);
		
		factory.close();
	}
}
