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

    h1 {
        text-align: center;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-top: 20px;
    }

    input[type="text"],
    input[type="password"],
    input[type="submit"] {
        padding: 10px;
        margin: 5px;
    }

    a {
        text-align: center;
        margin-top: 10px;
    }
    
    .form-group {
        display: flex;
        align-items: center;
    }

    .form-group label {
        text-align: center;
        margin-right: 10px;
        width: 80px; /* 수정: 라벨 너비 조정 */
    }

    button {
        display: block;
        width: 200px;
        padding: 10px;
        margin-bottom: 10px;
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }
    
    .in {
        display: flex;
        flex-direction: row;
    }
</style>
<title>사용자로그인</title>
</head>
<body>
    <h1>사용자로그인</h1>
    <form action="userloginOk.jsp" method="post">
        <div class="form-group">
            <label for="아이디">아이디</label>
            <input type="text" name="id">
        </div>
        <div class="form-group">
        	<label for="비밀번호">비밀번호</label>
            <input type="password" name="pw">
        </div>
        <br/>
        <button type="submit">로그인</button> 
    </form>
    <br/>
    <button onclick="location.href='userjoin.jsp'">회원가입</button>
</body>
</html>
