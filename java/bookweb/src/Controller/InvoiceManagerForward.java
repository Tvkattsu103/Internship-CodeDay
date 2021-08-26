package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.DetailBean;
import Bean.InvoiceBean;
import Dao.InvoiceDao;

/**
 * Servlet implementation class InvoiceManagerForward
 */
@WebServlet("/InvoiceManagerForward")
public class InvoiceManagerForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InvoiceManagerForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<InvoiceBean> dshd = InvoiceDao.getInvoice();
		request.setAttribute("msgtieude", "ĐƠN HÀNG");
		request.setAttribute("dshd", dshd);
		ArrayList<DetailBean> dsct = InvoiceDao.getDetail();
		request.setAttribute("dsct", dsct);
		request.getRequestDispatcher("View/Admin/InvoiceManager.jsp").forward(request, response);;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
