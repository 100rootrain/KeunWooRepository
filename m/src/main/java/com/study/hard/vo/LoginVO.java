package com.study.hard.vo;

import org.apache.ibatis.type.Alias;

import com.study.hard.util.Sha256Enc;

@Alias("loginVO")
public class LoginVO {
	String userId;
	String userPw;
	String userNm;
	String gndrCd;
	String rankCd;;
	String deptCd;
	String birth;
	String Reference;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = Sha256Enc.encrypt(userPw);
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getGndrCd() {
		return gndrCd;
	}
	public void setGndrCd(String gndrCd) {
		this.gndrCd = gndrCd;
	}
	public String getRankCd() {
		return rankCd;
	}
	public void setRankCd(String rankCd) {
		this.rankCd = rankCd;
	}
	public String getDeptCd() {
		return deptCd;
	}
	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getReference() {
		return Reference;
	}
	public void setReference(String reference) {
		Reference = reference;
	}
	@Override
	public String toString() {
		return "LoginVO [userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm + ", gndrCd=" + gndrCd
				+ ", rankCd=" + rankCd + ", deptCd=" + deptCd + ", birth=" + birth + ", Reference=" + Reference
				+ ", getUserId()=" + getUserId() + ", getUserPw()=" + getUserPw() + ", getUserNm()=" + getUserNm()
				+ ", getGndrCd()=" + getGndrCd() + ", getRankCd()=" + getRankCd() + ", getDeptCd()=" + getDeptCd()
				+ ", getBirth()=" + getBirth() + ", getReference()=" + getReference() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	
	
	
	
	// Source - Generate Getters and Setters
	
	


	

	// Source - Generate toString()


}
