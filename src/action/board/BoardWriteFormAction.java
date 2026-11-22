package action.board;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.BoardDataBean;
import board.coment.ComentDataBean;
import service.CommandAction;

public class BoardWriteFormAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		//int boardnum = Integer.parseInt(request.getParameter("num"));//해당 글번호		

		List<BoardDataBean> subjects = null;        

		String res = "config.xml";
		//String id = session.getAttribute("id");
		String id = "testID";

        try{
        	InputStream is = Resources.getResourceAsStream(res);
        	SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        	SqlSession session = factory.openSession();
        	
        	subjects = session.selectList("board.getSubject",id);

        }
        catch (IOException ie) {
        	System.out.println(ie.getMessage());
        }
 
		request.setAttribute("subjects", subjects);
		request.setAttribute("subjectid", id);
	
		// 해당 뷰에서 사용할 속성
		/*
		request.setAttribute("num", new Integer(num));
		request.setAttribute("ref", new Integer(ref));
		request.setAttribute("re_step", new Integer(re_step));
		request.setAttribute("re_level", new Integer(re_level));
		*/
		// view에서 사용하기 위해서 request로 저장한다.
		
		return "/board/boardWriteStart.jsp";
	}
}
