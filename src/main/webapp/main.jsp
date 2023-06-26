<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    </style>
</head>
<body>
<%
	if (session.getAttribute("ValidMem")!=null){
		session.invalidate();
	}
%>
	
		<h1>회원관리프로그램</h1>
		<button id="userModeBtn">사용자 모드</button>
		<button id="adminModeBtn">관리자 모드</button>


	<script>
		document.getElementById("userModeBtn").addEventListener("click",
				function() {
					window.location.href = "userlogin.jsp";
				});

		document.getElementById("adminModeBtn").addEventListener("click",
				function() {
					window.location.href = "adminlogin.jsp";
				});
	</script>
</body>
</html>
