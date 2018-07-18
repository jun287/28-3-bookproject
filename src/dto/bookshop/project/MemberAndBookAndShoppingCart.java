//// 28기 이원상 2018. 7. 18(수) MemberAndBookAndShoppingCart.java
package dto.bookshop.project;

public class MemberAndBookAndShoppingCart {				// 접근제한자 private 캡슐화
	private Member member;
	private Book book;
	private ShoppingCart shoppingCart;
	
	public MemberAndBookAndShoppingCart() {				// 인수없는 생성자 메소드 생성
		this.member=null;								// 인스턴스 변수 초기화
		this.book=null;
		this.shoppingCart=null;
	}
	// 간접 접근 방법 get, set 메소드 setting
	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public ShoppingCart getShoppingCart() {
		return this.shoppingCart;
	}

	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
}
