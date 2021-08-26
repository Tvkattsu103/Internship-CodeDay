package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ConnectSql;
import Dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String userN = request.getParameter("un");
		String passW = request.getParameter("pw");
		
		String passmd5 = UserDao.md5(passW);
		
		String sql = "SELECT * FROM USERS WHERE UserName=? AND Password=?";
		try {

			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setString(1, userN);
			cmd.setString(2, passmd5);
			ResultSet rs = cmd.executeQuery();
			if(rs.next()) {
				if(rs.getBoolean("Role")) {
					HttpSession session = request.getSession(true);
					session.setAttribute("sessionIdAD", rs.getString("UserID"));
					session.setAttribute("sessionAD", rs.getString("UserName"));
					session.setAttribute("sessionNameAD", rs.getString("Name"));
					RequestDispatcher rd = request.getRequestDispatcher("HomeAdminForward");
					rd.forward(request, response);
				}
				else {
					HttpSession session = request.getSession(true);
					session.setAttribute("sessionIdEM", rs.getString("UserID"));
					session.setAttribute("sessionEM", rs.getString("UserName"));
					session.setAttribute("sessionNameEM", rs.getString("Name"));
					session.setAttribute("sessionEmailEM", rs.getString("Email"));
					session.setAttribute("sessionPhoneEM", rs.getString("Phone"));
					session.setAttribute("sessionAddrEM", rs.getString("Address"));
					RequestDispatcher rd = request.getRequestDispatcher("HomeForward");
					rd.forward(request, response);
				}
			}
			else {
				request.setAttribute("msgdangnhap","TÊN ĐĂNG NHẬP, MẬT KHẨU KHÔNG ĐÚNG");
				RequestDispatcher rd = request.getRequestDispatcher("View/Client/Login.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
