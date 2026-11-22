package action.place;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import client.ClientDataBean;
import places.PlaceData;
import service.CommandAction;

public class PlaceInfoSave implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		String res = "config.xml";

		try
		{
			request.setCharacterEncoding("utf-8");
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			SqlSession sqlsession = factory.openSession();

			int check = 0;
			String id_day = "id_day";
			int number = Integer.parseInt(request.getParameter("number"));
			
			for(int i=0;i<number;i++){
				PlaceData data = new PlaceData();
				data.setPlaceid(request.getParameter("place_id_"+(i+1)));
				data.setName(request.getParameter("place_name_"+(i+1)));
				data.setDetail(request.getParameter("place_desc_"+(i+1)));
				data.setTel(request.getParameter("place_tel_"+(i+1)));
				data.setLon(request.getParameter("place_lon_"+(i+1)));
				data.setLat(request.getParameter("place_lat_"+(i+1)));
				data.setId_day(id_day);
				data.setPlacenum(Integer.parseInt(request.getParameter("place_num_"+(i+1))));
				data.setId(id_day+"_"+(i+1));
				data.setDay(Integer.parseInt(request.getParameter("day")));
						
				check = sqlsession.insert("places.add", data);
				
				System.out.println("check :::: " + check);
			}
		
			request.setAttribute("check", check);
			sqlsession.commit();
			
			sqlsession.close();
		}
		catch(Exception e)
		{
			e.getStackTrace();
		}
		
		return "/places/placesInfoSave.jsp";
	}
}