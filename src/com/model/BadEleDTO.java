package com.model;

public class BadEleDTO {
	private String element_name;
	private String symptom;

	public String getElement_name() {
		return element_name;
	}

	public void setElement_name(String element_name) {
		this.element_name = element_name;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public BadEleDTO(String element_name, String symptom) {
		this.element_name = element_name;
		this.symptom = symptom;
	}

}
