/**
	�Լ�����: ������(Pager)�� ����� �ִ� �Լ�
	�� �� ��: ����������, �� ��ü ����, �������� �� ��, 1���� ������ ��, ���� ������ �׷����� ���� ���� ��Ʈ, ������ �׷����� ���� ���� ��Ʈ, ���� ������ �׷����� ���� ���� ��Ʈ
	�� ȯ ��: ������ html�� write
 */

// Start of our jQuery Plugin
(function($){
	var opt;
	var tpgbk = 1;	//	�� ������ block ��
	var spg = 0;	//	���� ������
	var lpg = 1;	//	������ ������
	var ret = '';

	// ���� ����¡
	$.fn.setPager_info = function(cpg,pgurl,tcnt,pcph,cph,ncph,opts) {
		cpg		= parseInt(cpg);
		tcnt	= parseInt(tcnt);
		pcph	= parseInt(pcph);
		cph		= parseInt(cph);
		ncph	= parseInt(ncph);

		//	�������� �� ��, 1���� ������ ��
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

		ret += '<div align="center">';
		if(pgbk > 1) {
			ret += '<a href="'+pgurl+'&amp;page='+spg+'&amp;intCP='+pcph+'" class="page_text">&lt;</a> ';
		} else {
			ret += '&lt; ';
		}

		for(var i = (spg + 1);i <= lpg; i++) {
			if (i == cpg) {
				ret += '<span class="page_text_on">'+i+'</span>';
			} else {
				ret += '<a href="' + pgurl + '&amp;page=' + i + '&amp;intCP=' + cph + '" class="page_text">' + i + '</a>';
			}
		}

		if(pgbk < tpgbk) {
			ret += ' <a href="'+pgurl+'&amp;page='+(lpg + 1)+'&amp;intCP='+ncph+'" class="page_text" >&gt;</a>';
		} else {
			ret += ' &gt;';
		}

		ret += '</div>';
		return this.html(ret);
	};

	//	������ ����¡
	$.fn.setAdminPager = function(cpg,pgurl,tcnt,opts) {
		cpg		= parseInt(cpg);
		tcnt	= parseInt(tcnt);
		
		//	�������� �� ��, 1���� ������ ��
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
			ret += '<a href="'+pgurl+'&amp;page='+spg+'">���� ��</a>&nbsp;';
		} else {
			ret += '���� ��&nbsp;';
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
			ret += '&nbsp;<a href="'+pgurl+'&amp;page='+(lpg + 1)+'">�� ����</a>';
		} else {
			ret += '&nbsp;�� ����';
		}

		ret += '</div>';

		return this.html(ret);
	};
})(jQuery);
