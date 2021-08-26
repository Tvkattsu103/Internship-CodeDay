package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.CartBean;
import Dao.ConnectSql;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
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

		ArrayList<CartBean> dsgiohang = (ArrayList<CartBean>) session.getAttribute("dsgiohang");
		String userid = (String) session.getAttribute("sessionIdEM");
		ConnectSql dc = new ConnectSql();
		dc.Connect();
		String sql = "INSERT INTO INVOICE (UserID, OrderDate, Bought) VALUES(?,?,?)";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			java.sql.Date orderDate = new java.sql.Date((new java.util.Date()).getTime());
			cmd.setString(1, userid);
			cmd.setDate(2, orderDate);
			cmd.setBoolean(3, false);
			cmd.executeUpdate();
			sql = "SELECT Max(InvoiceID) AS LastID FROM INVOICE";
			cmd = ConnectSql.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			rs.next();
			int invoiceid = rs.getInt("LastID");

			for (CartBean gh : dsgiohang) {
				sql = "INSERT INTO DETAIL (BookID, Quantity, InvoiceID) VALUES(?,?,?)";
				cmd = ConnectSql.cn.prepareStatement(sql);
				cmd.setInt(1, gh.getBookid());
				cmd.setLong(2, gh.getQuantity());
				cmd.setInt(3, invoiceid);
				cmd.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("dsgiohang", new ArrayList<CartBean>());
		RequestDispatcher rd = request.getRequestDispatcher("View/Client/Cart.jsp");
		rd.forward(request, response);
	}

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
