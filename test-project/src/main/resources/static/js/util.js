/** 폼전송
 * ex: formSubmit("frm", "../sample/sampleList.do");
 * ex: formSubmit("frm", "../sample/sampleList.do", "_self");
 */
function formSubmit(formName, action, target, encType) {
	if(target == undefined) target = "_self";
	if(encType == undefined) encType = "application/x-www-form-urlencoded";
	
	$("#" + formName).attr({action: action, target: target, enctype: encType}).submit();
}

/** 폼설정
 * ex: formSet("frm", "../sample/sampleList.do");
 * ex: formSet("frm", "../sample/sampleList.do", "_self");
 */
function formSet(formName, action, target, encType) {
	if(target == undefined) target = "_self";
	if(encType == undefined) encType = "application/x-www-form-urlencoded";
	
	$("#" + formName).attr({action: action, target: target, enctype: encType});
}

/** 중앙팝업띄우기
 * ex: windowOpen("/mikep/xxx.do","pop","300","200","no");
 */
function windowOpen(strURL, winName, width, height, scrollbar, resize) {
	if(!resize) resize="no";
    var swidth  = (screen.width - width) / 2;
    var sheight = (screen.height - height) / 2;
    var shape   = "width=" + width + ",height=" + height + ",left=" + swidth + ",top=" + sheight + ",";
    shape += "toolbar=no, location=no, directories=no, status=yes, resizable=" + resize + ",";
    shape += "menubar=no, scrollbars=" + scrollbar;
    var win = window.open(strURL, winName, shape);
    return win;
}

/** 입력박스 입력
 * ex: setValue(document.form.field, "value");
 */
function setValue(p_name, p_value) {
    p_name.value = p_value;
}

/** 셀렉트박스 선택
 * ex: setSelect(document.form.field, "value");
 */
function setSelect(p_select, p_value) {
	/*
    for (i = 0; i < p_select.length; i++) {
        if (p_select[i].value == p_value)
            p_select.selectedIndex = i;
    }
    */
	if(p_select.indexOf(",") > -1 ){
		var sp_select = p_select.split(",");

		for( i = 0 ; i < sp_select.length ; i++ ){
			$("#"+sp_select[i]).val(p_value).attr("selected","selected");
		}
	} else {
		$("#"+p_select).val(p_value).attr("selected","selected");
	}
}

/** 라디오버튼 선택
 * ex: setRadio(document.form.field, "value");
 */
function setRadio(p_select, p_value) {
    for (i = 0; i < p_select.length; i++) {
        if (p_select[i].value == p_value)
            p_select[i].checked = true;
    }
}

/** 체크박스 선택
 * ex: setCheck(document.form.field, "value");
 */
function setCheck (p_select, p_value) {
	if(typeof(p_select.length) == "undefined") {
		if (p_select.value == p_value)
            p_select.checked = true;
	} else {
		for (i = 0; i < p_select.length; i++) {
	        if (p_select[i].value == p_value)
	            p_select[i].checked = true;
	    }
	}
}

function setChecked(name,value) {
	$("input[name=" + name + "]").filter("input[value=" + value + "]").attr("checked", true);
}

/**
 * 서브메뉴 left메뉴
 */
