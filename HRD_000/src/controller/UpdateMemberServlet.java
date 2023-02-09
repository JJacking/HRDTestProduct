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

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/UMS")
public class UpdateMemberServlet extends HttpServlet {
	
	//뿌려주는역할 (읽어와서출력)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int custno = Integer.parseInt(request.getParameter("custno"));//jsp내 값 읽어오기
		
		MemberDao dao = MemberDao.getInstance();
		MemberDto dto = dao.selectMember(custno);
		
		request.setAttribute("member", dto);
			
		request.getRequestDispatcher("updateMember.jsp").forward(request, response);
		
	}
	
	//저장하는
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request.setCharacterEncoding("UTF-8");
		
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Timestamp joindate = null;
		try {
			joindate = 
					new Timestamp(new SimpleDateFormat("yyyy-MM-dd")
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
		dao.updateMember(mto);
		
		response.sendRedirect("index.jsp");
	}

}
