package polymorphism;

public class LgTV implements TV{
	private Speaker speaker;
	private int price;
	
	// �⺻ ������
	public LgTV() {
		System.out.println("=> LgTV(1) --- ��ü ����");
	}
	// ������ �����ε� 1
	public LgTV(Speaker speaker) {
		this.speaker = speaker;
		System.out.println("=> LgTV(2) --- ��ü ����");
	}
	// ������ �����ε�2
	public LgTV(Speaker speaker, int price) {
		this.speaker = speaker;
		this.price = price;
		System.out.println("=> LgTV(3) --- ��ü ����");
	}
	// setter 
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
		System.out.println("=> setSpeaker() ȣ��");
	}
	
	public void setPrice(int price) {
		this.price = price;
		System.out.println("=> setPrice() ȣ��");
	}
	@Override
	public void powerOn() {
		System.out.println("LgTV --- ������ �Ҵ�");
	}
	@Override
	public void powerOff() {
		System.out.println("LgTV --- ������ ����");
	}
	@Override
	public void volumeUp() {
		speaker.volumeUp();
		//System.out.println("LgTV --- �Ҹ��� ���δ�");
	}
	@Override
	public void volumeDown() {
		speaker.volumeDown();
		//System.out.println("LgTV --- �Ҹ��� �����");
	}
}
