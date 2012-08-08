package br.com.fractal.model.enums;

public enum Estado {
	TODO, DOING, DONE, AWAITING_TO_APPROVE, ICEBOX;
	
	@SuppressWarnings("unused")
	private String getName() {
		return name().replace("_", "");
	}
	
}
