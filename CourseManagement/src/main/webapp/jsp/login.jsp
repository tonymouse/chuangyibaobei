<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../js/bootstrap/css/bootstrap.css" rel="stylesheet">

<script src="../js/jquery/jquery-1.12.3.min.js"></script>

<style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>

<script type="text/javascript">
$( function(){
	
	$('#alertBox').hide();
	
} );

        function login() {        	
            $.ajax({
            	url: 'login',
            	type: 'POST',
            	data: {'username':$('input[type=text]').val(),'password':$('input[type=password]').val()},
            	datatype: 'json',
                success: function(data){
                	if(data.msg=='failed'){
                	$('input[type=text]').val('');
                	$('input[type=password]').val('');
                	$('#alertBox').show();
                	}else{
                		location.href='/index';
                	}
                }
            });
        }
</script>

<title>登录</title>
</head>
<body>
<div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">请登录</h2>
        <input type="text" class="input-block-level" placeholder="请输入用户名">
        <input type="password" class="input-block-level" placeholder="请输入密码">
        <button class="btn btn-large btn-primary" type="button" onclick="login()">登录</button>
        <div id="alertBox" class="alert alert-error">
                            用户名/密码错误，请重试
        </div>
      </form>

    </div>

</body>
</html>