<%@page import="com.membermanage.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.membermanage.MemberDAO"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body {
        font-family: Arial, sans-serif;
        flex-direction: column;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h1 {
        text-align: center;
        color: #333;
    }

    .info {
        margin-bottom: 10px;
    }

    .info-label {
        font-weight: bold;
    }

    .info-value {
        margin-left: 5px;
    }

    .button {
        display: inline-block;
        padding: 10px 20px;
        margin-top: 20px;
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
    }

    .button:hover {
        background-color: #0056b3;
    }
</style>
<title>개인정보변경</title>
</head>
<body>
	<%
	
	String id =(String)session.getAttribute("id");
	String name =request.getParameter("name");
	String pw =request.getParameter("pw");
	String phone =request.getParameter("phone");
	String email =request.getParameter("email");
	
	MemberDAO memberDAO = new MemberDAO();
	if (!pw.matches("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{4,}$")) {
        out.println("<script>alert('비밀번호는 영문과 숫자로만 구성되어야 하며, 최소 4글자 이상이어야 합니다.');history.back();</script>");
	} else{
		
		MemberDTO dto=new MemberDTO(name,id,pw,phone,email,"정상","일반사용자");
		memberDAO.memberUpdate(dto);
		%>
		
		<h1>개인정보변경</h1>
		<div class="info">
	        <span class="info-label">이름</span>
	        <span class="info-value"><%=dto.getName()%></span>
	    </div>
	    <div class="info">
	        <span class="info-label">아이디</span>
	        <span class="info-value"><%=dto.getId()%></span>
	    </div>
	    <div class="info">
	        <span class="info-label">비밀번호</span>
	        <span class="info-value"><%=dto.getPw()%></span>
	    </div>
	    <div class="info">
	        <span class="info-label">전화번호</span>
	        <span class="info-value"><%=dto.getPhone()%></span>
	    </div>
	    <div class="info">
	        <span class="info-label">이메일</span>
	        <span class="info-value"><%=dto.getEmail()%></span>
	    </div>
	<% 
		}
	%>
	
	
	
	

<button class="button" onclick="location.href='usermain.jsp'">사용자메인</button>


</body>

</html>