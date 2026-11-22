package form.main;

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
import service.CommandAction;

public class MainForm implements CommandAction{
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		
		String res = "config.xml";
		List<BoardDataBean> items=null;
		try{
			request.setCharacterEncoding("utf-8");
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			System.out.println("factory ok");
			SqlSession session = factory.openSession();
			items=session.selectList("board.getMainBoardList");
		}catch(IOException e){
			e.printStackTrace();
		}
			request.getSession().setAttribute("items",items);
			request.getSession().setAttribute("id",1);
			request.getSession().setAttribute("ii",0);
			return "/main/mainStart.jsp";
	}
}