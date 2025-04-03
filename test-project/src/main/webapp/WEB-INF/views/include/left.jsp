<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
//<![CDATA[
window.onload = function(){
	
	//본부 수퍼관리자
	<c:if test="${details.getSMngrAthCd() == '01'}">
		//전부다 보여줌
		$("#perform_0105").hide();
		$("#perform_0106").hide();
	</c:if>
	
	//본부 관리자
	<c:if test="${details.getSMngrAthCd() == '02'}">
		//전부다 보여줌
		$("#perform_0105").hide();
		$("#perform_0106").hide();
		$("#safety_01").hide();
		$("#basic_01").hide();
		$("#basic_02").hide();
	</c:if>
	
	//본부 직원
	<c:if test="${details.getSMngrAthCd() == '03'}">
		$(".sidebar > ul > li").not('.logOut').hide();
		$(".sidebar > ul > li > ul > li").hide();
		$("#profile").show();

		$("#member_03").show();
		$("#member_0301").show();
		$("#home_01").show();
		$("#home_0101").show();
		$("#safety_01").hide();
		$("#basic_01").hide();
		$("#basic_02").hide();
	</c:if>
	
	//시도 관리자
	<c:if test="${details.getSMngrAthCd() == '04'}">
		$("#member_02").hide();
		$("#member_0104").hide();
		$("#perform_04").hide();
		$("#perform_03").hide();
		$("#office_01").hide();
		$("#safety_01").hide();
		$("#basic_01").hide();
		$("#basic_02").hide();
		$("#supervise_0101").hide();
		$("#supervise_0404").hide();
		$("#perform_0101").hide();
		$("#perform_0102").hide();
		$("#perform_0103").hide();
		$("#perform_09").hide();
		$("#supervise_02").hide();
	</c:if>
	
}
//]]>
</script>
<div class="sidebar open">
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}"></c:set>
    <div class="logo-details border-bottom p-3">
      <div class="logo_name">
        
        <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/logo.png" alt="대한건축사협회" />
        <p class="text-center m-0 pt-2">
		    <c:if test = "${fn:startsWith(path, '/member')}">    
		        정회원
		    </c:if>
		    <c:if test = "${fn:startsWith(path, '/perform')}">    
		       건축사 실적
		    </c:if>
		    <c:if test = "${fn:startsWith(path, '/subarch')}">    
		        건축사보
		    </c:if>
		    <c:if test = "${fn:startsWith(path, '/supervise')}">    
		        건축사보 및 감리원 배치
		    </c:if>
		    <c:if test = "${fn:startsWith(path, '/foreign')}">    
		        외국건축사
		    </c:if>
		    <c:if test = "${fn:startsWith(path, '/issue')}">    
		        증명서 발급
		    </c:if>
		    <c:if test = "${(fn:startsWith(path, '/basic')) || (fn:startsWith(path, '/home')) || (fn:startsWith(path, '/safety')) || (fn:startsWith(path, '/office'))}">    
		        기본정보
		    </c:if>
		    관리자 프로그램
        </p>
      </div>
      <button type="button" class="sidebar_btn btn hide btn-danger" id="side_btn"><i class="bi bi-list"></i></button>
    </div>
    <ul class="nav-list m-0 flex-column pb-3">
      <li class="profile p-3 border-bottom my-0" id="profile">
        <div class="profile-details">
          <img src="${pageContext.request.contextPath}/assets/img/user_icon.png" alt="profileImg">
          <div class="name_job mini_hide">
            <div class="name">${details.getSUserNm() }&nbsp;${details.getSPosName() }</div>
            <div class="job">${details.getSDeptName() }</div>
          </div>
          <span class="tooltip">
            <div class="name_job">
              <div class="name">${details.getSUserNm() }&nbsp;${details.getSPosName() }</div>
              <div class="job">${details.getSDeptName() }</div>
            </div>
          </span>
        </div>
      </li>
      
      <c:if test = "${fn:startsWith(path, '/member')}">
      
      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="member_01" >
        <button type="button" alt="신고서 접수">
          <i class="bi bi-clipboard-fill"></i>
          <span class="links_name mini_hide">신고서 접수 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">신고서 접수</span>
        <ul class="sub_menu">
          <li id="member_0101">	<!-- org : member 0101 -->
            <a href="javascript:;" onclick="addTab('접수내역', '/member/memberReceiptList')" alt="접수내역">접수내역</a>
          </li>
          <li id="member_0102">	<!-- org : member 0102 -->
            <a href="javascript:;" onclick="addTab('정회원 접수', '/member/regularRegForm')" alt="정회원 접수">정회원 접수</a>
          </li>
          <li id="member_0103">	<!-- org : member 0103 -->
            <a href="javascript:;" onclick="addTab('정회원외 회원 접수', '/member/associateRegForm')" alt="정회원외 회원 접수">정회원외 회원 접수</a>
          </li>
          <li id="member_0104">	<!-- org : member 0104 -->
            <a href="javascript:;" onclick="addTab('비회원 접수', '/member/registrantRegForm')" alt="비회원 접수">비회원 접수</a>
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="member_03">
        <button type="button" alt="정보검색">
          <i class="bi bi-search"></i>
          <span class="links_name mini_hide">정보검색  <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">정보검색</span>
        <ul class="sub_menu">
          <li id="member_0301"><!-- org : member 0301 -->
            <a href="javascript:;" onclick="addTab('정회원&비회원 조회', '/member/memberList')" alt="정회원&비회원 조회">정회원&비회원 조회</a>
          </li>
          <li id="member_0305"><!-- org : member 0305 -->
            <a href="javascript:;" onclick="addTab('전출 및 전입 현황 조회', '/member/memberMvIoList')" alt="전출 및 전입 현황 조회">전출 및 전입 현황 조회</a>
          </li>
          <li id="member_0303"><!-- org : member 0203 -->
            <a href="javascript:;" onclick="addTab('건축사 행정처분 조회', '/member/administrativeMeasureList')" alt="건축사 행정처분 조회">건축사 행정처분 조회</a>
          </li>
          <li id="member_0302"><!-- org : member 0302 -->
            <a href="javascript:;" onclick="addTab('정회원외 회원 조회', '/member/associateList')" alt="정회원외 회원 조회">정회원외 회원 조회</a>
          </li>
        </ul>
       
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="member_02">
        <button type="button" alt="정보관리">
          <i class="bi bi-clipboard2-pulse-fill"></i>
          <span class="links_name mini_hide">정보관리  <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">정보관리</span>
        <ul class="sub_menu">
          <li id="member_0203"><!-- org : member 0303 -->
            <a href="javascript:;" onclick="addTab('정회원&비회원 직권수정', '/member/modifyList')" alt="정회원&비회원 직권수정">정회원&비회원 직권수정</a>
          </li>
          <li id="member_0201"><!-- org : member 0201 -->
            <a href="javascript:;" onclick="addTab('정회원 직권퇴회 관리', '/member/authOutList')" alt="정회원 직권퇴회 관리">정회원 직권퇴회 관리</a>
          </li>
          <li id="member_0202"><!-- org : member 0202 -->
            <a href="javascript:;" onclick="addTab('정회원 징계 관리', '/member/disciplinaryList')" alt="정회원 징계 관리">정회원 징계 관리</a>
          </li>
          <li id="member_0204"><!-- org : member 0304 -->
            <a href="javascript:;" onclick="addTab('정회원외 회원 직권수정', '/member/associateModifyList')" alt="정회원외 회원 직권수정">정회원외 회원 직권수정</a>
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2 m-0 mb-3" id="member_09">
        <button type="button" alt="통게자료">	
          <i class="bi bi-bar-chart-line-fill"></i>
          <span class="links_name mini_hide">통계자료 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">통계자료</span>
        <ul class="sub_menu">
          <li id="member_0901">
            <a href="javascript:;" onclick="addTab('시도별 회원현황', '')" alt="시도별 회원현황">시도별 회원현황</a>
          </li>
          <li id="member_0902">
            <a href="javascript:;" onclick="addTab('지역별 회원현황', '')" alt="지역별 회원현황">지역별 회원현황</a>
          </li>
          <li id="member_0903">
            <a href="javascript:;" onclick="addTab('년도별/월별 회원현황', '')" alt="년도별/월별 회원현황">년도별/월별 회원현황</a>
          </li>
          <li id="member_0904">
            <a href="javascript:;" onclick="addTab('년도별 신고서 처리현황', '')" alt="년도별 신고서 처리현황">년도별 신고서 처리현황</a>
          </li>
        </ul>
      </li>
      </c:if>
      
      
      
      <c:if test = "${fn:startsWith(path, '/perform')}">
      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="perform_01">
        <button type="button" alt="제출서 접수">
          <i class="bi bi-clipboard-fill"></i>
          <span class="links_name mini_hide">제출서 접수<i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">제출서 접수</span>
        <ul class="sub_menu">
          <li id="perform_0101"><!-- org : perform 0101 -->
            <a href="javascript:;" onclick="addTab('본협회 접수내역', '/perform/performRecpProcList')" alt="본협회 접수내역">본협회 접수내역</a><!-- performRecpProcList -->
          </li>
          <li id="perform_0102"><!-- org : perform 0102 -->
            <a href="javascript:;" onclick="addTab('건축사회 접수내역', '/perform/performRecpProcActList')" alt="건축사회 접수내역">건축사회 접수내역</a><!-- performRecpProcActList -->
          </li>
          <li id="perform_0103"><!-- org : perform 0103 -->
            <a href="javascript:;" onclick="addTab('제출서 작성현황', '/perform/performWrtgList')" alt="제출서 작성현황">제출서 작성현황</a><!-- performWrtgList -->
          </li>
          
          <!-- 시도관리자메뉴 -->
          <li id="perform_0105"><!-- org : perform 0101 -->
            <a href="javascript:;" onclick="addTab('건축사회 접수내역', '/perform/performRecpProcList')" alt="건축사회 접수내역">건축사회 접수내역</a><!-- performRecpProcList -->
          </li>
          <li id="perform_0106"><!-- org : perform 0102 -->
            <a href="javascript:;" onclick="addTab('제출서 작성현황', '/perform/performRecpProcActList')" alt="제출서 작성현황">제출서 작성현황</a><!-- performRecpProcActList -->
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="perform_02">
        <button type="button" alt="실적검색">
          <i class="bi bi-search"></i>
          <span class="links_name mini_hide">실적검색  <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">실적검색</span>
        <ul class="sub_menu">
          <li id="perform_0201"><!-- org : perform 0201 -->
            <a href="javascript:;" onclick="addTab('실적 조회', '/perform/performSearchList')" alt="실적 조회">실적 조회</a> <!-- performSearchList -->
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="perform_04">
        <button type="button" alt="실적관리">
          <i class="bi bi-calendar2-week-fill"></i>
          <span class="links_name mini_hide">실적관리  <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">실적관리</span>
        <ul class="sub_menu">
          <li id="perform_0402"><!-- org : perform 0202 -->
            <a href="javascript:;" onclick="addTab('실적 직권수정', '/perform/performModifyList')" alt="실적 직권수정">실적 직권수정</a> <!-- performModifyList -->
          </li>
          <li id="perform_0401"><!-- org : perform 0401 -->
            <a href="javascript:;" onclick="addTab('실적 소멸', '/perform/performExtcList')" alt="실적 소멸">실적 소멸</a><!-- performExtcList 		.여기까지개발 -->
          </li>
        </ul>
      </li>

      <li class="p-3 pb-0  pt-2  m-0" id="perform_03">
        <button type="button" alt="법인관리">
          <i class="bi bi-clipboard2-pulse-fill"></i>
          <span class="links_name mini_hide">법인관리  <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">법인관리</span>
        <ul class="sub_menu">
          <li id="perform_0305"><!-- org : perform 0603 -->
            <a href="javascript:;" onclick="addTab('법인신청 접수', '/perform/performCrnoOfficeReg')" alt="법인신청 접수">법인신청 접수</a> <!-- performCrnoOfficeRegForm -->
          </li>
          <li id="perform_0304"><!-- org : perform 0602 -->
            <a href="javascript:;" onclick="addTab('법인신청 접수내역', '/perform/getCrnoOfficeRecpList')" alt="법인신청 접수내역">법인신청 접수내역</a> <!-- performCrnoOfficeReceiptList -->
          </li>
          <li id="perform_0302"><!-- org : perform 0302 -->
            <a href="javascript:;" onclick="addTab('법인 병합 접수', '/perform/crnoMergeRegForm')" alt="법인 병합 접수">법인 병합 접수</a> <!-- crnoMergeRegForm -->
          </li>
          <li id="perform_0301"><!-- org : perform 0301 -->
            <a href="javascript:;" onclick="addTab('법인 병합 접수내역', '/perform/performMergeReciptList')" alt="법인 병합 접수내역">법인 병합 접수내역</a> <!-- performMergeReceiptList -->
          </li>
