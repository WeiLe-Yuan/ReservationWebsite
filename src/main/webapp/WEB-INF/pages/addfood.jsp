<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bishe.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加食品</title>

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

#preview {
	width: 120px;
	height: 80px;
	border: 0px;
}

#preview img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<!-- <form id="addfoodform" action="addfood" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="user_id" value=${user_id }> 输入食物id
		<input type="text" name="food_id"> 输入食物名称 <input type="text"
			name="food_name"> 输入食物价格 <input type="text" name="food_price">
		输入食物照片
		<div id="preview"></div>
		<input type="file" id="img" name="img" onchange="preview(this)">
		<button>提交</button>
	</form>-->
	<div class="col-md-8 col-md-offset-2 form-box">
		<div class="form-top">
			<div class="form-top-left">
				<h3>添加食物信息</h3>
				<p>请准确的填写食物相关信息</p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>
		<div class="form-bottom">

			<form role="form" action="addfood" method="post"
				class="registration-form" enctype="multipart/form-data">
				<%
					User user = (User) session.getAttribute("user");
					int user_id = user.getuser_id();
					LinkedList<String> foodtype = (LinkedList<String>) session.getAttribute("foodtype");
				%>
				<input type="hidden" name="user_id" value=<%=user_id%>>
				<div class="form-group">
					<label class="sr-only" for="form-food-id">食物id</label> <input
						type="text" name="food_id" placeholder="食物id..."
						class="form-first-name form-control" id="food_id">
				</div>
				<div class="form-group">
					<label class="sr-only" for="form-food-name">食物名称</label> <input
						type="text" name="food_name" placeholder="食物名称..."
						class="form-last-name form-control" id="food_name">
				</div>
				<div class="form-group">
					<label class="sr-only" for="form-food-price">食物价格</label> <input
						type="text" name="food_price" placeholder="食物价格..."
						class="form-last-name form-control" id="food_price">
				</div>
				<div class="form-group">
					<label class="sr-only" for="form-food-img">食物照片</label>
					<div id="preview"></div>
					<input type="file" id="img" name="img" onchange="preview(this)">
				</div>
				<div class="form-group">
					<label class="sr-only" for="form-food-type">食物类型</label> 
					<select
						name="food_type" class="form-last-name form-control"
						id="food_type">
						<c:forEach items="${foodtype}" var="foodtp">
							<option value=${foodtp }>${foodtp}</option>
						</c:forEach>
					</select>
				</div>

				<button type="submit" class="btn">添加</button>
			</form>
		</div>
	</div>




	<script type="text/javascript">
		function preview(file) {
			var prevDiv = document.getElementById('preview');
			if (file.files && file.files[0]) {
				var reader = new FileReader();
				reader.onload = function(evt) {
					prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
				}
				reader.readAsDataURL(file.files[0]);
			} else {
				prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
			}
		}
	</script>
	<!-- <script type="text/javascript">
		$("#submitAdd").click(function() {
			var targetUrl = $("#addfoodform").attr("action");
			var data = new FormData($("#addfoodform")[0]);
			$.ajax({
				type : 'post',
				url : targetUrl,
				cache : false, //上传文件不需缓存
				processData : false, //需设置为false。因为data值是FormData对象，不需要对数据做处理
				contentType : "application/json", //需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
				data : data,
				dataType : 'json',
				success : function(data) {
					alert('success');
				},
				error : function() {
					alert("请求失败")
				}
			})

		})
	</script> -->

</body>

</html>