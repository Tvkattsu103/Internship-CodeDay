package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try(PrintWriter out = res.getWriter()) {
			String username = req.getParameter("username");
			String[] hobbies = req.getParameterValues("hobbies");
			String country = req.getParameter("country");
			
			out.println("<h1>Username: "+ username);
			out.println("<h1> Hobbies: ");
			for(String item : hobbies) {
				out.println(item + ", ");
			}
			out.println("</h1>");
			out.println("<h1>Country: "+ country);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}
}
