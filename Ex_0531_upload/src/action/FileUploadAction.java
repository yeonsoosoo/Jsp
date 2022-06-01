package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class FileUploadAction
 */

//@WebServlet : url 매핑 - jsp에서 현재 서블릿을 요청할 수 있는 식별자를 지정하는 영역
@WebServlet("/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	//request : 파라미터를 받을 때 사용하는 요청 처리 객체, response : 파라미터를 보낼 때 사용하는 응답 처리 객체
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		System.out.println("서블릿 접속됨");
		
		//절대경로로 접근하기 위한 경로, 업로드 폴더까지만이라도 접근을 하면 절대경로에 있는 사진을 가져올 수는 있음
		String web_path = "/upload";
		
		//현재 프로젝트에 대한 정보를 관리하는 클래스
		ServletContext application = request.getServletContext();
		
		//upload폴더까지의 절대경로
		String path = application.getRealPath(web_path); 
		System.out.println(path);
		
		int max_size = 1024 * 1024 * 100; //1024*1024가 1MB *100 : 100MB(최대사이즈)
		
		//파일을 포함한 파라미터를 수신하기 위한 객체 cos.jar 안에 있음.
		//request 정보는 문자열만 수신이 가능하기 때문에 사진도 받을 수 있게 정보를 위임
		//path 업로드 경로, max_size 최대 업로드 용량, 수신시 인코딩 타입 -> 여기서 작성했으면 셋캐릭터 인코딩 안써두됨.
		//new DefaultFileRenamePolicy() 중복된 파일명을 알아서 변경(spring은 없음)
		MultipartRequest mr = new MultipartRequest(request, path, max_size, "utf-8", new DefaultFileRenamePolicy()); 
		
		
		String filename = "no_file";
		
		//업로드가 완료된 파일의 정보를 얻어옴.
		File f = mr.getFile("photo");
		
		if(f != null) {
			filename = f.getName(); //방금 업로드된 파일의 이름을 가져올수 있다.
			
		}
		//파일 이외의 일반 파라미터
		String title = mr.getParameter("title");
		
		//파일명과 제목을 request영역에 저장(바인딩)
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		//처음 페이지로는 돌아갈 수 있지만, 의미가 없다.
		//response.sendRedirect("uploadInput.jsp");
		
		//바인딩 해놓은 정보를 어떤페이지에 가져다가 사용할 것인지 지정한다(포워딩)
		RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
	}
}
