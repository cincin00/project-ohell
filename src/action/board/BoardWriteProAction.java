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

public class BoardWriteProAction implements CommandAction {
	public String requestPro( HttpServletRequest request,HttpServletResponse response) throws Throwable {

		int boardnum = Integer.parseInt(request.getParameter("num"));//해당 글번호		
        
		String res = "config.xml";

        try{
        	InputStream is = Resources.getResourceAsStream(res);
        	SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        	SqlSession session = factory.openSession();
        	
    		BoardDataBean items = new BoardDataBean(request.getParameter("id_day"),Integer.parseInt(request.getParameter("like_num")),"review11",request.getParameter("subject"),"TOM"); 
        	
        	/*
        	items.setId_day(request.getParameter("id_day"));
        	items.setLike_num(Integer.parseInt(request.getParameter("like_num")));
        	items.setReview(request.getParameter("review"));
        	items.setSubject(request.getParameter("subject"));
        	items.setId(request.getParameter("id"));
        	items.setId("TOM");
        	*/
    		
			int x = session.insert("board.add",items);
			
			System.out.println("x:: " + x);
        }
        catch (IOException ie) {
        	System.out.println(ie.getMessage());
        }

        return "/boardListForm.do";
	}
}
