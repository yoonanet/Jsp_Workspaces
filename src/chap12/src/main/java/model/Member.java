package model;

public class Member {
	private String name;

	public String getName() { //자바빈의 규약에 따라서 getter, setter메서드를 추가하도록 함 
		                      //(프로퍼티와 필드의 이름을 동일하게 사용하고 있음 - 일반적인 방법)
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
