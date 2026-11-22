package places;

public class PlaceData {
	private String placeid;
	private String name;
	private String id;
	private String tel = "";
	private String detail = "";
	private String lon;
	private String lat;
	private int placenum;
	private String id_day;
	private int day;
	
	public PlaceData(){}
	
	public PlaceData(PlaceData data){
		this.placeid = data.placeid;
		this.name = data.name;
		this.id = data.id;
		this.tel = data.tel;
		this.detail = data.detail;
		this.lon = data.lon;
		this.lat = data.lat;
		this.placenum = data.placenum;
		this.id_day = data.id_day;
	}
	public String getPlaceid() {
		return placeid;
	}
	public void setPlaceid(String placeid) {
		this.placeid = placeid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public int getPlacenum() {
		return placenum;
	}
	public void setPlacenum(int placenum) {
		this.placenum = placenum;
	}
	public String getId_day() {
		return id_day;
	}
	public void setId_day(String id_day) {
		this.id_day = id_day;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	
}
