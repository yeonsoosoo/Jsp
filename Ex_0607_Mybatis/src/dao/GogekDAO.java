package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.GogekVO;
import vo.SawonVO;

public class GogekDAO {
	SqlSessionFactory factory;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static GogekDAO single = null;

	public static GogekDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new GogekDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public GogekDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//고객 테이블 조회
	public List<GogekVO> select() {
		//SqlSession : DB에 쿼리문을 실제로 요청하는 객체
		SqlSession sqlSession = factory.openSession();

		//DB접근을 통해 얻어온 결과를 list에 저장
		List<GogekVO> list =sqlSession.selectList("gogek.gogek_list");
			
		//DB접근을 위해 사용한 sqlSession은 마지막에 꼭 닫아줘야함
		//conn,pstmt,rs를 close()하는 내용이 포함되어있다.
		sqlSession.close();
		return list;
	}
	
	//검색 조건에 맞는 목록 조회
	public List<GogekVO> select(String search) {
		//SqlSession : DB에 쿼리문을 실제로 요청하는 객체
		SqlSession sqlSession = factory.openSession();

		//DB접근을 통해 얻어온 결과를 list에 저장
		List<GogekVO> list =sqlSession.selectList("gogek.gogek_list_search", search);
				
		//DB접근을 위해 사용한 sqlSession은 마지막에 꼭 닫아줘야함
		//conn,pstmt,rs를 close()하는 내용이 포함되어있다.
		sqlSession.close();
		return list;
		}
}
