<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <form action="login.form" method="post">
        <table border="1">
            <tr>
                <td>Name</td>
                <td><input name="name" type="text" maxlength="8" tabindex="1"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input name="password" type="password" maxlength="12" tabindex="2"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Login"/></td>
            </tr>
        </table>
    </form>
</body>
<p>${requestScope.message}</p>
</html>