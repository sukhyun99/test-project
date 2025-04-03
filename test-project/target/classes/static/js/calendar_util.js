

/**
 * 시작일과 종료일을 비교한다.
 * 죵료일이 작으면  true;
 */
function chkData(startData, endData, gubun){
	var retValue = true;
	v0=startData.split(gubun);
	v1=endData.split(gubun);

	v0=new Date(Number(v0[0]),Number(v0[1]),Number(v0[2]));
	v1=new Date(Number(v1[0]),Number(v1[1]),Number(v1[2]));

	if (v0 > v1) {
		retValue = true;
	} else {
		retValue = false;
	}
	return retValue;
}


//###########################날짜 제어함수 추가 시작###########################
var defaultDateF = "";
var defaultDateT = "";

function setDefaultDate(dateF,dateT){      
	if(dateF)defaultDateF = dateF.value;
	if(dateT)defaultDateT = dateT.value;	 
}

function makeDate(obj) {
	str = obj.value.toString();

	if(str.indexOf("-") > -1) {
		str = str.replace(/\-/g,"");
	}

	if(str.length == 8 && event.keyCode == 13) {

	}

	if(str.length == 4) {
		obj.value = str.substring(0,4);
	} else if(str.length > 4 && str.length <= 6) {
		obj.value = str.substring(0,4) + "-" + str.substring(4,str.length);
	} else if(str.length > 6) {
		obj.value = str.substring(0,4) + "-" + str.substring(4,6) + "-" + str.substring(6,str.length);
	}
}

function checkDate(obj,pos) {
	if($(obj)[0].validationMessage != '') {
		alert("\uc785\ub825\ud558\uc2e0 \uac12\uc774 \ub0a0\uc9dc\ud615\uc2dd\uc5d0 \ub9de\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4.");
		obj.value = null;       
		return;
	}
	if(obj.value!='') {
		if(obj.value.startsWith("19") || obj.value.startsWith("20")) {
			
		} else {
			alert("\uc785\ub825\uac00\ub2a5\ub144\ub3c4\ub294\u0020\u0031\u0039\u0078\u0078\u002c\u0020\u0032\u0030\u0078\u0078\u0020\ub9cc\u0020\uac00\ub2a5\ud569\ub2c8\ub2e4\u002e");
			obj.value = null;
			return;
		}
	}
}


/*
 * 날짜포맷에 맞는지 검사
 */
function isDateFormat(d) {
	var df = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
	return d.match(df);
}

/*
 * 윤년여부 검사
 */
function isLeaf(year) {
	var leaf = false;

	if(year % 4 == 0) {
		leaf = true;

		if(year % 100 == 0) {
			leaf = false;
		}

		if(year % 400 == 0) {
			leaf = true;
		}
	}

	return leaf;
}

/*
 * 날짜가 유효한지 검사
 */
function isCorrectDate(d) {
	// 포맷에 안맞으면 false리턴
	if(!isDateFormat(d)) {    	
		return false;
	}

	var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

	var dateToken = d.split('-');
	var year = Number(dateToken[0]);
	var month = Number(dateToken[1]);
	var day = Number(dateToken[2]);
	// 날짜가 0이면 false
	if(day == 0) {
		return false;
	}

	var isValid = false;

	// 윤년일때
	if(isLeaf(year)) {
		if(month == 2) {
			if(day <= month_day[month-1] + 1) {
				isValid = true;
			}
		} else {
			if(day <= month_day[month-1]) {
				isValid = true;
			}
		}
	} else {
		if(day <= month_day[month-1]) {
			isValid = true;
		}
	}

	return isValid;
}

//###########################날짜 제어함수 추가 끝###########################

//날짜계산(날짜차이) : 파라메터(obj.value, 일수)
//guar.js AddDay 함수와 같음
function plusDay(dt , diff) {
	diff = Number(diff);

	var strPhoneTime = new Date(dt.substring(0,4), dt.substring(5,7) - 1, dt.substring(8), 0, 0, 0, 0);
	var strIDay = strPhoneTime.getTime() + 24 * 3600 * 1000 * diff;
	var strDay = new Date();

	strDay.setTime(strIDay);

	var strYear  = strDay.getFullYear();
	var strMonth = strDay.getMonth()+1;
	strDay       = strDay.getDate();

	if(strMonth < 10){
		strMonth = "0" + strMonth;
	}
	if(strDay < 10){
		strDay = "0" + strDay;
	}

	return strYear.toString() + "-" + strMonth.toString() + "-" + strDay.toString();
}

//날짜계산(일수)
function dateDiff(dt1, dt2) {

	var inputYMD1 = dt1.replace(/\-/g,"");
	var inputYMD2 = dt2.replace(/\-/g,"");

	var strYear1, strMonth1, strDay1;
	var strYear2, strMonth2, strDay2;

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

	var diffCount = (parseInt(weeks) * 7) + parseInt(days) + 1;

	return diffCount;
}