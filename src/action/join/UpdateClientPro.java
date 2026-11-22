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

public class UpdateClientPro implements CommandAction{
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		
request.setCharacterEncoding("utf-8");
	String res = "config.xml";
	try{
		InputStream is = Resources.getResourceAsStream(res);
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("id").toString();
	    session.setAttribute("id", id);
	    
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email") + request.getParameter("email_site");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone_first")+request.getParameter("phone_middle")+request.getParameter("phone_last");
		int able = Integer.parseInt(request.getParameter("able"));
		//ClientDataBean member = new ClientDataBean();

		//passwd=#{passwd},age=#{age},email=#{email},phone=#{phone},zipcode=#{zipcode},address=#{address},able=#{able}
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
		SqlSession sqlsession = factory.openSession();
		
		System.out.println(passwd);
		List<ClientDataBean> member = sqlsession.selectList("client.find", id);
		
		member.get(0).setId(id);
		member.get(0).setPasswd(passwd);
		member.get(0).setName(name);
		member.get(0).setAge(age);
		member.get(0).setEmail(email);
		member.get(0).setZipcode(zipcode);
		member.get(0).setAddress(address);
		member.get(0).setPhone(phone);
		member.get(0).setAble(able);
		
	    int update = sqlsession.update("client.modify", member.get(0));
	    
	    sqlsession.commit();
	    
	    sqlsession.close();
	    
	    System.out.println("up::::" + update);
	}catch(IOException e){
		e.printStackTrace();
	}
		
		return "/client/modifyPro.jsp";
	}
}
