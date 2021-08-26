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
import Bean.InvoiceBean;
import Bean.UserBean;
import Dao.UserDao;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		if (session.getAttribute("sessionNameEM") == null) {
			request.setAttribute("msgdangnhap", "VUI LÒNG ĐĂNG NHẬP !");
			RequestDispatcher rd = request.getRequestDispatcher("View/Client/Login.jsp");
			rd.forward(request, response);
		} else {
			/*int id = Integer.parseInt((String) session.getAttribute("sessionIdEM"));
			UserBean kh = UserDao.GetUserByID(id);
			request.setAttribute("sessionkh", kh);*/

			int bookid = Integer.parseInt(request.getParameter("bookid"));
			String name = request.getParameter("Name");
			int price = Integer.parseInt(request.getParameter("Price"));
			String image = request.getParameter("Image");
			int quantity = Integer.parseInt(request.getParameter("Quantity"));
			String author = request.getParameter("Author");

			CartBean temp = new CartBean();
			temp.setBookid(bookid);
			temp.setAuthor(author);
			temp.setName(name);
			temp.setImage(image);
			temp.setPrice(price);
			temp.setQuantity(quantity);
			ArrayList<CartBean> dsgiohang = (ArrayList<CartBean>) session.getAttribute("dsgiohang");
			int kt = 0;
			if (session.getAttribute("dsgiohang") == null)
				dsgiohang = new ArrayList<CartBean>();
			else {
				for (CartBean gh : dsgiohang) {
					if (gh.getBookid() == bookid) {
						gh.setQuantity(gh.getQuantity() + 1);
						kt = 1;
						break;
					}
				}
			}
			if (kt == 0)
				dsgiohang.add(temp);
			session.setAttribute("dsgiohang", dsgiohang);
			RequestDispatcher rd = request.getRequestDispatcher("View/Client/Cart.jsp");
			rd.forward(request, response);
		}
	}
	/*
	 * int bookid= Integer.parseInt(request.getParameter("bookid")); String name =
	 * request.getParameter("Name"); int price =
	 * Integer.parseInt(request.getParameter("Price")); String image =
	 * request.getParameter("Image"); int quantity =
	 * Integer.parseInt(request.getParameter("Quantity")); String userid = (String)
	 * session.getAttribute("sessionIdEM"); int Usid = Integer.parseInt(userid);
	 * 
	 * ArrayList<OrderBean> ssdathang = (ArrayList<OrderBean>)
	 * session.getAttribute("ssdathang");
	 * 
	 * ConnectSql dc = new ConnectSql(); dc.Connect(); String sql
	 * ="INSERT INTO ORDERS (UserID, BookID, Name, Image, Quantity, Price) VALUES(?,?,?,?,?,?)"
	 * ; try { PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
	 * cmd.setInt(1, Usid); cmd.setInt(2, bookid); cmd.setString(3, name);
	 * cmd.setString(4, image); cmd.setInt(5, quantity); cmd.setInt(6, price);
	 * cmd.executeUpdate();
	 * 
	 * 
	 * 
	 * ArrayList<OrderBean> listOrder = new ArrayList<OrderBean>(); OrderBean temp =
	 * new OrderBean(); temp.setImage(image); temp.setPrice(price);
	 * temp.setUserid(Usid); temp.setBookid(bookid); temp.setQuantity(quantity);
	 * temp.setName(name); listOrder.add(temp); } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
