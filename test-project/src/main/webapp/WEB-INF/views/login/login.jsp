<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>대한건축사협회 관리자 로그인</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/fonts/nanum/nanumbarungothicsubset.css">
<link rel="stylesheet" type="text/css" href="/fonts/NotoSansKR-Hestia-master/stylesheets/NotoSansKR-Hestia.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-icons.css">
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/datatables.min.css">
<script src="/js/jquery.js"></script>
<script src="/js/jquery-ui-1.10.0.custom.js"></script>
<script src="/js/pdfmake.min.js"></script>
<script src="/js/vfs_fonts.js"></script>
<script src="/js/datatables.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/util.js"></script>
<script>
$(document).ready(function() {
    if ( self !== top ) {
        top.location.href = "/";
    } else {
        if(opener) {
            opener.location.href = "/";
            window.self.close();
        }
    }
	//모바일 vh 높이 맞추기.
	let vh = window.innerHeight * 0.01;
	document.documentElement.style.setProperty('--vh', `${vh}px`);
	
	// resize
	window.addEventListener('resize', () => {
		let vh = window.innerHeight * 0.01;
		document.documentElement.style.setProperty('--vh', `${vh}px`);
	});
	
	$('#goLogin').on('click', function() {
	    if(Trim($('#floatingInputGroup1').val())=='') {
	        alert("아이디를 입력해주세요.");
	        $('#floatingInputGroup1').focus();
	        return;
	    }
	    
		if(Trim($('#floatingInputGroup2').val())=='') {
		    alert("비밀번호를 입력해주세요.");
	        $('#floatingInputGroup2').focus();
	        return;
	    }
		
		$('#f').submit();
	});
	
	$('#floatingInputGroup1').focus();
});
function nextInput() {
    if(event.keyCode == 13) {
        $('#floatingInputGroup2').focus();
    }
}

function nextSubmit() {
    if(event.keyCode == 13) {
        $('#goLogin').trigger('click');
    }
}

</script>
</head>
<body>
	<div class="login_wrap p-4">
		<div class="login_bg d-flex  align-items-center py-4">
			<div class="login_form text-center px-4 w-100">
				<h1>
					<img src="/img/logo.png" class="img-fluid" /> <br> <span class="text-danger">관리자 메뉴 통합시스템</span>
				</h1>
				<h2 class="text-center mb-0">LOGIN</h2>
				<div class="login-form py-3">
					<form id='f' name='f' action="/doLogin" method='POST'>
						<div class="input-group mb-3">
							<span class="input-group-text"><i class="bi bi-person-fill"></i></span>
							<div class="form-floating">
								<input type="text" class="form-control" id="floatingInputGroup1" name="username" placeholder="아이디" value="" onkeyup="nextInput(this)"> <label for="floatingInputGroup1">아이디 입력</label>
							</div>
						</div>
						<div class="input-group mb-4">
							<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
							<div class="form-floating">
								<input type="password" class="form-control" id="floatingInputGroup2" name="password" placeholder="비밀번호" onkeyup="nextSubmit(this)" value=""> <label for="floatingInputGroup2" >비밀번호 입력</label>
							</div>
						</div>
					</form>
					<button id="goLogin" class="login_btn btn btn-danger w-100 p-2">LOGIN</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>