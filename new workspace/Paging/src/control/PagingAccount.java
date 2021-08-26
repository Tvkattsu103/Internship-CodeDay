package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import entity.Account;

/**
 * Servlet implementation class PagingAccount
 */
@WebServlet("/paging")
public class PagingAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagingAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String indexPage = request.getParameter("index");
		
		if(indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		
		Dao dao = new Dao();
		int count = dao.getTotalAccount();
		int endPage = count/3;
		if(count % 3 != 0) {
			endPage++;
		}
		List<Account> list = dao.pagingAccount(index);
		
//		request.setAttribute("listA", list);
//		request.setAttribute("endP", endPage);
//		request.setAttribute("tag", index);
		
		PrintWriter out = response.getWriter();
		for(Account o: list) {
			out.println("<tr>\r\n"
					+ "				<td>"+o.getId()+"</td>\r\n"
					+ "				<td>"+o.getUser()+"</td>\r\n"
					+ "				<td>"+o.getPass()+"</td>\r\n"
					+ "				<td>"+o.getIsSell()+"</td>\r\n"
					+ "				<td>"+o.getIsAdmin()+"</td>"
					+ "			</tr>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
