package org.scourt.iros.service;

public class OfficerVO {
	
	private String id;
	private String name;
	private String birthday;
	private String rank;
	private String office_number;
	private String phone_number;
	private String initday;
	private String department;
	private String location;
	private String departmentName;
	
	//setter
	public void setId(String pid) {
		this.id=pid;
	}
	
	public void setName(String pname) {
		this.name=pname;
	}
	
	public void setBirthday(String pbirth) {
		if(pbirth=="") {
			pbirth=null;
		}
		
		this.birthday=pbirth;
	}
	
	public void setRank(String prank) {
		this.rank=prank;
	}
	
	public void setOfficeNum(String poffice) {
		this.office_number=poffice;
	}
	
	public void setPhoneNum(String pphone) {
		this.phone_number=pphone;
	}
	
	public void setInitday(String pinit) {
		if(pinit=="") {
			pinit=null;
		}
		this.initday=pinit;
		
	}
	
	public void setDepartment(String pdepartment) {
		this.department=pdepartment;
	}
	
	public void setLocation(String plocation) {
		if(plocation==null) {
			plocation="";
		}
		this.location=plocation;
	}
	
	public void setDepartmentName(String pdepartmentName) {
		this.departmentName = pdepartmentName;
	}
	
	//getter
	public String getId() {
		return this.id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getBirthday() {
		return this.birthday;
	}
	
	public String getRank() {
		return this.rank;
	}
	
	public String getOfficeNum() {
		return this.office_number;
	}
	
	public String getPhoneNum() {
		return this.phone_number;
	}
	
	public String getInitday() {
		return this.initday;
	}
	
	public String getDepartment() {
		return this.department;
	}
	
	public String getLocation() {
		return this.location;
	}
	
	public String getDepartmentName() {
		return this.departmentName;
	}
	
	public String toString() {
		return "id = "+this.id+", "+ "name = "+this.name+", "+"birthday = "+this.birthday+", "+"rank = "+this.rank+", "+"office_number = "
				+this.office_number+", "+"phone_number = "+this.phone_number+", "+"initday = "+this.initday+", "+"department = "
				+this.department+", "+"location = "+this.location+", "+"departmentName = "+this.departmentName;
	}
	
}
