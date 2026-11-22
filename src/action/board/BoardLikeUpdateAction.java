package action.board;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.coment.ComentDataBean;
import service.CommandAction;

public class BoardLikeUpdateAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	int content_num = Integer.parseInt(request.getParameter("ctn"));
	int coment_num = Integer.parseInt(request.getParameter("cmt"));
	int like = Integer.parseInt(request.getParameter("like"));
	
	
	String res = "config.xml";
	
	try {
		
		InputStream is = Resources.getResourceAsStream(res);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
		SqlSession session = factory.openSession();
						
		int x = session.update("coment.likeUpdate", coment_num);
		System.out.println("x:: "+x);
		
		session.commit();
		
	} catch (IOException ie) {
		System.out.println(ie.getMessage());
	}		
		
	return "boardViewForm.do?num="+content_num;
	
	}
}
