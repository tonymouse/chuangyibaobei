<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$('#siteModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget); // Button that triggered the modal
	  var siteName = button.data('sitename'); // Extract info from data-* attributes
	  var siteId = button.data('siteid');
	  var siteAliasName = button.data('sitealiasname');
	  var siteAddress = button.data('siteaddress');
	  var siteTelephone = button.data('sitetelephone');
	  var siteCode = button.data('sitecode');
	  var siteZipCode = button.data('sitezipcode');	  
	  var modal = $(this);
	  if(siteName == null||siteName==''){
	  	modal.find('.modal-title').text('添加门店');
	  }else{
		modal.find('.modal-title').text('修改门店');  
	  }
	  modal.find('#siteName').val(siteName);
	  modal.find('#siteAliasName').val(siteAliasName);
	  modal.find('#siteAddress').val(siteAddress);
	  modal.find('#siteTelephone').val(siteTelephone);
	  modal.find('#siteCode').val(siteCode);
	  modal.find('#siteZipCode').val(siteZipCode);
	  modal.find('#hiddenSiteName').val(siteName);
	  modal.find('#siteId').val(siteId);
	});
</script>
<div class="nav navbar-nav navbar-right"> 
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#siteModal">添加门店</button>
</div>
<table class="table table-striped">
  <thead>
        <tr>
          <th>门店名称</th>
          <th>门店简称</th>
          <th>城市</th>
          <th>门店电话</th>
          <th>门店状态</th>
          <th>操作</th>
        </tr>
  </thead>
  <tbody>
  <c:forEach items="${siteList}" var="site">
  <tr>
  <td>${site.name}</td>
  <td>${site.aliasName}</td>
  <td></td>
  <td>${site.telephone}</td>
  <td><c:choose>
  <c:when test="${site.isActive =='Y'}">
        激活
  </c:when>
  <c:otherwise>
       冻结
  </c:otherwise>
  </c:choose></td>
  <td><c:if test="${site.isActive == 'Y'}">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#siteModal" 
  data-siteId="${site.siteId}" data-siteAddress="${site.address}"
  data-siteName="${site.name}" data-siteAliasName="${site.aliasName}"
  data-siteTelephone="${site.telephone}" data-siteZipCode="${site.zipCode}"
  data-siteCode="${site.code}">详情</button></c:if>
  <c:choose>
  <c:when test="${site.isActive == 'Y'}">
  <button type="button" class="btn btn-danger">冻结</button>
  </c:when>
  <c:otherwise>
  <button type="button" class="btn btn-success">激活</button>
  </c:otherwise>
  </c:choose></td>
  </tr>
  </c:forEach>
  </tbody>
</table>

<div class="modal" id="siteModal" tabindex="-1" role="dialog" aria-labelledby="siteModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label for="siteName" class="control-label">门店名称</label>
            <input type="text" class="form-control" id="siteName">
            <label for="siteAddress" class="control-label">门店地址</label>
            <input type="text" class="form-control" id="siteAddress">
            <label for="siteAliasName" class="control-label">门店简称</label>
            <input type="text" class="form-control" id="siteAliasName">
            <label for="siteTelephone" class="control-label">门店电话</label>
            <input type="text" class="form-control" id="siteTelephone">
            <label for="siteCode" class="control-label">门店编号</label>
            <input type="text" class="form-control" id="siteCode">
            <label for="siteZipCode" class="control-label">门店邮编</label>
            <input type="text" class="form-control" id="siteZipCode">
            <input type="hidden" class="form-control" id="siteId">
            <input type="hidden" class="form-control" id="hiddenSiteName">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="editSite()">修改</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->