package dto.bookshop.project;

public class BoardQnAComment {

	private int boardQnaCommnetNo;
	private int boardQnaNo;
	private int adminNo;
	private String boardQnaCommentContent;
	private String boardQnaCommentDate;
	
	public int getBoardQnaCommnetNo() {
		return boardQnaCommnetNo;
	}
	public void setBoardQnaCommnetNo(int boardQnaCommnetNo) {
		this.boardQnaCommnetNo = boardQnaCommnetNo;
	}
	public int getBoardQnaNo() {
		return boardQnaNo;
	}
	public void setBoardQnaNo(int boardQnaNo) {
		this.boardQnaNo = boardQnaNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getBoardQnaCommentContent() {
		return boardQnaCommentContent;
	}
	public void setBoardQnaCommentContent(String boardQnaCommentContent) {
		this.boardQnaCommentContent = boardQnaCommentContent;
	}
	public String getBoardQnaCommentDate() {
		return boardQnaCommentDate;
	}
	public void setBoardQnaCommentDate(String boardQnaCommentDate) {
		this.boardQnaCommentDate = boardQnaCommentDate;
	}
	
	
}
