package com.controler;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

@Entity
@Table(name="bookingInformation")
public class BookingInformation {
	
	@Id @GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="bookingID")
	private int bookingID;
	@Column(name="flightID")
	private int flightID;
	@Column(name="numPassengers")
	private int numPassengers;
	@Column(name="totalAmount")
	private int totalAmount;
	public int getBookingID() {
		return bookingID;
	}
	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}
	public int getFlightID() {
		return flightID;
	}
	public void setFlightID(int flightID) {
		this.flightID = flightID;
	}
	public int getNumPassengers() {
		return numPassengers;
	}
	public void setNumPassengers(int numPassengers) {
		this.numPassengers = numPassengers;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void addBookingInformation(int bookingID, int flightID, int numPassengers, int totalAmount) {
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session_db = factory.openSession();
		
		this.setBookingID(bookingID);
		this.setFlightID(flightID);
		this.setNumPassengers(numPassengers);
		this.setTotalAmount(totalAmount);
		
		Transaction tx = session_db.beginTransaction();
		session_db.save(this);
		tx.commit();
		
	}
	
	
	
	
	
	

}
