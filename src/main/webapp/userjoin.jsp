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
    input[type="submit"],
    input[type="email"] {
        padding: 10px;
        margin: 5px;
        text-align: center; /* 가운데 정렬 */
        width: 200px;
        box-sizing: border-box; /* 내용 포함한 전체 크기 지정 */
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
<script>
    function validateForm() {
    	
    	var pw = document.getElementById("pw").value;
    	var phone = document.getElementById("phone").value;

        var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{4,}$/;
        if (!pwRegex.test(pw)) {
            alert("비밀번호는 영문과 숫자로만 구성되어야 하며, 최소 4글자 이상이어야 합니다.");
            return false;
        }
        
        var phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
        if (!phoneRegex.test(phone)) {
            alert("전화번호는 010-0000-0000 형태로 입력해주세요.");
            return false;
        }
        
        return true;
    }
</script>
</head>
<body>
<h1>회원가입</h1>
    <form action="userjoinOk.jsp" method="post"  onsubmit="return validateForm()">
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
            <input type="text" name="phone" id="phone"  >
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" name="email" id="email">
        </div>
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
