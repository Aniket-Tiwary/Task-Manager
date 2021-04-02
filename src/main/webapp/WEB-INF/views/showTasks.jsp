 <%@page import="com.example.taskmanager.bean.Tasks" %>
<%@page import="java.util.*" %>
<html>
 	<head>
 		<meta charset="UTF-8">
 		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
 		<link href="/css/styles.css rel="stylesheet">
 		<title>Home</title>
 	</head>
	<body>
		<%String email=(String)request.getAttribute("aaa");%>
		<%-- <h1> Email we got is <%= email %> </h1> --%>
		<header>
			<nav class="navbar navbar-static-top navbar-expand-sm navbar-dark bg-dark mb-3">
		        <div class="container">
		            <a class="navbar-brand" href="#">Task Manager</a>
		            <ul class="navbar-nav">
		                <!-- <li class="nav-item">
		                    <a class="nav-link" href="#">Home</a>
		                </li> -->
		               <!--  <li class="nav-item">Log out</a>
		                </li> -->
		                <li class="nav-item">
		                    <a class="nav-link" href="/login">Logout</a>
		                </li>
		                <!-- <li class="nav-item">
		                    <a class="nav-link" href="#">Contact</a>
		                </li> -->
		            </ul>
		        </div>
		    </nav>
	    </header>
		<br><br>
		<div class="text-center">
			<form action="/addNewTask">
				<input type = "hidden" name = "email" value="<%= email %>" />
				<button class="btn btn-success" type="submit">Add new Task</button>
			</form>
		</div>
		<br><br>
		<div data-spy="scroll" class="container m-60">
		    <table class="table table-hover table-bordered">
		    	<thead>
	                <tr class="bg-primary">
	                    <th class="text-center">Task Name</th>
	                    <th class="text-center">Task Description</th>
	                    <th class="text-center">Completion Date</th>
	                    <th class="text-center">Actions</th>
	                </tr>
                </thead>
	            <tbody>
	                <% ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks"); %>
	                <%for(Tasks task : tasks)
	                	{                	
	                %>
	                <tr>
	                	<%-- <td><%= task.getID() %></td> --%>
	                	<td><%= task.getTaskName() %></td>
	                	<td><%= task.getTaskDescription() %></td>
	                	<td><%= task.getTaskDate() %></td>
	             		<td class="float-center">
	             			<form action="updateTask" method="post">
	             			 	<input type = "hidden" name = "taskId" value="<%= task.getTaskId() %>" />
	             			 	<input type = "hidden" name = "email" value="<%= task.getEmail() %>" />
	             				<input type = "hidden" name = "taskName" value="<%= task.getTaskName() %>" />
	             				<input type = "hidden" name = "taskDescription" value="<%= task.getTaskDescription() %>" />
	             				<input type = "hidden" name = "taskDate" value="<%= task.getTaskDate() %>" />
	             				<button class="btn btn-sm btn-primary" type="submit">Update Task</button>
	             			</form>
	             			<form action="deleteTask" method="post">
	             				<input type = "hidden" name = "taskId" value="<%= task.getTaskId() %>" />
	             			 	<input type = "hidden" name = "email" value="<%= task.getEmail() %>" />
	             				<input type = "hidden" name = "taskName" value="<%= task.getTaskName() %>" />
	             				<input type = "hidden" name = "taskDescription" value="<%= task.getTaskDescription() %>" />
	             				<input type = "hidden" name = "taskDate" value="<%= task.getTaskDate() %>" />
	             				<button class="btn btn-sm btn-danger" type="submit">Delete Task</button>
	             			</form>
	             		</td>
	             	</tr>
	             	<% } %>
	            </tbody>
	        </table>
        </div>
		<%-- <%
		ArrayList<Tasks> tasks=(ArrayList<Tasks>)request.getAttribute("tasks");
		%> --%>
		<!-- <table border="4">
		<tr><th>Task </th><th>Description</th><th>Completed</th></tr> -->
		<%-- <%
		for(Tasks task:tasks)
		{
		%>
		<tr><td><%=task.getTaskName() %></td><td><%=task.getTaskDescription() %></td><td><%=task.isTaskStatus() %></td></tr>
		<%} %> --%>
		</table> 
	</body>
</html>