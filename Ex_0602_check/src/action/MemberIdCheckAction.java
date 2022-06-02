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
 * Servlet implementation class MemberIdCheckAction
 */
@WebServlet("/check_id.do")
public class MemberIdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check_id.do?id=aaa
		String id = request.getParameter("id");
		
		UserVO vo = UserDAO.getInstance().selectOne(id);
		
		String res = "no";
		//중복조회를 통해서 회원가입이 가능한 경우
		if(vo == null) {
			res="yes";
		}
		String result = String.format("[{'res':'%s'}]", res);
		response.getWriter().print(result);
	}

}
