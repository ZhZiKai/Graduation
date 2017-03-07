<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath}/common/js/admin-addstudent.js"></script>

<div class="row-fluid">
    <div>
        <h1 class="page-header">添加学生</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<form id="studentForm" class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
    <div class="col-sm-3 input">
      <input type="text" class="form-control" name="name" placeholder="姓名">
    </div>
    <label for="inputEmail3" class="col-sm-2 control-label">学号</label>
    <div class="col-sm-3 input">
      <input type="text" class="form-control" name="account" placeholder="学号">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-3 input">
      <input type="text" class="form-control" name="password" placeholder="密码">
    </div>
    <label for="inputPassword3" class="col-sm-2 control-label">专业</label>
    <div class="col-sm-3 input">
      <input type="text" class="form-control" name="dept" placeholder="专业">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">班级</label>
    <div class="col-sm-3 input">
      <input type="text" class="form-control" name="classname" placeholder="班级">
    </div>
    <label for="inputPassword3" class="col-sm-2 control-label">联系电话</label>
    <div class="col-sm-3 input">
      <input type="text" class="form-control" name="tel" placeholder="联系电话">
    </div>
  </div>
  <div class="form-group">
      <a href="${pageContext.request.contextPath}/yy/admin/download_student" class="btn btn-success col-sm-offset-1 col-sm-1">下载模板</a>
      <span class="btn btn-primary fileinput-button col-sm-offset-1 col-sm-2">
        	导入Excel文件
          <input id="add-student"  type="file" name="file">
      </span>
      <button id="addStudent" type="button" class="btn btn-default col-sm-offset-4">提交</button>
  </div>
</form>