<!--           <li> -->
<!--             <a href="javascript:;" onclick="addTab('법인신청 현황 조회', '/perform/')" alt="법인신청 현황 조회">법인신청 현황 조회</a> 신설 -->
<!--           </li> -->
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2 m-0 mb-3" id="perform_09">
        <button type="button" alt="통계자료">
          <i class="bi bi-bar-chart-line-fill"></i>
          <span class="links_name mini_hide">통계자료 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">통계자료</span>
        <ul class="sub_menu">
          <li id="perform_0904"><!-- org : perform 0904 -->
            <a href="javascript:;" onclick="addTab('실적수수료 현황', '/perform/performPaymthIssueList')" alt="실적수수료 현황">실적수수료 현황</a>
          </li>
<!--           <li> -->
<!--             <a href="javascript:;" onclick="addTab('실적신고처리 현황', '/perform/')" alt="실적신고처리 현황">실적신고처리 현황</a> 신설 / 메뉴 사용안함-->
<!--           </li> -->
          <li id="perform_0905"><!-- org : perform 0905 -->
            <a href="javascript:;" onclick="addTab('교부금세세부대장', '/perform/performGrantIssueList')" alt="교부금세세부대장">교부금세세부대장</a>
          </li>
          <li id="perform_0906"><!-- org : perform 0906 -->
            <a href="javascript:;" onclick="addTab('행정처분결제 대장', '/perform/performPenaltyIssueList')" alt="행정처분결제 대장">행정처분결제 대장</a>
          </li>
        </ul>
      </li>
      </c:if>
      
      <c:if test = "${fn:startsWith(path, '/subarch')}">
      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="subarch_01">
        <button type="button" alt="신고서 접수">
          <i class="bi bi-clipboard-fill"></i>
          <span class="links_name mini_hide">신고서 접수 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">신고서 접수</span>
        <ul class="sub_menu">
          <li id="subarch_0101"><!-- org : subarch 0101 -->
            <a href="javascript:;" onclick="addTab('신고서 접수', '/subarch/subarchRegForm')" alt="신고서 접수">신고서 접수</a> <!-- register_declaration -->
          </li>
          <li id="subarch_0102"><!-- org : subarch 0102 -->
            <a href="javascript:;" onclick="addTab('신고서 접수내역', '/subarch/subarchNewList')" alt="신고서 접수내역">신고서 접수내역</a> <!-- register_details -->
          </li>
          <li id="subarch_0103"><!-- org : subarch 0103 -->
            <a href="javascript:;" onclick="addTab('변동신고서 접수', '/subarch/subarchAltForm')" alt="변동신고서 접수">변동신고서 접수</a> <!-- variation_declaration -->
          </li>
          <li id="subarch_0104"><!-- org : subarch 0104 -->
            <a href="javascript:;" onclick="addTab('변동신고서 접수내역', '/subarch/subarchAltList')" alt="변동신고서 접수내역">변동신고서 접수내역</a> <!-- variation_reception.html -->
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="subarch_02">
        <button type="button" alt="건축사보 검색">
          <i class="bi bi-search"></i>
          <span class="links_name mini_hide">건축사보 검색 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">건축사보 검색</span>
        <ul class="sub_menu">
          <li id="subarch_0201"><!-- org : subarch 0201 -->
            <a href="javascript:;" onclick="addTab('건축사보 조회', '/subarch/subarchList')" alt="건축사보 조회">건축사보 조회</a> <!-- sabarch_inquiry -->
          </li>
          <li id="subarch_0203"><!-- org : subarch 0203 -->
            <a href="javascript:;" onclick="addTab('건축사보 보유현황 조회', '/subarch/officeSubArchList')" alt="건축사보 보유현황 조회">건축사보 보유현황 조회</a> <!-- sabarch_status.html -->
          </li>
        </ul>
       
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="subarch_03">
        <button type="button" alt="건축사보 관리">
          <i class="bi bi-clipboard2-pulse-fill"></i>
          <span class="links_name mini_hide">건축사보 관리  <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">건축사보 관리</span>
        <ul class="sub_menu">
          <li id="subarch_0307"><!-- org : subarch 0202 -->
            <a href="javascript:;" onclick="addTab('건축사보 직권수정', '/subarch/subarchEditList')" alt="건축사보 직권수정">건축사보 직권수정</a> <!-- sabarch_modify -->
          </li>
          <li id="subarch_0301"><!-- org : subarch 0301 -->
            <a href="javascript:;" onclick="addTab('신고대장 출력', '/subarch/subarchRequestList')" alt="신고대장 출력">신고대장 출력</a> <!-- report_print -->
          </li>
          <li id="subarch_0302"><!-- org : subarch 0302 -->
            <a href="javascript:;" onclick="addTab('건축사보명부 출력', '/subarch/subarchDirectoryList')" alt="건축사보명부 출력">건축사보명부 출력</a> <!-- sabarch_print -->
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2 m-0 mb-3" id="subarch_04">
        <button type="button" alt="통계자료">
          <i class="bi bi-bar-chart-line-fill"></i>
          <span class="links_name mini_hide">통계자료 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">통계자료</span>
        <ul class="sub_menu">
          <li id="subarch_0401"><!-- org : subarch 0401 -->
            <a href="javascript:;" onclick="addTab('건축사보 현황', '/subarch/subarchStats')" alt="건축사보 현황">건축사보 현황</a> <!-- sabarch_situation -->
          </li>
          <li id="subarch_0402"><!-- org : subarch 0401 -->
            <a href="javascript:;" onclick="addTab('시도별 건축사보 현황', '/subarch/subarchStats2')" alt="시도별 건축사보 현황">시도별 건축사보 현황</a> <!-- sabarch_region -->
          </li>
          <li id="subarch_0403"><!-- org : subarch 0401 -->
            <a href="javascript:;" onclick="addTab('건축사보(신규)신고 현황', '/subarch/subarchStats3')" alt="건축사보(신규)신고 현황">건축사보(신규)신고 현황</a> <!-- sabarch_newsituation -->
          </li>
        </ul>
      </li>
      </c:if>
      
      <c:if test = "${fn:startsWith(path, '/supervise')}">
      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="supervise_01">
        <button type="button" alt="문서접수">
          <i class="bi bi-clipboard-fill"></i>
          <span class="links_name mini_hide">문서접수 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">문서접수</span>
        <ul class="sub_menu">
          <li id="supervise_0102"><!-- org : supervise 0102 -->
            <a href="javascript:;" onclick="addTab('접수내역', '/supervise/docuReceiptList')" alt="접수내역">접수내역</a>		<!-- acceptance_details.html -->	
          </li>
          <li id="supervise_0101"><!-- org : supervise 0101 -->
            <a href="javascript:;" onclick="addTab('문서접수', '/supervise/docuRegForm')" alt="문서접수">문서접수</a>	<!-- document_acceptance.html -->
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="supervise_04">
        <button type="button" alt="배치현황 검색">
          <i class="bi bi-search"></i>
          <span class="links_name mini_hide">배치현황 검색 <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">배치현황 검색</span>
        <ul class="sub_menu">
          <li id="supervise_0401"><!-- org : supervise 0401 -->
            <a href="javascript:;" onclick="addTab('사업개요 조회', '/supervise/inquiryConstructList')" alt="사업개요 조회">사업개요 조회</a>	<!-- business_overview.html -->
          </li>
          <li id="supervise_0402"><!-- org : supervise 0402 -->
            <a href="javascript:;" onclick="addTab('건축사보(감리원) 배치조회', '/supervise/inquiryDeployList')" alt="건축사보(감리원) 배치조회">건축사보(감리원) 배치조회</a> <!-- supervision_inquiry.html -->
          </li>
          <li id="supervise_0403"><!-- org : supervise 0403 -->
            <a href="javascript:;" onclick="addTab('교체빈도 조회', '/supervise/inquiryFrequencyList')" alt="교체빈도 조회">교체빈도 조회</a>	<!-- replacement_frequency.html --> <!-- inquiryDeployFrequencyList -->
          </li>
          <li id="supervise_0404"><!-- org : supervise 0404 -->
            <a href="javascript:;" onclick="addTab('수행결과평가 조회', '/supervise/inquiryEvaluationList')" alt="수행결과평가 조회">수행결과평가 조회</a>		<!-- results_performance.html -->
          </li>
        </ul>
       
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="supervise_02">
        <button type="button" alt="배치현황 관리">
          <i class="bi bi-clipboard2-pulse-fill"></i>
          <span class="links_name mini_hide">배치현황 관리  <i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">배치현황 관리</span>
        <ul class="sub_menu">
          <li id="supervise_0201"><!-- org : supervise 0201 -->
            <a href="javascript:;" onclick="addTab('사업개요 관리', '/supervise/constructList')" alt="사업개요 관리">사업개요 관리</a>		<!-- overview_management.html -->
          </li>
          <li id="supervise_0203"><!-- org : supervise 0203 -->
            <a href="javascript:;" onclick="addTab('건축사보(감리원) 관리', '/supervise/editDeployList')" alt="건축사보(감리원) 관리">건축사보(감리원) 관리</a> 		<!-- subarch_management.html -->
          </li>
        </ul>
      </li>
