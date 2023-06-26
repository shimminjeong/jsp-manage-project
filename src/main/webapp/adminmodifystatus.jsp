<%@page import="java.util.ArrayList"%>
<%@page import="com.membermanage.MemberDTO"%>
<%@page import="com.membermanage.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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

    table {
        border-collapse: collapse;
        width: 70%;
        background-color: #fff;
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    form {
        display: inline;
    }

    select {
        padding: 4px;
    }

    input[type="submit"] {
        padding: 4px 10px;
        background-color: #007bff;
        color: #fff;
        font-size: 14px;
        font-weight: bold;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    a.button-link {
        display: inline-block;
        background-color: #007bff;
        color: #fff;
        font-size: 14px;
        font-weight: bold;
        padding: 4px 10px;
        border: none;
        border-radius: 4px;
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
<h1>회원상태변경</h1>
<body>
    <%
    MemberDAO memberDAO = new MemberDAO();
    ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
    %>
  
    <table>
        <tr>
            <th>이름</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>회원상태</th>
            <th>회원상태수정</th>
        </tr>
        <% for (MemberDTO dto : dtos) { %>
        <tr>
            <td><%= dto.getName() %></td>
            <td><%= dto.getId() %></td>
            <td><%= dto.getPw() %></td>
            <td><%= dto.getPhone() %></td>
            <td><%= dto.getEmail() %></td>
            <td>
                <form action="adminmodifystatusOk.jsp" method="post">
                    <input type="hidden" name="id" value="<%= dto.getId() %>">
                    <input type="hidden" name="name" value="<%= dto.getName() %>">
                    <input type="hidden" name="pw" value="<%= dto.getPw() %>">
                    <input type="hidden" name="phone" value="<%= dto.getPhone() %>">
                    <input type="hidden" name="email" value="<%= dto.getEmail() %>">
                    <input type="hidden" name="authority" value="<%= dto.getAuthority() %>">
                    <% if (dto.getStatus().equals("일시정지")) { %>
                    <%= dto.getStatus() %>
                    <input type="hidden" name="status" value="<%= dto.getStatus() %>">
                    <% } else { %>
                    <select name="status">
                        <option value="정상" <%= dto.getStatus().equals("정상") ? "selected" : "" %>>정상</option>
                        <option value="승인전" <%= dto.getStatus().equals("승인전") ? "selected" : "" %>>승인전</option>
                    </select>
                    </td>
                    <% } %>
            <td>
                <input type="submit" value="상태변경">
            </td>
            </form>
        </tr>
        <% } %>
    </table>

    <a href="adminmain.jsp" class="button-link">메인</a>
</body>
</html>
