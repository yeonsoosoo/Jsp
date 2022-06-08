package service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
    
	SqlSessionFactory factory = null;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;

	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	//기본 생성자
	public MyBatisConnector() {
		//sqlMapConfig.xml 이라고 하는 설정파일을 읽어옴
		try {
			Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			
			//위에서 읽어온 sqlMapConpig.xml에서 지정해둔 DB접근 경로를 실제로 읽어오는 작업
			//문자열로 되어있는 파일의 정보를 factory로 변환하여 넣어주는 작업
			factory = new SqlSessionFactoryBuilder().build(reader);
			
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//sqlMapConfig.xml의 정보를 담고있는 factory 객체를 반환
	public SqlSessionFactory getFactory() {
		return factory;
	}
}
