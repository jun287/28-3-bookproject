// 28기 이원상 2018. 7. 18(수) ShoppingCart.java
package dto.bookshop.project;

public class ShoppingCart {						// 접근제한자 private 캡슐화
	private int shoppingCartNumber;				// 쇼핑카트 no
	private int bookNumber;						// 책 no
	private int memberNumber;					// 회원 no
	private int shoppingCartAmount;				// 쇼핑카트 수량(책)
	private int shoppingCartPrice;				// 쇼핑카트 가격
	private String shoppingCartDate;			// 쇼핑카트 생성일
	
	public ShoppingCart() {						// 인수없는 생성자 메소드 생성
		this.shoppingCartNumber = 0;			// 인스턴스 변수 초기화
		this.bookNumber = 0;					
		this.memberNumber = 0;
		this.shoppingCartAmount = 0;
		this.shoppingCartPrice = 0;
		this.shoppingCartDate = null;
	}
	
	// 간접 접근 방법 get, set 메소드 setting
	public int getShoppingCartNumber() {
		return this.shoppingCartNumber;			// this - 만들어질 인스턴스의 인스턴스 변수를 가르킴 	
	}

	public void setShoppingCartNumber(int shoppingCartNumber) {
		this.shoppingCartNumber = shoppingCartNumber;
		System.out.println(this.shoppingCartNumber+"\t<--setShoppingCartNumber ShoppingCart.java");
	}

	public int getBookNumber() {
		return this.bookNumber;
	}

	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
		System.out.println(this.bookNumber+"\t<--setBookNumber ShoppingCart.java");
	}

	public int getMemberNumber() {
		return this.memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
		System.out.println(this.memberNumber+"\t<--setMemberNumber ShoppingCart.java");
	}

	public int getShoppingCartAmount() {
		return this.shoppingCartAmount;
	}

	public void setShoppingCartAmount(int shoppingCartAmount) {
		this.shoppingCartAmount = shoppingCartAmount;
		System.out.println(this.shoppingCartAmount+"\t<--setShoppingCartAmount ShoppingCart.java");
	}

	public int getShoppingCartPrice() {
		return this.shoppingCartPrice;
	}

	public void setShoppingCartPrice(int shoppingCartPrice) {
		this.shoppingCartPrice = shoppingCartPrice;
		System.out.println(this.shoppingCartPrice+"\t<--setShoppingCartPrice ShoppingCart.java");
	}

	public String getShoppingCartDate() {
		return this.shoppingCartDate;
	}

	public void setShoppingCartDate(String shoppingCartDate) {
		this.shoppingCartDate = shoppingCartDate;
		System.out.println(this.shoppingCartDate+"\t<--setShoppingCartDate ShoppingCart.java");
	}
	
}

