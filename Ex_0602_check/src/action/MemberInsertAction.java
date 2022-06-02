package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import vo.UserVO;

/**
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전송방식이 POST이고, 한글을 주고받기 때문에 인코딩해주어야함
		request.setCharacterEncoding("utf-8");
		
		//insert.do?id=aaaa&pwd=1111&name=홍길동
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		
		int res = UserDAO.getInstance().insert(vo);
		
		if(res > 0) {
			response.sendRedirect("member_list.do");
		}
	}

}
