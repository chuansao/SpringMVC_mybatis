<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=<%=basePath%>>
<title>编辑用户</title>
<script type="text/javascript">
function updateUser() {
	var form = document.forms[0];
	form.action = "<%=basePath%>user/updateUser";
	form.method="post";
	form.submit();
}
</script>
</head>
<body>
<h1>编辑用户</h1>
<form action="" name="userForm">
	<input type="hidden" name="id" value="${user.id }" />
	姓名：<input type="text" name="userName" value="${user.userName }" />
	年龄：<input type="text" name="age" value="${user.age }" />
	<input type="button" value="编辑" onclick="addUser()" />
</form>
</body>
</html>