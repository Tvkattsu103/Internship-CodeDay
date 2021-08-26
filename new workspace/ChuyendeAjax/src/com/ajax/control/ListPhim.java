package com.ajax.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajax.Dao.DAO;
import com.ajax.entity.Phim;

@WebServlet("/list")
public class ListPhim extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListPhim() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String indexPage = request.getParameter("page");
		if(indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		
		DAO dao = new DAO();
		int count = dao.getTotalPhim();
		int endPage = count/6;
		if(count % 6 != 0) {
			endPage++;
		}
		index = (index-1)*6;
		List<Phim> list = dao.pagingPhim(index);
		
		request.setAttribute("pageCurrent", indexPage);
		request.setAttribute("listP", list);
		request.setAttribute("endP", endPage);
		request.getRequestDispatcher("Pagination.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
