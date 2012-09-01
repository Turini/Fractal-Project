package br.com.fractal.util;

public class ProjectIds {

	private long id;
	private String name;

	public ProjectIds(long id, String Name) {
		this.id = id;
		name = Name;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
