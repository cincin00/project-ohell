package action.loginout;

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

public class LoginPro implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String res = "config.xml";
		try {
			InputStream is = Resources.getResourceAsStream(res);
			HttpSession session = request.getSession();

			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");

			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();

			List<ClientDataBean> client = sqlsession.selectList("client.find", id);
			
			int check = -1;
			if(!client.isEmpty()){
				if(client.get(0).getPasswd().equals(passwd)){
				   session.setAttribute("id", id);
				   request.setAttribute("check", 1);
				}else{
					request.setAttribute("check", 0);
				}
			}
			sqlsession.commit();

			sqlsession.close();
			
		} catch (

		IOException e) {
			e.printStackTrace();
		}
		return "/client/loginPro.jsp";
	}
}


