<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>대한건축사협회</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/fonts/nanum/nanumbarungothicsubset.css">
<link rel="stylesheet" type="text/css" href="/fonts/NotoSansKR-Hestia-master/stylesheets/NotoSansKR-Hestia.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/styleOrg.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-icons.css">
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/datatables.min.css">

<%-- <script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.js"></script> --%>
<script src="/js/jquery.js"></script>
<script src="/js/jquery-ui-1.10.0.custom.js"></script>
<script src="/js/datatables.min.js"></script>
<script src="/js/pdfmake.min.js"></script>
<script src="/js/vfs_fonts.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/script.js"></script>
<script src="/js/calendar_util.js"></script>
<script src="/js/util.js"></script>
<script>

// history.pushState(null, null, document.URL);

var conHeight;
var activeIdx;
var m_idx = 1;

//탭추가
function addTab(menuNm, menuPath) {
    if($("div[id^='tabFrame']").length > 6) {
        alert("탭 메뉴는 최대 6개까지 가능합니다.");
        return;
    } 
        
    var tag1 = "<div class=\"item\" id=\"tabMenu-"+m_idx+"\">"+
    "<a href=\"#\" onclick=\"tabOn('"+m_idx+"')\" class=\"btn btn-gray active\" alt=\""+menuNm+"\">"+menuNm+" <button onclick=\"tabClose(event, '"+m_idx+"');return false;\" type=\"button\" class=\"btn-close\" aria-label=\"Close\"></button></a>"+
    "</div>";
    var tag2 = "<div class=\"content p-3 d-flex\" id=\"tabFrame-"+m_idx+"\">"+
    "<iframe id=\"iframetab_"+m_idx+"\" src=\""+menuPath+"\" width=\"100%\" height=\"100%\"></iframe>"+
    "</div>";

    tabOff();
	$('.owl-carousel')
    .trigger('add.owl.carousel', [tag1])
    .trigger('refresh.owl.carousel');
    $(".home-section").append(tag2);
    m_idx++;
    
    $('.owl-carousel').trigger('to.owl.carousel', [m_idx]);
}

function tabOff() {
	$("div[id^='tabFrame']").each(function(index, item) {
		$(this).removeClass('d-flex');
		$(this).addClass('d-none');
	});
	$("div[id^='tabMenu'] a").each(function(index, item) {
		$(this).removeClass('active');
	});
}

function tabClose(e, idx) {
	$('#tabFrame-'+idx).remove();
	var removeIdx = 0;
	$("div[id^='tabMenu']").each(function(index, item) {
		if($(this).attr('id') == 'tabMenu-'+idx) removeIdx = index;
	});
	$('.owl-carousel')
    .trigger('remove.owl.carousel', removeIdx);
	tabAllCheck();
	e.stopPropagation();
}

function tabOn(idx) {
	if($('#tabFrame-'+idx).hasClass('d-flex')===false) { // d-flex 면 이미 보고 있는 화면이다.
		tabOff();
		$('#tabFrame-'+idx).removeClass('d-none');
		$('#tabFrame-'+idx).addClass('d-flex');
		$('#tabMenu-'+idx+' a').addClass('active');
	}
}

// tab 전체 체크
// 열린 탭이 없을 경우 또는 현재 활성화 된 탭이 없을 경우 동작
function tabAllCheck() {
	var isActive = false;
	var totalTabCnt = 0;
	$("div[id^='tabMenu'] a").each(function(index, item) {
		totalTabCnt++;
		if($(this).hasClass('active')) isActive = true;
	});
	if(!isActive) {
		if(totalTabCnt==0) { // 최초 기본 화면을 보여준다.
			$('#tabFrame-0').removeClass('d-none'); 
			$('#tabFrame-0').addClass('d-flex'); 
		} else {
			var idx = $("div[id^='tabMenu']").eq(0).attr('id').replace('tabMenu-','');
			tabOn(idx);
		}
	}
}

//지역 건축사회선택(Ajax로 늦게 로딩되는경우대비)
function setSubLocCode(sctCode, locCode, locField) {
	var selSize = $("#" + locField + " option").length;
    for(var i=0; i<selSize; i++) {
        $("#" + locField + " option:eq(0)").remove();
    }
    $("#" + locField).append("<option>로딩중...</option>");
    
    $.post("../common/getLocCodeList", {sctcode: sctCode},
        function(data) {
            $("#" + locField + " option:eq(0)").remove();
            
            $("#" + locField).append("<option value=''>선택</option>");
            
            $(data).each(
                function(index, item) {
                    $("#" + locField).append("<option value='" + item.CD + "'>" + item.CD_NM + "</option>");
                }
            )
            
            $("#" + locField).val(locCode).prop("selected", true);
        }
    );
}

//건축사회변경(지역 건축사회조회)
function getSubLocCode(sctCode, fieldNm) {
	var selSize = $("#" + fieldNm + " option").length;
    for(var i=0; i<selSize; i++) {
        $("#" + fieldNm + " option:eq(0)").remove();
    }
    $("#" + fieldNm).append("<option>로딩중...</option>");
    
    $.post("../common/getLocCodeList", {sctcode: sctCode},
        function(data) {
            $("#" + fieldNm + " option:eq(0)").remove();
            
            $("#" + fieldNm).append("<option value=''>선택</option>");
            
            $(data).each(
                function(index, item) {
                    $("#" + fieldNm).append("<option value='" + item.CD + "'>" + item.CD_NM + "</option>");
                }
            )
        }
    );
}

//<![CDATA[
window.onload = function() {
	$('#frm').on("submit", function(event){
		// report popup exclude
		console.log(this.target);
		if(this.target == undefined || this.target == '' || this.target == '_self') {
			$("#loading").css("display",'');
		}
	});
    try {
        init();
    }catch(e){
    	console.log(e);
    }
};

//새로고침(F5)기능 재정의
document.onkeydown = function() {
	if(event.keyCode == 116) {
		var url = document.location.pathname;

		if(url!="member" && url!="perform" && url!="subarch" && url!="supervise" && url!="foreign" && url!="issue" && url!="offcie" && url!="home" && url!="basic") {
			event.keyCode = 505;
			location.href = url;
		}

		return false;
	}
}

//rexpert report호출 경로(변경가능성으로 빼둠)
//var reportUrl = "http://rex.kira.or.kr/RexServer30";
var reportUrl = "https://cert.kira.or.kr/RexServer30";
//]]>
</script>

<div id="loading" style="display:none !important" class="spinner_wrap w-100 h-100 d-flex align-items-center justify-content-between bg-dark bg-opacity-50">
    <div  class="m-auto bg-light rounded-circle p-4 shadow">
      <div class="spinner"  ></div>
    </div>
</div>
