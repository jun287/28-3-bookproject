//// 28�� �̿��� 2018. 7. 18(��) MemberAndBookAndShoppingCart.java
package dto.bookshop.project;

public class MemberAndBookAndShoppingCart {				// ���������� private ĸ��ȭ
	private Member member;
	private Book book;
	private ShoppingCart shoppingCart;
	
	public MemberAndBookAndShoppingCart() {				// �μ����� ������ �޼ҵ� ����
		this.member=null;								// �ν��Ͻ� ���� �ʱ�ȭ
		this.book=null;
		this.shoppingCart=null;
	}
	// ���� ���� ��� get, set �޼ҵ� setting
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