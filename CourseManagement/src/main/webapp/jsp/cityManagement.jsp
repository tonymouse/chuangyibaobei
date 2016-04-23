<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">


$('#cityModal').on('show.bs.modal', function (event) {
	$('#errorBox').hide();
	$('#successBox').hide();
	  var button = $(event.relatedTarget); // Button that triggered the modal
	  var cityName = button.data('cityname'); // Extract info from data-* attributes
	  var cityId = button.data('cityid');	  
	  var modal = $(this);
	  if(cityName == null||cityName==''){
	  	modal.find('.modal-title').text('添加城市');
	  	console.log();
	  	modal.find('.modal-footer button .btn-primary').html('添加');
	  }else{
		modal.find('.modal-title').text('修改城市'); 
		modal.find('.modal-footer button .btn-primary').html('修改');
	  }
	  modal.find('#cityName').val(cityName);
	  modal.find('#hiddenCityName').val(cityName);
	  modal.find('#cityId').val(cityId);
	});

function editCity() {
	var editCityName = $('#cityModal').find('#cityName').val();
	var previousCityName = $('#cityModal').find('#hiddenCityName').val();
	var editCityId = $('#cityModal').find('#cityId').val();
	if(typeof(editCityName) == 'undefined' || editCityName== null|| editCityName==''){
		$('#cityModal').modal('hide');
		$('#successBox').hide();
		$('#errorBox').html('请输入需要添加或修改的城市名称');
		$('#errorBox').show();
		$('#alertModal').modal('show');
		setTimeout(function(){$("#alertModal").modal("hide");},2000);
	}else if(editCityName == previousCityName){
		$('#cityModal').modal('hide');
		$('#successBox').hide();
		$('#errorBox').html('修改的城市名称相同');
		$('#errorBox').show();
		$('#alertModal').modal('show');
		setTimeout(function(){$("#alertModal").modal("hide");},2000);
		}else{
			console.log(editCityName);
		$.ajax({
	    	url: '/system/cityManagement/saveCity',
	    	type: 'POST',
	    	data: {'cityId':editCityId,'cityName':editCityName},
	    	datatype: 'json',
	        success: function(data){
	        	if(data=='failed'){
		    	$('#cityModal').modal('hide');
		    	$('#successBox').hide();
	        	$('#errorBox').html('添加或修改的城市名称已存在！');
	        	$('#errorBox').show();
	        	$('#alertModal').modal('show');
	        	setTimeout(function(){$("#alertModal").modal("hide");},2000);
	        	}else{
	        		$('#cityModal').modal('hide');
	        		$('#centerDiv').html('');
                	$('#centerDiv').html(data);
                	$('#errorBox').hide();
    	        	$('#successBox').show();
    	        	$('#alertModal').modal('show');
    	        	setTimeout(function(){$("#alertModal").modal("hide");},2000);
    	        	
	        	}	        	
	        },
	        error:function (XMLHttpRequest, textStatus, errorThrown) 
	        { 
	        	$('#cityModal').modal('hide');  
	        	$('#successBox').hide();
	        	$('#errorBox').html(errorThrown);
	    		$('#errorBox').show();
	    		$('#alertModal').modal('show');
	    		setTimeout(function(){$("#alertModal").modal("hide");},2000);
	        } 
		
    });
	}
	
}
</script>
<div class="nav navbar-nav navbar-right"> 
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#cityModal" data-cityName="" data-cityId="">添加城市</button>
</div>

<br>

<table class="table table-striped" style="margin-top:50px">
  <thead>
        <tr>
          <th>城市名称</th>
          <th>操作</th>
        </tr>
  </thead>
  <tbody>
  <c:forEach items="${cityList}" var="city">
  <tr>
  <td>${city.cityName}</td>
  <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cityModal" data-cityName="${city.cityName}" data-cityId="${city.cityId}">修改</button></td>
  </tr>
  </c:forEach>
  </tbody>
</table>

<div class="modal" id="cityModal" tabindex="-1" role="dialog" aria-labelledby="cityModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label for="city_name" class="control-label">城市名称</label>
            <input type="text" class="form-control" id="cityName">
            <input type="hidden" class="form-control" id="cityId">
            <input type="hidden" class="form-control" id="hiddenCityName">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="editCity()">修改</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="cityModalLabel">
  <div class="modal-dialog" role="document">
<!--     <div class="modal-content"> -->
      <div class="modal-body">
        <div id="errorBox" class="alert alert-danger">                           
		</div>
		<div id="successBox" class="alert alert-success">
                           城市添加/修改成功！
</div>
      </div>
  </div>
</div>