<!--       <li class="p-3 pb-0  pt-2 m-0 mb-3"> -->
<!--         <button type="button" alt="사실조회"> -->
<!--             <i class="bi bi-eye-fill"></i> -->
<!--           <span class="links_name mini_hide">사실조회 <i class="bi bi-chevron-down"></i></span> -->
<!--         </button> -->
<!--         <span class="tooltip">사실조회</span> -->
<!--         <ul class="sub_menu"> 사실조회부분 아직없음. -->
<!--           <li> -->
<!--             <a href="javascript:;" onclick="addTab('감리자 정보 조회', '/supervise/confAppointList')" alt="감리자 정보 조회">감리자 정보 조회</a>		supervision_inquery.html -->
<!--           </li> -->
<!--           <li> -->
<!--             <a href="javascript:;" onclick="addTab('건축사보(감리원) 정보 조회', '/supervise/confDeployList')" alt="건축사보(감리원) 정보 조회">건축사보(감리원) 정보 조회</a>		supervision_info.html -->
<!--           </li> -->
<!--         </ul> -->
<!--       </li> -->
      </c:if>
      
      
      
      
      
      
      
      
      
      
      
      <c:if test = "${fn:startsWith(path, '/foreign')}">
      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="foreign_01">
        <button type="button" alt="신고서 접수">
          <i class="bi bi-clipboard-fill"></i>
          <span class="links_name mini_hide">신고서 접수<i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">신고서 접수</span>
        <ul class="sub_menu">
          <li id="foreign_0101">
            <a href="javascript:;" onclick="addTab('신고서 접수', '/foreign/foreign_declaration')" alt="신고서 접수">신고서 접수</a>		<!-- .html -->	
          </li>
          <li id="foreign_0102">
            <a href="javascript:;" onclick="addTab('신고서 접수내역', '/foreign/foreign_details')" alt="신고서 접수내역">신고서 접수내역</a>	<!-- .html -->
          </li>
          <li id="foreign_0103">
            <a href="javascript:;" onclick="addTab('변동신고 접수', '/foreign/change_declaration')" alt="변동신고 접수">변동신고 접수</a>	<!-- .html -->
          </li>
          <li id="foreign_0104">
            <a href="javascript:;" onclick="addTab('변동신고 접수내역', '/foreign/change_reception')" alt="변동신고 접수내역">변동신고 접수내역</a>	<!-- .html -->
          </li>
        </ul>
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="foreign_02">
        <button type="button" alt="정보검색">
          <i class="bi bi-search"></i>
          <span class="links_name mini_hide">정보검색<i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">정보검색</span>
        <ul class="sub_menu">
          <li id="foreign_0201">
            <a href="javascript:;" onclick="addTab('외국건축사 조회', '/foreign/foreign_inquiry')" alt="외국건축사 조회">외국건축사 조회</a>	<!-- .html -->
          </li>
        </ul>
       
      </li>
      <li class="p-3 pb-0  pt-2  m-0" id="foreign_03">
        <button type="button" alt="정보관리">
          <i class="bi bi-clipboard2-pulse-fill"></i>
          <span class="links_name mini_hide">정보관리<i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">정보관리</span>
        <ul class="sub_menu">
          <li id="foreign_0301">
            <a href="javascript:;" onclick="addTab('외국건축사 직권수정', '/foreign/foreign_modify')" alt="외국건축사 직권수정">외국건축사 직권수정</a>		<!-- .html -->
          </li>
          <li id="foreign_0302">
            <a href="javascript:;" onclick="addTab('신고대장 출력', '/foreign/foreign_print')" alt="신고대장 출력">신고대장 출력</a>
          </li>
          <li id="foreign_0303">
            <a href="javascript:;" onclick="addTab('신고확인증 출력', '/foreign/foreignchk_print')" alt="신고확인증 출력">신고확인증 출력</a>
          </li>
        </ul>
      </li>
      
      <li class="p-3 pb-0  pt-2  m-0" id="foreign_04">
        <button type="button" alt="통계자료">
          <i class="bi bi-bar-chart-line-fill"></i>
          <span class="links_name mini_hide">통계자료<i class="bi bi-chevron-down"></i></span>
        </button>
        <span class="tooltip">통계자료</span>
        <ul class="sub_menu">
          <li id="foreign_0401">
            <a href="javascript:;" onclick="addTab('자격별 통계', '/foreign/qualification_statistics')" alt="자격별 통계">자격별 통계(페이지 없음)</a>		
          </li>
          <li id="foreign_0402">
            <a href="javascript:;" onclick="addTab('국가별 통계', '/foreign/country_statistics')" alt="국가별 통계">국가별 통계(페이지 없음)</a> 		
          </li>
          <li id="foreign_0403">
            <a href="javascript:;" onclick="addTab('년도별/월별 신고 통계', '/foreign/report_statistics')" alt="년도별/월별 신고 통계">년도별/월별 신고 통계(페이지 없음)</a> 		
          </li>
        </ul>
      </li>
      </c:if>
      
      
      
      
      
      
      
      <!--  -->
      
      <c:if test = "${fn:startsWith(path, '/issue1')}">
      	<li class="p-3 pb-0 pt-2 m-0 mt-3" id="issue_01">
            <button type="button" alt="건축사">
                <i class="bi bi-building"></i>
              <span class="links_name mini_hide">건축사 <i class="bi bi-chevron-down"></i></span>
            </button>
            <span class="tooltip">건축사</span>
            <ul class="sub_menu">
              <li id="issue_0101">
                <a href="javascript:;" onclick="addTab('건축사 행정처분 조회서', '/issue/measureIssueList?p_issue_type=1')" alt="건축사 행정처분 조회서">건축사 행정처분 조회서</a>	<!-- disposition_inquiry.html -->
              </li>
              <li id="issue_0102">
                <a href="javascript:;" onclick="addTab('정회원 증명서', '/issue/regularIssueList?p_issue_type=1')" alt="정회원 증명서">정회원 증명서</a>		<!-- member_certificate.html -->
              </li>
              <li id="issue_0103">
                <a href="javascript:;" onclick="addTab('건축사 증명발급대장', '/issue/reportIssueList?p_issue_type=1')" alt="건축사 증명발급대장">건축사 증명발급대장</a>		<!-- certificate_issuance.html -->
              </li>
            </ul>
          </li>
          <li class="p-3 pb-0 pt-2 m-0" id="issue_02">
            <button type="button" alt="건축사 실적">
                <i class="bi bi-clipboard2-data-fill"></i>
              <span class="links_name mini_hide">건축사 실적 <i class="bi bi-chevron-down"></i></span>
            </button>
            <span class="tooltip">건축사 실적</span>
            <ul class="sub_menu">
              <li id="issue_0201">
                <a href="javascript:;" onclick="addTab('증명서 신청내역', '/issue/performCrtfRecpList?p_issue_type=1')" alt="증명서 신청내역">증명서 신청내역</a>		<!-- certicate_apphistory.html -->
              </li>
              <li id="issue_0202">
                <a href="javascript:;" onclick="addTab('실적 증명발급대장', '/issue/performCrtfReportList?p_issue_type=1')" alt="실적 증명발급대장">실적 증명발급대장</a>		<!-- performance_issuance.html -->
              </li>
            </ul>
           
          </li>
          <li class="p-3 pb-0  pt-2  m-0" id="issue_03">
            <button type="button" alt="건축사보">
                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
              <span class="links_name mini_hide">건축사보 <i class="bi bi-chevron-down"></i></span>
            </button>
            <span class="tooltip">건축사보</span>
            <ul class="sub_menu">
              <li id="issue_0301">
                <a href="javascript:;" onclick="addTab('건축사보 신고확인증', '/issue/subarchConfList?p_issue_type=1')" alt="건축사보 신고확인증">건축사보 신고확인증</a>		<!-- subarch_report.html -->
              </li>
              <li id="issue_0302">
                <a href="javascript:;" onclick="addTab('건축사보 경력증명서', '/issue/subarchCareerList?p_issue_type=1')" alt="건축사보 경력증명서">건축사보 경력증명서</a>		<!-- subarch_career.html -->
              </li>
              <li id="issue_0303">
                <a href="javascript:;" onclick="addTab('건축사보 증명발급대장', '/issue/subarchIssueList?p_issue_type=1')" alt="건축사보 증명발급대장">건축사보 증명발급대장</a>		<!-- subarch_issuance.html -->
              </li>
            </ul>
          </li>
