package com.ajax.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajax.Dao.DAO;
import com.ajax.entity.TheLoai;

import entity.Product;

@WebServlet("/TheLoaiPhim")
public class TheLoaiPhim extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TheLoaiPhim() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cateID = request.getParameter("cid");
//		DAO dao = new DAO();
//		List<Product> list = dao.getProductByCategoryID(cateID);
//		List<TheLoai> listC = dao.getAllCategory();
//		Product pLast = dao.getLastest();
//		
//		request.setAttribute("listTL", listTL);
//		request.setAttribute("pLast", pLast);
//		request.setAttribute("tag", cateID);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
