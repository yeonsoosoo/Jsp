package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/board_list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//전체 목록 가져오기
		List<BoardVO> list = BoardDAO.getInstance().selectList();
		
		//조회수를 위해 저장해뒀던 show라는 정보를 세션에서 제거
		request.getSession().removeAttribute("show2");
		
		//바인딩
		request.setAttribute("list", list);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
	}

}
