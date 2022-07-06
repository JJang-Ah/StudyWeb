document.addEventListener("DOMContentLoaded", function() {
	let form = document.insertMemberForm;
	
	// 돌아기기 버튼
	let btn_back = document.getElementById("btn_back");
	btn_back.addEventListener("click", function() {
		location = "login";
	})
	
	// 아이디 중복 체크 버튼
	let btn_id_check = document.getElementById("btn_id_check");
	btn_id_check.addEventListener("click", function() {
		if(!form.id.value) {
			alert('아이디를 입력해주세요.');
			return;
		}
		
		form.action = "checkIdMember";
		form.submit();
	})
})