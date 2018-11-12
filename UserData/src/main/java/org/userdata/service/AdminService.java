package org.userdata.service;

import java.util.List;

import org.userdata.model.Admin;
import org.userdata.model.Userdata;

public interface AdminService {
	public Admin loginAdmin(Admin admin);
	public Userdata checkData(Userdata userdata);
	public Userdata create(Userdata userdata);
	public List<Userdata> getAll();
	public Userdata find(Long userdataId);
	public Userdata update(Userdata userdata);
	public void delete(Long userdataId);
	public Admin createmember(Admin admindata);
	public List<Admin> getAllMember();	
}
