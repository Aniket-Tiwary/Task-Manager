package com.example.taskmanager.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Tasks")
@Table(name="Tasks")
public class Tasks {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="taskId")
	private int taskId;
	private String email;
	private String taskName;
	private String taskDescription;
	private java.sql.Date taskDate;
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int id) {
		this.taskId = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	
	public java.sql.Date getTaskDate() {
		return taskDate;
	}
	public void setTaskDate(java.sql.Date taskDate) {
		this.taskDate = taskDate;
	}
	public Tasks() {
		super();
	}
	public Tasks(String email, String taskName, String taskDescription, java.sql.Date taskDate) {
		super();
		this.email = email;
		this.taskName = taskName;
		this.taskDescription = taskDescription;
		this.taskDate = taskDate;
	}
	
	
	
	
	 
}

