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
<title>회원수정확인</title>
</head>
<body>
	<%
	String id=request.getParameter("id");
	String name =request.getParameter("name");
	String pw =request.getParameter("pw");
	String phone =request.getParameter("phone");
	String email =request.getParameter("email");
	String status =request.getParameter("status");
	String authority =request.getParameter("authority");

	MemberDAO memberDAO = new MemberDAO();
	MemberDTO dto=new MemberDTO(name,id,pw,phone,email,status,authority);
	memberDAO.memberUpdate(dto);
	%>
	
	<h1>회원정보변경</h1>
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
    <div class="info">
        <span class="info-label">승인상태</span>
        <span class="info-value"><%=dto.getStatus()%></span>
    </div>

<button class="button" onclick="location.href='adminmain.jsp'">메인</button>

</body>

</html>