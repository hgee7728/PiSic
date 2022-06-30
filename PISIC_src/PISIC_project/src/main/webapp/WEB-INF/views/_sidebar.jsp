<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
    <a class="sidebar-brand brand-logo" href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/assets/images/PISIC-logo.png" alt="logo" /></a>
    <a class="sidebar-brand brand-logo-mini" href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/assets/images/PISIC-logo-mini.png" alt="logo" /></a>
  </div>
  <ul class="nav">
    <li class="nav-item profile">
      <div class="profile-desc">
        <div class="profile-pic">
          <div class="count-indicator">
            <img class="img-xs rounded-circle " src="<%=request.getContextPath()%>/resources/assets/images/faces/face15.jpg" alt="">
            <span class="count bg-success"></span>
          </div>
          <div class="profile-name">
            <h5 class="mb-0 font-weight-normal">
	        <c:if test="${not empty loginSsInfo}">
	        	${loginSsInfo.m_name }
	        </c:if>
	        <c:if test="${empty loginSsInfo}">
	        	로그인
	        </c:if>
            </h5>
            <span>Gold Member</span>
          </div>
        </div>
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
      </div>
    </li>
    <c:if test="${empty loginSsInfo}">
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/member/login">
        <span class="menu-icon">
          <i class="mdi mdi-playlist-play"></i>
        </span>
        	<span class="menu-title">LOGIN</span>
    </c:if>
    <c:if test="${not empty loginSsInfo}">
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/member/logout">
        <span class="menu-icon">
          <i class="mdi mdi-playlist-play"></i>
        </span>
        	<span class="menu-title">LOGOUT</span>
    </c:if>
      </a>
    </li>
    <li class="nav-item w-100">
      <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
        <input type="text" class="form-control" placeholder="Search products">
      </form>
    </li>
    <li class="nav-item nav-category">
      <span class="nav-link">MENU</span>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/">
        <span class="menu-icon">
          <i class="mdi mdi-speedometer"></i>
        </span>
        <span class="menu-title">MAIN</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/chart/">
        <span class="menu-icon">
          <i class="mdi mdi-chart-bar"></i>
        </span>
        <span class="menu-title">PISIC CHART</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="<%=request.getContextPath()%>/pymusic/">
        <span class="menu-icon">
          <i class="mdi mdi-table-large"></i>
        </span>
        <span class="menu-title">PICK YOUR MUSIC</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="pages/charts/chartjs.html">
        <span class="menu-icon">
          <i class="mdi mdi-chart-bar"></i>
        </span>
        <span class="menu-title">PJ LOUNGE</span>
      </a>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
        <span class="menu-icon">
          <i class="mdi mdi-laptop"></i>
        </span>
        <span class="menu-title">MY MUSIC</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="ui-basic">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">내 플레이 리스트</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/dropdowns.html">좋아하는 아티스트</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">좋아하는 노래</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">최근 들은 노래</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">많이 들은 노래</a></li>
        </ul>
      </div>
    </li>
    <li class="nav-item nav-category">
      <span class="nav-link"></span>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" data-toggle="collapse" href="#membership" aria-expanded="false" aria-controls="membership">
        <span class="menu-icon">
          <i class="mdi mdi-square-inc-cash"></i>
        </span>
        <span class="menu-title">PISIC MEMBERSHIP</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="membership">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html">이용권 구매</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html">이용권 해지</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html">결제내역</a></li>
        </ul>
      </div>
    </li>
    <li class="nav-item menu-items">
      <a class="nav-link" href="documentation">
        <span class="menu-icon">
          <i class="mdi mdi-account"></i>
        </span>
        <span class="menu-title">MY PAGE</span>
      </a>
    </li>
        <li class="nav-item menu-items">
      <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
        <span class="menu-icon">
          <i class="mdi mdi-security"></i>
        </span>
        <span class="menu-title">CUSTOMER SERVICE</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="auth">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/faq/list">자주묻는 질몬</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html">1:1 문의</a></li>
        </ul>
      </div>
    </li>
  </ul>
</nav>