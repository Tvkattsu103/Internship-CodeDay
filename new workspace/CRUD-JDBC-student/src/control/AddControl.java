package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.studentDao;

@WebServlet("/add")
public class AddControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("Add.jsp").forward(request, response);    
		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String shoten = request.getParameter("hoten");
		String sdiachi = request.getParameter("diachi");
		String sngaysinh = request.getParameter("ngaysinh");
		
		studentDao dao = new studentDao();
		dao.insertStudent(shoten, sdiachi, sngaysinh);
		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
		response.sendRedirect("load");
	}

}
