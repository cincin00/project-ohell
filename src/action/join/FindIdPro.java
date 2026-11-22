package action.join;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import client.ClientDataBean;
import service.CommandAction;

public class FindIdPro implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		String res = "config.xml";
		try{
			InputStream is = Resources.getResourceAsStream(res);
			HttpSession session = request.getSession();
			
			String name = request.getParameter("name");
		    
			String phone = request.getParameter("phone");
			
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();
			
			List<ClientDataBean> client = sqlsession.selectList("client.findId", name);
			
			if(client.get(0).getPhone().equals(phone)){
				request.setAttribute("check", 1);
				request.setAttribute("id", client.get(0).getId());
			}else{
				request.setAttribute("check", -1);
			}
			
			sqlsession.commit();
			
			sqlsession.close();
	
		}catch(IOException e){
			e.printStackTrace();
		}
		return "/client/findIdPro.jsp";
	}
}