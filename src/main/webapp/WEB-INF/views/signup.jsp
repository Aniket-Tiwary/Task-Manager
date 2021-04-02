	<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 --%>
 <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <link href="webjars/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
		<title>Sign up page</title>
	</head>
	<body>
		<header>
			<nav class="navbar navbar-static-top navbar-expand-sm navbar-dark bg-dark mb-3">
		        <div class="container">
		            <a class="navbar-brand" href="/login">Task Manager</a>
		            <ul class="navbar-nav">
		                <!-- <li class="nav-item">
		                    <a class="nav-link" href="#">Home</a>
		                </li> -->
		                <li class="nav-item">
		                    <a class="nav-link" href="/signup">Register</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link" href="/login">Log in</a>
		                </li>
		                <!-- <li class="nav-item">
		                    <a class="nav-link" href="#">Contact</a>
		                </li> -->
		            </ul>
		        </div>
		    </nav>
	    </header>
		<div class="container m-30" >
			<form action="registered" method="POST">
				<div class="form-group">
                	<label>User Name</label>
                	<input class="form-control" type="text" name="userName" placeholder="Enter Username" required>
            	</div>
            	<div class="row">
	            	<div class="form-group col">
	                	<label>First Name</label>
	                	<input class="form-control" type="text" name="firstName" placeholder="Enter Firstname" required>
	            	</div>
	            	<div class="form-group col">
	                	<label>Last Name</label>
	                	<input class="form-control" type="text" name="lastName" placeholder="Enter Lastname" required>
	            	</div>
	            </div>
            	<div class="form-group">
	                <label>Email address</label>
	                <input class="form-control form-control-lg" type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Enter email" required>
	                <small class="form-text text-muted">Your email will not ever be shared</small>
	            </div>
	            <div class="form-group">
                	<label>Password</label>
                	<input class="form-control" type="password" name="password" placeholder="Password" required>
            	</div>
				<div class="form-group">
                	<label>Gender</label>
                	<select class="form-control" name="gender" required>
                    	<option>Male</option>
                    	<option>Female</option>
                    	<option>Others</option>
                	</select>
            	</div>
				<p class="text-uppercase text-danger font-weight-bold">${message}</p>
				<button class="btn btn-primary btn-block" type="submit">Submit</button>
			</form>
		</div>
		
		<script type="text/javascript" src="/js/passwordVeri.js"></script>
		<script src="webjars/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<!-- <script type="text/javascript" src="test.js"></script> -->
		<!-- <script src="../../resources/templates/js/password-veri.js"  type="text/javascript"></script> -->
		<!-- <script src="test.js" type="text/javascript"></script> -->
	</body>
</html>