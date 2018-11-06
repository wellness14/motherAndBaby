/**
	함수설명: 페이저(Pager)를 만들어 주는 함수
	입 력 값: 현재페이지, 글 전체 숫자, 페이지당 글 수, 1블럭당 페이지 수, 이전 페이지 그룹으로 가기 위한 힌트, 페이지 그룹으로 가기 위한 힌트, 다음 페이지 그룹으로 가기 위한 힌트
	반 환 값: 페이저 html을 write
 */

// Start of our jQuery Plugin
(function($){
	var opt;
	var tpgbk = 1;	//	총 페이지 block 수
	var spg = 0;	//	시작 페이지
	var lpg = 1;	//	마지막 페이지
	var ret = '';

	// 서비스 페이징
	$.fn.setPager_info = function(cpg,pgurl,tcnt,pcph,cph,ncph,opts) {
		cpg		= parseInt(cpg);
		tcnt	= parseInt(tcnt);
		pcph	= parseInt(pcph);
		cph		= parseInt(cph);
		ncph	= parseInt(ncph);

		//	페이지당 글 수, 1블럭당 페이지 수
		opt = $.extend({
			nppg: 5,
			npbk: 5
		}, opts||{});

		if (tcnt > opt.nppg) {
			var tpg = Math.ceil(tcnt/opt.nppg);
			tpgbk = Math.ceil(tpg / opt.npbk);
			var pgbk = Math.ceil(cpg / opt.npbk);
			spg = (pgbk - 1) * opt.npbk;
			if(tpgbk <= pgbk) {
				lpg = tpg;
			} else {
				lpg = pgbk*opt.npbk;
			}
		}						

		ret += '<ul class="pagination">';
		if(pgbk > 1) {
			ret += '<li><a href="'+pgurl+'&amp;page='+spg+'&amp;intCP='+pcph+'" class="page_text">&lt;</a></li>';
		} else {
			ret += '<li><a>&lt;</a></li>';
		}

		for(var i = (spg + 1);i <= lpg; i++) {
			if (i == cpg) {
				ret += '<li class="active"><a>'+i+'</a></li>';
			} else {
				ret += '<li><a href="' + pgurl + '&amp;page=' + i + '&amp;intCP=' + cph + '" class="page_text">' + i + '</a></li>';
			}
		}

		if(pgbk < tpgbk) {
			ret += '<li><a href="'+pgurl+'&amp;page='+(lpg + 1)+'&amp;intCP='+ncph+'" class="page_text" >&gt;</a></li>';
		} else {
			ret += '<li><a>&gt;</a></li>';
		}

		ret += '</ul>';
		return this.html(ret);
	};

	//	관리자 페이징
	$.fn.setAdminPager = function(cpg,pgurl,tcnt,opts) {
		cpg		= parseInt(cpg);
		tcnt	= parseInt(tcnt);
		
		//	페이지당 글 수, 1블럭당 페이지 수
		opt = $.extend({
			nppg: 10,
			npbk: 10
		}, opts||{});

		if (tcnt > opt.nppg) {
			var tpg = Math.ceil(tcnt/opt.nppg);
			tpgbk = Math.ceil(tpg / opt.npbk);
			var pgbk = Math.ceil(cpg / opt.npbk);
			spg = (pgbk - 1) * opt.npbk;
			if(tpgbk <= pgbk) {
				lpg = tpg;
			} else {
				lpg = pgbk*opt.npbk;
			}
		}
		
		ret = '';
		ret += '<div style="width: 100%; text-align: center;">';
		if(pgbk > 1) {
			ret += '<a href="'+pgurl+'&amp;page='+spg+'">이전 ◀</a>&nbsp;';
		} else {
			ret += '이전 ◀&nbsp;';
		}

		ret += '<span>';
		for(var i = (spg + 1);i <= lpg; i++) {
			if ((i%opt.npbk) != 1) {
				ret += '<font style="color: #c0b6ac;">&nbsp;|&nbsp;</font>';
			}

			if (i == cpg) {
			    ret += '<strong>' + i + '</strong>';
			} else {
				ret += '<a href="'+pgurl+'&amp;page='+i+'">'+i+'</a>';
			}
		}
		ret += '</span>';

		if(pgbk < tpgbk) {
			ret += '&nbsp;<a href="'+pgurl+'&amp;page='+(lpg + 1)+'">▶ 다음</a>';
		} else {
			ret += '&nbsp;▶ 다음';
		}

		ret += '</div>';

		return this.html(ret);
	};
})(jQuery);
