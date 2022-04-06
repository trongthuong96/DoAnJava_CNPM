package web_spring_mvc.Entity;

public class BannerEntity {
	private int id;
	private String img;
	private String content;
	private String capption;
	
	public BannerEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCapption() {
		return capption;
	}
	public void setCapption(String capption) {
		this.capption = capption;
	}
	
}