<!--           <li class="p-3 pb-0  pt-2 m-0 mb-3"> -->
<!--             <button type="button" alt="내부확인용"> -->
<!--                 <i class="bi bi-clipboard-check-fill"></i> -->
<!--               <span class="links_name mini_hide">내부확인용 <i class="bi bi-chevron-down"></i></span> -->
<!--             </button> -->
<!--             <span class="tooltip">내부확인용</span> -->
<!--             <ul class="sub_menu"> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사 행정처분 조회서', '/issue')" alt="건축사 행정처분 조회서">건축사 행정처분 조회서</a>		disposition_inquiry.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('정회원 증명서', '/issue')" alt="정회원 증명서">정회원 증명서</a>		member_certificate.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사실적증명서', '/issue')" alt="건축사실적증명서">건축사실적증명서</a>		performance_issuance.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사보 신고확인증', '/issue')" alt="건축사보 신고확인증">건축사보 신고확인증</a>		subarch_report.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사보 경력증명서', '/issue')" alt="건축사보 경력증명서">건축사보 경력증명서</a>		subarch_career.html -->
<!--                 </li> -->
<!--             </ul> -->
<!--           </li> -->
          <!--  -->
      </c:if>
      
      
      <c:if test = "${fn:startsWith(path, '/issue2')}">
      	<li class="p-3 pb-0 pt-2 m-0 mt-3" id="issue_01">
            <button type="button" alt="건축사">
                <i class="bi bi-building"></i>
              <span class="links_name mini_hide">건축사 <i class="bi bi-chevron-down"></i></span>
            </button>
            <span class="tooltip">건축사</span>
            <ul class="sub_menu">
              <li id="issue_0101">
                <a href="javascript:;" onclick="addTab('건축사 행정처분 조회서', '/issue/measureIssueList?p_issue_type=2')" alt="건축사 행정처분 조회서">건축사 행정처분 조회서</a>	<!-- disposition_inquiry.html -->
              </li>
              <li id="issue_0102">
                <a href="javascript:;" onclick="addTab('정회원 증명서', '/issue/regularIssueList?p_issue_type=2')" alt="정회원 증명서">정회원 증명서</a>		<!-- member_certificate.html -->
              </li>
