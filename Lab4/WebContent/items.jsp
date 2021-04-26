<%@page import="com.Item"%>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	//Insert Item-----------------
	if (request.getParameter("itemCode") != null) {
		Item itemObj = new Item();
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),
				request.getParameter("itemPrice"), request.getParameter("itemDesc"));
		session.setAttribute("statusMsg", stsMsg);
	}

	//Delete Item------------------
	if (request.getParameter("itemID") != null) {
		Item itemObj = new Item();
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<div class="container">
	<div class="row">
		<div class="col">
			<body>
				<h1>Items Management</h1>
				<form method="post" action="items.jsp">
					Item code: <input name="itemCode" type="text"><br>
					Item name: <input name="itemName" type="text"><br>
					Item price: <input name="itemPrice" type="text"><br>
					Item description: <input name="itemDesc" type="text"><br>
					<input name="btnSubmit" type="submit" value="Save"
						class="btn btn-primary">
				</form>
				<div class="alert alert-success">
					<%
						out.print(session.getAttribute("statusMsg"));
					%>
				</div>
				<br>
				<%
					Item itemObj = new Item();
					out.print(itemObj.readItems());
				%>
			</body>
		</div>
	</div>
</div>
</html>