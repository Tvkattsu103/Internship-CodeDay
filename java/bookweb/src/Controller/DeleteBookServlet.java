package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.CartBean;

/**
 * Servlet implementation class DeleteBook
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("bookid"));
		HttpSession session = request.getSession();
		ArrayList<CartBean> dsgiohang = (ArrayList<CartBean>) session.getAttribute("dsgiohang");
		if (dsgiohang!=null)
		{
			for (CartBean gh : dsgiohang)
			{
				if (gh.getBookid()==id)
				{
					dsgiohang.remove(gh);
					break;
				}
				
			}
		}
		/*session.setAttribute("dsgiohang", dsgiohang);*/
		session.removeAttribute("dsgiohang");
		RequestDispatcher rd = request.getRequestDispatcher("View/Client/Cart.jsp");
		rd.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