<!--               <li id="issue_0103"> -->
<!--                 <a href="javascript:;" onclick="addTab('건축사 증명발급대장', '/issue/reportIssueList')" alt="건축사 증명발급대장">건축사 증명발급대장</a>		certificate_issuance.html -->
<!--               </li> -->
            </ul>
          </li>
          <li class="p-3 pb-0 pt-2 m-0" id="issue_02">
            <button type="button" alt="건축사 실적">
                <i class="bi bi-clipboard2-data-fill"></i>
              <span class="links_name mini_hide">건축사 실적 <i class="bi bi-chevron-down"></i></span>
            </button>
            <span class="tooltip">건축사 실적</span>
            <ul class="sub_menu">
              <li id="issue_0201">
                <a href="javascript:;" onclick="addTab('건축사 설계업무 실적증명서', '/issue/performInsdConfList?p_issue_type=2')" alt="건축사 설계업무 실적증명서">건축사 설계업무 실적증명서</a>		<!-- certicate_apphistory.html -->
              </li>
              <li id="issue_0202">
                <a href="javascript:;" onclick="addTab('건축사 감리업무 실적증명서', '/issue/performInsdConfList2?p_issue_type=2')" alt="실적 증명발급대장">건축사 감리업무 실적증명서</a>		<!-- performance_issuance.html -->
              </li>
