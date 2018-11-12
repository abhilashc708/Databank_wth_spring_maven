package org.userdata.dao.impl;


import java.util.List;

import javax.annotation.Resource;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.userdata.dao.AdminDao;
import org.userdata.model.Admin;
import org.userdata.model.Userdata;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	
	  @Resource(name="sessionFactory")
	    protected SessionFactory sessionFactory;

	    public void setSessionFactory(SessionFactory sessionFactory) {
	           this.sessionFactory = sessionFactory;
	    }
	    

		protected Session currentSession() {
			return sessionFactory.getCurrentSession();
		}
	   
	    protected Session getSession(){
	           return sessionFactory.openSession();
	    }

	@Override
	public Admin loginAdmin(Admin admin) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="from Admin as a where a.adminName = ? and a.adminPass = ?";
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, admin.getAdminName());
			query.setParameter(1, admin.getAdminPass());
			admin = (Admin) query.uniqueResult();
			tx.commit();
			session.close();
		}
		catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return admin;
	}

	@Override
	public Userdata create(Userdata userdata) {
		currentSession().save(userdata);
		return userdata;
		
	}


	@Override
	public List<Userdata> getAll() {
		return currentSession().createCriteria(Userdata.class).list();
	}


	@Override
	public Userdata find(Long userdataId) {
		return (Userdata)currentSession().get(Userdata.class, userdataId);
	}

	@Override
	public Userdata update(Userdata userdata) {
		 currentSession().update(userdata);
		return userdata;

	}


	@Override
	public void delete(Long userdataId) {
	
		Userdata userdata = currentSession().get(Userdata.class, userdataId);
		if(userdata != null) {
		currentSession().delete(userdata);
		}
	/*	Userdata userdata = new Userdata();
		userdata.setUserdataId(userdataId);
		if(userdata != null) {
		currentSession().delete(userdata);
		}*/
	}


	@Override
	public Userdata checkData(Userdata userdata) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="from Userdata as u where u.mob = ?";
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, userdata.getMob());
			userdata = (Userdata) query.uniqueResult();
			tx.commit();
			session.close();
		}
		catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return userdata;
	}

	@Override
	public Admin createmember(Admin admindata) {
		currentSession().save(admindata);
		return admindata;
	}


	@Override
	public List<Admin> getAllMember() {
		return currentSession().createCriteria(Admin.class).list();
	}

}
