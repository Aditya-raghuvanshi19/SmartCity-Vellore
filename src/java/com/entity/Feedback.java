package com.entity;

public class Feedback {

	private int id;

	private int serviceId;

	private int userId;

	private String comment;

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Feedback(int serviceId, int userId, String comment) {
		super();
		this.serviceId = serviceId;
		this.userId = userId;
		this.comment = comment;
	}

	public Feedback(int id, int serviceId, int userId, String comment) {
		super();
		this.id = id;
		this.serviceId = serviceId;
		this.userId = userId;
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
