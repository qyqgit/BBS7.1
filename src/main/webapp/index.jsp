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
        <span style="float:right;">Sessions:${applicationScope.numMembers}</span>
        <img src="sys/pic/default_head20141014.png">
    </div>
    <div id="main">
        <table id="main_tb">
            <tr bgcolor="#EEEEEE">
                <td>Num</td>
                <td>Title</td>
                <td>Author</td>
                <td><c:out value="&nbsp;&nbsp;&nbsp;&nbsp;" escapeXml="false"/></td>
                <td colspan="2">Reply</td>
            </tr>
            <c:forEach var="myPageList" items="${requestScope.myPageList }" varStatus="loop">
	            <tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
	                <td><c:out value="${myPageList.messageNumber}" /></td>
	                <td>
	                    <c:url value="myPage.form?id=${myPageList.id}&timeStamp=${myPageList.timeStamp }" var="url"></c:url>
	                    <a href="${url }" style="text-decoration:none;"><c:out value="${myPageList.title} " escapeXml="false"></c:out></a>
	                </td>
	                <td>
	                    <c:url value="home.form?id=${myPageList.user.id}" var="url"></c:url>
	                    <a href="${url }"><c:out value="${myPageList.user.name}"></c:out></a>
	                </td>
	                <td><c:out value="&nbsp;&nbsp;&nbsp;&nbsp" escapeXml="false"/></td>
	                <td>
	                    <c:url value="home.form?id=${lastSendMessageUserList[loop.index].id}" var="url"></c:url>
	                    <a href="${url }"><c:out value="${lastSendMessageUserList[loop.index].name}"></c:out></a>
	                </td>
	                <td><c:out value="${fn:substring(myPageList.timeStamp, 5, 16)}"></c:out></td>
	            </tr>
	            <tr><td colspan="6"><hr></td></tr>
            </c:forEach>
        </table>
        <br>
        <br>
        <br>
        <form id="umForm" method="post"  action="sendMyPage.form">
            <input id="title" name="title" type="text" style="width:570px" maxlength="40"/>
            <input id="text" name="text" type="hidden" style="width:570px" maxlength="1024"/>
            <br>
            <br>
	        <script type="text/plain" id="myEditor" style="width:600px;height:240px;"></script>
	        <script type="text/javascript">var um = UM.getEditor('myEditor');</script>
            <input id="btn" type="button" value="Send"/>
        </form>
    </div>
    <div id="foot">
        <span style="float:right;">Connections:${applicationScope.numConn}</span>
    </div>
</body>
</html>