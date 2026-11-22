package client;

public class ClientDataBean {
	private String id;
	private String passwd;
	private String name;
	private int age;
	private String zipcode;
	private String address;
	private String email;
	private String phone;
	private int able;
	private int sex;
	private int num;
	private String ask;
	private String answer;
	
	public ClientDataBean(){}
	
	public ClientDataBean(ClientDataBean data)
	{
		this.id = data.id;
		this.passwd =data.passwd;
		this.name = data.name;
		this.age = data.age;
		this.email = data.email;
		this.zipcode = data.zipcode;
		this.address = data.address;
		this.phone = data.phone;
		this.able = data.able;
		this.sex = data.sex;
		this.num = data.num;
		this.ask = data.ask;
		this.answer = data.answer;
	}
	
	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAble() {
		return able;
	}

	public void setAble(int able) {
		this.able = able;
	}
	public int getSex()
	{
		return sex;
	}
	public void setSex(int sex)
	{
		this.sex = sex;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	
}
