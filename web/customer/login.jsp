<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="utf-8">
  <base href="http://${header.host}${pageContext.request.contextPath}/customer/">
  <title>用户登录</title>
  <head>
    <meta charset="utf-8">
  </head>
<body>
<div>
  <h1>顾客登录</h1>
</div>
<form action="login" method="post">
  用户名：<input type="text" name="name"><br>
  密码：<input type="password" name="password"><br>
  验证码：<input type="text" name="inputCode">
  <img src="validCode" id="vCode" onclick="refreshCode()"><br>
  <button type="submit">登 录</button>
</form>
<div>
  <a href="book/list">首页</a>
  <a href="register.jsp">新顾客注册</a>
  <a href="../admin/login.jsp">管理员登录</a>
</div>
</body>
</html>
<script>
  function refreshCode() {
    document.getElementById("vCode").src = "validCode?r=" + Math.random();
  }
</script>