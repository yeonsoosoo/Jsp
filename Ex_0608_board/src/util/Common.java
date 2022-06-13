package util;

public class Common {

	//일반 게시판용
	public static class Board{
		//한 페이지에 보여질 수 있는 게시물 수
		public final static int BLOCKLIST = 10;
		
		//Common.Board.BLOCKLIST으로 호출하여 사용가능
		
		//페이지 메뉴 수
		//<- 1 2 3 ->
		
		public final static int BLOCKPAGE = 3;
	}
	
	//공지사항용
	public static class Notice{
		public final static int BLOCKLIST = 20;
		public final static int BLOCKPAGE = 5;
	}
}
