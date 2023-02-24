package com.study.hard.vo;

import org.apache.ibatis.type.Alias;

@Alias("hVO")
public class HVO {
	String id;
	String name;
	String grade;
	String class1;
	String no;
	String ssn1;
	String email;
	String contact1;
	String contact2;
	String contact3;
	String address;
	String school1;
	String school2;
	String school3;
	String entryDate;
	String resignDate;
	String remark;
	String gender;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClass1() {
		return class1;
	}

	public void setClass1(String class1) {
		this.class1 = class1;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSsn1() {
		return ssn1;
	}

	public void setSsn(String ssn1) {
		this.ssn1 = ssn1;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact1() {
		return contact1;
	}

	public void setContact1(String contact1) {
		this.contact1 = contact1;
	}

	public String getContact2() {
		return contact2;
	}

	public void setContact2(String contact2) {
		this.contact2 = contact2;
	}

	public String getContact3() {
		return contact3;
	}

	public void setContact3(String contact3) {
		this.contact3 = contact3;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSchool1() {
		return school1;
	}

	public void setSchool1(String school1) {
		this.school1 = school1;
	}

	public String getSchool2() {
		return school2;
	}

	public void setSchool2(String school2) {
		this.school2 = school2;
	}

	public String getSchool3() {
		return school3;
	}

	public void setSchool3(String school3) {
		this.school3 = school3;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getResignDate() {
		return resignDate;
	}

	public void setResignDate(String resignDate) {
		this.resignDate = resignDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
}
