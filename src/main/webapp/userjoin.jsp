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
</style>
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
    <form action="userjoinOk.jsp" method="post">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" id="name">
        </div>
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" name="id" id="id">
        </div>
        <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" id="pw">
        </div>
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" name="phone" id="phone">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" name="email" id="email">
        </div>
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
