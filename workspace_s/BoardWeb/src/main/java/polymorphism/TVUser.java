package polymorphism;

public class TVUser {

	public static void main(String[] args) {
		
		/*
		 * < SamsungTV���� LgTV�� �ٲٴ� ���� >
		 * - 1, 2��: Java�� �� �� �ִ� ���
		 1. ������ Ŭ����
		 - SamsungTV���� LgTV�� �ٲٴ� �������� ������ - > ����: ��ġ�� ������ ���Ƽ� ���������� ��ƴ�.
		 2. ���� - �������̽��� ����� �����ϴ� ����� ���� 
		 - ������: �ҽ� �ڵ带 ���ľ� �Ѵ�.
		 -------------
		 
		 Spring���� �� �� �ִ� ���
		 3. ���� - Factory ������ ���� ��� 
		 - �ҽ��ڵ带 ��ġ�� �ʰ� TV�� ������ �� ����
		 - Spring�� �����Ǿ� �ִ� ���
		 */
		
		/* 1, 2�� ��� - Java�� �������� ó��
		SamsungTV tv = new SamsungTV();
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		*/
		
		// 3. �Ʒ��� �ҽ��ڵ带 ��ġ�� ����
		// run -configuration ���� argument�� �ٲ��ֱ⸸ �ϸ�ȴ�.
		BeanFactory factory = new BeanFactory();
		TV tv = (TV)factory.getBean(args[0]);
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		// ��ü ������ ȣ�� -> �ѹ��� ����ǰ� ����. (�������� �̱��� ������ ����Ǿ� ����)
		//TV tv1 = (TV)factory.getBean("tv");
		//TV tv2 = (TV)factory.getBean("tv");
		//TV tv3 = (TV)factory.getBean("tv");
		
	}
}
