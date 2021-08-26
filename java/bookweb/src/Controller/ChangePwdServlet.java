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
import javax.websocket.Session;

import Bean.BookBean;
import Dao.BookDao;
import Dao.UserDao;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet("/ChangePwdServlet")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdServlet() {
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
		request.setCharacterEncoding("utf-8");
		String currentpass = request.getParameter("p1");
		String curp = UserDao.md5(currentpass);
		String newpass = request.getParameter("p2");
		String newp = UserDao.md5(newpass);
		String confirmpass = request.getParameter("p3");
		String conf = UserDao.md5(confirmpass);
		int usid = Integer.parseInt((String) session.getAttribute("sessionIdEM"));
		if(!UserDao.CheckPass(request.getParameter(curp))) {
			if(!currentpass.equals(newpass) && newpass.equals(confirmpass)) {
				UserDao.ChangePass(newp, usid);
				ArrayList<BookBean> ds;
				if (request.getParameter("timkiem")!=null)
					ds = BookDao.getSachTheoTen(request.getParameter("timkiem"));
				else 
					ds= BookDao.GetBook();
				if (request.getParameter("pageid")==null || Integer.parseInt(request.getParameter ("pageid"))==1)		
				{
					request.setAttribute("listsach", ds);
					request.setAttribute("dau", 0);
					request.setAttribute("cuoi", 8<ds.size()?8:ds.size());
					request.setAttribute("tranghientai", 1);
					RequestDispatcher rd = request.getRequestDispatcher("View/Client/Home.jsp");
					rd.forward(request, response);
				}
				else 
				{
					String page= request.getParameter("pageid");
					int id=Integer.parseInt(page);
					int dau=(id-1)*8;
					int cuoi=dau+8;
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
			else {
				request.setAttribute("msgdoimk", "MẬT KHẨU KHÔNG ĐÚNG");
				RequestDispatcher rd = request.getRequestDispatcher("View/Client/ChangePwd.jsp");
				rd.forward(request, response);
		}
	}
	}

}
