<%@page import="com.isooou.mvcapp.domain.Customer"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<% Object msg = request.getAttribute("message"); 
	if(msg != null){
%>
	<br>
	<font color="red"><%= msg %></font>
	<br>
	<br>
	<% 
	}
	
	String id = null;
	String oldname = null;
	String name = null;
	String address = null;
	String phone = null;
	
	Customer customer = (Customer)request.getAttribute("customer");//为什么要强转
	//因为这里获取的是对象                                而这里获取的是属性值
	

	if(customer != null){//如果customer不是空，获取数据库的内容
		id = customer.getId()+"";
		oldname = customer.getName();
		name = customer.getName();
		address = customer.getAddress();
		phone = customer.getPhone();

	}else{//如果是空获取表单上提交之前的值
		id = request.getParameter("id");
		oldname = request.getParameter("oldname");
		name = request.getParameter("oldname");//当name被占用后，不修改name,修改别的数据,这样会提交到数据库。
		address = request.getParameter("address");
		phone = request.getParameter("phone");
	}
%>

<form action = "update.isooou" method = "post">

	<!-- 二个隐藏域 -->
	<input type="hidden" name="id" value="<%= id%>"/>
	<input type="hidden" name="oldname" value="<%= oldname%>"/>
	
		<table>
			<tr>
				<td>CustomerName:</td>
				<td><input type="text" name="name" value="<%= name %>"/></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address" value="<%= address %>"/></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><input type="text" name="phone" value="<%= phone %>"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="submit"/></td>
				<td><a href = "index.jsp">return...</a></td>
			</tr>
		</table>
	</form>

</body>
</html>