<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加食品</title>
<style type="text/css">
#preview{
width:120px;
height:80px;
border:0px;
}

#preview img{
width:100%;
height:100%;
}
</style>
</head>
<body>
<form action="addfood" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_id" value=${user_id }>
输入食物id
<input type="text" name="food_id">
输入食物名称
<input type="text" name="food_name">
输入食物价格
<input type="text" name="food_price">
输入食物照片
<div id="preview"></div> 
<input type="file" id="img" name="img" onchange="preview(this)">
<button>提交</button>
</form>


<script type="text/javascript">      
        function preview(file){    
            var prevDiv = document.getElementById('preview');    
            if (file.files && file.files[0]){    
                var reader = new FileReader();    
                reader.onload = function(evt){    
                    prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';    
                }      
                reader.readAsDataURL(file.files[0]);    
            }else{    
                prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';    
            }    
        }    
    </script>

</body>

</html>