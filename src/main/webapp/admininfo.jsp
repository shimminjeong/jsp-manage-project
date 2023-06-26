<%@page import="java.util.ArrayList"%>
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
<title>회원조회</title>

</head>
<body>
	<%

	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> dtos=memberDAO.memberSelect();
	%>
	
<h1>회원정보 조회 및 수정</h1>
<table>
  <tr>
    <th>이름</th>
    <th>아이디</th>
    <th>비밀번호</th>
    <th>전화번호</th>
    <th>이메일</th>
    <th>회원가입처리상태</th>
    <th>회원정보수정</th>
  </tr>
  <% for (MemberDTO dto : dtos) { %>
  <tr>
    <td><%= dto.getName() %></td>
    <td><%= dto.getId() %></td>
    <td><%= dto.getPw() %></td>
    <td>010-XXXX-XXXX</td>
    <td><%= dto.getEmail() %></td>
    <td><%= dto.getStatus() %></td>
    <td>
      <form action="adminmodifymember.jsp" method="post">
        <input type="hidden" name="id" value="<%= dto.getId() %>">
        <input type="submit" value="수정">
      </form>
    </td>
  </tr>
  <% } %>
</table>

<a href="adminmain.jsp" class="button-link">메인</a>
	
</body>
</html>