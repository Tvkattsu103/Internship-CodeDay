package Controller;
import java.io.PrintWriter;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import Dao.ConnectSql;

/**
 * Servlet implementation class UpdateInvoiceServlet
 */
@WebServlet("/UpdateInvoiceServlet")
public class UpdateInvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInvoiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id =Integer.parseInt(request.getParameter("invoiceid"));
		PrintWriter out = response.getWriter();
		String sql = "Proc_Update_Invoice ?";
		try {
			PreparedStatement cmd = ConnectSql.cn.prepareStatement(sql);
			cmd.setInt(1, id);
			cmd.executeUpdate();
			out.print(id);
			} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("InvoiceManagerForward");
		rd.forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
