package dto.bookshop.project;

public class BookCode {
	//카테고리에서 사용되는 데이터들의 저장할 공간을 캡슐화로 생성한다.
	private int bookcode_no;
	private String bookcode_name;
	
	public int getBookcode_no() {
		return bookcode_no;
	}
	public void setBookcode_no(int bookcode_no) {
		this.bookcode_no = bookcode_no;
	}
	public String getBookcode_name() {
		return bookcode_name;
	}
	public void setBookcode_name(String bookcode_name) {
		this.bookcode_name = bookcode_name;
	}
	
}