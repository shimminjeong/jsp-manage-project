<%@page import="com.membermanage.MemberDTO"%>
<%@page import="com.membermanage.MemberDAO"%>
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

    .button {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px;
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
<title>회원탈퇴</title>
</head>
<body>

	<%
	String id = (String) session.getAttribute("id");
	session.invalidate();
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO dto = memberDAO.memberId(id);
	dto.setStatus("일시정지");
	memberDAO.memberUpdate(dto);
	%>
	<h1><%=dto.getName()%>님 정상탈퇴 되었습니다.<br/></br>그동안 감사했습니다.</h1>

<button class="button" onclick="location.href='main.jsp'">메인</button>
</body>
</html>