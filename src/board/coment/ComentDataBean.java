package board.coment;

public class ComentDataBean {
	private int coment_num;
	private int content_num;
	private String comenter;
	private String coment;
	private int like_num;
	
	public ComentDataBean() {
	}

	public ComentDataBean(int content_num,String comenter,String coment){
		super();
		this.content_num=content_num;
		this.comenter=comenter;
		this.coment=coment;
	}
	
	public int getComent_num() {
		return coment_num;
	}
	public void setComent_num(int coment_num) {
		this.coment_num = coment_num;
	}
	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
	public String getComenter() {
		return comenter;
	}
	public void setComenter(String comenter) {
		this.comenter = comenter;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
}