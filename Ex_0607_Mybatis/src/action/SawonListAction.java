package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

/**
 * Servlet implementation class SawonListAction
 */
@WebServlet("/sawon_list.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사원리스트 조회
		int deptno = 0;
		String str_deptno = request.getParameter("deptno");
		
		//sawon_list.do? -> null : 메모리도 점유 x
		//sawon_list.do?dept= -> empty : 값이 없긴한데 메모리 점유
		//0~50까지의 deptno 값을 받았을 때
		if(str_deptno != null && !str_deptno.isEmpty()) {
			deptno = Integer.parseInt(str_deptno);
		}
		List<SawonVO> list = null;
		
		if(deptno == 0) {
			list = SawonDAO.getInstance().select();
		} else {
			list = SawonDAO.getInstance().select(deptno);
		}
	
		
		//list 바인딩
		request.setAttribute("list", list);
				
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
		
	}

}
