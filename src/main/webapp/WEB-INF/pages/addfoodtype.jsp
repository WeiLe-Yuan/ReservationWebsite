<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加食品类型</title>

<!-- css -->
<link rel="stylesheet"
	href="../js/form-1/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../js/form-1/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../js/form-1/assets/css/form-elements.css">
<link rel="stylesheet" href="../js/form-1/assets/css/style.css">

<!-- Javascript -->
<script src="../js/form-1/assets/js/jquery-1.11.1.min.js"></script>
<script src="../js/form-1/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../js/form-1/assets/js/jquery.backstretch.min.js"></script>
<script src="../js/form-1/assets/js/retina-1.1.0.min.js"></script>
<script src="../js/form-1/assets/js/scripts.js"></script>

<style type="text/css">
body {
	background-color: #2a2a47;
}
</style>

</head>
<body>
	<div class="col-md-8 col-md-offset-2 form-box">
		<div class="form-top">
			<div class="form-top-left">
				<h3>添加食物类型</h3>
				<p>请准确的填写食物相关信息</p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>
		<div class="form-bottom">

			<form role="form" action="addfoodtype" method="post"
				class="registration-form" enctype="multipart/form-data">
				<div class="form-group">
					<label class="sr-only" for="form-first-name">食物类型名称 </label> <input
						type="text" name="foodtypename" placeholder="食物类型名称..."
						class="form-first-name form-control" id="foodtypename">
				</div>

			</form>
			<button id="addfoodtype" type="submit" class="btn">添加</button>
		</div>
	</div>

	<script type="text/javascript">
		$("#addfoodtype").on('click', function() {
			var foodtype = document.getElementById('foodtypename').value;
			var params = {};
			params.foodtype = foodtype;

			$.ajax({
				async : false,
				type : "POST",
				url : "addfoodtype",//注意路径  
				data : params,
				dataType : "json",
				success : function(data) {
					if (data.result == '添加成功') {
						alert("添加成功");
					} else {
						alert("添加失败，该食品类型已存在");
					}
				},
				error : function(data) {
					alert(data.result);
				}
			});

		});
	</script>

</body>
</html>