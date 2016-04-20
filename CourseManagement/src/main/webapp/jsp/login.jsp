<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery/jquery-1.12.3.min.js"></script>

<style type="text/css"> 
      body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
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
        <label for="inputEmail" class="sr-only"></label>
        <input type="text" id="inputEmail" class="form-control" placeholder="请输入用户名" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="请输入密码" required>
        <button class="btn btn-large btn-primary btn-block" type="button" onclick="login()">登录</button>
        <div id="alertBox" class="alert alert-danger">
                            用户名/密码错误，请重试
        </div>
      </form>

    </div>

</body>
</html>