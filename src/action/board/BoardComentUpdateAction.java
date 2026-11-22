package action.board;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.BoardDataBean;
import board.coment.ComentDataBean;
import service.CommandAction;

public class BoardComentUpdateAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		request.setCharacterEncoding("utf-8");
		
		int pageNum = Integer.parseInt(request.getParameter("content_num"));
		String res = "config.xml";
		try {
			
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = factory.openSession();
			
			System.out.println(Integer.parseInt(request.getParameter("content_num")));			
			System.out.println(request.getParameter("comenter"));
			System.out.println(request.getParameter("comentt"));
						
			ComentDataBean coment;
			coment = new ComentDataBean(Integer.parseInt(request.getParameter("content_num")),request.getParameter("comenter"),request.getParameter("comentt"));
			
			/*
			coment.setContent_num(Integer.parseInt(request.getParameter("content_num")));			
			coment.setComenter(request.getParameter("comenter"));			
			coment.setComent(request.getParameter("comentt"));		
			*/
			
			session.insert("coment.add", coment);
			
			int comentCount = session.selectOne("coment.getComentCount");
			
			request.setAttribute("comentCount",comentCount);
			
			session.commit();
			
		} catch (IOException ie) {
			System.out.println(ie.getMessage());
		}

		return "boardViewForm.do?num="+pageNum;
	}
}