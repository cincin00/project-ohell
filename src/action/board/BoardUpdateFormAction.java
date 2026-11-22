package action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandAction;

public class BoardUpdateFormAction implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response) throws Throwable {
		return "/board/updateForm.jsp";
	}
}
