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
@Table(name="airLines")
public class EAirLines {
	
	@Id @GeneratedValue
	@Column(name="id")
	private int id;
	@Column(name="airLinesName")
	private String airLinesName;
	@Column(name="source")
	private String source;
	@Column(name="destination")
	private String destination;
	@Column(name="date")
	private String dateOfFlying;
	@Column(name="time")
	private String timeOfFlying;
	@Column(name="distance")
	private int distance;
	@Column(name="cost")
	private int costPerKm;
	
	public int getCostPerKm() {
		return costPerKm;
	}
	public void setCostPerKm(int costPerKm) {
		this.costPerKm = costPerKm;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAirLinesName() {
		return airLinesName;
	}
	public void setAirLinesName(String airLinesName) {
		this.airLinesName = airLinesName;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDateOfFlying() {
		return dateOfFlying;
	}
	public void setDateOfFlying(String dateOfFlying) {
		this.dateOfFlying = dateOfFlying;
	}
	public String getTimeOfFlying() {
		return timeOfFlying;
	}
	public void setTimeOfFlying(String timeOfFlying) {
		this.timeOfFlying = timeOfFlying;
	}
	
	
	public boolean addData(String airLinesName, String source, String destination, String dateOfFlying,
			String timeOfFlying, int distance, int cost) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		this.setAirLinesName(airLinesName);
		this.setSource(source);
		this.setDestination(destination);
		this.setDateOfFlying(dateOfFlying);
		this.setTimeOfFlying(timeOfFlying);
		this.setDistance(distance);
		this.setCostPerKm(cost);
		
		Transaction tx = session_db.beginTransaction();
		session_db.save(this);
		tx.commit();
		return true;
	}
	
	public boolean remove(int id) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session_db = factory.openSession();
		Query q = session_db.createQuery("delete EAirLines where id="+id);
		Transaction tx = session_db.beginTransaction();
		q.executeUpdate();
		tx.commit();
		
		return true;
	}

}
