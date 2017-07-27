<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=<%=basePath%>>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<title>用户列表</title>
<script type="text/javascript">
function del(id) {
	$.get("<%=basePath%>user/delUser?id=" + id, function(data) {
			if ("success" == data.result) {
				alert("删除成功");
				window.location.reload();
			} else {
				alert("删除失败");
			}
		});
	}
	
$(function() {

	var $table = $("table");

	var currentPage = 1;

	var pageSize = 3;

	var sumRows = $table.find("tbody tr").length;

	var sumPages = Math.ceil(sumRows/pageSize);

	init();

	paging(currentPage)

	$("#prev").click(function(){

	currentPage--;

	init();

	paging(currentPage);

	})

	$("#next").click(function(){

	currentPage++;

	init();

	paging(currentPage);

	})

	var $page = $("<div class='page'></div>");

	for(var pageIndex=1;pageIndex<=sumPages;pageIndex++){

	$("<a href='#'><span>["+(pageIndex)+"]</span></a>").bind("click",{"newPage":pageIndex},function(event){

	currentPage=event.data["newPage"];

	init();

	paging(currentPage);

	}).appendTo($page);

	}

	$page.insertAfter($table);

	function paging(currentPage){

	$table.find("tbody tr:not(.prevnext)").hide().slice((currentPage-1)*pageSize,(currentPage)*pageSize).show();

	$("#currentPage").val(currentPage+1);

	$("#currentPage").text(currentPage);

	$("#sumPages").text(sumPages);

	}

	function init(){

	if(currentPage==1){

	$("#prev").attr({"disabled":"disabled"});

	}else{

	$("#prev").removeAttr("disabled");

	}

	if(currentPage==sumPages){

	$("#next").attr({"disabled":"disabled"});

	}else{

	$("#next").removeAttr("disabled");

	}

	}

	})
</script>
</head>

<body>
	<h6>
		<a href="<%=basePath%>user/toAddUser">添加用户</a>
	</h6>
	<table border="1">
		<tbody>
			<tr>
				<th>姓名</th>
				<th>年龄</th>
				<th>操作</th>
			</tr>
			<c:if test="${!empty pageTableForm.userList }">
				<c:forEach items="${pageTableForm.userList}" var="user">
					<tr>
						<td>${user.userName }</td>
						<td>${user.age }</td>
						<td><a href="<%=basePath%>user/getUser?id=${user.id}">编辑</a>
							<a href="javascript:del('${user.id }')">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>