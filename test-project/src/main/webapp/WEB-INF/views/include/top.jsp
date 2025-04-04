<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<span class="navbar-brand" href="javascript:;">Top Menu</span>
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toglger-icon"><i class="bi bi-list"></i></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-lg-0">
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/member')}">active</c:if>"
					aria-current="page" href="/member" alt="정회원">정회원</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/perform')}">active</c:if>" aria-current="page"
					href="/perform" alt="건축사 실적">건축사 실적</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/subarch')}">active</c:if>" aria-current="page"
					href="/subarch" alt="건축사보">건축사보</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/supervise')}">active</c:if>" aria-current="page"
					href="/supervise" alt="건축사보 및 감리원 배치">건축사보 및 감리원 배치</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/foreign')}">active</c:if>" aria-current="page"
					href="/foreign" alt="외국건축사">외국건축사</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/issue1')}">active</c:if>" aria-current="page"
					href="/issue1	" alt="증명서 발급">증명서 발급</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/issue2')}">active</c:if>" aria-current="page"
					href="/issue2" alt="증명서 발급(내부)">증명서 발급(내부)</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/basic')}">active</c:if>" aria-current="page"
					href="/basic" alt="기본정보">기본정보</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/auth2')}">active</c:if>" aria-current="page"
					href="/auth2" alt="본부 직원">본부 직원</a></li>
				<li class="nav-item"><a class="nav-link <c:if test = "${fn:startsWith(path, '/auth1')}">active</c:if>" aria-current="page"
					href="/auth1" alt="총괄 관리자">총괄 관리자</a></li>
			</ul>
		</div>
	</div>
</nav>
