package com.springbook.biz.board;

// 이전, 다음, 시작 페이지, 끝 페이지 설정하는 클래스
public class PageDTO {
	private int startPage;      // 시작 페이지
	private int endPage;        // 끝 페이지
	private boolean prev, next; // 이전, 다음 작동 유무
	private int total;          // 전체 글 수 
	private BlockDTO block;
	
	public PageDTO(BlockDTO block, int total) {
		this.block = block;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(block.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int endPage2 = (int)(Math.ceil(total * 1.0)) / block.getAmount(); // 실제 endPage
		
		if (endPage2 < this.endPage) this.endPage = endPage2;
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < endPage2;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotal() {
		return total;
	}

	public BlockDTO getBlock() {
		return block;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setBlock(BlockDTO block) {
		this.block = block;
	}

	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", block=" + block + "]";
	}
}