<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/24/2023
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%--@declare id="exchangerate"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <h2>Chuyển đổi tiền tệ</h2>
    <form action="/convert" method="post">
        <label>Exchange Rate: </label>
        <input type="text" name="exchangeRate" required><br>
        <label>USD Amount: </label>
        <input type="text" name="usdAmount" required><br>
        <input type="submit" value="Convert">
    </form>
</head>
<body>

</body>
</html>
