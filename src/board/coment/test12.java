package board.coment;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.coment.ComentDataBean;

public class test12 {

	public static void main(String[] args) {
		String res = "config.xml";
		try {
			InputStream is = Resources.getResourceAsStream(res);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			System.out.println("factory ok");
			SqlSession session = factory.openSession();

			List<ComentDataBean> items = session.selectList("coment.getlist");
			Iterator<ComentDataBean> iter = items.iterator();

			while (iter.hasNext()) {
				System.out.println(iter.next().getComent());
			}

			session.close();
		} catch (IOException ie) {
			System.out.println(ie.getMessage());
		}
	}
}