var defaultTable;
$(document).ready(function () {
	
	window.history.pushState(null, null, window.location.href);
	window.onpopstate = function () {
	window.history.go(1);
	};
	
  // input date 괄호 없애기
  $("input[type='date']").each(function() {
    const originalValue = $(this).val();
    const sanitizedValue = originalValue.replace(/[()]/g, '');
    $(this).val(sanitizedValue);
  });
  // 모달 z-index값 조정
  $(document).on('show.bs.modal', '.modal', function(event) {
    var zIndex = 1040 + (10 * $('.modal:visible').length);
    $(this).css('z-index', zIndex);
    setTimeout(function() {
      $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
  });


  // PC인지 모바일인지 확인
  var isMobile = /iPhone|iPad|iPod|Android|webOS|BlackBerry|Opera Mini|IEMobile|Mobile/i.test(navigator.userAgent);

  if (isMobile) {
    $(".sidebar li.pb-0").click(function () {
      if (!$(".sidebar").hasClass("open")) {
        console.log("모바일");
        // 사이드바 메뉴 버튼 누를 시, 사이드바 펼치기.

        if ($(".sidebar").hasClass("open")) {
          $(".sidebar").removeClass("open");
          $(".dark_bg").fadeOut();
          $(".logo-details").hide();
          $(".logo-details").fadeIn(500);
          $(".sidebar .nav-list").hide();
          $(".sidebar .nav-list").fadeIn(500);
          $("#search-side-btn").show();
          $("#menu-search-btn").hide();

        } else {
          $(".sidebar").addClass("open")
          $(".dark_bg").fadeIn();
          $(".logo-details").hide();
          $(".logo-details").fadeIn(500);
          $(".sidebar .nav-list").hide();
          $(".sidebar .nav-list").fadeIn(500);
          $("#search-side-btn").hide();
          $("#menu-search-btn").show();
        }
      }
    });
    // 사이드바 백그라운드 클릭 시, 사이드바 축소
    $(".dark_bg").click(
      function () {
        $(".sidebar").removeClass("open");
        $(".dark_bg").fadeOut();
        $(".logo-details").hide();
        $(".logo-details").fadeIn(500);
        $(".sidebar .nav-list").hide();
        $(".sidebar .nav-list").fadeIn(500);
        $("#menu-search-btn").hide();
        $(".sidebar li.pb-0").children(".sub_menu").removeClass("sub_show");
      }
    );

  }
  //내부코드 표 추가
  $('#code_add_btn').click(function () {
    $('#code_table tbody:last').append('<tr><th>1</th><td><input type="text" name="com_cd" class="form-control"></td><td><input type="text" name="cd_val1" class="form-control"></td><td><input type="text" name="cd_val2" class="form-control"></td><td><input type="text" name="cd_val3" class="form-control"></td><td><select name="use_yn" class="form-select" style="min-width: 80px; text-align: left !important;"><option value="Y" selected="">사용</option><option value="N">미사용</option></select></td><td><input type="text" name="ord_seq" class="form-control"></td><td><button type="button" class="btn btn-default">삭제</button></td><td></td></tr>');
  });


  //건축사보 수수료관리 표 추가
  $('#fee_add_btn').click(function () {
    $('#fee_management_table tbody:last').append('<tr><th>1</th><td><input type="text" class="form-control"></td><td><input type="text" class="form-control"></td><td><div class="d-flex"><input type="text" name="ent_amt" class="form-control" value="2,000"><span>원</span></div></td><td></td>');
    $('.delete_btn_row').click(function () {
      $(this).parents('tr').remove();
    });
  });
  $('.delete_btn_row').click(function () {
    $(this).parents('tr').remove();
  });


  //신고 구분 타입 라디오 클릭시 테이블 show hide 여부
  var report_class = $('input:radio[name=report_class]:checked').val();
  if (report_class == 2) {
    $(".report_table").show();
  } else {
    $(".report_table").hide();
  }
  $('input:radio[name=report_class]').click(function () {
    var report_class = $('input:radio[name=report_class]:checked').val();
    if (report_class == 2) {
      $(".report_table").show();
    } else {
      $(".report_table").hide();
    }
  });

  // 통계 기간 선택
  var schopt = $('input:radio[name=schopt]:checked').val();
  if (schopt == 1) {
    $(".month_st").attr("disabled", true);
    $(".day_st").attr("disabled", true);
    $(".date_end").attr("disabled", true);
  } else if (schopt == 2) {
    $(".month_st").attr("disabled", false);
    $(".day_st").attr("disabled", true);
    $(".date_end").attr("disabled", true);
  } else if (schopt == 3) {
    $(".month_st").attr("disabled", false);
    $(".day_st").attr("disabled", false);
    $(".date_end").attr("disabled", true);
  } else if (schopt == 4) {
    $(".month_st").attr("disabled", false);
    $(".day_st").attr("disabled", false);
    $(".date_end").attr("disabled", false);
  }
  $('input:radio[name=schopt]').click(function () {
    var schopt = $('input:radio[name=schopt]:checked').val();
    if (schopt == 1) {
      $(".month_st").attr("disabled", true);
      $(".day_st").attr("disabled", true);
      $(".date_end").attr("disabled", true);
    } else if (schopt == 2) {
      $(".month_st").attr("disabled", false);
      $(".day_st").attr("disabled", true);
      $(".date_end").attr("disabled", true);
    } else if (schopt == 3) {
      $(".month_st").attr("disabled", false);
      $(".day_st").attr("disabled", false);
      $(".date_end").attr("disabled", true);
    } else if (schopt == 4) {
      $(".month_st").attr("disabled", false);
      $(".day_st").attr("disabled", false);
      $(".date_end").attr("disabled", false);
    }
  });


  //법령구분 라디오 클릭시 검색 변환
  var juso = $('input:radio[name=statutory_class]:checked').val();
  if (juso == 2) {
    $(".statutory_wrap2").show();
    $(".statutory_wrap1").hide();
  } else {
    $(".statutory_wrap1").show();
    $(".statutory_wrap2").hide();
  }
  $('input:radio[name=statutory_class]').click(function () {
    var juso = $('input:radio[name=statutory_class]:checked').val();
    if (juso == 2) {
      $(".statutory_wrap2").show();
      $(".statutory_wrap1").hide();
    } else {
      $(".statutory_wrap1").show();
      $(".statutory_wrap2").hide();
    }
  });

  //주소 타입 라디오 클릭시 검색 변환
  var juso = $('input:radio[name=jusotype]:checked').val();
  if (juso == 2) {
    $(".juso_wrap2").show();
    $(".juso_wrap1").hide();
  } else {
    $(".juso_wrap1").show();
    $(".juso_wrap2").hide();
  }
  $('input:radio[name=jusotype]').click(function () {
    var juso = $('input:radio[name=jusotype]:checked').val();
    if (juso == 2) {
      $(".juso_wrap2").show();
      $(".juso_wrap1").hide();
    } else {
      $(".juso_wrap1").show();
      $(".juso_wrap2").hide();
    }
  });

  //배치현황 교체빈도 조회 라디오 클릭시 표 변환
  $('#jncn_yn_btn').click(function () {
    $('#jncn_yn_table tbody:last').append('<tr><th>1</th><td><input type="text" class="form-control"></td><td><input type="text" class="form-control"></td><td><input type="text" class="form-control"></td><td><input type="text" class="form-control"></td><td><div class="d-flex"><input type="text" class="form-control"><span>%</span></div></td><td><button class="btn btn-secondary delete_btn_row" type="button">삭제</button></td></tr>');
    $('.delete_btn_row').click(function () {
      $(this).parents('tr').remove();
    });
  });
  $('.delete_btn_row').click(function () {
    $(this).parents('tr').remove();
  });

  var jncn_yn = $('input:radio[name=jncn_yn]:checked').val();
  if (jncn_yn == 2) {
    $(".jncn_yn2_chk").show();
  } else {
    $(".jncn_yn2_chk").hide();
  }
  $('input:radio[name=jncn_yn]').click(function () {
    var jncn_yn = $('input:radio[name=jncn_yn]:checked').val();
    if (jncn_yn == 2) {
      $(".jncn_yn2_chk").show();
    } else {
      $(".jncn_yn2_chk").hide();
    }
  });



  var radio_val = $('input:radio[name=who_frequency]:checked').val();
  if (radio_val == 1) {
    $(".replacement_con1").show();
    $(".replacement_con2").hide();
  } else {
    $(".replacement_con1").hide();
    $(".replacement_con2").show();
  }
  $('input:radio[name=who_frequency]').click(function () {
    var radio_val = $('input:radio[name=who_frequency]:checked').val();
    if (radio_val == 1) {
      $(".replacement_con1").show();
      $(".replacement_con2").hide();
    } else {
      $(".replacement_con1").hide();
      $(".replacement_con2").show();
    }
  });

  //모바일 vh 높이 맞추기.
  let vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty('--vh', `${vh}px`);

  // resize
  window.addEventListener('resize', () => {
    let vh = window.innerHeight * 0.01;
    document.documentElement.style.setProperty('--vh', `${vh}px`);
  })
  // jquery 테이블
  defaultTable = $('.sort_table').DataTable({
	searching: false,
    autoWidth: false,
    paging: false,
    info: false,
	order: [[ 0, 'desc' ]]
  });



  $('.sort_table tr').click(function (e) {
    $('.sort_table tr').removeClass('highlighted');
    $(this).toggleClass('highlighted');
  });
  // 메뉴 버튼 클릭 시, 서브메뉴 보이게 하기
  $(".sidebar > ul > li > button").click(
    function () {
      $(".sidebar > ul > li ul").removeClass("sub_show");
      $(this).parent().children("ul").addClass("sub_show");
    }
  );


  // 사이드바 1200px 디바이스 반응
  if ($(window).width() < 1281) {
    $(".sidebar").removeClass("open");
    $("#side_btn").removeClass("hide");
    $("#search-side-btn").show();
    $("#menu-search-btn").hide();
    $(".home-section").click(
      function () {
        $(".sidebar > ul > li ul").removeClass("sub_show");
      }
    );
    $(".navbar").click(
      function () {
        $(".sidebar > ul > li ul").removeClass("sub_show");
      }
    );

    $(".sidebar li.pb-0").on("mouseenter", function () {
      if (!$(".sidebar").hasClass("open")) {
        $(this).children(".sub_menu").addClass("sub_show");
      }
    }).on("mouseleave", function () {
      if (!$(".sidebar").hasClass("open")) {
        $(this).children(".sub_menu").removeClass("sub_show");
      }
    });

  } else {
    $(".sidebar").addClass("open");
    $("#side_btn").addClass("hide");
    $("#search-side-btn").hide();
    $("#menu-search-btn").show();
  }



  // 테이블 검색 설정 버튼 방향키
  $(".table-option-btn").click(
    function () {
      if ($(".table-option-btn").hasClass("collapsed")) {
        $(".table-option-btn").removeClass('rotate');
      } else {
        $(".table-option-btn").removeClass('rotate');
      }
    }
  );
  // 테이블 검색 컬렙스
  if ($(window).width() < 1201) {
    $(".search-nav .navbar-collapse").addClass("collapse");
  }
  // 사이드바 버튼 클릭 이벤트
  $("#side_btn").click(
    function () {
      if ($(".sidebar").hasClass("open")) {
        $(".sidebar").removeClass("open");
        $(".dark_bg").fadeOut();
        $(".logo-details").hide();
        $(".logo-details").fadeIn(500);
        $(".sidebar .nav-list").hide();
        $(".sidebar .nav-list").fadeIn(500);
        $("#search-side-btn").show();
        $("#menu-search-btn").hide();

      } else {
        $(".sidebar").addClass("open")
        $(".dark_bg").fadeIn();
        $(".logo-details").hide();
        $(".logo-details").fadeIn(500);
        $(".sidebar .nav-list").hide();
        $(".sidebar .nav-list").fadeIn(500);
        $("#search-side-btn").hide();
        $("#menu-search-btn").show();
      }
    }
  );
  // 사이드바 메뉴 서치 버튼 누를 시, 사이드바 펼치기.
  $("#search-side-btn").click(
    function () {
      if ($(".sidebar").hasClass("open")) {
        $(".sidebar").removeClass("open");
        $(".dark_bg").fadeOut();
        $(".logo-details").hide();
        $(".logo-details").fadeIn(500);
        $(".sidebar .nav-list").hide();
        $(".sidebar .nav-list").fadeIn(500);
      } else {
        $(".sidebar").addClass("open")
        $(".dark_bg").fadeIn();
        $(".logo-details").hide();
        $(".logo-details").fadeIn(500);
        $(".sidebar .nav-list").hide();
        $(".sidebar .nav-list").fadeIn(500);
        $(this).hide();
        $("#menu-search-btn").show();
      }
    }
  );
  // 사이드바 백그라운드 클릭 시, 사이드바 축소
  $(".dark_bg").click(
    function () {
      $(".sidebar").removeClass("open");
      $(".dark_bg").fadeOut();
      $(".logo-details").hide();
      $(".logo-details").fadeIn(500);
      $(".sidebar .nav-list").hide();
      $(".sidebar .nav-list").fadeIn(500);
      $("#menu-search-btn").hide();
      $("#search-side-btn").show();
    }
  );
  // 탭 캐러셀
  $('.owl-carousel').owlCarousel({
    loop: false,
    margin: 10,
    dots: false,
    responsiveClass: true,
    responsive: {
      0: {
        items: 1,
        nav: true
      },
      600: {
        items: 2,
        nav: true
      },
      700: {
        items: 3,
        nav: true
      },
      991: {
        items: 4,
        nav: true
      },
      1600: {
        items: 6,
        nav: true
      }

    }
  })
  //툴팁 활성화
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
  const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))


  //height 600이하면 메뉴 클릭 시, 사이드 메뉴 펼치기
  if ($(window).height() < 601) {
    $(".sidebar .nav-list > li > button").click(
      function () {
        $(".sidebar").addClass("open");
        $(".dark_bg").fadeIn();
        $("#menu-search-btn").show();
        $("#search-side-btn").hide();
      }
    );
    $(".sidebar .logo-details .btn").click(
      function () {
        $(".sub_menu").removeClass("sub_show");
      }
    );
    $(".dark_bg").click(
      function () {
        $(".sub_menu").removeClass("sub_show");
      }
    );
  }
  if ($(window).width() > 1280) {
    $(".sidebar .nav-list > li > button").click(
      function () {
        $(".dark_bg").addClass("hide2");
      }
    );
  } else {
    $(".sidebar .nav-list > li > button").click(
      function () {
        $(".dark_bg").removeClass("hide2");
      }
    );
  }
  $(".hover_wrap").hover(
    function () {
      $(this).parent("tr").children(".hover_wrap").addClass("active");
    },
    function () {
      $(this).parent("tr").children(".hover_wrap").removeClass("active");
    }
  );

  var radio_val = $('input:radio[name=report2_type]:checked').val();
  if (radio_val == 1) {
    $(".radio_table1").show();
    $(".radio_table2").hide();
  } else {
    $(".radio_table1").hide();
    $(".radio_table2").show();
  }
  $('input:radio[name=report2_type]').click(function () {
    var radio_val = $('input:radio[name=report2_type]:checked').val();
    if (radio_val == 1) {
      $(".radio_table1").show();
      $(".radio_table2").hide();
    } else {
      $(".radio_table1").hide();
      $(".radio_table2").show();
    }
  });

});
// 창, 디바이스 1280이하로 축소 시, 네비게이션 다이어트
$(window).resize(function () {
  if ($(window).width() < 1281) {
    $(".sidebar li.pb-0").on("mouseenter", function () {
      if (!$(".sidebar").hasClass("open")) {
        $(this).children(".sub_menu").addClass("sub_show");
      }
    }).on("mouseleave", function () {
      if (!$(".sidebar").hasClass("open")) {
        $(this).children(".sub_menu").removeClass("sub_show");
      }
    });

    // 네비게이션 서브메뉴 오버시, 펼치기
    if (!$(".sidebar").hasClass("open")) {
      $(".sidebar li").hover(
        function () {
          $(this).children(".sub_menu").addClass("sub_show");
        },
        function () {
          $(this).children(".sub_menu").removeClass("sub_show");
        }
      );
    }
    $(".sidebar").removeClass("open");
    $("#side_btn").removeClass("hide");
    $(".dark_bg").fadeOut();
    $("#search-side-btn").show();
    $("#menu-search-btn").hide();

  } else {
    $(".sidebar li.pb-0").off("mouseenter mouseleave");

    $(".sidebar").addClass("open");
    $("#side_btn").addClass("hide");
    $(".dark_bg").fadeOut();
    $("#search-side-btn").hide();
    $("#menu-search-btn").show();
  }
  if ($(window).width() < 992) {
    $(".search-nav .navbar-collapse").addClass("collapse");
  }
  if ($(window).height() < 601) {
    $(".sub_menu").removeClass("sub_show");
  }
  if ($(window).width() > 1200) {
    $(".dark_bg").addClass("hide2");
  } else {
    $(".dark_bg").removeClass("hide2");
  }
  $(".home-section").click(
    function () {
      $(".sidebar > ul > li ul").removeClass("sub_show");
    }
  );
  $(".navbar").click(
    function () {
      $(".sidebar > ul > li ul").removeClass("sub_show");
    }
  );
});


