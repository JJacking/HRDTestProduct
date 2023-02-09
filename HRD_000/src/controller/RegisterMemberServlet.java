package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.MemberDto;


@WebServlet("/RMS")
public class RegisterMemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원 가입 폼");
		
		MemberDao dao = MemberDao.getInstance();
		int nextNo = dao.nextCustno(); //2
		
		request.setAttribute("nextNo", nextNo);
		
		request.getRequestDispatcher("registerMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("회원 가입 완료");
		
		request.setCharacterEncoding("UTF-8");
		
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Timestamp joindate = null;
		try {
			joindate = 
					new Timestamp(new SimpleDateFormat("yyyyMMdd")
									.parse(request.getParameter("joindate"))
									.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberDto mto = new MemberDto();
		mto.setCustno(custno);
		mto.setCustname(custname);
		mto.setPhone(phone);
		mto.setAddress(address);
		mto.setJoindate(joindate);
		mto.setGrade(grade);
		mto.setCity(city);
		
		MemberDao dao = MemberDao.getInstance();
		dao.insertMember(mto); //1
		
		response.sendRedirect("index.jsp");
	}

}
