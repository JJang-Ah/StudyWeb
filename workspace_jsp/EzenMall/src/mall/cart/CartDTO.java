package mall.cart;

public class CartDTO {

	// 장바구니 번호, 구매자, 상품번호, 상품이름, 구매금액, 구매수량, 상품이미지
	private int cart_id;
	private String buyer;
	private int product_id;
	private String product_name;
	private int buy_price;
	private int buy_count;
	private String product_image;

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public int getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", buyer=" + buyer + ", product_id=" + product_id + ", product_name="
				+ product_name + ", buy_price=" + buy_price + ", buy_count=" + buy_count + ", product_image="
				+ product_image + ", getCart_id()=" + getCart_id() + ", getBuyer()=" + getBuyer() + ", getProduct_id()="
				+ getProduct_id() + ", getProduct_name()=" + getProduct_name() + ", getBuy_price()=" + getBuy_price()
				+ ", getBuy_count()=" + getBuy_count() + ", getProduct_image()=" + getProduct_image() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
