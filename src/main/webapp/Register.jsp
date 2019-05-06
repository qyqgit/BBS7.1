<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="sys/js/jquery-3.4.0.js"></script>
<script type="text/javascript">
    $(function(){
        $("#name").blur(function(){
            var name = $("#name").val();
            $.ajax({
                url:"alreadyRegister.form",
                type:"post",
                data:{"name":name},
                dataType:"text",
                success:function(txt){
                    if(txt!="")
                        alert(txt);
                },
                error:function(){alert("system error.");}
            });
        });
    })
</script>
<title>Insert title here</title>
</head>
<body>
    <form action="register.form" method="post">
        <table border="1">
            <tr>
                <td>Name</td>
                <td><input id="name" name="name" type="text" maxlength="8" tabindex="1"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input id="password" name="password" type="password" maxlength="12" tabindex="2"/></td>
            </tr>
            <tr>
                <td>Birthday</td>
                <td><input id="birthday" name="birthday" type="text"/></td>
            </tr>
            <tr>
                <td>Sex</td>
                <td>
                    <input name="sex" type="radio" value="2" checked="checked"/>null
                    <input name="sex" type="radio" value="1"/>boy
                    <input name="sex" type="radio" value="0"/>girl
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Register"/></td>
            </tr>
        </table>
    </form>
</body>
<p>${requestScope.message}</p>
</html>