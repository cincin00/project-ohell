package form.join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandAction;

public class DeleteClientForm implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response)throws Throwable{
		
		String passwd = request.getParameter("passwd");
		
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("id").toString();
	    session.setAttribute("id", id);
	    
		request.setAttribute("passwd", passwd);
				
		return "/client/deleteForm.jsp";
	}
}