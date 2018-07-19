// 28�� �̿��� 2018. 7. 18(��) ShoppingCart.java
package dto.bookshop.project;

public class ShoppingCart {						// ���������� private ĸ��ȭ
	private int shoppingCartNumber;				// ����īƮ no
	private int bookNumber;						// å no
	private int memberNumber;					// ȸ�� no
	private int shoppingCartAmount;				// ����īƮ ����(å)
	private int shoppingCartPrice;				// ����īƮ ����
	private String shoppingCartDate;			// ����īƮ ������
	
	public ShoppingCart() {						// �μ����� ������ �޼ҵ� ����
		this.shoppingCartNumber = 0;			// �ν��Ͻ� ���� �ʱ�ȭ
		this.bookNumber = 0;					
		this.memberNumber = 0;
		this.shoppingCartAmount = 0;
		this.shoppingCartPrice = 0;
		this.shoppingCartDate = null;
	}
	
	// ���� ���� ��� get, set �޼ҵ� setting
	public int getShoppingCartNumber() {
		return this.shoppingCartNumber;			// this - ������� �ν��Ͻ��� �ν��Ͻ� ������ ����Ŵ 	
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