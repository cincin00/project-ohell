package introduce;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandAction;

public class introduceFormAction implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response) throws Throwable {
		request.getSession().setAttribute("id",request.getSession().getAttribute("id"));
		//request.getSession().setAttribute("id",1);
		return "/introduce/introduceStart.jsp";
	}
}