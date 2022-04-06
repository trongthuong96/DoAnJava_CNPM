package web_spring_mvc.Entity;

public class MenuEntity {
	private int id;
	private String name;
	private String url;
	
	//constructor
	public MenuEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//get set
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