function MM_swapImgRestore() { //v3.0
    var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
    var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
    var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
        d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
    if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
    var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
    if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

/* 동적 html 테이블 관련 시작 */
function delEachRow(obj) {
    var idx = getObj().parentElement.rowIndex;
    obj.deleteRow(idx);
}

function delAllRow(obj) {
    var cnt = obj.rows.length;
    for(var i=1; i<cnt; i++) {
        obj.deleteRow(1);
    }
}

function getObj() {
    var obj = event.srcElement;
    while (obj.tagName.toUpperCase() != 'TD') obj = obj.parentElement;
    return obj;
}
/* 동적 html 테이블 관련 끝 */

/*
' ------------------------------------------------------------------
' Function : fc_chk_byte(aro_name)
' Description : 입력한 글자수를 체크
' Argument : Object Name(글자수를 제한할 컨트롤)
' Return :
' ------------------------------------------------------------------
*/
function fc_chk_byte(aro_name,ari_max)
{
	var ls_str = aro_name.value; // 이벤트가 일어난 컨트롤의 value 값

	var li_str_len = ls_str.length; // 전체길이

	// 변수초기화
	var li_max = ari_max; // 제한할 글자수 크기
	var i = 0; // for문에 사용
	var li_byte = 0; // 한글일경우는 2 그밗에는 1을 더함
	var li_len = 0; // substring하기 위해서 사용
	var ls_one_char = ""; // 한글자씩 검사한다
	var ls_str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.

	for(i=0; i< li_str_len; i++)
	{
		// 한글자추출
		ls_one_char = ls_str.charAt(i);

		if (escape(ls_one_char).length > 4)
		{
			// 한글이면 2를 더한다.
			li_byte += 2;
		} else {
			// 그밗의 경우는 1을 더한다.
			li_byte++;
		}

		// 전체 크기가 li_max를 넘지않으면
		if(li_byte <= li_max)
		{
			li_len = i + 1;
		}
	}

	// 전체길이를 초과하면
	if(li_byte > li_max)
	{
		alert("한글은"+ li_max/2 +"자 이상 입력하실 수 없습니다.");
		ls_str2 = ls_str.substr(0, li_len);
		aro_name.value = ls_str2;
	}

	aro_name.focus();
}


function flashLoad(url,width,height) {
    var target;
    target =  "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='"+ width + "' height='" + height + "'>";
    target += "<param name='movie' value='" + url + "'>";
    target += "<param name='quality' value='high'>";
    target += "<param name='wmode' value='window' />";
    target += "<embed src='" + url + "' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='" + width + "' height='" + height + "'></embed>";
    target += "</object>";

    document.write(target);
}

function layerview_move(name, x, y) {
    document.all[name].style.left = x;
    document.all[name].style.top = y;
}

function Trim(String){
	/*
    for(;String.indexOf(" ") != -1;){
        String = String.replace(" ", "");
    }
    return String;
    */
    return String.replace(/^\s+|\s+$/g, '');
}

/**
* 입력값의 바이트 길이를 리턴
* ex) if (getByteLength(form.title) > 100) {
*         alert("제목은 한글 50자(영문 100자) 이상 입력할 수 없습니다.");
*     }
*/
function getByteLength(input) {
   var byteLength = 0;
   for (var inx = 0; inx < input.value.length; inx++) {
       var oneChar = escape(input.value.charAt(inx));
       if ( oneChar.length == 1 ) {
           byteLength ++;
       } else if (oneChar.indexOf("%u") != -1) {
           byteLength += 2;
       } else if (oneChar.indexOf("%") != -1) {
           byteLength += oneChar.length/3;
       }
   }
   return byteLength;
}

//글자수체크
function isMaxLength(obj, id){
	if(typeof(id) == "undefined") id = "writedLength";

    var maxlen = obj.getAttribute ? Number(obj.getAttribute("maxlength")) : "";
    var content_length = getByteLength(obj);

    document.getElementById(id).value = content_length;

    if(obj.getAttribute && content_length > maxlen) {
       alert("입력가능한 글자수가 초과되었습니다.");
       obj.value = obj.value.substring(0,maxlen/2);
       content_length = getByteLength(obj);
    }
    document.getElementById(id).value = content_length;
}

function insertByteCheck(){
	//byteCheck(obj.attr("maxlength"),obj);
	$("span").remove(".byte");

	insertByteCheckInit();
}

/**
 * byte 체크
 * @param limitByte
 * @param obj
 */
function byteCheck(limitByte,obj){
	var len = 0, j;
	//var str = obj.value;
	var str = typeof(obj.value) == "undefined" ? obj.val() : obj.value;
	var id = typeof(obj.id) == "undefined" ? obj.attr("id") : obj.id;
	for (i=0, j = str.length; i < j;i++, len++) {
		if ( (str.charCodeAt(i)<0)||(str.charCodeAt(i)>127) ){
			len = len+1;
		}

		if (len >= limitByte) {
			alert(limitByte+"바이트를 초과했습니다.");
			obj.value=str.substring(0,i);
			obj.focus();
			return;
		}
	}
	$("#"+id+"_span").text(len);
}

function byteCheck2(obj){
	var len = 0, j;
	//var str = obj.value;
	var str = typeof(obj.value) == "undefined" ? obj.val() : obj.value;
	var id = typeof(obj.id) == "undefined" ? obj.attr("id") : obj.id;
	for (i=0, j = str.length; i < j;i++, len++) {
		if ( (str.charCodeAt(i)<0)||(str.charCodeAt(i)>127) ){
			len = len+1;
		}
	}
	$("#"+id+"_span").text(len);
}

function insertByteCheckInit(){
	$("textarea").each(function (){
		var $id = $(this).attr("id");

		var max = $(this).attr("maxlength");

		var $title = $("#" + $id).parents("td");

		var byteSpan = " <span class=\"byte\"><span id=\""+$id+"_span\">0</span> / "+max+" byte</span>";

		$title.html($title.html()+byteSpan);

		$("#"+$id).on("blur",function (){
			byteCheck(max,$(this));
		});

		$("#"+$id).on("keydown",function (){
			byteCheck(max,$(this));
		});

	});
}

//글자수 설정
function setLength(text, area) {
	if(typeof(area) != "undefined")
		setValue(text, getByteLength(area));
}

function getRadioValue(pObj) {
	var selectedValue = '';
	for ( var i=0; i < pObj.length; i++) {
		if ( pObj[i].checked) {
			selectedValue = pObj[i].value;
			break;
		}
	}
	return selectedValue;
}

function getObj() {
    var obj = event.srcElement;
    while (obj.tagName != 'TD') obj = obj.parentElement;
    return obj;
}

function makeComma(obj){
  	var name = obj.name;
  	var num = obj.value.replace(/,/g,'');
  	var retStr = num.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
  	
  	if(retStr.indexOf(".") > -1 && retStr.indexOf(".") < retStr.length - 3) {
  		retStr = retStr.substring(0, retStr.length - 1);
  	}

	obj.value = retStr;

	/*
	var num = obj.toString();
	var objRegExp = new RegExp('(-?[0-9]+)([0-9]{3})');
		while(objRegExp.test(num)) {
			num = num.replace(objRegExp, '$1,$2');
		}
	return num;
    */
}

function insertComma(num){
	num = num.toString();
	num = num.replace(/,/g, "");
	var num_str = num.toString();
	var result = '';
	var flag = '';

	if(num_str.indexOf('-') != -1){
	  num_str = num_str.replace(/-/g, "");
	  flag = '-';
	}

	if(num_str.indexOf('+') != -1){
	  num_str = num_str.replace(/\+/g, "");
	  flag = '+';
	}

	for(var i = 0; i<num_str.length; i++) {
		var tmp = num_str.length-(i+1);
		if(i%3==0 && i!=0) result = ',' + result;
		result = num_str.charAt(tmp) + result;
	}

	if(flag == '-') result = flag + result;

	return result;
}

function removeComma(num) {
    return num.toString().replace(/,/gi,"");
}

function removeDash(num) {
    return num.toString().replace(/-/gi,"");
}

//일자 차이를 구한다.
function getTerm(inputYMD1, inputYMD2) {
    var strYear1, strMonth1, strDay1;
    var strYear2, strMonth2, strDay2;

    inputYMD1 = removeDash(inputYMD1);
    inputYMD2 = removeDash(inputYMD2);

    strYear1  = inputYMD1.substring(0, 4);
    strMonth1 = inputYMD1.substring(4, 6);
    strDay1   = inputYMD1.substring(6);

    strYear2  = inputYMD2.substring(0, 4);
    strMonth2 = inputYMD2.substring(4, 6);
    strDay2   = inputYMD2.substring(6);

    date1 = new Date();
    date2 = new Date();
    diff  = new Date();

    var date1Temp = new Date(strMonth1 + "/" + strDay1 + "/" + strYear1 + " " + "10:00:00");
    var date2Temp = new Date(strMonth2 + "/" + strDay2 + "/" + strYear2 + " " + "10:00:00");

    date1.setTime(date1Temp.getTime());
    date2.setTime(date2Temp.getTime());

    diff.setTime(Math.abs(date1.getTime() - date2.getTime()));

    timediff = diff.getTime();

    weeks = Math.floor(timediff / (1000 * 60 * 60 * 24 * 7));
    timediff -= weeks * (1000 * 60 * 60 * 24 * 7);

    days = Math.floor(timediff / (1000 * 60 * 60 * 24));
    timediff -= days * (1000 * 60 * 60 * 24);

    hours = Math.floor(timediff / (1000 * 60 * 60));
    timediff -= hours * (1000 * 60 * 60);

    mins = Math.floor(timediff / (1000 * 60));
    timediff -= mins * (1000 * 60);

    secs = Math.floor(timediff / 1000);
    timediff -= secs * 1000;

    var diffCount = (parseInt(weeks) * 7) + parseInt(days);
    return (parseInt(diffCount));
}

//10원단위 절사
function trunc10(num) {
    var ret;
    var money = (num / 10) + "";

    var idx = money.indexOf(".");

    if(idx == -1) {
      ret = parseInt(money, 10) * 10;
    } else {
      money = money.substring(0, idx);
      ret = parseInt(money, 10) * 10;
    }

    return(ret);
}

//10원 반올림 100원단위 표기 + pg수수료
function trunc100(amt,pg) {
	if(pg != undefined) {
		return Number(amt <= 10) ? Number(amt+ pg) : Number((Math.round(parseInt(Math.round(Math.floor(amt))) / 100) * 100)+pg);
	} else {
		return (Math.round(parseInt(Math.round(Math.floor(amt))) / 100) * 100);
	}
}

//1000원단위 절사
function trunc1000(amt){
	var num = Math.floor(amt);
	var ret;
	var money = (num/1000)+"";
	var idx = money.indexOf(".");
	if(idx == -1){
		ret = Number(money, 10) * 1000;
	} else {
		money = money.substring(0,idx);
		ret = Number(money, 10) * 1000;
	}
	return (ret);
}

function getAddedDay(strTargetDate, strAmount, divs) {
	if(divs == undefined) divs = "-";
	strTargetDate = removeDash(strTargetDate);
    var strAmount = Number(strAmount);
    var strPhoneTime = new Date(strTargetDate.substring(0,4), strTargetDate.substring(4,6) - 1, strTargetDate.substring(6,8),0, 0, 0, 0);
    var strIDay = strPhoneTime.getTime() + 24*3600*1000*strAmount;
    var strDay = new Date();

    strDay.setTime(strIDay);

    var strYear = strDay.getFullYear();
    var strMonth = strDay.getMonth()+1;
    var strDay = strDay.getDate();

    if(strMonth < 10){
        strMonth = "0" + strMonth;
    }
    if(strDay < 10){
        strDay = "0" + strDay;
    }
    return strYear.toString()+divs+strMonth.toString()+divs+strDay.toString();
}

function getAddedMonth(strTargetDate, diff_m, divs) {
	if(divs == undefined) divs = "-";
	pdate = removeDash(strTargetDate);
    var add_m;
    var lastDay;    // 마지막 날(30,31..)
    var pyear, pmonth, pday;

    pdate = makeDateFormat(pdate); // javascript 날짜형변수로 변환
    if (pdate == "") return "";

    pyear = pdate.getFullYear();
    pmonth= pdate.getMonth() + 1;
    pday  = pdate.getDate();

    add_m = new Date(pyear, pmonth + diff_m, 1);    // 더해진 달의 첫날로 셋팅

    lastDay = new Date(pyear, pmonth, 0).getDate(); // 현재월의 마지막 날짜를 가져온다.
    if (lastDay == pday) {  // 현재월의 마지막 일자라면 더해진 월도 마지막 일자로
        pday = new Date(add_m.getFullYear(), add_m.getMonth(), 0).getDate();
    }

    add_m = new Date(add_m.getFullYear(), add_m.getMonth()-1, pday);

    var strYear = add_m.getFullYear();
    var strMonth = add_m.getMonth()+1;
    var strDay = add_m.getDate();

    if(strMonth < 10){
        strMonth = "0" + strMonth;
    }
    if(strDay < 10){
        strDay = "0" + strDay;
    }
    return strYear.toString()+divs+strMonth.toString()+divs+strDay.toString();
}

/* yyyymmdd, yyyy-mm-dd, yyyy.mm.dd 를 javascript 날짜형 변수로 변환 */
function makeDateFormat(pdate) {
    var yy, mm, dd, yymmdd;
    var ar;
    if (pdate.indexOf(".") > -1) {  // yyyy.mm.dd
        ar = pdate.split(".");
        yy = ar[0];
        mm = ar[1];
        dd = ar[2];

        if (mm < 10) mm = "0" + mm;
        if (dd < 10) dd = "0" + dd;
    } else if (pdate.indexOf("-") > -1) {// yyyy-mm-dd
        ar = pdate.split("-");
        yy = ar[0];
        mm = ar[1];
        dd = ar[2];

        if (mm < 10) mm = "0" + mm;
        if (dd < 10) dd = "0" + dd;
    } else if (pdate.length == 8) {
        yy = pdate.substr(0,4);
        mm = pdate.substr(4,2);
        dd = pdate.substr(6,2);
    }

    yymmdd = yy+"/"+mm+"/"+dd;

    yymmdd = new Date(yymmdd);

    if (isNaN(yymmdd)) {
        return false;
    }

    return yymmdd;
}

function onlyNumber(exceptStr){
	var iKeyCode = event.keyCode;
	var cKeyChar = String.fromCharCode(iKeyCode); 
	var bIsExc = false;
	if(exceptStr!=null){
		if(exceptStr.indexOf(cKeyChar)>-1){
			bIsExc = true;
		} 
	}
	if((iKeyCode!=13)&&(iKeyCode!=45)&&(iKeyCode!=46)&&((iKeyCode<48)||(iKeyCode>57))){
		if(!bIsExc){
			event.preventDefault ? event.preventDefault() : event.returnValue = false;
		}
	}
}

function syncData(a, b) {
	$("#" + b).val($("#" + a).val());
}

function formatDate(str, nullStr) {
	if(str==undefined) return "";
	
    if(str.indexOf("-") > -1) {
        str = str.replace(/\-/g,"");
    }

    if(str.length == 0) {
    	if(nullStr && nullStr != "") return nullStr;
    	else return "";
    } else if(str.length == 4) {
        return str.substring(0,4);
    } else if(str.length > 4 && str.length <= 6) {
    	return str.substring(0,4) + "-" + str.substring(4,str.length);
    } else if(str.length > 6) {
    	return str.substring(0,4) + "-" + str.substring(4,6) + "-" + str.substring(6,8);
    }


}

function formatNumber(num){
	if(num == undefined) return '';
	num = num.toString();
	num = num.replace(/,/g, "");
	var num_str = num.toString();
	var result = '';
	var flag = '';

	if(num_str.indexOf('-') != -1){
	  num_str = num_str.replace(/-/g, "");
	  flag = '-';
	}

	if(num_str.indexOf('+') != -1){
	  num_str = num_str.replace(/\+/g, "");
	  flag = '+';
	}

	for(var i = 0; i<num_str.length; i++) {
		var tmp = num_str.length-(i+1);
		if(i%3==0 && i!=0) result = ',' + result;
		result = num_str.charAt(tmp) + result;
	}

	if(flag == '-') result = flag + result;

	return result;
}

function formatLawNo(str) {
	var orgStr = str;
    if(str.indexOf("-") > -1) {
        str = str.replace(/\-/g,"");
    }

    if(str.length == 13) {
        return str.substring(0,6) + "-" + str.substring(6);
    } else {
    	return orgStr;
    }
}

function formatBizNo(str) {
	var orgStr = str;
    if(str.indexOf("-") > -1) {
        str = str.replace(/\-/g,"");
    }

    if(str.length == 10) {
        return str.substring(0,3) + "-" + str.substring(3,5) + "-" + str.substring(5);
    } else {
    	return orgStr;
    }
}

function formatPostNo(str) {
	var orgStr = str;
    if(str.indexOf("-") > -1) {
        str = str.replace(/\-/g,"");
    }

    if(str.length == 6) {
    	//괄호없앰
        return str.substring(0,3) + "-" + str.substring(3);
    } else {
    	return orgStr;
    }
}

function getBirthday(birthday, gender) {
	if(birthday.length == 8) {
		return birthday.substring(0, 4) + "-" + birthday.substring(4, 6) + "-" + birthday.substring(6, 8);
	} else {
		var yearFirst = "19";		
		
		if(gender == "3" || gender == "4") {
			yearFirst = "20";
		}
		
		return yearFirst + birthday.substring(0, 2) + "-" + birthday.substring(2, 4) + "-" + birthday.substring(4, 6);
	}
}

function getGenderNm(str) {
	if(str == "1" || str == "3") return "남";
	else if(str == "2" || str == "4") return "여";
	else return "";
}

function getTermTxt(term) {
	var days = Number(term);
	var dd = parseInt(term % 30.416);
	var mm = parseInt(term / 30.416) % 12;
	var yy = parseInt(term / 365);
	
	return (yy == 0 ? '' : yy + '년 ') + (mm == 0 ? '' : mm + '개월 ') + (dd == 0 ? '' : dd + '일');
}

function getTermYear(term) {
	var days = Number(term);
	var dd = parseInt(term % 30.416);
	var mm = parseInt(term / 30.416) % 12;
	var yy = parseInt(term / 365);
	
	return yy;
}

function getObjectText(arr, level) {
    var dumped_text = "";
    if(!level) level = 0;

    //The padding given at the beginning of the line.
    var level_padding = "";
    for(var j=0; j < level+1; j++) level_padding += "    ";

    if(typeof(arr) == 'object') { //Array/Hashes/Objects
        for(var item in arr) {
            var value = arr[item];

            if(typeof(value) == 'object') { //If it is an array,
                dumped_text += level_padding + "'" + item + "' ...\n";
                dumped_text += getObjectText(value,level+1);
            } else {
                dumped_text += level_padding + "'" + item + "' => \"" + value + "\"\n";
            }
        }
    } else { //Stings/Chars/Numbers etc.
        dumped_text = "===>"+arr+"<===("+typeof(arr)+")";
    }
    return dumped_text;
}

function toNumber(str) {
	if(str == "") str = "0";
	return Number(removeComma(str));
}

function makeLawNo(obj) {
	var str = obj.value;
    if(str.indexOf("-") > -1) {
        str = str.replace(/\-/g,"");
    }

    if(str.length > 0 && str.length <= 6) {
        obj.value = str;
    } else if(str.length > 6 && str.length <= 13) {
    	obj.value = str.substring(0,6) + "-" + str.substring(6);
    }
}

function makeBizNo(obj) {
	var str = obj.value;
    if(str.indexOf("-") > -1) {
        str = str.replace(/\-/g,"");
    }

    if(str.length > 0 && str.length <= 3) {
        obj.value = str;
    } else if(str.length > 3 && str.length <= 5) {
    	obj.value = str.substring(0,3) + "-" + str.substring(3);
    } else if(str.length > 5 && str.length <= 10) {
    	obj.value = str.substring(0,3) + "-" + str.substring(3,5) + "-" + str.substring(5);
    }
}

function checkBizNo(obj){
	if(obj.value != "" && obj.value.length != 12){
		alert("사업자번호의 자릿수를 확인해주십시오.");
		$("#"+obj.id).focus();
		return;
	}
}

function makeTelNo(obj) {
	var str = obj.value;
    if(str.indexOf("-") > -1) {
        str = str.replace(/\-/g,"");
    }

    var firstNoIdx = 3;
    if(str.length >= 2 && str.substring(0, 2) == "02") firstNoIdx = 2;
    else if(str.length >= 4 && str.substring(0, 4) == "0505") firstNoIdx = 4;

    if(str.length > 0 && str.length <= firstNoIdx) {
        obj.value = str;
    } else if(str.length > firstNoIdx && str.length <= 7) {
    	obj.value = str.substring(0,firstNoIdx) + "-" + str.substring(firstNoIdx);
    } else if(str.length > 7 && str.length <= 14) {
    	obj.value = str.substring(0,firstNoIdx) + "-" + str.substring(firstNoIdx,str.length - 4) + "-" + str.substring(str.length - 4);
    }
}

function ifrmResize(bodyName) {
	$("iframe", parent.document).get(Number(parent.activeIdx) - 1).height = document.getElementById(bodyName).offsetHeight + 10 + "px";
}

function checkTerm(fromDt, toDt, type) {
	var fDt = removeDash($("#" + fromDt).val());
	var tDt = removeDash($("#" + toDt).val());

	if(fDt.length != 8 || tDt.length != 8) return;

	if(type == "f" && fDt > tDt) {
		alert("\uc2dc\uc791\uc77c\uc774 \uc885\ub8cc\uc77c\ubcf4\ub2e4 \ud07d\ub2c8\ub2e4.");
		$("#" + fromDt).focus();
	}
	else if(type == "t" && tDt < fDt) {
		alert("\uc885\ub8cc\uc77c\uc774 \uc2dc\uc791\uc77c\ubcf4\ub2e4 \uc791\uc2b5\ub2c8\ub2e4.");
		$("#" + toDt).focus();
	}
}

//체크박스 및 라디오체크
function setRadioCheck(id, val) {
	$("input[name=" + id + "]").filter("input[value=" + val + "]").attr("checked", true);
}

//공백추가
function addSpace(v){
    if(v != ""){
        return " "+v;
    }else{
        return "";
    }
}

//날짜형식으로 return
function toDateForm(d){
	var str = d.replace(/\-/g,"");

	if(str.length != 8) return;

	return str.replace(/([0-9]{4})([0-9]{2})([0-9]{2})/,"$1-$2-$3");
}

//그리드 로딩바 표시
function showLoading() {
	$(".loading").get(0).style.display = "inline";
	return true;
}

function getInternetExplorerVersion() {
    var rv = -1; // Return value assumes failure.
    if (navigator.appName == 'Microsoft Internet Explorer') {
        var ua = navigator.userAgent;
        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null)
            rv = parseFloat(RegExp.$1);
    }
    return rv;
}

function include(path) {
    var _js = document.createElement('script'); 
    _js.setAttribute('type', 'text/javascript'); 
    _js.setAttribute('src', path); 
    document.getElementsByTagName("head")[0].appendChild(_js);
}

//주민등록번호 유효성체크
function isValidSsn(iden) {
	var iden_tot = 0;
    var iden_ad = "234567892345";
 
    for(i=0; i<=11; i++) {
        iden_tot = iden_tot 
            + parseInt(iden.substring(i, i+1)) 
            * parseInt(iden_ad.substring(i, i+1));
    }
 
    iden_tot = 11 - (iden_tot % 11);
 
    if(iden_tot == 10) 
        iden_tot = 0;
    else if(iden_tot == 11) 
        iden_tot = 1;
 
    if(parseInt(iden.substring(12, 13)) != iden_tot) return false;
    
    return true;
}

function leftPad(value) {
    if (value >= 10) {
        return value;
    }

    return '0'+value;
}

// Date 날짜 형식 재정의 yyyy-MM-dd
function toStringByFormatting(source, delimiter = '-') {
    var year = source.getFullYear();
    var month = leftPad(source.getMonth() + 1);
    var day = leftPad(source.getDate());

    return [year, month, day].join(delimiter);
}