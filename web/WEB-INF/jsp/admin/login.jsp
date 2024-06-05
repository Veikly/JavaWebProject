<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/admin/">
    <title>管理员登录</title>
    <style>
        nav {
            background-color: #007bff;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            width: 100%;
            z-index: 1000;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            transition: background-color 0.3s;
        }
        nav a:hover {
            background-color: #0056b3;
        }
        form {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);

        }
        input, button {
            margin-top: 10px;
            padding: 8px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 3px;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .login-form{
            align-content: center;
            display: flex;
            justify-content: center;
        }
        h2{
            text-align: center;
            align-content: center;
            justify-content: center;
        }
    </style>

</head>
<body>
<nav class="navbar">
        <a href="../customer/book/list">首页(图书列表)</a>
        <a href="../customer/login.do">顾客登录</a>
</nav>

<div class="login-form">
<form action="login" method="post" >
    <h2>管理员登录</h2>
    用户名：<input type="text" name="name"><br>
    密码：<input type="password" name="password"><br>
    验证码：<input type="text" name="inputCode">
    <img src="validCode" id="vCode" onclick="refreshCode()"><br>
    <button class="btn-primary" type="submit">登录</button>
</form>
</div>
</body>
</html>
<script>
    function refreshCode() {
        document.getElementById("vCode").src = "validCode?r=" + Math.random();
    }
</script>