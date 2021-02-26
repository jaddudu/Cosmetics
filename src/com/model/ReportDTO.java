package com.model;

public class ReportDTO {
	private String id;
	private String company;
	private String proName;
	private String symptom;
	
	// 평가 목록에서 bad라고 나타낸 제품의 회사 이름과 제품이름
	public ReportDTO(String company, String proName) {
		super();
		this.company = company;
		this.proName = proName;
	}

	

	// 알러지 제보 인서트
	public ReportDTO(String id, String company, String proName, String symptom) {
		super();
		this.id = id;
		this.company = company;
		this.proName = proName;
		this.symptom = symptom;
	}

	// 알러지 제보 목록
	public ReportDTO(String company, String proName, String symptom) {
		super();
		this.company = company;
		this.proName = proName;
		this.symptom = symptom;
	}



	public String getSymptom() {
		return symptom;
	}



	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getCompany() {
		return company;
	}



	public void setCompany(String company) {
		this.company = company;
	}



	public String getProName() {
		return proName;
	}



	public void setProName(String proName) {
		this.proName = proName;
	}



	
	
}
