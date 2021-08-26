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

import Bean.DetailBean;
import Bean.InvoiceBean;
import Dao.InvoiceDao;

/**
 * Servlet implementation class PurchaseHistoryForward
 */
@WebServlet("/PurchaseHistoryForward")
public class PurchaseHistoryForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseHistoryForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("sessionIdEM");
		int userid = Integer.parseInt(id);
		ArrayList<InvoiceBean> dshd = InvoiceDao.getHoaDon(userid);
		request.setAttribute("dshd", dshd);
		ArrayList<DetailBean> dsct = InvoiceDao.getDetailByID(userid);
		request.setAttribute("dsct", dsct);
		RequestDispatcher rd = request.getRequestDispatcher("View/Client/PurchaseHistory.jsp");
		rd.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
