<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="sys/css/global.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="sys/js/jquery-3.4.0.js"></script>
<script type="text/javascript">
$(function(){
    var num = 0;
    $("#editBtn").bind("click", function(){
    	if(num % 2 == 0){
    		$("#editBtn").val("Clear");
    		num++;
    	}else{
    		$("#editBtn").val("Edit");
    		num++;    		
    	}
        $("#viewTable").toggle();
        $("#submitBtn").toggle();
        $("#editTable").toggle();
        if($("#sex").val() == "1")
            $("#boy").attr('checked',true);
        else if($("#sex").val() == "0")
            $("#girl").attr('checked',true);
        else $("#null").attr('checked',true);
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
    <br>
    <div id="main">
        <table id="viewTable">
            <tr bgcolor="#EEEEEE">
                <td>Name</td>
                <td>Password</td>
                <td>Age</td>
                <td>Sex</td>
                <td>Date</td>
            </tr>
            <tr>
                <td>${requestScope.user.name }</td>
                <td>**</td>
                <td>${requestScope.user.age==null ?'unknow':requestScope.user.age }</td>
                <td>${requestScope.user.sex==2 ?'unknow':''}${requestScope.user.sex==1 ?'boy':''}${requestScope.user.sex==0 ?'girl':''}</td>
                <td>${fn:substring(requestScope.user.date, 0, 10) }</td>
            </tr>
        </table>
        <form id="editForm" name="editForm"   method="post"  action="updateUser.form?id=${sessionScope.user.id}">
            <table id="editTable" style="display:none">
                <tr bgcolor="#EEEEEE">
                    <td>Name</td>
                    <td>Password</td>
                    <td>Age</td>
                    <td>Sex</td>
                    <td>Date</td>
                </tr>
                <tr>
                    <td>${sessionScope.user.name }</td>
                    <td><input id="password" name="password" type="password" value="5f4dcc3b5aa765d61d8327deb882cf99"></td>
                    <td><input id="birthday" name="birthday" type="text" value="${sessionScope.user.age }" onBlur="formatDate('birthday')"></td>
                    <td>
                        <input id="sex" type="hidden" value="${sessionScope.user.sex }" />
                        <input id="null" name="sex" type="radio" value="2"/>null
                        <input id="boy" name="sex" type="radio" value="1"/>boy
                        <input id="girl" name="sex" type="radio" value="0"/>girl
                    </td>
                    <td>${fn:substring(sessionScope.user.date, 0, 10) }</td>
                </tr>
            </table>
            <table>
            <c:set value="<input id='editBtn'  type='button' value='Edit' />" var="editBtn"></c:set>
            <c:set value="<input id='submitBtn' type='submit' style='display:none;' value='Submit' />" var="submitBtn"></c:set>
                <tr>
                <td>${sessionScope.user.id == requestScope.user.id ? editBtn:''}</td>
                <td>${sessionScope.user.id == requestScope.user.id ? submitBtn:''}</td>
                </tr>
            </table>
        </form>
        <br>
        <table id="main_tb">
                <tr bgcolor="#EEEEEE">
                    <td>ID</td>
                    <td>Name</td>
                    <td>Download</td>
                    <td>Date</td>
                    <td>URL</td>
                    <td>${sessionScope.user.id == requestScope.user.id ? 'Delete':''}</td>
                </tr>
                <c:forEach var="mediaList" items="${requestScope.mediaList }" >
                <tr>
                    <td><c:out value="${mediaList.id }"/></td>
                    <td style="max-width:550px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><c:out value="${mediaList.name }"/></td>
                    <td>
                        <c:url value="${mediaList.url}" var="url"></c:url>
                        <a href="${url }"><c:out value="Download"></c:out></a>
                    </td>
                    <td style="white-space:nowrap;"><c:out value="${mediaList.date }"/></td>
                    <td>
                        <input style="width:1px;position:absolute;z-index:-1;opacity:0.0;" id="_${mediaList.id }" type="text" value="${mediaList.url}">
                        <button class="btn" data-clipboard-action="copy" data-clipboard-target="#_${mediaList.id }" onclick="encodeUrl('_${mediaList.id }','${mediaList.url}')">URL</button>
                    </td>
                    <td>
                    <c:set value = '<a href="deleteFile?id=${mediaList.id}" >Delete</a>' var = "delete"></c:set>
                    <c:out value="${sessionScope.user.id == requestScope.user.id ? delete:''}" escapeXml="false"/>
                    </td>
                </tr>
                <tr><td colspan="6"><hr></td></tr>
                </c:forEach>
        </table>
        <c:set value ='<form action="FileUploadServlet" method="post" enctype="multipart/form-data" onsubmit="return uploadCheck()"><input id="file" type="file" name="file" accept="/*"><input type="submit" value="Upload"></form>' var = "upload"></c:set>
        ${sessionScope.user.id == requestScope.user.id ? upload:''}
    </div>
    <div id="foot">
        <span style="float:right;">Connections:${applicationScope.numConn}</span>
    </div>
</body>
</html>