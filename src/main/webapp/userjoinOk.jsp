<%@page import="com.membermanage.MemberDTO"%>
<%@page import="com.membermanage.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    h3 {
        text-align: center;
        color: #333;
        margin-bottom: 10px;
    }

    .button {
        display: inline-block;
        padding: 10px 20px;
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
<title>회원가입 결과</title>
</head>
<body>
    <% 
    MemberDTO dto = null;
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String status = "승인전";
    String authority = "일반사용자";

    if (name == "" || id == "" || pw == "") {
        out.println("<script>alert('이름, 아이디, 비밀번호를 모두 입력해주세요.');history.back();</script>");
    } /* else if (!pw.matches("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{4,}$")) {
        out.println("<script>alert('비밀번호는 영문과 숫자로만 구성되어야 하며, 최소 4글자 이상이어야 합니다.');history.back();</script>");
    } */ else {
        MemberDAO memberdao = new MemberDAO();
        dto = memberdao.memberId(id);
        if (dto == null) {
            dto = new MemberDTO(name, id, pw, phone, email, status, authority);
            memberdao.memberInsert(dto);
    %>
        <h3><%=dto.getName()%>님 회원가입을 관리자에게 요청하였습니다.</h3>
        <h3>조금만 기다려주세요.</h3>
    <% } else { %>
        <script>alert('해당 아이디는 현재 존재하고 있습니다.'); history.back();</script>
    <% } }%>
    </br>
    <a href="main.jsp" class="button">메인</a>
    </body>
</html>
