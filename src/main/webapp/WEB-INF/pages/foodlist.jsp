<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.bishe.model.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食品列表</title>
<link rel="stylesheet" type="text/css" href="js/paging/css/cPager.css">
<link rel="stylesheet" type="text/css"
	href="js/showlist/css/component.css">
<link rel="stylesheet" type="text/css"
	href="js/showlist/css/default.css">

<script type="text/javascript" src="jq/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/paging/js/cPager.js"></script>
<script type="text/javascript" src="js/paging/js/template.js"></script>

<script type="text/javascript" src="js/showlist/js/cbpViewModeSwitch.js"></script>
<script type="text/javascript" src="js/showlist/js/classie.js"></script>
<script type="text/javascript" src="js/showlist/js/modernizr.custom.js"></script>

<script type="text/javascript" src="js/layer-v3.1.1/layer/layer.js"></script>

<style type="text/css">
#alterfood {
	position: absolute;
	top: 50;
	z-index: 10;
}

#div-foodtype{
float:left;
}
</style>

</head>
<body>

    <%
	    LinkedList<String> foodtype = (LinkedList<String>) session.getAttribute("foodtype");
	%>

	<div class="container" style="position: relative">
		<!--容器-->
		<div id="foodList">
			<ul id="listShow"></ul>
		</div>
		<!--分页容器-->
		<div class="turn-page" id="pager"></div>
		<!--模板-->
		<textarea id="listTemplate" style="display: none;">
		
         <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
    <div class="cbp-vm-options">
        <div id="div-foodtype">
        <form id="foodtype" action="foodlistpage" method="post">
            <select name="foodtype">
                <option id="全部" value="全部">全部</option>
                <c:forEach items="${foodtype}" var="foodtp">
				    <option id=${foodtp } value=${foodtp }>${foodtp}</option>
			    </c:forEach>
            </select>
            <button type="submit" class="btn">查询</button>
        </form>
        </div>
        <a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected"
						data-view="cbp-vm-view-grid">Grid View</a>
        <a href="#" class="cbp-vm-icon cbp-vm-list"
						data-view="cbp-vm-view-list">List View</a>
    </div>
    <ul>
    <c:forEach items="${foodlist}" var="food">
        <li class="li-item hide">
            <a class="cbp-vm-image" href="#"><img
								src="${food.getfood_img()}"></a>
            <h3 class="cbp-vm-title">${food.getfood_name()}</h3>
            <div class="cbp-vm-price">￥${food.getfood_price()}</div>
            <div id="foodid" style="display: none;">${food.getfood_id()}</div>
            <div class="cbp-vm-details">
                                                               介绍
            </div>
            <a name="alter-food" class="cbp-vm-icon cbp-vm-add"
							foodid="${food.getfood_id()}" imgpath="${food.getfood_img()}">编辑</a>
        </li>
      </c:forEach>
    </ul>
</div>

         </textarea>


	</div>
	<div id="alterfood" style="display: none;">
		<form action="food/alterfood" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="primalfoodid" name="primalfoodid"> <input
				type="hidden" id="primalimgpath" name="primalimgpath"> 食物id<input
				type="text" name="food_id" placeholder="食物id..." id="food_id">
			食物名称<input type="text" name="food_name" placeholder="食物名称..."
				id="food_name"> 食物价格<input type="text" name="food_price"
				placeholder="食物价格..." id="food_price"> 食物照片<input
				type="file" id="img" name="img">
			<button type="submit" class="btn">修改</button>
		</form>
	</div>

	<script type="text/javascript">
		//渲染模板
		$("#listShow").html(TrimPath.processDOMTemplate("listTemplate"));
		$(this).cPager({
			pageSize : 9, //每一页显示的记录条数
			pageid : "pager", //分页容器ID
			itemClass : "li-item", //个体元素名称
			pageIndex : 1
		//当前页面的索引
		});
	</script>

	<script type="text/javascript">
		(function() {
			var container = document.getElementById('cbp-vm'), optionSwitch = Array.prototype.slice
					.call(container.querySelectorAll('div.cbp-vm-options > a'));
			function init() {
				optionSwitch.forEach(function(el, i) {
					el.addEventListener('click', function(ev) {
						ev.preventDefault();
						_switch(this);
					}, false);
				});
			}
			function _switch(opt) {
				// remove other view classes and any any selected option
				optionSwitch.forEach(function(el) {
					classie.remove(container, el.getAttribute('data-view'));
					classie.remove(el, 'cbp-vm-selected');
				});
				// add the view class for this option
				classie.add(container, opt.getAttribute('data-view'));
				// this option stays selected
				classie.add(opt, 'cbp-vm-selected');
			}
			init();
		})();
	</script>

	<script type="text/javascript">
		//弹出一个页面层
		$("a[name='alter-food']").on('click', function() {
			var foodid = $(this).attr('foodid');
			var a = document.getElementById("primalfoodid");
			a.value = foodid;
			var imgpath = $(this).attr('imgpath');
			var b = document.getElementById("primalimgpath");
			b.value = imgpath;
			layer.open({
				type : 1,
				area : [ '600px', '360px' ],
				shadeClose : true, //点击遮罩关闭
				content : $('#alterfood')
			});
		});
	</script>
	
	<!-- 
	<script type="text/javascript">
	    //通过食品类型进行分类展示
	    function select(){
	    	var foodtype = $(this).attr("value");
	    	console.log(foodtype);
	    	var params = {};
			params.foodtype = foodtype;
	    	
	    	$.ajax({
				async : false,
				type : "POST",
				url : "foodlistpage",//注意路径  
				data : params,
				dataType : "json",
				/*success : function(data) {
					if (data.result == '添加成功') {
						alert("添加成功");
					} else {
						alert("添加失败，该食品类型已存在");
					}
				},
				error : function(data) {
					alert(data.result);
				}*/
				success : function(date){
					//console.log(date);
				},
				error : function(data) {
					alert(data.result);
				}
			});
	    }
	</script>
    -->

</body>
</html>