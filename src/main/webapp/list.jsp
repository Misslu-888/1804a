<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String path=request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="<%=path%>/css/index_work.css"/> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.js"></script>
</head>
<body>
	<table>
		<tr>
			<td>序号</td>
			<td>会议编号</td>
			<td>会议名称</td>
			<td>开始日期</td>
			<td>结束日期</td>
			<td>会议类型</td>
			<td>创建时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="l">
			<tr>
				<td>${l.id }</td>
				<td>${l.code }</td>
				<td>${l.name }</td>
				<td>${l.start_time }</td>
				<td>${l.end_time }</td>
				<td>${l.tname }</td>
				<td>${l.create_time }</td>
				<td>
					<a href="queryHui?id=${id }">
						<input type="button" value="编辑" onclick="update()">
					</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="11">
				<a href="add.jsp?id=${id }">
					<input type="button" value="新增">
				</a>
				<a href="?pageNum=1">首页</a>
				<a href="?pageNum=${page.pageNum-1<1?page.pageNum:page.pageNum-1}">上一页</a>
				<c:forEach begin="1" end="${page.pages }" step="1" var="num">
					<a href="?pageNum=${num}">${num }</a>
				</c:forEach>
				<a href="?pageNum=${page.pageNum+1>page.pages?page.pageNum:page.pageNum+1}">下一页</a>
				<a href="?pageNum=${page.pages}">尾页</a>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">

</script>
</html>