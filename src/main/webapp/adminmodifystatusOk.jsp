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
<title>회원 정보 수정 결과</title>
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

    p {
        margin-bottom: 10px;
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
</style>
</head>
<body>
    <%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String status = request.getParameter("status");
    String authority = request.getParameter("authority");
    
    MemberDAO memberDAO = new MemberDAO();
    if (status.equals("일시정지")) {
        memberDAO.memberDelete(id);
        response.sendRedirect("admininfo.jsp");
    }
    
    MemberDTO dto = new MemberDTO(name, id, pw, phone, email, status, authority);
    memberDAO.memberUpdate(dto);
    %>
    
    <h1>상태 정보 변경 확인</h1>
    <h2><%= dto.getId()%>님의 승인상태가</h2>
    <h2> <%= dto.getStatus() %>으로 변경되었습니다.</h2>

    <a href="admininfo.jsp" class="button-link">회원정보 조회/수정</a>
</body>
</html>
