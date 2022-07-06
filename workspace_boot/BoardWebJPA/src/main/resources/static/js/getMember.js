	document.addEventListener("DOMContentLoaded", function() {
		let form = document.detailMemberForm;
		
		// 회원삭제(탈퇴) 버튼 처리
		let btn_delete = document.getElementById("btn_delete");
		btn_delete.addEventListener("click", function() {
			form.action = "deleteMember";
			form.submit();
		})
		
		// 글목록 버튼 처리
		let btn_board_list = document.getElementById("btn_board_list");
		btn_board_list.addEventListener("click", function() {
			form.action = "getBoardList";
			form.submit();
		})
	})