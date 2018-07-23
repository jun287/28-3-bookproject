package dto.bookshop.project;

public class BookCode {
	//카테고리에서 사용되는 데이터들의 저장할 공간을 캡슐화로 생성한다.
	private int bookCodeNo;
	private String bookCodeName;
	
	public int getBookCodeNo() {
		return bookCodeNo;
	}
	public void setBookCodeNo(int bookCodeNo) {
		this.bookCodeNo = bookCodeNo;
	}
	public String getBookCodeName() {
		return bookCodeName;
	}
	public void setBookCodeName(String bookCodeName) {
		this.bookCodeName = bookCodeName;
	}
}