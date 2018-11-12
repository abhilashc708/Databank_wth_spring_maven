package org.userdata.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "admin")
@SuppressWarnings("serial")
public class Admin implements Serializable {
	
	@Id
	@GeneratedValue
	@Column(name = "adminId" )
	private Long adminId;
	
	@Column(name = "adminName" )
	private String adminName;
	
	@Column(name = "adminPass" )
	private String adminPass;
	
	@Column(name = "roll" )
	private String roll;
	
	@Column(name = "action" )
	private String action;
	
	@Column(name = "email" )
	private String email;
	
	@Column(name = "mob" )
	private String mob;
	
	
	
	public Long getAdminId() {
		return adminId;
	}
	public void setAdminId(Long adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
	public String getRoll() {
		return roll;
	}
	public void setRoll(String roll) {
		this.roll = roll;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	

}
