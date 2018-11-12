package org.userdata.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;

@Entity
@Table(name= "userdata")
@SuppressWarnings("serial")
@DynamicInsert
public class Userdata implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "userdataId" )
	private Long userdataId;
	
	@NotNull
	@Column(name = "userName" )
	private String userName;
	
	
	@Column(name = "gname" )
	@ColumnDefault("'Null'")
	private String gname;
	
	
	@Column(name = "sex" )
	@ColumnDefault("'Null'")
	private String sex;
	
	
	@Column(name = "mob", unique = true )
	private String mob;
	
	@Column(name = "mob1" )
	@ColumnDefault("'Null'")
	private String mob1;
	

	@Column(name = "email" )
	@ColumnDefault("'test@gmail.com'")
	private String email;
	
	
	@Column(name = "job" )
	@ColumnDefault("'Null'")
	private String job;
	
	@Column(name = "address" )
	@ColumnDefault("'Null'")
	private String address;

	@Column(name = "remark" )
	@ColumnDefault("'Null'")
	private String remark;
	
	
	public Long getUserdataId() {
		return userdataId;
	}

	public void setUserdataId(Long userdataId) {
		this.userdataId = userdataId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getMob() {
		return mob;
	}

	public void setMob(String mob) {
		this.mob = mob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getMob1() {
		return mob1;
	}

	public void setMob1(String mob1) {
		this.mob1 = mob1;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
