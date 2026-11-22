package action.join;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import client.ClientDataBean;
import service.CommandAction;

public class InsertClientPro implements CommandAction
{
	public String requestPro(HttpServletRequest request, HttpServletResponse response)throws Throwable
	{
		request.setCharacterEncoding("utf-8");

		String res = "config.xml";

		try
		{
			
			String id = request.getParameter("id");
			//System.out.println("id: : :"+id);

			String pass = request.getParameter("passwd2");
			//System.out.println("pass: : :"+pass);

			String  phone = 
					request.getParameter("first")+
					request.getParameter("mid")+
					request.getParameter("last");
			//System.out.println("phone: : :"+phone);

			String name = request.getParameter("name");
			//System.out.println("name: : :"+name);

			int gender = Integer.parseInt(request.getParameter("gender"));
			//System.out.println("gender: : :"+gender);

			int age = Integer.parseInt(request.getParameter("age"));
			//System.out.println("age: : :"+age);
			String ask=request.getParameter("ask");
			//System.out.println("ask : : :"+ask);
			
			String answer = request.getParameter("answer");
			//System.out.println("answer : : :"+answer);

			
			String email = request.getParameter("email"); 
			if(email.equals("1"))
			{
				String email1 = request.getParameter("emailID")+"@"+request.getParameter("emailAddres");
				email = email1;
				
				//System.out.println("emailAddress : : : "+ email1 );
			}
			else
			{
				String email2 = request.getParameter("emailID")+"@"+request.getParameter("email");
				email = email2;
				
				//System.out.println("email2: : :"+email2);
			}
			
			String zipcode = request.getParameter("zipcode");
			//System.out.println("zicode: : :"+zipcode);

			String address = request.getParameter("address");
			//System.out.println("address: : :"+address);

			int able = Integer.parseInt(request.getParameter("able"));
			//System.out.println("able: : :"+able);

			InputStream is = Resources.getResourceAsStream(res);
			
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();
			ClientDataBean clientdata = new ClientDataBean();

			clientdata.setId(id);
			clientdata.setPasswd(pass);
			clientdata.setPhone(phone);
			clientdata.setName(name);
			clientdata.setSex(gender);
			clientdata.setAge(age);
			clientdata.setEmail(email);
			clientdata.setZipcode(zipcode);
			clientdata.setAddress(address);
			clientdata.setAble(able);
			clientdata.setNum(2);
			clientdata.setAsk(ask);
			clientdata.setAnswer(answer);;
			
			int check = sqlsession.insert("client.add", clientdata);
		
			//Check Insert data
			System.out.println("check :::: " + check);
			
			sqlsession.commit();
			
			sqlsession.close();

		}
		catch(Exception e)
		{
			e.getStackTrace();
		}
		return "/client/inputPro.jsp";
	}
}
