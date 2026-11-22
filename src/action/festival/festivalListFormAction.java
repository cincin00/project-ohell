package action.festival;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import festival.festivalVO;
import service.CommandAction;

public class festivalListFormAction implements CommandAction {
	public String requestPro(HttpServletRequest request,
	        HttpServletResponse response) throws Throwable {
		String res = "config.xml";
		String pageNum = request.getParameter("pageNum");//페이지 번호
        if (pageNum == null) {
            pageNum = "1";
        }
        List<festivalVO> items=null;
        int pageSize = 6;//한 페이지의 글의 개수
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int number=0;
        String count="0";
        
        try {
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			System.out.println("factory ok");
			SqlSession session = factory.openSession();
			System.out.println("0000000000000");
			count = (String)session.selectOne("festival.selectCount");
			System.out.println("1111111111111");
			HashMap<String, Object> hash = new HashMap<>();
			System.out.println("22222222222222");
			hash.put("startRow", startRow);
			System.out.println("333333333333");
			hash.put("endRow", endRow);
			System.out.println("44444444444");
			if (new Integer(count) > 0) {
				items = session.selectList("festival.selectList",hash);//현재 페이지에 해당하는 글 목록
	        } else {
	        	items = Collections.EMPTY_LIST;
	        }
			System.out.println("555555555555");
			number=new Integer(count)-((currentPage-1)*pageSize);//글목록에 표시할 글번호
			System.out.println(new Integer(count));
			System.out.println((currentPage-1)*pageSize);
			System.out.println("66666666666666");
			
        }catch (IOException ie) {
			System.out.println(ie.getMessage());
		}
        System.out.println("77777777777777");
        System.out.println("??????????????????????");
        
		request.setAttribute("id","1");
		request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("pageSize", new Integer(pageSize));
        request.setAttribute("number", new Integer(number));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("items", items);
		request.setAttribute("ii", 0);
		return "/festival/festivalListStart.jsp";
		
	}
}
