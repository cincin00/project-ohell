package form.join;

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

public class MyPageForm implements CommandAction{
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		String res = "config.xml";
		try{
			InputStream is = Resources.getResourceAsStream(res);
			HttpSession session = request.getSession();
			
			String id = session.getAttribute("id").toString();
		    session.setAttribute("id", id);
			
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();
			
			List<ClientDataBean> client = sqlsession.selectList("client.find", id);
			
			request.setAttribute("id", id);
			request.setAttribute("c", client.get(0));
			if(client.get(0).getEmail().contains("@")){
				String[] emailsplit = client.get(0).getEmail().split("@");
				String email = emailsplit[0];
				System.out.println(email);
				String emailsite = "@"+emailsplit[1];
				System.out.println(emailsite);
				request.setAttribute("email", email);
				request.setAttribute("emailsite", emailsite);
			}else{
			
				request.setAttribute("email", client.get(0).getEmail());
				request.setAttribute("emailsite", "직접입력");
			}
			
			if(client.get(0).getPhone().length() > 10){
				request.setAttribute("phone_first", client.get(0).getPhone().substring(0, 3));
				request.setAttribute("phone_middle", client.get(0).getPhone().substring(3, 7));
				request.setAttribute("phone_last", client.get(0).getPhone().substring(7, client.get(0).getPhone().length()));
			}else{
				request.setAttribute("phone_first", client.get(0).getPhone());
			}
			sqlsession.commit();
			
			sqlsession.close();
			
		}catch(IOException e){
			e.printStackTrace();
		}
			
			return "/client/mypageForm.jsp";
	}
}
