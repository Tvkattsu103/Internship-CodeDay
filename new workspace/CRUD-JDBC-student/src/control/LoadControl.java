package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.studentDao;
import entity.students;

@WebServlet("/load")
public class LoadControl extends HttpServlet {

    public LoadControl() {
        super();
    }

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        studentDao dao = new studentDao();
        List<students> list = studentDao.getAllStudents();
        System.out.println(list);
        request.setAttribute("listS", list);
        request.getRequestDispatcher("Show.jsp").forward(request, response);    

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
