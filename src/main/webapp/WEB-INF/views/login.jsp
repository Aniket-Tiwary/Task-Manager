<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
			  <meta name="viewport" content="width=device-width, initial-scale=1.0">
			  <meta http-equiv="X-UA-Compatible" content="ie=edge">
			  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
			    crossorigin="anonymous">
		<title>Login page</title>
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
		                    <a class="nav-link" href="/login">Signin</a>
		                </li>
		                <!-- <li class="nav-item">
		                    <a class="nav-link" href="#">Contact</a>
		                </li> -->
		            </ul>
		        </div>
		    </nav>
		 </header>
		 <div class="container m-60">
			<form action="generateOtp" method="POST">
				<div class="form-group">
	                	<label>Email address</label>
	                <input class="form-control form-control-lg" type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Enter email" required>
	            </div>
				<div class="form-group">
	                	<label>Password</label>
	                	<input class="form-control" type="password" name="password" placeholder="Password" required>
	            </div>
	            <p class="text-uppercase text-success font-weight-bold">${message}</p>
	            <button class="btn btn-primary btn-block" type="submit">Submit</button>
			</form>
		</div>
	</body>
</html>