<!--               <li id="issue_0202"> -->
<!--                 <a href="javascript:;" onclick="addTab('법인감리 실적증명서', '/issue/performCrtfReportList')" alt="실적 증명발급대장">법인감리 실적증명서</a>		performance_issuance.html -->
<!--               </li> -->
            </ul>
           
          </li>
          <li class="p-3 pb-0  pt-2  m-0" id="issue_03">
            <button type="button" alt="건축사보">
                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
              <span class="links_name mini_hide">건축사보 <i class="bi bi-chevron-down"></i></span>
            </button>
            <span class="tooltip">건축사보</span>
            <ul class="sub_menu">
              <li id="issue_0301">
                <a href="javascript:;" onclick="addTab('건축사보 신고확인증', '/issue/subarchConfList?p_issue_type=2')" alt="건축사보 신고확인증">건축사보 신고확인증</a>		<!-- subarch_report.html -->
              </li>
              <li id="issue_0302">
                <a href="javascript:;" onclick="addTab('건축사보 경력증명서', '/issue/subarchCareerList?p_issue_type=2')" alt="건축사보 경력증명서">건축사보 경력증명서</a>		<!-- subarch_career.html -->
              </li>
            </ul>
          </li>
<!--           <li class="p-3 pb-0  pt-2 m-0 mb-3"> -->
<!--             <button type="button" alt="내부확인용"> -->
<!--                 <i class="bi bi-clipboard-check-fill"></i> -->
<!--               <span class="links_name mini_hide">내부확인용 <i class="bi bi-chevron-down"></i></span> -->
<!--             </button> -->
<!--             <span class="tooltip">내부확인용</span> -->
<!--             <ul class="sub_menu"> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사 행정처분 조회서', '/issue')" alt="건축사 행정처분 조회서">건축사 행정처분 조회서</a>		disposition_inquiry.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('정회원 증명서', '/issue')" alt="정회원 증명서">정회원 증명서</a>		member_certificate.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사실적증명서', '/issue')" alt="건축사실적증명서">건축사실적증명서</a>		performance_issuance.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사보 신고확인증', '/issue')" alt="건축사보 신고확인증">건축사보 신고확인증</a>		subarch_report.html -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="javascript:;" onclick="addTab('건축사보 경력증명서', '/issue')" alt="건축사보 경력증명서">건축사보 경력증명서</a>		subarch_career.html -->
<!--                 </li> -->
<!--             </ul> -->
<!--           </li> -->
          <!--  -->
      </c:if>
      
      <c:if test = "${fn:startsWith(path, '/basic')}">
      
