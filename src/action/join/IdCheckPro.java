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

public class IdCheckPro implements CommandAction
{
	public String requestPro(HttpServletRequest request,HttpServletResponse response)throws Throwable
	{
		String res = "config.xml";
		try
		{
			String id = request.getParameter("id");
			//아이디 넘어 오는지 확인!
			//System.out.println("IdCheckPro로넘어온값 : : :"+id);
			
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();

			//DB에서 아이디값 가져오기
			List<ClientDataBean> client = sqlsession.selectList("client.find", id);

			//아이디의 중복 여부를 확인하기 위한 변수	
			int check=0;

			//client에 아이디가 있는 경우
			if(!client.isEmpty())
			{				
				//같은 아이디 DB에 존재
				check = -1;
			}
			else
			{
				//같은 아이디 DB에 없음
				check =1;
			}
			//check변수의 내용 확인!!
			//System.out.println("check : : :" + check);
			//check변수에 값 저장
			request.setAttribute("id", id);
			request.setAttribute("check", check);

			sqlsession.commit();

			sqlsession.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "/client/confirmId.jsp";
	}
}
