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
	<form action="#">
		会议编号：<input type="text" name="code"><br>
		会议名称：<input type="text" name="name"><br>
		会议日期：<input type="text" name="start_time">-<input type="text" name="end_time"><br>
		会议地址：<select name="${tid }" id="${tid }"><br>
			<option value="">请选择</option>
		</select><br>
		<input type="button" value="保存"onclick="add()">
	</form>
</body>
<script type="text/javascript">
	$.post("finXL",function(data){
		var str = '';
		for(var i in data){
			str+="<option value='"data[i].tid+"'>"+data[i].tname+"</option>";
		}
		$("#tid").append(str);
		$("#tid").val("${param.tid}");
	})
	function add() {
		$.post("add",$("form").serialize(),function(data){
			if(data){
				alert("添加成功");
				location.href="list";
			}else{
				alert("添加失败");
			}
		})
	}
</script>
</html>