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
  	<li class="nav-item nav-category">
    	<span class="nav-link"></span>
  	</li>
    <li class="nav-item profile">
      <div class="profile-desc">
        <div class="profile-pic">
          <div class="count-indicator">
          	<sec:authorize access="isAnonymous()">
          		<img class="img-xs rounded-circle " src="<%=request.getContextPath()%>/resources/assets/images/favicon.png" alt="">
          	</sec:authorize>
          	<sec:authorize access="isAuthenticated()">
          		<sec:authentication property="principal.m_profile" var="m_profile"/>
          		<img class="img-xs rounded-circle " src="${m_profile }" alt="">
          	</sec:authorize>
            <span class="count bg-success"></span>
          </div>
          <div class="profile-name">
	        <sec:authorize access="isAuthenticated()">
	        	<sec:authentication property="principal.m_nickname" var="m_nickname"/>
	        	<h5 class="mb-0 font-weight-normal">
	        		${m_nickname }
	        	</h5>
	        	<sec:authorize access="hasRole('ROLE_MEMBER')">
	        		<sec:authentication property="principal.m_membership_yn" var="m_membership_yn"/>
	        		<c:if test="${m_membership_yn eq 'N'}">
	        			<span>General Member</span>
	        		</c:if>
	        		<c:if test="${m_membership_yn eq 'Y'}">
	        			<span>PISIC Membership</span>
	        		</c:if>
	        	</sec:authorize>
	        	<sec:authorize access="hasRole('ROLE_ADMIN')">
            		<span>관리자</span>
            	</sec:authorize>
	        </sec:authorize>
	        <sec:authorize access="isAnonymous()">
	        	<h5 class="mb-0 font-weight-normal">
	        	로그인
	        	</h5>
	        	<span>로그인하고 PISIC을 이용하세요</span>
	        </sec:authorize>
          </div>
        </div>
        <!-- 
        <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a>
        <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list" aria-labelledby="profile-dropdown">
          <a href="#" class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-dark rounded-circle">
                <i class="mdi mdi-settings text-primary"></i>
              </div>
            </div>
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1 text-small">Account settings</p>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-dark rounded-circle">
                <i class="mdi mdi-onepassword  text-info"></i>
              </div>
            </div>
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1 text-small">Change Password</p>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item preview-item">
            <div class="preview-thumbnail">
              <div class="preview-icon bg-dark rounded-circle">
                <i class="mdi mdi-calendar-today text-success"></i>
              </div>
            </div>
            <div class="preview-item-content">
              <p class="preview-subject ellipsis mb-1 text-small">To-do list</p>
            </div>
          </a>
        </div>
        -->
      </div>
    </li>
   <sec:authorize access="isAnonymous()">
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/login">
        <span class="menu-icon">
          <i class="mdi mdi-playlist-play"></i>
        </span>
        <span class="menu-title">LOGIN</span>
       </a>
    </li>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
	    <form action="${pageContext.request.contextPath}/logout" method="POST" id="frmLogout">
			<li class="nav-item menu-items">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />				
		      <a class="nav-link" href="javascript:;" onclick="document.getElementById('frmLogout').submit();">
		        <span class="menu-icon">
		          <i class="mdi mdi-playlist-play"></i>
		        </span>
		        <span class="menu-title">LOGOUT</span>
		      </a>
		    </li>
		</form>
    </sec:authorize>
    <li class="nav-item w-100">
      <form id="search_frm" class="nav-link mt-2 mt-md-0 d-lg-flex search" action="<%=request.getContextPath()%>/search/searchKeyword" method="get">
        <input type="text" class="form-control" placeholder="Search Sound" name="keyword">
        <button type="button" id="search_btn" class="btn btn-outline-light btn-sm">Search</button>
      </form>
    </li>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/main">
        <span class="menu-icon">
          <i class="mdi mdi-account"></i>
        </span>
        <span class="menu-title">USER PAGE</span>
      </a>
    </li>
    </sec:authorize>
    <li class="nav-item nav-category">
      <span class="nav-link">MENU</span>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/admin/member">
        <span class="menu-icon">
          <i class="mdi mdi-speedometer"></i>
        </span>
        <span class="menu-title">회원 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/admin/membership">
        <span class="menu-icon">
          <i class="mdi mdi-chart-bar"></i>
        </span>
        <span class="menu-title">이용권 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/admin/report">
        <span class="menu-icon">
          <i class="mdi mdi-table-large"></i>
        </span>
        <span class="menu-title">신고글 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/admin/artist">
        <span class="menu-icon">
          <i class="mdi mdi-chart-bar"></i>
        </span>
        <span class="menu-title">아티스트 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/admin/album">
        <span class="menu-icon">
          <i class="mdi mdi-square-inc-cash"></i>
        </span>
        <span class="menu-title">앨범 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/admin/sound">
        <span class="menu-icon">
          <i class="mdi mdi-square-inc-cash"></i>
        </span>
        <span class="menu-title">음원 관리</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" data-toggle="collapse" href="#Faq" aria-expanded="false" aria-controls="Faq">
        <span class="menu-icon">
          <i class="mdi mdi-account"></i>
        </span>
        <span class="menu-title">고객센터 관리</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="Faq">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/faq/faqList">자주묻는 질문</a></li>
          <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/admin/adminQnaList">1:1 문의</a></li>
        </ul>
      </div>
    </li>
  </ul>
</nav>