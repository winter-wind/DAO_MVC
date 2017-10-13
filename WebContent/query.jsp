<%@page import="com.isooou.mvcapp.domain.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<form action = "query.isooou" method = "post">
		<table>
			<tr>
				<td>CustomerName:</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address"/></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><input type="text" name="phone"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Query"/></td>
				<td><a href = "adds.jsp">Add New Customer</a></td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<%
															//此参数与FristServlet.java中的setAttribute方法一致
		List<Customer> customers = (List<Customer>)request.getAttribute("customers");
		if(customers != null && customers.size() > 0){
			
	%>
	<hr>
	<br><br>
	
		 <!--表格边框宽度       规定单元边沿与其内容之间的空白   规定单元格之间的空白  -->
		<table border="2" cellpadding="3" cellspacing="0">
			<tr><!-- 表头 -->
				<th>ID</th>
				<th>CustomerName</th>
				<th>Address</th>
				<th>phone</th>
				<th>UPDATE\DELETE</th>
			</tr>
			
			<%
				for(Customer customer: customers){
			%>
			<tr><!-- 表内容 -->
				<td><%= customer.getId() %></td>
				<td><%= customer.getName() %></td>
				<td><%= customer.getAddress() %></td>
				<td><%= customer.getPhone() %></td>
				<td>
											<!-- 通过id修改一条数据 -->
					<a href="edit.isooou?id=<%= customer.getId() %>">UPDATE</a>
											<!-- 通过id删除一条数据 -->
					<a href="delete.isooou?id=<%= customer.getId() %>">DELETE</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	<%
		}
	%>
</body>
</html>