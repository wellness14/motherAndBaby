

function fncSetTab(tar,num){
	t = num;
	tar.each(function(i) {
		if (i == num) {
			fncSetImg(i);
			jQuery(this).attr({ 'src': jQuery(this).attr("src").split("_off").join("_on") });
		} else {
			jQuery(this).attr({ 'src': jQuery(this).attr("src").split("_on").join("_off") }).hover(
				function() { jQuery(this).attr({ 'src': jQuery(this).attr("src").split("_off").join("_on") }); },
				function() { if (i != t){ jQuery(this).attr({ 'src':  jQuery(this).attr("src").split("_on").join("_off") }); } }
			);
		}
	});
}	

//팝업쿠키 세트
function setCookie(name, value, expiredays, cookie_num) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	var eventCookie = getCookie(name);
	if (eventCookie.length == 0) {
		eventCookie = "no/no/no/no/no/no/no/no/no/no/no/no";
	}
	var arr_pop = new Array(10), new_value;
	arr_pop = eventCookie.split("/");
	arr_pop[parseInt(cookie_num) - 1] = value;

	new_value = arr_pop[0] + "/" + arr_pop[1] + "/" + arr_pop[2] + "/" + arr_pop[3] + "/" + arr_pop[4] + "/" + arr_pop[5] + "/" + arr_pop[6] + "/" + arr_pop[7] + "/" + arr_pop[8] + "/" + arr_pop[9];

	document.cookie = name + "=" + escape(new_value) + ";domain=mothernbaby.co.kr;path=/;expires=" + todayDate.toGMTString() + ";"
}

// 함수이름 : getCookie()
// 함수설명 : 쿠키가져오기
// 입 력 값 : 쿠키명
// 반 환 값 : 없음/쿠키값
function getCookie(name) {
    var nameOfCookie = name + "=";
    var x = 0;
    while (x <= document.cookie.length) {
        var y = (x + nameOfCookie.length);
        if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }
        x = document.cookie.indexOf(" ", x) + 1;
        if (x == 0)
            break;
    }
    return "";
}

//팝업쿠키 정보 가져오기
function fnc_getCookie(name, num) {

    var popCookie = getCookie(name);
    var arr_pop = new Array(10);

    if (popCookie.length != 0) {
        popCookie = popCookie.replace(/undefined/g, "no");
        popCookie = popCookie.replace(/=/g, "");
        arr_pop = popCookie.split("/");

        if (arr_pop[0] != "yes" && arr_pop[0] != "no") {
            arr_pop[0] = "no";
        }
        if (arr_pop[1] != "yes" && arr_pop[1] != "no") {
            arr_pop[1] = "no";
        }
        if (arr_pop[2] != "yes" && arr_pop[2] != "no") {
            arr_pop[2] = "no";
        }
        if (arr_pop[3] != "yes" && arr_pop[3] != "no") {
            arr_pop[3] = "no";
        }
        if (arr_pop[4] != "yes" && arr_pop[4] != "no") {
            arr_pop[4] = "no";
        }
        if (arr_pop[5] != "yes" && arr_pop[5] != "no") {
            arr_pop[5] = "no";
        }

        if (arr_pop[6] != "yes" && arr_pop[6] != "no") {
            arr_pop[6] = "no";
        }

        if (arr_pop[7] != "yes" && arr_pop[7] != "no") {
            arr_pop[7] = "no";
        }

        if (arr_pop[8] != "yes" && arr_pop[8] != "no") {
            arr_pop[8] = "no";
        }

        if (arr_pop[9] != "yes" && arr_pop[9] != "no") {
            arr_pop[9] = "no";
        }

        popCookie = arr_pop[0] + "/" + arr_pop[1] + "/" + arr_pop[2] + "/" + arr_pop[3] + "/" + arr_pop[4] + "/" + arr_pop[5] + "/" + arr_pop[6] + "/" + arr_pop[7] + "/" + arr_pop[8] + "/" + arr_pop[9];
        var todayDate = new Date();
        todayDate.setHours(24 + 8);

        document.cookie = name + "=" + escape(popCookie) + "; domain=megastudy.net ; path=/; expires=" + todayDate.toGMTString() + ";"

        return arr_pop[num];
    }

}



