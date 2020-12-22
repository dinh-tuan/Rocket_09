package Entity;

public abstract class HocSinh extends Person {

	private int id;
	private String nameHs;

	public HocSinh(String nameP) {
		super(nameP);
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameHs() {
		return nameHs;
	}

	public void setNameHs(String nameHs) {
		this.nameHs = nameHs;
	}
	
	
}
