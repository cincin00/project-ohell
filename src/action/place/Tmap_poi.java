package action.place;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandAction;

public class Tmap_poi implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		
		return "/places/tmap_poi.jsp";
	}
}