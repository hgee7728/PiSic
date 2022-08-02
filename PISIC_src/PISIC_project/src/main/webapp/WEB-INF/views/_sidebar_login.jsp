<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
input[name=keyword]{
	height:30px;
}
</style>
<script>
$(function(){
	$("#search_btn").click(function(){
		if($("input[name=keyword]").val()==""){
			alert("검색어를 입력해주세요");
		} else {
			search_frm.submit();
		}
	});
});
</script>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
    <a class="sidebar-brand brand-logo" href="<%=request.getContextPath()%>/main"><img src="<%=request.getContextPath()%>/resources/assets/images/PISIC-logo.png" alt="logo" /></a>
    <a class="sidebar-brand brand-logo-mini" href="<%=request.getContextPath()%>/main"><img src="<%=request.getContextPath()%>/resources/assets/images/PISIC-logo-mini.png" alt="logo" /></a>
  </div>
  <ul class="nav">
  	
  </ul>
</nav>