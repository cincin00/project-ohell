package action.board;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.BoardDataBean;
import board.coment.ComentDataBean;
import service.CommandAction;

public class BoardViewFormAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int boardnum = Integer.parseInt(request.getParameter("num"));//해당 글번호
		
		List<BoardDataBean> items = null;        
        List<ComentDataBean> comentList = null;
        
		String res = "config.xml";

        try{
        	InputStream is = Resources.getResourceAsStream(res);
        	SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        	SqlSession session = factory.openSession();
        	
			items = session.selectList("board.getContent",boardnum);
			comentList = session.selectList("coment.getComent",boardnum);

        }
        catch (IOException ie) {
        	System.out.println(ie.getMessage());
        }
        
        int count = comentList.size();
  
		request.setAttribute("boardnum", new Integer(boardnum));
		//request.setAttribute("id", items.get(0).getId());
		request.setAttribute("review", items.get(0).getReview());
		request.setAttribute("subject", items.get(0).getSubject());	
		request.setAttribute("comentList", comentList);			
		request.setAttribute("count", count);			
		

		
        return "/board/boardViewStart.jsp";
	}
}