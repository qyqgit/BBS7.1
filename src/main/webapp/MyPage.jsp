<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="sys/css/global.css" rel="stylesheet" type="text/css"/>
<link href="sys/utf8-jsp/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="sys/utf8-jsp/third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="sys/utf8-jsp/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="sys/utf8-jsp/umeditor.min.js"></script>
<script type="text/javascript" src="sys/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
    $("#btn").bind("click", function(){
        $("#text").val(UM.getEditor('myEditor').getContent());
        $("#umForm").submit();
    });
})
</script>
<title>Insert title here</title>
</head>
<body>
    <div id="head">
        Name:
        <c:url value="home.form?id=${sessionScope.user.id}" var="url"></c:url>
        <a href="${url }"><c:out value="${sessionScope.user.name}"></c:out></a>
        
        ${sessionScope.user.id == null?'<a href="Login.jsp">Login</a>':''}
        ${sessionScope.user.id == null?'<a href="Register.jsp">Register</a>':''}
        ${sessionScope.user.id == null?'':'<a href="logout.form">Logout</a>'}
        ${sessionScope.user.id == null?'':'<a href="MyReply'.concat('">Reply('.concat(sessionScope.count[0]).concat(')</a>'))}
        <a href="index.form">Index</a>
        <span style="float:right;">Sessions:${applicationScope.numMembers}</span>
    </div>
    <div id="main">
	    <table id="main_tb">
	        <tr><td colspan="5"><h2>${requestScope.myPage.text}</h2></td></tr>
	        <tr>
	            <td></td>
	            <td width="200px"  style="vertical-align:bottom;">
	                <h2>
	                <c:url value="home.form?id=${requestScope.myPage.user.id}" var="url"></c:url>
	                <a href="${url }"><c:out value="${requestScope.myPage.user.name}"></c:out></a>
	                </h2>
	            </td>
	            <td width="220px" style="vertical-align:bottom;"><h2>${fn:substring(requestScope.myPage.createDate, 0, 16)}</h2></td>
	        </tr>
	        <c:forEach var="messageList" items="${requestScope.messageList }" >
	        <tr><td colspan="5"><a id="${messageList.floorNumber }"></a></td></tr>
	        <tr>
	            <td colspan="5"><c:out value="${messageList.text }" escapeXml="false"/></td>
	        </tr>
	        <tr>
	            <td></td>
	            <td  style="vertical-align:bottom;">
	                <c:url value="home.form?id=${messageList.user.id}" var="url"></c:url>
	                <a href="${url }"><c:out value="${messageList.user.name}"></c:out></a>
	            </td>
	            <td  style="vertical-align:bottom;"><c:out value="${messageList.date }"/></td>
	            <td width="50px" style="vertical-align:bottom;">
	                <c:out value="${messageList.floorNumber }"/>
	            </td>
	            <td width="50px" style="vertical-align:bottom;">
	                <a href="${messageList.id}" onclick="return replyFunction(${messageList.floorNumber },${messageList.id},${requestScope.pageNumber},${requestScope.eachPageList[0].pageLength},'${messageList.user.name}',${requestScope.pageId })"><c:out value="${messageList.id == null?'':'Reply' }"></c:out></a>
	            </td>
	        </tr>
	        <tr><td colspan="5"><hr></td></tr>
	        </c:forEach>
	    </table>
        <br>
        <br>
        <br>
        <form id="umForm" method="post"  action="sendMessage.form?id=${requestScope.myPage.id}">
            <input id="text" name="text" type="hidden" style="width:570px" maxlength="1024"/>
            <br>
            <br>
            <script type="text/plain" id="myEditor" style="width:600px;height:240px;"></script>
            <script type="text/javascript">var um = UM.getEditor('myEditor')</script>
            <input id="btn" type="button" value="Send"/>
        </form>
    </div>
    <div id="foot">
        <span style="float:right;">Connections:${applicationScope.numConn}</span>
    </div>
</body>
</html>