<!-- 	      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="" > -->
<!-- 	        <button type="button" alt="대시보드"> -->
<!-- 	          <i class="bi bi-clipboard-fill"></i> -->
<!-- 	          <span class="links_name mini_hide">대시보드 <i class="bi bi-chevron-down"></i></span> -->
<!-- 	        </button> -->
<!-- 	        <span class="tooltip">대시보드</span> -->
<!-- 	        <ul class="sub_menu"> -->
<!-- 	          <li id="">	org : member 0101 -->
<!-- 	            <a href="javascript:;" onclick="addTab('접수내역', '')" alt="대시보드">대시보드</a> -->
<!-- 	          </li> -->
<!-- 	        </ul> -->
<!-- 	      </li> -->
      
	      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="office_01">
	        <button type="button" alt="">
	            <i class="bi bi-stack-overflow"></i>
	          <span class="links_name mini_hide">건축사사무소 정보 검색 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">건축사사무소 정보 검색</span>
	        <ul class="sub_menu">
	          <li id="office_0101">
	            <a href="javascript:;" onclick="addTab('사무소 검색', '/office/officeList')" alt="사무소 검색">사무소 검색</a> <!-- search_office.html -->
	          </li>
	        </ul>
	      </li>
	      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="safety_01">
	        <button type="button" alt="보안관리">
	            <i class="bi bi-person-badge-fill"></i>
	          <span class="links_name mini_hide">개인정보 안전성 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">개인정보 안전성</span>
	        <ul class="sub_menu">
	          <li id="safety_0101">
	            <a href="javascript:;" onclick="addTab('접속내역 목록', '/safety/accessList')" alt="접속내역 목록">접속내역 목록</a> 
	          </li>
	          <li id="safety_0102">
	            <a href="javascript:;" onclick="addTab('접속활동내역 목록', '/safety/activityList')" alt="접속활동내역 목록">접속활동내역 목록</a>
	          </li>
	          <li id="safety_0103">
	            <a href="javascript:;" onclick="addTab('비정상행위내역 목록', '/safety/abnormalList')" alt="비정상행위내역 목록">비정상행위내역 목록</a>
	          </li>
	        </ul>
	      </li>
<!-- 	      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="home_01"> -->
<!-- 	        <button type="button" alt="아이디 검색"> -->
<!-- 	            <i class="bi bi-stack-overflow"></i> -->
<!-- 	          <span class="links_name mini_hide">아이디 검색 <i class="bi bi-chevron-down"></i></span> -->
<!-- 	        </button> -->
<!-- 	        <span class="tooltip">아이디 검색</span> -->
<!-- 	        <ul class="sub_menu"> -->
<!-- 	          <li id="home_0101"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('아이디 검색', '/home/userList')" alt="아이디 검색">아이디 검색</a>  -->
<!-- 	          </li> -->
<!-- 	        </ul> -->
<!-- 	      </li> -->
<!-- 	      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="basic_01"> -->
<!-- 	        <button type="button" alt="임원/위원회관리"> -->
<!-- 	            <i class="bi bi-person-badge-fill"></i> -->
<!-- 	          <span class="links_name mini_hide">임원/위원회관리 <i class="bi bi-chevron-down"></i></span> -->
<!-- 	        </button> -->
<!-- 	        <span class="tooltip">임원/위원회관리</span> -->
<!-- 	        <ul class="sub_menu"> -->
<!-- 	          <li id="basic_0101"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('임원/위원회 관리', '/basic/committeeList')" alt="임원/위원회 관리">임원/위원회 관리</a> director_manage.html -->
<!-- 	          </li> -->
<!-- 	          <li id="basic_0102"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('임원/위원 관리', '/basic/memberList')" alt="임원/위원 관리">임원/위원 관리</a>	executive_manage.html -->
<!-- 	          </li> -->
<!-- 	          <li id="basic_0103"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('건축사회 정보', '/basic/localList')" alt="건축사회 정보">건축사회 정보</a>			subarch_info.html -->
<!-- 	          </li> -->
<!-- 	          <li id="basic_0104"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('사원 관리', '/basic/templeList')" alt="사원 관리">사원 관리</a>			employee_manage.html -->
<!-- 	          </li> -->
<!-- 	        </ul> -->
<!-- 	      </li> -->
			<li class="p-3 pb-0 pt-2 m-0 mt-3" id="basic_01">
	        <button type="button" alt="본부 및 시도 관리자">
	            <i class="bi bi-person-badge-fill"></i>
	          <span class="links_name mini_hide">본부 및 시도 관리자 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">본부 및 시도 관리자</span>
	        <ul class="sub_menu">
