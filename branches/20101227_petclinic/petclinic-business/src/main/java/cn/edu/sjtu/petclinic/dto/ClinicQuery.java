package cn.edu.sjtu.petclinic.dto;

import cn.edu.sjtu.common.orm.Page;
import cn.edu.sjtu.petclinic.entity.Clinic;

public class ClinicQuery {
	
	private String name;
	
	private Integer grade;
	
	private String address;
	
	private Integer star;
	
	private Clinic.Status status;
	
	private Page<Clinic> page = new Page<Clinic>(10);

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public Clinic.Status getStatus() {
		return status;
	}

	public void setStatus(Clinic.Status status) {
		this.status = status;
	}

	public Page<Clinic> getPage() {
		return page;
	}

	public void setPage(Page<Clinic> page) {
		this.page = page;
	}
	
}
