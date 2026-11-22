package form.join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandAction;

public class InsertClientForm implements CommandAction
{
	public String requestPro(HttpServletRequest request,  HttpServletResponse response)throws Throwable
	{
			return "/client/inputForm.jsp";
	}
}
