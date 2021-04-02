<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
			  <meta http-equiv="X-UA-Compatible" content="ie=edge">
			  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
			    crossorigin="anonymous">
		<title>Validate OTP page</title>
		<style>
			.login-form {
			    width: 340px;
			    margin: 50px auto;
			  	font-size: 15px;
			}
		</style>
	</head>
	<body>
		<div class="login-form">
			<div class="text-center">
				<h2>OTP - validate your OTP</h2>
				<p class="text-sm-center">An OTP was sent to your Email please enter to continue</p>
			</div>
			 <% String email= (String)request.getAttribute("aaa");%>
			 <form  action="validateOtp" method="POST">
				<div class="col-xs-3">
				    <input type="text" name="otpnum" id="otpnum" class="form-control input-lg"
				           required="true" autofocus="true"/>
				</div>
				<div class="form-group">
				    <input type="hidden" name="email" value= "<%= email %>" />
				</div>
				<div class="col-xs-3">
				    <p>${message}</p>
				    <input type="submit" class="btn btn-success btn-lg btn-primary btn-block" value="Submit"/>
				</div>
			</form>
		</div>
	</body>
</html>