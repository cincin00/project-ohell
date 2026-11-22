package action.board;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.BoardDataBean;
import service.CommandAction;

public class BoardListFormAction implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response) throws Throwable {
		//세션에 저장 EX:ID
		//request.getSession().setAttribute("세션값", 객체혹은변수);
		//일반 파라미터
		//request.setAttribute("파라미터명", 객체 혹은 변수);
		//new Integer(숫자로바꿀문자형데이터) -> 숫자로바뀜
		String pageNum = request.getParameter("pageNum");//페이지 번호
        if (pageNum == null) {
            pageNum = "1";
        }
        List<BoardDataBean> items=null;
        int pageSize = 10;//한 페이지의 글의 개수
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		String id="testID";
		String res = "config.xml";
		String count="0";
		int number=0;
		System.out.println("startRow====="+startRow);
		
		try {
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			System.out.println("factory ok");
			SqlSession session = factory.openSession();
			count = (String)session.selectOne("board.getlistCount");
			HashMap<String, Object> hash = new HashMap<>();
			hash.put("startRow", startRow);
			hash.put("endRow", endRow);
			if (new Integer(count) > 0) {
				items = session.selectList("board.getlist",hash);//현재 페이지에 해당하는 글 목록
	        } else {
	        	items = Collections.EMPTY_LIST;
	        }
			number=new Integer(count)-((currentPage-1)*pageSize);//글목록에 표시할 글번호
			System.out.println(new Integer(count));
			System.out.println((currentPage-1)*pageSize);
			// = session.selectList("board.getlist");
			
			
			//Iterator<BoardDataBean> iter = items.iterator();//iterator함수로 하나씩 읽어서 전달
			
			
			/*while (iter.hasNext()) {
				System.out.println(iter.next().getId());
			}*/
			request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("pageSize", new Integer(pageSize));
	        request.setAttribute("number", new Integer(number));
			request.setAttribute("count", new Integer(count));
			request.setAttribute("items", items);
			
		} catch (IOException ie) {
			System.out.println(ie.getMessage());
		}
				
		return "/board/boardListStart.jsp";
	}
}
