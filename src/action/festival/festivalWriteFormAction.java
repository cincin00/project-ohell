package action.festival;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandAction;

public class festivalWriteFormAction implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response) throws Throwable {
		request.getSession().setAttribute("id", 1);
		return "/festival/festivalWriteStart.jsp";
	}
}
