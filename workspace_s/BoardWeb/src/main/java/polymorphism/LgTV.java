package polymorphism;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component("tv")
public class LgTV implements TV{
	
	//@Inject // 자바 자체에서 제공하는 기능
	//@Autowired
	//@Qualifier("sony") // 빈이 2개이상이라 예외로 넘어가기 때문에 빈을 명시해준다
	//@Resource("sony")
	
	
	private Speaker speaker;
	private int price;
	
	// 기본 생성자
	public LgTV() {
		System.out.println("=> LgTV(1) --- 객체 생성");
	}
	// 생성자 오버로딩 1
	public LgTV(Speaker speaker) {
		this.speaker = speaker;
		System.out.println("=> LgTV(2) --- 객체 생성");
	}
	// 생성자 오버로딩2
	public LgTV(Speaker speaker, int price) {
		this.speaker = speaker;
		this.price = price;
		System.out.println("=> LgTV(3) --- 객체 생성");
	}
	// setter 
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
		System.out.println("=> setSpeaker() 호출");
	}
	
	public void setPrice(int price) {
		this.price = price;
		System.out.println("=> setPrice() 호출");
	}
	@Override
	public void powerOn() {
		System.out.println("LgTV --- 전원을 켠다");
	}
	@Override
	public void powerOff() {
		System.out.println("LgTV --- 전원을 끈다");
	}
	@Override
	public void volumeUp() {
		speaker.volumeUp();
		//System.out.println("LgTV --- 소리를 높인다");
	}
	@Override
	public void volumeDown() {
		speaker.volumeDown();
		//System.out.println("LgTV --- 소리를 낮춘다");
	}
}
