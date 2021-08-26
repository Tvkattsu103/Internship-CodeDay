package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Bean.DashboardBean;
import Dao.DashboardDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/HomeAdminForward")
public class HomeAdminForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeAdminForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if (request.getParameter("year") != null) {
            int nam = Integer.parseInt(request.getParameter("year"));
            DashboardBean listThongKe = DashboardDao.getMonthlyRevenue(nam);
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            String objectToReturn = gson.toJson(listThongKe); // Convert List -> Json
            out.write(objectToReturn); // Đưa Json trả về Ajax
            out.flush();
        } else {
            Calendar calendar = Calendar.getInstance();
            int nam = calendar.get(Calendar.YEAR);
            request.setAttribute("db", DashboardDao.getMonthlyRevenue(nam));
            RequestDispatcher rd = request.getRequestDispatcher("View/Admin/HomeAdmin.jsp");
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
