package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;

	//객체를 한개만 생성해두고 필요할 때마다 지속적으로 호출하여 사용
	//static이기 때문에 메모리를 한번만 점유하기 때문에 효율적.
	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	
	DataSource ds;
	
	public DBService() {
		// TODO Auto-generated constructor stub
		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/oracle_test");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} //생성자
	
	//생성자에서 준비해둔 정보를 기반으로 DB에 연결
	public Connection getConnection() {
		Connection conn = null;
		
		//쿼리문이 잘못되거나 오라클의 아이디 비밀번호가 잘못되는 경우 예외처리
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//conn이 null이면 연결이 안된거고, null이 아니면 연결 성공
		return conn;
	}
}
