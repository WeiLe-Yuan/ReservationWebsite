<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎页</title>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="jq/bootstrap-3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="js/navbar/fonts/iconfont.css">
<link rel="stylesheet" type="text/css" href="js/navbar/css/nav.css">
<script type="text/javascript" src="jq/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/navbar/js/nav.js"></script>

<style>
.right-iframe {
	top: 0;
	left: 250px;
	width: 1000px;
	min-height: 450px;
	bottom: 0;
	position: absolute;
}

.iframe {
	overflow: hidden;
}
</style>
</head>

<body>

	<div class="html-container">

		<div class="nav">
			<div class="nav-top">
				<div id="mini"
					style="border-bottom: 1px solid rgba(255, 255, 255, .1)">
					<img src="js/navbar/images/mini.png">
				</div>
			</div>
			<ul>
				<li class="nav-item"><a href="javascript:;"><i
						class="my-icon nav-icon icon_1"></i><span id="userid">${user.getuser_id()}</span><span id="username">${user.getuser_name()}</span><i
						class="my-icon nav-more"></i></a>
					</li>
				<li class="nav-item"><a href="javascript:;"><i
						class="my-icon nav-icon icon_1"></i><span>销售情况</span><i
						class="my-icon nav-more"></i></a>
					<ul>
						<li><a class="menu-item" href="javascript:;"
							data-href="a.html"><span>热销食品</span></a></li>
						<li><a class="menu-item" href="javascript:;"
							data-href="b.html"><span>销量统计</span></a></li>
						<li><a class="menu-item" href="javascript:;"
							data-href="test"><span>分类管理</span></a></li>
					</ul></li>
				<li class="nav-item"><a href="javascript:;"><i
						class="my-icon nav-icon icon_2"></i><span>食品管理</span><i
						class="my-icon nav-more"></i></a>
					<ul>
						<li><a href="javascript:;"><span>食品列表</span></a></li>
						<li><a class="menu-item" href="javascript:;"
						    data-href="addfood/addfoodpage"><span>添加食品</span></a></li>
						<li><a class="menu-item" href="javascript:;"
						    data-href="addfood/deletefoodpage"><span>修改食品</span></a></li>
					</ul></li>
				<li class="nav-item"><a href="javascript:;"><i
						class="my-icon nav-icon icon_3"></i><span>订单管理</span><i
						class="my-icon nav-more"></i></a>
					<ul>
						<li><a href="javascript:;"><span>订单列表</span></a></li>
						<li><a href="javascript:;"><span>打个酱油</span></a></li>
						<li><a href="javascript:;"><span>也打酱油</span></a></li>
					</ul></li>
			</ul>
		</div>



		<div class="right-iframe">
			<iframe id="content" src='welcome.html' width="100%" height="100%"
				frameborder="0" scrolling="auto"></iframe>
		</div>

	</div>


	<script type="text/javascript">
		$(".menu-item").click(function() {
			var url = $(this).data("href");
			var userid = document.getElementById("userid").innerHTML;
			var username = document.getElementById("username").innerHTML;
			$('iframe#content', parent.document.body).attr("src", url+"?userid="+userid+"&username="+username);
		});
	</script>


</body>

</html>