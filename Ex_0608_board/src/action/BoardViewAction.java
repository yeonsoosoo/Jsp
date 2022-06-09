package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAction
 */
@WebServlet("/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//view.do?idx=000
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//상세 글조회, 조회수 증가를 위해서 DB에 두번 접근해야하므로 변수 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		//idx에 해당하는 게시글 한 건을 조회하기 위해 selectOne메서드를 사용한다.
		BoardVO vo = dao.selectOne(idx);
		
		//조회수 증가(session을 추가한 이유는 f5를 눌렀을 때 조회수가 계속 증가하는 것을 방지)
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show2");
		
		if(show == null) {
			int res = dao.update_readhit(idx);
			session.setAttribute("show2", "0");
		}
		
		//다른 게시물에 들어가도 0을 점유하고 있기 때문에 조회스 증가가 안된다.
		//목록으로 돌아오면 session을 해제해줘야 한다.
		
		//상세보기 페이지로 전환하기 위해 바인딩 및 포워딩
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		
		disp.forward(request, response);
	}

}
