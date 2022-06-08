package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDAO;
import dao.GogekDAO;
import vo.DeptVO;
import vo.GogekVO;

/**
 * Servlet implementation class GogekListAction
 */
@WebServlet("/gogek_list.do")
public class GogekListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//gogek_list.do -> null
		//gogek_list.do?search= -> empty
		//한글이 깨지지 않게하기 위함
		request.setCharacterEncoding("utf-8");
		
		String search = "all";
		String str_search = request.getParameter("search");
		
		//정상적으로 값이 들어온 경우
		if(str_search != null && !str_search.isEmpty()) {
			search = str_search;
		}
		
		//조회하고 목록 가져오기
		List<GogekVO> list = null;
		
		//부서목록 가져오기
		if(search.equals("all")) {
			list = GogekDAO.getInstance().select();
		} else {
			list = GogekDAO.getInstance().select(search);
		}
		

		// list 바인딩
		request.setAttribute("list", list);

		// 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");
		disp.forward(request, response);
	}

}
