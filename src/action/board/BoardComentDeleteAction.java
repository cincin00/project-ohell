package action.board;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import service.CommandAction;

public class BoardComentDeleteAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int content_num = Integer.parseInt(request.getParameter("ctn"));
		int coment_num = Integer.parseInt(request.getParameter("cmn"));
		
		System.out.println(content_num);
		System.out.println(coment_num);
		
		String res = "config.xml";
		
		try {
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = factory.openSession();
			
			int x = session.delete("coment.remove",coment_num);
			
			System.out.println("x::: " + x);
			
			session.commit();
			// 코멘트 작성자를 writer로 받아왔기 때문에, 지금 로그인된 아이디와 writer가 같은지 비교 해보고 삭제 하면 된다.
			/* comentMapper에
			 session.delete("coment.remove",id);
			 
			 <delete id="remove" parameterType="java.lang.String">
				delete from coment where coment_num=#{coment_num} and writer=#{접속한 id}
			 </delete> 
			   
			 		
			 */
		/*
		 String url="content.jsp?num="+content_num+"&pageNum="+p_num;
		 response.sendRedirect(url);
		%
		*/
		} catch (IOException ie) {
			System.out.println(ie.getMessage());
		}			
			
		String url = "/boardViewForm.do?num="+content_num;
		
		return "boardViewForm.do?num="+content_num;
	}
}
