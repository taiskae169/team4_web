<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
        </div>
        <div class="sidebar-brand-text mx-3">관리자 페이지 </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="admin.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
         <a class="nav-link" href="admin_user.jsp">
         	<i class="fas fa-fw fa-cog"></i>
          	<span>유저관리</span></a>
      </li>
      <li class="nav-item">
         <a class="nav-link" href="admin_webtoon.jsp">
         	<i class="fas fa-fw fa-cog"></i>
          	<span>웹툰 관리</span></a>
      </li>
      <li class="nav-item">
         <a class="nav-link" href="admin_comment.jsp">
         	<i class="fas fa-fw fa-cog"></i>
          	<span>코멘트 관리</span></a>
      </li>
      <li class="nav-item">
         <a class="nav-link" href="helpdesk.jsp">
         	<i class="fas fa-fw fa-folder"></i>
          	<span>문의사항 목록</span></a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>