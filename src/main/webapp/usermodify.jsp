<%@page import="com.membermanage.MemberDTO"%>
<%@page import="com.membermanage.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
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

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
        border-radius: 5px;
    }

    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .form-group label {
        text-align: center;
        margin-right: 10px;
        width: 100px;
    }

    input[type="text"],
    input[type="password"],
    input[type="submit"] {
        padding: 10px;
        margin: 5px;
        text-align: center;
        width: 200px;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
<title>회원정보 수정</title>
</head>
<body>

	<%
	String id = (String)session.getAttribute("id");
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO dto = memberDAO.memberId(id);
	%>
	<h1>회원정보 수정</h1>
    <form action="usermodifyOk.jsp" method="post">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" value="<%=dto.getName()%>">
        </div>
        <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" value="<%=dto.getPw()%>">
        </div>
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" name="phone" value="<%=dto.getPhone()%>">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" name="email" value="<%=dto.getEmail()%>">
        </div>
        <input type="submit" value="수정완료">
    </form>
</body>
</html>