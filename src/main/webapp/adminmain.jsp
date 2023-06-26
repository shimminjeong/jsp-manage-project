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

    .button {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px;
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        text-decoration: none; 
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .button:hover {
        background-color: #0056b3;
    }
</style>
<title>관리자메일</title>
</head>
<body>
	<h1><%=(String)session.getAttribute("id")%> 관리자 입장</h1> 
	<a href="admininfo.jsp" class="button">회원정보 조회 / 수정</a>
	<a href="adminmodifystatus.jsp" class="button">회원상태 변경</a>
	<a href="logout.jsp" class="button">로그아웃</a>
</body>
</html>