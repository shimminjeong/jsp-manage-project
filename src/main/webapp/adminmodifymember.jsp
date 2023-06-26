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
<title>회원 정보 수정</title>
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
        background-color: #fff;
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
    input[type="submit"] {
        padding: 10px;
        margin: 5px;
        text-align: center; /* 가운데 정렬 */
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

    a.button-link {
        display: inline-block;
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        margin-top: 10px;
    }

    a.button-link:hover {
        background-color: #0056b3;
    }
    
    h1 {
        text-align: center;
        color: #333;
    }
</style>
</head>
<body>
	<h1>회원정보수정</h1>
    <%
    String id = request.getParameter("id");

    MemberDAO memberDAO = new MemberDAO();
    MemberDTO dto = memberDAO.memberId(id);
    %>

    <form action="adminmodifymemberOk.jsp" method="post">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" value="<%= dto.getName() %>">
        </div>
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" name="phone" value="<%= dto.getPhone() %>">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" name="email" value="<%= dto.getEmail() %>">
        </div>
        <input type="hidden" name="id" value="<%= dto.getId() %>">
        <input type="hidden" name="pw" value="<%= dto.getPw() %>">
        <input type="hidden" name="status" value="<%= dto.getStatus() %>">
        <input type="hidden" name="authority" value="<%= dto.getAuthority() %>">
        <input type="submit" value="수정완료">
    </form>

    <a href="adminmain.jsp" class="button-link">메인메뉴</a>
</body>
</html>
