package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardDelAction
 */
@WebServlet("/del.do")
public class BoardDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//del.do?idx=oo
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//삭제하고자 하는 원본 게시물의 정보를 얻어옴.
		BoardVO baseVo = dao.selectOne(idx);
		
		//삭제할 게시글의 제목과 이름을 수정해줌.
		baseVo.setSubject("이미 삭제된 글입니다");
		baseVo.setName("unknown");
		
		int res = dao.del_update(baseVo);
		
		//json 형식으로 값 전달
		if(res == 1) {
			response.getWriter().print("[{'param' : 'yes'}]");
		} else {
			response.getWriter().print("[{'param' : 'no'}]");
		}
	}

}
