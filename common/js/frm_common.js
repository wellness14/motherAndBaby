
/*------------------------------------------------------------------------*/
//	�� �� �� : CheckValid(formobj,tarobj,txtvalid)
//	�Լ���� : Form �Է°����� ���� �� �ʼ� ���� üũ
/*------------------------------------------------------------------------*/
	function CheckValid(formobj,tarobj,txtvalid){
		var tmpstr = '';					// �迭 ��
    	var r_objname = '';					// �Է°� ��
		var r_objAlert = '';				// alert �޽���
    	var r_maxlen  = 0;					// �ִ����
    	var r_essent  = false;				// �ʼ��׸� ����
    	var r_numeric = false;				// ���ڸ� �Է� ����

    	for(var i=0; i<txtvalid.split("|").length; i++){
    		tmpstr = txtvalid.split("|")[i];
    		if(tmpstr.substring(0,1)=="T"){				// �Է°� ��
    			r_objname = tmpstr.split("=")[1];
			}else if(tmpstr.substring(0,1)=="A"){		// Alert �޽���
    			r_objAlert = tmpstr.split("=")[1];
    		}else if(tmpstr.substring(0,1)=="M"){		// �ִ����
    			r_maxlen = tmpstr.split("=")[1];
    		}else if(tmpstr.substring(0,1)=="E"){		// �ʼ��׸���
    			r_essent = true;
    		}else if(tmpstr.substring(0,1)=="N"){		// ���ڸ� �Է°���
    			r_numeric = true;
    		}
    	}
    	if(r_essent){
    		if(!CheckEssential(formobj,tarobj,txtvalid)){
    			alert( r_objAlert );
	  			tarobj.focus();
				return false;
    		}
    	}
		if(parseInt(r_maxlen)>0){
    		if(!CheckMaxLen(tarobj,r_maxlen)){
				alert(r_objname + '��(��) �ִ� '+ r_maxlen+'�ڱ��� �Է°����մϴ�.');
				val = tarobj.val().substring(0,r_maxlen);
				tarobj.val(val);
				tarobj.focus();
    			return false;
    		}
    	}
    	if(r_numeric){
    		if(!CheckNumeric(tarobj)){
    			alert(r_objname + '��(��) ���ڸ� �Է°����մϴ�.');
    			tarobj.focus();
    			return false;
    		}
    	}
    	return true;
    }
	

/*------------------------------------------------------------------------*/
//	�� �� �� : CheckMaxLen(tarobj,maxlen)
//	�Լ���� : �Է� ������ �ִ� �Է� ���� üũ
/*------------------------------------------------------------------------*/
    function CheckMaxLen(tarobj,maxlen){
    	if(tarobj.val().length > maxlen)
    		return false;
    	else
    		return true;
    }


/*------------------------------------------------------------------------*/
//	�� �� �� : CheckNumeric(tarobj)
//	�Լ���� : �Է� �������� ���� ���� Ȯ��
/*------------------------------------------------------------------------*/	
    function CheckNumeric(tarobj){
    	if(isNaN(tarobj.val()))
    		return false;
    	else
    		return true;
    }


/*------------------------------------------------------------------------*/
//	�� �� �� : getByte(strtext)
//	�Լ���� : Byte ���� ����
/*------------------------------------------------------------------------*/	
    function getByte(strtext){
        var str = new String(strtext);
        var len = str.length;
    	var k,temp,count=0;

    	for (k=0 ; k<len ; k++){
            temp = str.charAt(k);
            if (escape(temp).length > 4){
                count += 2;
            }else if (temp == 'r' && str.charAt(k+1) == 'n') { // rn�� ���
                count += 2;
            }else if (temp != 'n') {
                count++;
            }
    	}
    	return count;
    }


/*------------------------------------------------------------------------*/
//	�� �� �� : CheckEssential(formobj,tarobj,txtvalid)
//	�Լ���� : Input Ÿ�Ժ� �Է� ������ ���� üũ
/*------------------------------------------------------------------------*/	
    function CheckEssential(formobj,tarobj,txtvalid){
        var i;
        var tmpcnt;

		if (tarobj.is("select") == true || tarobj.is("textarea") == true){
			if(jQuery.trim(tarobj.val())==''){
    			return false;
			}else{
    			return true;
			}	
		}else if((tarobj.attr('type')=="text") || (tarobj.attr('type')=="password") || (tarobj.attr('type')=="select-one")){
    		if(jQuery.trim(tarobj.val())==''){
    			return false;
			}else{
    			return true;
			}
    	}else if(tarobj.attr('type')=="radio" || tarobj.attr('type')=="checkbox"){
			if (jQuery(":input:"+ tarobj.attr('type') +"[name="+ tarobj.attr('name') +"]:checked").length > 0){
				return true;
			}else{
				return false;
			}
        }
    }

//-----------------------------------------------------------------------------------------------------------
// �Լ���    : byteCheck(code,size)
// ��  ��    : �Է��� ���ڼ��� üũ
// ��  ��    : code - �Է� ��, size - �Է¹��� �ؽ�Ʈ ������
// ���� ��� : <textarea name="txt_aaa" rows="5" cols="60" onkeyup="byteCheck(this,500);"></textarea><br><span id="answerContent_Num">500</span>�� ���ҽ��ϴ�.
// ----------------------------------------------------------------------------------------------------------
function byteCheck(code,size,tar){
	var code_byte = 0;
	code_byte = getByte(code.value);
	
	var code_size = Math.ceil(code_byte/2);
	if (code_size > size){
		alert(size + '�ڱ��� �Է��� �����մϴ�.');
		code.value = code.value.substring(0, size);
		return false;
	}else{
		tar.html(code_size +" / <strong>"+ size +"byte</strong>");
	}
}


/*------------------------------------------------------------------------*/
//	�� �� �� : checkForm(formobj,tarobj)
//	�Լ���� : �Է°��� üũ�Ŀ� true,false ����
/*------------------------------------------------------------------------*/
    function checkForm(formobj,tarobj){
		for (i=0; i < tarobj.length; i++ ){
			var valid = tarobj.eq(i).attr('valid');
			if (typeof(valid) != "undefined"){
				var ret = CheckValid(formobj, tarobj.eq(i), valid);
	    		if(ret==false) return ret;
			}
		}
		return true;
    }