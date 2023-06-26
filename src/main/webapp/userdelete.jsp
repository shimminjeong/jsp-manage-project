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

    .button-link {
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

    .button-link:hover {
        background-color: #0056b3;
    }
</style>
<title>회원 탈퇴</title>
</head>
<body>
    <h2>정말 탈퇴하시겠습니까?</h2>
    <form action="userdeleteOk.jsp" method="post">
        <br/>
        <button class="button-link" type="submit">네</button>
    </form>
    <a href="usermain.jsp" class="button-link">아니요</a>
</body>
</html>
