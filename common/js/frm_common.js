
/*------------------------------------------------------------------------*/
//	함 수 명 : CheckValid(formobj,tarobj,txtvalid)
//	함수기능 : Form 입력값들의 길이 및 필수 여부 체크
/*------------------------------------------------------------------------*/
	function CheckValid(formobj,tarobj,txtvalid){
		var tmpstr = '';					// 배열 값
    	var r_objname = '';					// 입력값 명
		var r_objAlert = '';				// alert 메시지
    	var r_maxlen  = 0;					// 최대길이
    	var r_essent  = false;				// 필수항목 여부
    	var r_numeric = false;				// 숫자만 입력 여부

    	for(var i=0; i<txtvalid.split("|").length; i++){
    		tmpstr = txtvalid.split("|")[i];
    		if(tmpstr.substring(0,1)=="T"){				// 입력값 명
    			r_objname = tmpstr.split("=")[1];
			}else if(tmpstr.substring(0,1)=="A"){		// Alert 메시지
    			r_objAlert = tmpstr.split("=")[1];
    		}else if(tmpstr.substring(0,1)=="M"){		// 최대길이
    			r_maxlen = tmpstr.split("=")[1];
    		}else if(tmpstr.substring(0,1)=="E"){		// 필수항목임
    			r_essent = true;
    		}else if(tmpstr.substring(0,1)=="N"){		// 숫자만 입력가능
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
				alert(r_objname + '은(는) 최대 '+ r_maxlen+'자까지 입력가능합니다.');
				val = tarobj.val().substring(0,r_maxlen);
				tarobj.val(val);
				tarobj.focus();
    			return false;
    		}
    	}
    	if(r_numeric){
    		if(!CheckNumeric(tarobj)){
    			alert(r_objname + '은(는) 숫자만 입력가능합니다.');
    			tarobj.focus();
    			return false;
    		}
    	}
    	return true;
    }
	

/*------------------------------------------------------------------------*/
//	함 수 명 : CheckMaxLen(tarobj,maxlen)
//	함수기능 : 입력 데이터 최대 입력 길이 체크
/*------------------------------------------------------------------------*/
    function CheckMaxLen(tarobj,maxlen){
    	if(tarobj.val().length > maxlen)
    		return false;
    	else
    		return true;
    }


/*------------------------------------------------------------------------*/
//	함 수 명 : CheckNumeric(tarobj)
//	함수기능 : 입력 데이터의 숫자 여부 확인
/*------------------------------------------------------------------------*/	
    function CheckNumeric(tarobj){
    	if(isNaN(tarobj.val()))
    		return false;
    	else
    		return true;
    }


/*------------------------------------------------------------------------*/
//	함 수 명 : getByte(strtext)
//	함수기능 : Byte 길이 추출
/*------------------------------------------------------------------------*/	
    function getByte(strtext){
        var str = new String(strtext);
        var len = str.length;
    	var k,temp,count=0;

    	for (k=0 ; k<len ; k++){
            temp = str.charAt(k);
            if (escape(temp).length > 4){
                count += 2;
            }else if (temp == 'r' && str.charAt(k+1) == 'n') { // rn일 경우
                count += 2;
            }else if (temp != 'n') {
                count++;
            }
    	}
    	return count;
    }


/*------------------------------------------------------------------------*/
//	함 수 명 : CheckEssential(formobj,tarobj,txtvalid)
//	함수기능 : Input 타입별 입력 데이터 유무 체크
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
// 함수명    : byteCheck(code,size)
// 설  명    : 입력한 글자수를 체크
// 변  수    : code - 입력 폼, size - 입력받을 텍스트 사이즈
// 적용 방법 : <textarea name="txt_aaa" rows="5" cols="60" onkeyup="byteCheck(this,500);"></textarea><br><span id="answerContent_Num">500</span>자 남았습니다.
// ----------------------------------------------------------------------------------------------------------
function byteCheck(code,size,tar){
	var code_byte = 0;
	code_byte = getByte(code.value);
	
	var code_size = Math.ceil(code_byte/2);
	if (code_size > size){
		alert(size + '자까지 입력이 가능합니다.');
		code.value = code.value.substring(0, size);
		return false;
	}else{
		tar.html(code_size +" / <strong>"+ size +"byte</strong>");
	}
}


/*------------------------------------------------------------------------*/
//	함 수 명 : checkForm(formobj,tarobj)
//	함수기능 : 입력값들 체크후에 true,false 리턴
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