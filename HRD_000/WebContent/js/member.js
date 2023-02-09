

function chkValue(){
	if(document.frm.custname.value==''){
		alert('회원 성명이 입력되지 않았습니다');
		document.frm.custname.focus();
		return false;
	}
	if(document.frm.phone.value==''){
		alert('회원 전화가 입력되지 않았습니다');
		document.frm.phone.focus();
		return false;
	}
	if(document.frm.address.value==''){
		alert('회원 주소가 입력되지 않았습니다');
		document.frm.address.focus();
		return false;
	}
	if(document.frm.joindate.value==''){
		alert('가입일자가 입력되지 않았습니다');
		document.frm.custname.focus();
		return false;
	}
	if(document.frm.grade.value==''){
		alert('고객 등급이 입력되지 않았습니다');
		document.frm.grade.focus();
		return false;
	}
	if(document.frm.city.value==''){
		alert('도시코드가 입력되지 않았습니다');
		document.frm.city.focus();
		return false;
	}
	alert('회원등록이 완료되었습니다.')
	return true;
}