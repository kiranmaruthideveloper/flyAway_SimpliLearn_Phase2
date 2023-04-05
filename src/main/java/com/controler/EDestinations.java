package com.controler;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

@Entity
@Table(name="destinations")
public class EDestinations {
	@Id @GeneratedValue
	@Column(name="id")
	private int id;
	@Column(name="destinationName")
	private String Destination;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDestination() {
		return Destination;
	}
	public void setDestination(String destination) {
		Destination = destination;
	}
	
	public boolean addData(String name) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		this.setDestination(name);
		Transaction tx = session_db.beginTransaction();
		session_db.save(this);
		tx.commit();
		return true;
	}
	public boolean remove(int id) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		Query q = session_db.createQuery("delete EDestinations where id="+id);
		Transaction tx = session_db.beginTransaction();
		q.executeUpdate();
		tx.commit();
		
		return true;
	}
	
}
