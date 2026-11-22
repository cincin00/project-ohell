package board;

public class BoardDataBean {
	private int boardnum;
	private String id_day;
	private int like_num;
	private String review;
	private String subject;	
	private String id;
	private String img_path;
	private String plan_calendar;
	public BoardDataBean() 
	{
	}
	
	public BoardDataBean(String id_day, int like_num, String review, String subject, String id){
		super();
		this.id_day=id_day;
		this.like_num=like_num;
		this.review=review;
		this.subject=subject;
		this.id=id;
	}
	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getPlan_calendar() {
		return plan_calendar;
	}

	public void setPlan_calendar(String plan_calendar) {
		this.plan_calendar = plan_calendar;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getId_day() {
		return id_day;
	}

	public void setId_day(String id_day) {
		this.id_day = id_day;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}