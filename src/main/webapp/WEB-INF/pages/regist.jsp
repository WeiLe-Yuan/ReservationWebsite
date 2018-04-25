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

		<form action="regist" method="post" onsubmit="return regist();">
			<div class="ffl-wrapper">
				<label for="name" class="ffl-label">Name</label> <input type="text"
					id="user_name" name="user_name">
			</div>
			<div class="ffl-wrapper">
				<label for="password" class="ffl-label">Password</label> <input
					type="password" id="user_password" name="user_password">
			</div>
			<div class="ffl-wrapper">
				<label for="address" class="ffl-label">Address</label> <input
					type="text" id="user_address" name="user_address">
			</div>
			<div class="ffl-wrapper">
				<label for="email" class="ffl-label">Email </label> <input
					type="text" id="user_email" name="user_email">
			</div>
			<button type="submit">Sign In</button>
			<a href="index.jsp">返回登陆</a>
		</form>

	</div>




	<script type="text/javascript">
		$('.ffl-wrapper').floatingFormLabels();
	</script>

	<script type="text/javascript">
	    function regist() {
	    // console.info("点击了登录");
	    var userName = $("#user_name").val();
	    // console.info(userName)
	    var userPass = $("#user_password").val();
	    // console.info(userPass);
	    var userAddress = $("#user_address").val();
	    var userEmail = $("#user_email").val();
	    
	    if (userName == "" || userName == null) {
	        alert("用户名不能为空");
	        return false;
	    } else if (userPass == "" || userPass == null) {
	        alert("密码不能为空");
	        return false;
	    } else if (userAddress == "" || userAddress == null) {
	        alert("地址不能为空");
	        return false;
	    } else if (userEmail == "" || userEmail == null) {
	        alert("邮箱地址不能为空");
	        return false;
	    } else {
	        return true;
	    }
	}
	</script>

</body>
</html>