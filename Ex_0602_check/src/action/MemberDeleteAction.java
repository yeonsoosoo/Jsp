package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/member_del.do")
public class MemberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//member_del.do?idx=ooo
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//idx에 해당되는 글 삭제
		int res = UserDAO.getInstance().delete(idx);
		
		String param = "no";
		if(res > 0) {
			param = "yes";
		}
		
		//결과값인 param을 json구조로 포장
		String resultStr = String.format("[{'param' : '%s'}]", param);
	
		//콜백메서드로 복귀 (html에 출력 - response.getWriter())
		response.getWriter().print(resultStr);
		
	}

}
