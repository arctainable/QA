package Util;

public class Criteria {	// 다른 src에서 모두 사용되는 공통 유틸리티 모음집

	private int pageNum;	// 페이지번호
	private int amount;		// 한 페이지당 보여줄 레코드 갯수
	private String type;	// 검색조건
	private String keyword;	// 검색단어

	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
