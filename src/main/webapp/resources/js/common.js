
   /*------login & join_js------  */

/**
 * 회원가입 validation check
 */
//필수항목체크


function signInCheck(){
	//---필수체크
	//id
	if(!document.join_form.id.value) {
		alert("아이디를 입력하세요");
		document.join_form.id.focus();
		return false;
	}
	
	//password
	else if(!document.join_form.password.value) {
		alert("비밀번호를 입력하세요");
		document.join_form.password.focus();
		return false;
	}
	
	//repassword
	else if(!document.join_form.repassword.value) {
		alert("비밀번호를 확인하세요");
		document.join_form.repassword.focus();
		return false;
	}
	
	//password 일치
	else if(document.join_form.password.value != document.join_form.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
		document.join_form.repassword.value = "";
		document.join_form.repassword.focus();
		return false;
	} 
	
	//name
	else if(!document.join_form.name.value) {
		alert("이름을 입력하세요");
		document.join_form.name.focus();
		return false;
	}
	
	//birthday
	else if(!document.join_form.birthday.value) {
		alert("생년월일을 입력하세요");
		document.join_form.birthday.focus();
		return false;
	}
	
	//address
	else if(!document.join_form.address.value) {
		alert("주소를 입력하세요");
		document.join_form.birthday.focus();
		return false;
	}
	
	//email
	else if(!document.join_form.email1.value) {
		alert("이메일을 입력하세요");
		document.join_form.email1.focus();
		return false;
	}
		//email형식
	else if(!document.join_form.email2.value && document.join_form.email3.value == 0) {
		alert("이메일 형식에 일치하지 않습니다")
		document.join_form.email2.focus();
		return false;
		
	}
	
	//중복확인
/*	if(document.join_form) {
		
	}*/
	
	//2-1. join.jsp 폼 바로 아래 추가
	//<input type = "hidden" name = "hiddenId" value = "0">
	//hiddenId: 중복확인 버튼 클릭 여부 체크(0:클릭안함, 1:클릭함)
	
	//2-2. 중복확인 버튼 클릭하지 않는 경우 "중복확인 해주세요"
	if(document.join_form.hiddenId.value == 0) {
		alert("아이디 중복확인을 해주세요");
		document.join_form.id.focus();
		return false;
	}
}

//아이디 중복확인 페이지 open
function confirmId(){
	if(document.join_form.id.value == 0) {
		alert("중복확인을 해주세요");
		document.join_form.dupChk.focus();
		return false;
	}
	
	var url = "/pj_117_lsj/confirmIdAction.do?id=" + document.join_form.id.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

//----------중복확인-----------
//3.중복확인창 포커스
function confirmIdFocus(){
	document.confirmform.id.focus();
}

function confirmIdCheck(){
	if(document.confirmform.id.value == 0) {
		alert("아이디를 입력해주세요");
		document.confirmform.id.focus();
		return false;
	}
}

//4. 자식 창에서 부모 창으로 id값을 전달
/*
 * opener : window객체의 open() 메서드로 열린 새 창(=중복확인창)에서 부모창(=회원가입폼)에 접근할 떄 사용
 * join.jsp - hiddenId : 중복확인 버튼 클릭여부 체크(0: 클릭안함, 1:클릭함)
 * self.close(); 내 창 닫기
 */
function setId(id){
	opener.document.join_form.id.value = id;
	opener.document.join_form.hiddenId.value = "1";
	self.close();
}

//5. 이메일주소 select박스로 선택
function selectEmailChk() {
	//직접 입력이 아닌 경우
	if(document.join_form.email3.value !=0) {
		document.join_form.email2.value = document.join_form.email3.value;
	} else {
		document.join_form.email2.value = "";
		document.join_form.email2.focus();
		returnfalse;
	}
}

	
/*modify form*/
function modifyCheck(){
	//---필수체크
	//id
	if(!document.modifyform.password.value) {
		alert("비밀번호를 입력하세요");
		document.modifyform.password.focus();
		return false;
	}
	
	//repassword
	else if(!document.modifyform.repassword.value) {
		alert("비밀번호를 확인하세요");
		document.join_form.repassword.focus();
		return false;
	}
	
	//password 일치
	else if(document.modifyform.password.value != document.modifyform.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
		document.modifyform.repassword.value = "";
		document.modifyform.repassword.focus();
		return false;
	} 
	
	
	//name
	else if(!document.modifyform.name.value) {
		alert("이름을 입력하세요");
		document.modifyform.name.focus();
		return false;
	}
	
	//birthday
	else if(!document.modifyform.birthday.value) {
		alert("생년월일을 입력하세요");
		document.modifyform.birthday.focus();
		return false;
	}
	
	//address
	else if(!document.modifyform.address.value) {
		alert("주소를 입력하세요");
		document.modifyform.birthday.focus();
		return false;
	}
	
	//email
	else if(!document.modifyform.email1.value) {
		alert("이메일을 입력하세요");
		document.modifyform.email1.focus();
		return false;
	}
		//email형식
	else if(!document.modifyform.email2.value && document.modifyform.email3.value == 0) {
		alert("이메일 형식에 일치하지 않습니다")
		document.modifyform.email2.focus();
		return false;
	}
};

function selectEmail2Chk() {
	//직접 입력이 아닌 경우
	if(document.modifyform.email3.value !=0) {
		document.modifyform.email2.value = document.modifyform.email3.value;
	} else {
		document.modifyform.email2.value = "";
		document.modifyform.email2.focus();
		returnfalse;
	}
};
	

  
 //common function--
   
   // checkbox-checkAll - cart
   $(function() {
      $("#all_check").change(function() {
         var is_checked = $("#all_check").is(":checked");
         $(".p_selectChk").prop("checked", is_checked); // is_checked : true
      });
   });
   
   //admin - statement change event

   // customer - refund
   function refund_ask(){
 	  confirm("환불신청을 하시겠습니까?");
   };  
   
   // product upload button event - product
   function p_upload(){
	   alert("업데이트 되었습니다");
   };
   
  
   //productAdd();
   function productAdd() {
	   confirm("상품을 등록하시겠습니까?"); //안되ㅏㅁ
   };
   
   
