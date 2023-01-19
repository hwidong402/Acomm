<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg" aria-label="Main navigation">
    <div class="container-fluid">
      <!-- 홈버튼 -->
      <a class="navbar-brand" href="openHomepage">A-Comm</a>
      <!-- SideCollapse -->
      <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- nav 목록 -->
      <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="openBbs">게시판</a></li>
	          	<li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=noti">공지사항</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=hot">인기게시판</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=free">자유게시판</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=market">장터게시판</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=sugg">건의사항</a></li>
	            <li><a class="dropdown-item" href="openBbsCate?bbs_cate=worry">질문게시판</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="open.aptsell">부동산</a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="matjip">맛집</a>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>