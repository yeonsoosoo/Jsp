package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// login.do?id=aaaa&pwd=1111
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);	
		
		String param = "";
		String resultStr = "";
		
		//vo가 null인 경우 id자체가 DB에 존재하지 않는다는 의미
		if(vo == null) {
			param="no_id";
			resultStr = String.format("[{'param' : '%s' }]", param);
			response.getWriter().print(resultStr);
			return;
		}
		
		//비밀번호가 일치하지 않을 때
		if(!vo.getPwd().equals(pwd)) {
			param = "no_pwd";
			resultStr = String.format("[{'param' : '%s' }]", param);
			response.getWriter().print(resultStr);
			return;
		}
		
		//세션은 서버의 메모리를 사용하기 때문에 세션을 많이 사용할수록 브라우저가 느려지므로, 필요한 곳에서만 세션을 사용해야함.
		//세션은 포워딩을 할 필요가 없고 어느 jsp에서든 el표기법으로 vo.name과 같은 방식으로 사용할 수 있다.
		HttpSession session = request.getSession();
		//설정을 하지않으면 default 값은 30분, ()안에는 초를 작성해주어야함.
		session.setMaxInactiveInterval(3600);
		session.setAttribute("vo", vo);
		
		//로그인에 성공했을 경우
		param = "clear";
		resultStr = String.format("[{'param' : '%s' }]", param);
		response.getWriter().print(resultStr);
	}

}
