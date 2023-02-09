package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.SalesDto;


@WebServlet("/MMS")
public class MemberSalesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDao dao = MemberDao.getInstance();
		List<SalesDto> list = dao.selectSales();
		
		request.setAttribute("list", list);
		
		//request.getRequestDispatcher("salesInfo1.jsp").forward(request, response);
		request.getRequestDispatcher("salesInfo2.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
