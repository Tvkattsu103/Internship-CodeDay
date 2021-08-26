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
 * Servlet implementation class UpdateCart
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int bookid = Integer.parseInt(request.getParameter("txtMasach"));
		int price = Integer.parseInt(request.getParameter("txtSoluong"));
		ArrayList<CartBean> dsgiohang= (ArrayList<CartBean>)session.getAttribute("dsgiohang");
		if (dsgiohang!=null)
		{
			for (CartBean gh:dsgiohang)
			{
				if (gh.getBookid() == bookid)
				{
					gh.setQuantity(price);
					break;
				}
			}
		}
		session.setAttribute("dsgiohang", dsgiohang);
		RequestDispatcher rd= request.getRequestDispatcher("View/Client/Cart.jsp");
		rd.forward(request, response);	}

}
