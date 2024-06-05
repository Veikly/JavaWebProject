<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/customer/">
    <title>用户注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease;

        }
        h1 {
            margin-top: 0;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
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
        input[type="text"],
        input[type="password"],
        button {
            width: 100%;
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        button {
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #23527c;
        }
        div > a {
            display: inline-block;
            margin-right: 10px;
            color: #337ab7;
            text-decoration: none;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<div display="block">
    <nav>
        <a href="login.do">用户登录</a>
        <a href="../admin/login.do">管理员登录</a>
    </nav>
</div>

<div class="container" display="block">
    <h2>用户注册</h2>
    <form action="reg" method="post">
        用户名:<input type="text" name="name"><br>
        密码:<input type="password" name="password"><br>
        <button type="submit">注 册</button>
        <button type="reset">重 置</button>
    </form>
</div>

</body>
</html>