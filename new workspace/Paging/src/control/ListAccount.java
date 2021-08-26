package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import entity.Account;

@WebServlet("/list")
public class ListAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indexPage = request.getParameter("index");
		if(indexPage == null) {
			indexPage = "0";
		}
		int index = Integer.parseInt(indexPage);
		
		Dao dao = new Dao();
		int count = dao.getTotalAccount();
		int endPage = count/3;
		if(count % 3 != 0) {
			endPage++;
		}
		List<Account> list = dao.pagingAccount(index);
		
		request.setAttribute("listA", list);
		request.setAttribute("endP", endPage);
		request.setAttribute("tag", index);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
