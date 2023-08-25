package member;

import java.util.Date;

public class Member { //순수 데이터를 보관하거나 처리할 목적으로 정의하는 자료형을 JavaBean이라고 부른다.
	private String id;
	private String password;
	private String name;
	private String address;
	private String email;
	private Date registerDate; //언제 회원가입을 했는지에 대한 날짜정보를 보관하도록 한다. 
	                           //(서버자체에서 저장되도록 함/ 사용자가 전달받게되면 문제점들이 야기됨_마음대로 날짜를 다르게 수정할 수 있음)
	
	//자바빈의 자료형은 데이터를 보관할 목적 또는 데이터만을 처리할 목적으로 처리하는 클래스를 자바빈이라고 부름
	//자바빈이라는 용어자체는 반드시 따라야하는 규약이 있음 => 여기에 정의되는 메소드의 이름이 반드시 프로퍼티(property)에 따라서 작성되어야함.
	//우리들이 지어주는 이름에서 저장하고 읽어올 이름을 정의하고자 한다면 getter, setter메소드를 선언하도록 한다.
	//get(값을 가져올 때)과 set(값을 셋팅할 때)을 앞에 적어주고 그 뒤에 프로퍼티 이름에 첫글자는 반드시 대문자로 적어주도록 한다.(프로퍼티이름에 기반해서 정의를 해줘야 한다.)
	
	//필드를 정의하고 이클립스 도움을 받아서 메소드를 정의했음 이때 정의한 getter, setter메소드들을 보면 필드 이름에 기반하여 정의를 해주고 있었음
	//따라서 프로퍼티의 이름을 필드 이름과 똑같이 사용을 하겠다는 의도가 들어가는 것이다.
	//프로퍼티의 이름과 필드 이름은 항상 같을 필요 없음 (다르다면 수동으로 getter, setter메소드를 다시 작성을 해줘야함.)
	//하지만 일반적으로 프로퍼티의 이름과 필드의 이름을 동일하게 사용한다.
	
	public String getId() { //get + 프로퍼티 이름으로 지정해주도록 함.
		return id; //리턴만 필드명으로 제대로 지정해주면 프로퍼티이름과 다르게 지정해줘도 상관이 없음. 하지만 일일히 챙겨야하기 때문에 번거로움
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	
}
