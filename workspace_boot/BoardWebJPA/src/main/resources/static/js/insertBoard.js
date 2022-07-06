document.addEventListener("DOMContentLoaded", function() {
	let form = document.insertForm;
		
	// 글목록 버튼 처리
	let btn_board_list = document.getElementById("btn_board_list");
	btn_board_list.addEventListener("click", function() {
		form.action = "getBoardList";
		form.submit();
	})
})