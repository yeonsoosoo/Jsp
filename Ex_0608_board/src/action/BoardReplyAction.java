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
 * Servlet implementation class BoardReplyAction
 */
@WebServlet("/reply.do")
public class BoardReplyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//reply.do?subject=ooo&name=-o~~~~~~~~~~~~~~~
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		
		BoardDAO dao = BoardDAO.getInstance();

		//기준글의 idx를 이용해서 댓글을 달고싶은 게시글의 정보를 가져온다.
		BoardVO base_vo = dao.selectOne(idx);
		
		//기준글에 step이상 값은 step = step + 1처리
		dao.update_step(base_vo);
		
		//댓글 vo
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setContent(content);
		vo.setSubject(subject);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		//댓글이 들어갈 위치를 선정
		vo.setRef(base_vo.getRef());
		vo.setStep(base_vo.getStep()+1);
		vo.setDepth(base_vo.getDepth()+1);
		
		//댓글등록
		int res = dao.reply(vo);
		
		if(res > 0) {
			response.sendRedirect("board_list.do");
		}
	}

}
