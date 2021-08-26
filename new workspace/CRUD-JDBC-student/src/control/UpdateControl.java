package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.studentDao;
import entity.students;

@WebServlet("/update")
public class UpdateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		studentDao dao = new studentDao();
		students s = dao.getStudentById(id);
		request.setAttribute("st", s);
		request.getRequestDispatcher("Update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String sid = request.getParameter("id");
		String shoten = request.getParameter("hoten");
		String sdiachi = request.getParameter("diachi");
		String sngaysinh = request.getParameter("ngaysinh");
		
		studentDao dao = new studentDao();
		dao.updateStudent(sid, shoten, sdiachi, sngaysinh);
		response.sendRedirect("load");
	}

}
