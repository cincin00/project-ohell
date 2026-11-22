package action.join;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import client.ClientDataBean;
import service.CommandAction;

public class DeleteClientPro implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		String res = "config.xml";
		try{
			InputStream is = Resources.getResourceAsStream(res);
			HttpSession session = request.getSession();
			
			String id = session.getAttribute("id").toString();
		    session.setAttribute("id", id);
		    
			String passwd = request.getParameter("passwd");
			
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();
			
			System.out.println(passwd);
			
			List<ClientDataBean> client = sqlsession.selectList("client.find", id);
			
			if(client.get(0).getPasswd().equals(passwd)){
			    int check = sqlsession.delete("client.remove", id);
				
			    System.out.println("check : ::" + check);
				request.setAttribute("check", check);
				
				sqlsession.commit();
				
				sqlsession.close();
			}
	
		}catch(IOException e){
			e.printStackTrace();
		}
		return "/client/deletePro.jsp";
	}
}