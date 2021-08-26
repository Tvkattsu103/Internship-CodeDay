package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.BookBean;
import Dao.ItemDao;

/**
 * Servlet implementation class ItemBookServlet
 */
@WebServlet("/ItemBookServlet")
public class ItemBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String itemid = request.getParameter("id");
		int temp = Integer.parseInt(itemid);
		String name = request.getParameter("name");
		ArrayList<BookBean> ds = ItemDao.getArrayItemBook(temp);
		request.setAttribute("Name", name);
		request.setAttribute("listsach", ds);
		request.setAttribute("id", temp);
		if (request.getParameter("pageid")==null || Integer.parseInt(request.getParameter ("pageid"))==1)		
		{
			request.setAttribute("listsach", ds);
			request.setAttribute("dau", 0);
			request.setAttribute("cuoi", 6<ds.size()?6:ds.size());
			request.setAttribute("tranghientai", 1);
			RequestDispatcher rd = request.getRequestDispatcher("View/Client/Home.jsp");
			rd.forward(request, response);
		}
		else 
		{
			String page= request.getParameter("pageid");
			int id=Integer.parseInt(page);
			int dau=(id-1)*6;
			int cuoi=dau+6;
			if (cuoi>ds.size())
				cuoi=ds.size();
			request.setAttribute("listsach", ds);
			request.setAttribute("dau", dau);
			request.setAttribute("cuoi", cuoi);
			request.setAttribute("tranghientai", id);
			RequestDispatcher rd = request.getRequestDispatcher("View/Client/Home.jsp");
			rd.forward(request, response);
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
