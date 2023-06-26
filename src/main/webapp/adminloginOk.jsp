<%@page import="com.membermanage.MemberDTO"%>
<%@page import="com.membermanage.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	MemberDAO memberdao = new MemberDAO();
	MemberDTO dto = memberdao.memberId(id);

	if (dto != null && dto.getAuthority().equals("관리자")) {
		if (dto.getPw().equals(pw)) {
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("ValidMem", "yes");
			response.sendRedirect("adminmain.jsp");
		} else {
			out.println("<script>alert('비밀번호가 틀립니다.'); history.back();</script>");
		}
	} else {
		out.println("<script>alert('해당 아이디가 존재하지 않습니다.'); history.back();</script>");
	}
	%>
</body>
</html>