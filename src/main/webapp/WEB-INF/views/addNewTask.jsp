<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="webjars/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
		<title>Add New Task</title>
	</head>
	<body>
		<%String email=(String)request.getAttribute("email");%>
		<%--<h1> Email we got is <%= email %> </h1> --%>
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
		<div class="container m-30">
			<form action="/newTask" method="POST">
				<div><input type = "hidden" name = "email" value="<%= email %>" /></div>
				<div class="form-group">
                	<label>Task Name</label>
                	<input class="form-control" type="text" name="taskName" placeholder="Enter Task Name" required>
            	</div>
            	<div class="form-group">
                	<label>Task Description</label>
                	<input class="form-control" type="text" name="taskDescription" placeholder="Enter Task Description" required>
            	</div>
            	<div class="form-group">
                	<label for="example-date-input" >Enter Completion Date</label>
					<input class="form-control" type="date" value="2021-03-24" id="example-date-input" name="taskDate">
            	</div>
            	<div class="text-center">
            		<button class="btn btn-success" type="submit">Add Task</button>
            	</div>
			</form>
		</div>
	</body>
</html>