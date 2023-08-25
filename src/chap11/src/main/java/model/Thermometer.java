package model;

import java.util.HashMap;
import java.util.Map;

public class Thermometer { //온도 클래스( public 접근제어자를 지정하여 범용적으로 클래스를 사용하도록 함.)
	//컬렉션 프레임워크(list, set, map)는 자바 5.0버전이후에 제너릭이라는 문법을 추가하면서 자료형의 안전한 코드로 바뀜
	//제너릭은 <>로 표현을 하고, 자료형을 명시해주면 됨.
	private Map<String, Double> locationCelsiusMap; 
	
	
	public Thermometer() { //new를 통해 메모리를 할당할 때 생성자도 자동적으로 같이 호출되므로 접근제어자도 참조자료형과 동일하게 지정하도록 한다.
		//map이라는 인터페이스를 구현하는 참조자료형으로 HashMap을 활용하도록 한다. (key, value형태로 데이터를 관리하는 것이 TreeMap과의 공통점)
		//자바 8.0버전부터는 실질적인 할당 메모리에서 제너릭<>의 자료형을 생략할 수 있게끔 간편성을 허용하는 문법을 제공해주고 있음
		locationCelsiusMap = new HashMap<>(); //map은 키값으로 접근함.
	}
	
	public void setCelsius(String location, Double value) { //기온 저장
		locationCelsiusMap.put(location, value); //지역과 기온을 map의 형태로 저장을 하도록 한다. 
		// -> list와 set은 add메소드를 통해 인스턴스를 담아주면 됐었음, 
		//    map은 키와 벨류형태로 데이터를 관리할 수 있는 put메소드를 제공해주고 있었음!!
	}
	
	public Double getCelsius(String location) { //날씨 데이터를 반환(따라서 반환형은 Double로 잡음) 
	//이 메소드는 지역정보(키값)를 전달받아서 map의 컬렉션프레임워크 메서드를 통해 value값을 읽어오도록 한다.
		return locationCelsiusMap.get(location);
	}
	
	public Double getFahrenheit(String location) { //저장하는 온도가 섭씨온도이기 때문에 그 섭씨온도를 화씨온도로 계산해서 반환을 해주는 메소드
		Double celsius = getCelsius(location); //섭씨온도를 가져오는 메소드를 호출
		
		if(celsius == null) { //데이터가 없으면 리턴값이 없으니까 null값이 반환되는 것임
			return null; //호출된 쪽으로 데이터가 없다고 보내주게 됨.
		} 
		
		
		return celsius.doubleValue() * 1.8 + 32.0; //화씨온도로 계산하는 방법
		//double값을 래퍼클래스로 감싸도록 함.
	}
	
	public String getInfo() { //현재 기능의 버전 히스토리 관리를 위한 메소드
		return "Ver. 1.0";
	}
}
