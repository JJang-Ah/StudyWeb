package polymorphism;

public class SamsungTV implements TV {

	@Override
	public void powerOn() {
		System.out.println("Samsung TV --- ������ �Ҵ�");
	}
	@Override
	public void powerOff() {
		System.out.println("Samsung TV --- ������ ����");
	}
	@Override
	public void volumeUp() {
		System.out.println("Samsung TV --- �Ҹ��� ���δ�");
	}
	@Override
	public void volumeDown() {
		System.out.println("Samsung TV --- �Ҹ��� �����");
	}
}
