document.addEventListener("DOMContentLoaded", function() {
	let form = document.detailForm;
	
	// 글목록 버튼 처리
	let btn_board_list = document.getElementById("btn_board_list");
	btn_board_list.addEventListener("click", function() {
		form.action = "getBoardList";
		form.submit();
	})
	
	// 글삭제 버튼 처리
	let btn_delete = document.getElementById("btn_delete");
	if(btn_delete != null) {
		btn_delete.addEventListener("click", function() {
			form.action = "deleteBoard";
			form.submit();
		})
	}
	
})