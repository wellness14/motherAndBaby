/*
'=======================================================================
'�� �� �� : 
'����� : ���� js ����
'�� �� �� : common.js
'�ۼ����� : 2013/01/31
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
*/

/*---------------------------------------------------------------------------------------------------------------------------------------*/
// S : �Լ����� : ���� Ajax ȣ��
/*---------------------------------------------------------------------------------------------------------------------------------------*/
function msAjax(o) {
    o = { type: o.type || "POST", url: o.url || "", info: o.info || null, timeout: o.timeout || 10000, onLoading: o.onLoading || function () { }, onComplete: o.onComplete || function () { }, onError: o.onError || function () { }, onSuccess: o.onSuccess || function () { }, onTimeOut: o.onTimeOut || function () { }, data: o.data || "" };
    o.onLoading();
    if (typeof XMLHttpRequest == "undefined") { XMLHttpRequest = function () { return new ActiveXObject(navigator.userAgent.indexOf("MSIE 5") >= 0 ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP"); } }
    var xml = new XMLHttpRequest();
    xml.open(o.type, o.url, true);
    if (o.type == "POST") xml.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    var tOut = o.timeout; var reqDone = false;
    setTimeout(function () { reqDone = true; }, tOut);
    xml.onreadystatechange = function () { if (xml.readyState == 4 && !reqDone) { if (hSuc(xml)) { o.onSuccess(hData(xml, o.type)); } else { o.onError(); } o.onComplete(); xml = null; } else { o.onTimeOut(); } };
    xml.send(o.info);
    function hSuc(r) { try { return !r.status && location.protocol == "file:" || (r.status >= 200 && r.status < 300) || r.status == 304 || navigator.userAgent.indexOf("Safari") >= 0 && typeof r.status == "undefined"; } catch (e) { } return false; }
    function hData(r, type) { var ct = r.getResponseHeader("content-type"); var data = !type && ct && ct.indexOf("xml") >= 0; data = type == "xml" || data ? r.responseXML : r.responseText; if (type == "script") eval.call(window, data); return data; }
}
function msLoading(e) { document.getElementById(e).innerHTML = "<div class='swiper-slide' style='width:100%;height:300px;text-align:center;'><div><img src='http://news2me.co.kr/image/indicator_white.gif' border='0'></div></div>"; }
function msAxList(u, d) {
    msAjax({ url: u, type: "GET", onSuccess: function (rss) { document.getElementById(d).innerHTML = rss; } });
}

/*---------------------------------------------------------------------------------------------------------------------------------------*/
// S : �Լ����� : Ajax ȣ��, html �Է�
/*---------------------------------------------------------------------------------------------------------------------------------------*/
function fncAxListHtml(url,tar){
	jQuery.get(url,function(data, textStatus){
		jQuery(tar).html(data);
	});
}

/*---------------------------------------------------------------------------------------------------------------------------------------*/
// S : �Լ����� : Ajax ȣ��, append �Է�
/*---------------------------------------------------------------------------------------------------------------------------------------*/
function fncAxListAppend(url,tar){
	jQuery.get(url,function(data, textStatus){
		jQuery(tar).append(data);
	});
}