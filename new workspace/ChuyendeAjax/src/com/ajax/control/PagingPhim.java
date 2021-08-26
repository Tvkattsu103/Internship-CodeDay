package com.ajax.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajax.Dao.DAO;
import com.ajax.entity.Phim;

@WebServlet("/paging")
public class PagingPhim extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PagingPhim() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String indexPage = request.getParameter("page");
		
		if(indexPage == null) {
			indexPage = "0";
		}
		int index = Integer.parseInt(indexPage);
		
		DAO dao = new DAO();
		index = (index-1)*6;
		List<Phim> list = dao.pagingPhim(index);
		
		PrintWriter out = response.getWriter();
		for(Phim o: list) {
			out.println("<div class=\"col-3 card m-4\">\r\n"
					+ "									<img\r\n"
					+ "										src=\""+o.getImg()+"\"\r\n"
					+ "										class=\"card-img-top img-film m-auto\" alt=\"anh-phim\">\r\n"
					+ "									<div class=\"card-body p-0 pt-4\">\r\n"
					+ "										<h4 class=\"card-title mt-1 font-weight-bold\">"+o.getTitle()+"</h4>\r\n"
					+ "										<p>\r\n"
					+ "											Release date: <strong>"+o.getReleaseDate()+"</strong>\r\n"
					+ "										</p>\r\n"
					+ "									</div>\r\n"
					+ "								</div>");
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
