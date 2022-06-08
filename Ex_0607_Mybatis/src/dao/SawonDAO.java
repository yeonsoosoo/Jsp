package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	SqlSessionFactory factory;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public SawonDAO() {
		//커넥터에서 디비의 접근할 수 있는 내용을 알고 있는 팩토리를 받아옴
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//부서테이블 조회
	public List<SawonVO> select() {
		
		//SqlSession : DB에 쿼리문을 실제로 요청하는 객체
		SqlSession sqlSession = factory.openSession();

		//DB접근을 통해 얻어온 결과를 list에 저장
		List<SawonVO> list =sqlSession.selectList("sawon.sawon_list");
	
		//DB접근을 위해 사용한 sqlSession은 마지막에 꼭 닫아줘야함
		//conn,pstmt,rs를 close()하는 내용이 포함되어있다.
		sqlSession.close();
		return list;
	}
	
	//메서드 오버로딩
	//부서별 사원 목록
	public List<SawonVO> select(int deptno) {
		//SqlSession : DB에 쿼리문을 실제로 요청하는 객체
		SqlSession sqlSession = factory.openSession();

		//파라미터 전달은 하나만 가능함.
		//DB접근을 통해 얻어온 결과를 list에 저장
		List<SawonVO> list =sqlSession.selectList("sawon.sawon_list_no", deptno);
		
		//DB접근을 위해 사용한 sqlSession은 마지막에 꼭 닫아줘야함
		//conn,pstmt,rs를 close()하는 내용이 포함되어있다.
		sqlSession.close();
		return list;
	}
}
