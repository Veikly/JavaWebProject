<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/admin/">
    <title>重置密码</title>
</head>
<body>
<h2>重置密码</h2>
<form action="/reset-password" method="post">
    <label for="email">邮箱：</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="new-password">新密码：</label>
    <input type="password" id="new-password" name="new-password" required><br><br>

    <label for="confirm-password">确认新密码：</label>
    <input type="password" id="confirm-password" name="confirm-password" required><br><br>

    <input type="submit" value="重置密码">
</form>
</form>
</body>
</html>
