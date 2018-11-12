package org.userdata.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.userdata.dao.AdminDao;
import org.userdata.model.Admin;
import org.userdata.model.Userdata;
import org.userdata.service.AdminService;

@Service("adminService")
@Transactional(propagation = Propagation.SUPPORTS, rollbackFor=Exception.class)
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public Admin loginAdmin(Admin admin) {
		return adminDao.loginAdmin(admin);
	}

	@Override
	public Userdata create(Userdata userdata) {
		return adminDao.create(userdata);
		
	}

	@Override
	public List<Userdata> getAll() {
		return adminDao.getAll();
	}

	@Override
	public Userdata find(Long userdataId) {
		return adminDao.find(userdataId);
	}

	@Override
	public Userdata update(Userdata userdata) {
		return adminDao.update(userdata);

	}

	@Override
	public void delete(Long userdataId) {
		adminDao.delete(userdataId);
		
	}

	@Override
	public Userdata checkData(Userdata userdata) {
		return adminDao.checkData(userdata);
	}

	@Override
	public Admin createmember(Admin admindata) {
		return adminDao.createmember(admindata);
	}

	@Override
	public List<Admin> getAllMember() {
		return adminDao.getAllMember();
	}

}