<!-- 	          <li id="basic_0101"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('임원/위원회 관리', '/basic/committeeList')" alt="임원/위원회 관리">임원/위원회 관리</a> director_manage.html -->
<!-- 	          </li> -->
<!-- 	          <li id="basic_0102"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('임원/위원 관리', '/basic/memberList')" alt="임원/위원 관리">임원/위원 관리</a>	executive_manage.html -->
<!-- 	          </li> -->
<!-- 	          <li id="basic_0103"> -->
<!-- 	            <a href="javascript:;" onclick="addTab('건축사회 정보', '/basic/localList')" alt="건축사회 정보">건축사회 정보</a>			subarch_info.html -->
<!-- 	          </li> -->
	          <li id="basic_0104">
	            <a href="javascript:;" onclick="addTab('사원 관리', '/basic/templeList')" alt="사원 관리">사원 관리</a>			<!-- employee_manage.html -->
	          </li>
	          <li id="basic_0105">
	            <a href="javascript:;" onclick="addTab('개인정보취급자 관리', '/basic/staffList')" alt="개인정보취급자 관리">개인정보취급자 관리</a>			<!-- employee_manage.html -->
	          </li>
	        </ul>
	      </li>
	      <li class="p-3 pb-0 pt-2 m-0 mb-3" id="basic_02">
	        <button type="button" alt="코드관리">
	            <i class="bi bi-code-square"></i>
	          <span class="links_name mini_hide">코드관리 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">코드관리</span>
	        <ul class="sub_menu">
	          <li id="basic_0201"> 
	            <a href="javascript:;" onclick="addTab('코드 관리', '/basic/mstCodeList')" alt="코드 관리">코드 관리</a>		<!-- code_manage.html -->
	          </li>
	        </ul>
	      </li>
	      
      </c:if>
      
      
      
      <c:if test = "${fn:startsWith(path, '/auth1')}">
      	  <li class="p-3 pb-0 pt-2 m-0 mt-3" id="home_01">
	        <button type="button" alt="아이디 검색">
	            <i class="bi bi-stack-overflow"></i>
	          <span class="links_name mini_hide">홈페이지 사용자 계정 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">홈페이지 사용자 계정</span>
	        <ul class="sub_menu">
	          <li id="home_0101">
	            <a href="javascript:;" onclick="addTab('홈페이지 사용자 계정', '/home/userList')" alt="홈페이지 사용자 계정">홈페이지 사용자 계정</a> 
	          </li>
	        </ul>
	      </li>
	      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="basic_01">
	        <button type="button" alt="본부 및 시도 관리자">
	            <i class="bi bi-person-badge-fill"></i>
	          <span class="links_name mini_hide">본부 및 시도 관리자 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">본부 및 시도 관리자</span>
	        <ul class="sub_menu">
	          <li id="basic_0104">
	            <a href="javascript:;" onclick="addTab('사원 관리', '/basic/templeList')" alt="사원 관리">사원 관리</a>			<!-- employee_manage.html -->
	          </li>
	        </ul>
	      </li>
      </c:if>
      
      
		<c:if test = "${fn:startsWith(path, '/auth2')}">
	      <li class="p-3 pb-0  pt-2  m-0" id="member_03">
	        <button type="button" alt="정보검색">
	          <i class="bi bi-search"></i>
	          <span class="links_name mini_hide">정회원(건축사) 검색  <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">정회원(건축사) 검색</span>
	        <ul class="sub_menu">
	          <li id="member_0301"><!-- org : member 0301 -->
	            <a href="javascript:;" onclick="addTab('정회원(건축사)검색', '/member/memberList')" alt="정회원(건축사)검색">정회원(건축사) 검색</a>
	          </li>
	        </ul>
	      </li>
      	  <li class="p-3 pb-0 pt-2 m-0 mt-3" id="home_01">
	        <button type="button" alt="아이디 검색">
	            <i class="bi bi-stack-overflow"></i>
	          <span class="links_name mini_hide">홈페이지 사용자 계정 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">홈페이지 사용자 계정</span>
	        <ul class="sub_menu">
	          <li id="home_0101">
	            <a href="javascript:;" onclick="addTab('아이디 검색', '/home/userList?first=true')" alt="홈페이지 사용자 계정">홈페이지 사용자 계정</a> 
	          </li>
	        </ul>
	      </li>
	      <li class="p-3 pb-0 pt-2 m-0 mt-3" id="basic_01">
	        <button type="button" alt="본부 및 시도 관리자">
	            <i class="bi bi-person-badge-fill"></i>
	          <span class="links_name mini_hide">임원/위원회 <i class="bi bi-chevron-down"></i></span>
	        </button>
	        <span class="tooltip">임원/위원회</span>
	        <ul class="sub_menu">
	          <li id="basic_0101">
	            <a href="javascript:;" onclick="addTab('임원/위원회 관리', '/basic/committeeList')" alt="임원/위원회 관리">임원/위원회 관리</a> 
	          </li>
	          <li id="basic_0102">
	            <a href="javascript:;" onclick="addTab('임원/위원 관리', '/basic/memberList')" alt="임원/위원 관리">임원/위원 관리</a>	
	          </li>
	        </ul>
	      </li>
      </c:if>      
      
      
      <li class="px-3 mb-0 pt-3 logOut mt-auto border-top mt-3 ">
        <a href="/logout" alt="프로그램 종료">
          <i class="bi bi-power"></i>
          <span class="links_name mini_hide">프로그램 종료</span>
        </a>
        <span class="tooltip">프로그램 종료</span>
      </li>
    </ul>
  </div>
