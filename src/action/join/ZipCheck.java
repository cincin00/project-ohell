package action.join;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import client.ZipcodeBean;
import service.CommandAction;

public class ZipCheck implements CommandAction
{
	public String requestPro(HttpServletRequest request,  HttpServletResponse response)throws Throwable
	{
		String res = "config.xml";
		try
		{
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();
			List<ZipcodeBean> zipcode =null;
			request.setCharacterEncoding("utf-8");
			String area4 = request.getParameter("area4");
			System.out.println("4:::" +area4);
			String check = request.getParameter("check");
			
		
 			if (check.equals("n")) {
			
 				zipcode = sqlsession.selectList("zipcode.find", area4);
				System.out.println("우편번호 수:::"+zipcode.size());
 				
				sqlsession.commit();
				sqlsession.close();

 			}
 			request.setAttribute("check", check);
			request.setAttribute("zipcode", zipcode);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "/client/zipCheck.jsp";
	}
}

