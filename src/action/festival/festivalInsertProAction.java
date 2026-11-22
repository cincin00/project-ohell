package action.festival;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandAction;

public class festivalInsertProAction implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response) throws Throwable {
		return "/festivalInsertPro.jsp";
	}
}
