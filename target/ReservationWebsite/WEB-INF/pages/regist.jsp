<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家注册</title>

<link rel="stylesheet" type="text/css"
	href="js/biaodan/css/_floating-form-labels.css">
<script type="text/javascript" src="jq/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="js/biaodan/js/floatingFormLabels.min.js"></script>

<style>
body {
	background-image: url('img/zhupa.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>

<div class="container">

		<form action="regist" method="post">
			<div class="ffl-wrapper">
				<label for="name" class="ffl-label">Name</label> <input type="text"
					id="user_name" name="user_name">
			</div>
			<div class="ffl-wrapper">
				<label for="password" class="ffl-label">Password</label> <input
					type="password" id="user_password" name="user_password">
			</div>
			<div class="ffl-wrapper">
				<label for="address" class="ffl-label">Address</label> <input type="text"
					id="user_address" name="user_address">
			</div>
			<div class="ffl-wrapper">
				<label for="email" class="ffl-label">Email </label> <input type="text"
					id="user_email" name="user_email">
			</div>
			<button type="submit">Sign In</button>
		</form>

	</div>




	<script type="text/javascript">
		$('.ffl-wrapper').floatingFormLabels();
	</script>
	
</body>
</html>