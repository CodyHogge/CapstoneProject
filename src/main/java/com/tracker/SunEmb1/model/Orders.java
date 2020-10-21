package com.tracker.SunEmb1.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.tracker.SunEmb1.utils.Division;
import com.tracker.SunEmb1.utils.Priority;
import com.tracker.SunEmb1.utils.Status;

@Entity
@Table(name="SunshineOrders")
public class Orders {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long orderId;
	@Column(name="Customer_Name")
	private String customerName;
	@Column(name="UpdatingUser")
	private String userId;
	//private Customers customer; //need to make this a string for the customer name
	//private Users updateUser; //need to make this a string for the updating employee's name
	@Column
	private LocalDate receivedDate;
	
	@Column
	private LocalDate acceptedDate;
	
	@Column
	private LocalDate updatedDate;
	
	@Column
	private LocalDate closedDate;
	
	@Column
	private LocalDate divAcceptedDate;
	
	@Column
	private LocalDate requestedDate;
	
	private String div1;
	private String div2;
	private String div3;
	private String priority;
	private String status;
	private String log;
	private String note;
	private String description;
	//private Division div1;
	//private Division div2;
	//private Division div3;
	//private Priority priority;
	//private Status status;
	
	
	public String getNote() {
		return note;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	public String getLog() {
		return "***LOG***" +"<br>" + log;
	}
	
	public void setLog(String inputNote, String user, LocalDate date) {
		if(this.log == null) {
			this.log = "LOG ENTRY: " + inputNote+ " -"+user+" on "+date;
		}else {
			this.log = this.log + "<br>" + "LOG ENTRY: " + inputNote +" -" +user+" on "+date;
		}
	}
	
	public Long getOrderId() {
		return orderId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public LocalDate getRequestedDate() {
		return requestedDate;
	}
	public void setRequestedDate(LocalDate requestedDate) {
		this.requestedDate = requestedDate;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public LocalDate getReceivedDate() {
		return receivedDate;
	}
	public void setReceivedDate(LocalDate receivedDate) {
		this.receivedDate = receivedDate;
	}
	public LocalDate getAcceptedDate() {
		return acceptedDate;
	}
	public void setAcceptedDate(LocalDate acceptedDate) {
		this.acceptedDate = acceptedDate;
	}
	public LocalDate getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(LocalDate updatedDate) {
		this.updatedDate = updatedDate;
	}
	public LocalDate getClosedDate() {
		return closedDate;
	}
	public void setClosedDate(LocalDate closedDate) {
		this.closedDate = closedDate;
	}
	public LocalDate getDivAcceptedDate() {
		return divAcceptedDate;
	}
	public void setDivAcceptedDate(LocalDate divAcceptedDate) {
		this.divAcceptedDate = divAcceptedDate;
	}
	public String getDiv1() {
		return div1;
	}
	public void setDiv1(String div1) {
		this.div1 = div1;
	}
	public String getDiv2() {
		return div2;
	}
	public void setDiv2(String div2) {
		this.div2 = div2;
	}
	public String getDiv3() {
		return div3;
	}
	public void setDiv3(String div3) {
		this.div3 = div3;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", customerName=" + customerName + ", userId=" + userId
				+ ", receivedDate=" + receivedDate + ", acceptedDate=" + acceptedDate + ", updatedDate=" + updatedDate
				+ ", closedDate=" + closedDate + ", divAcceptedDate=" + divAcceptedDate + ", requestedDate="
				+ requestedDate + ", div1=" + div1 + ", div2=" + div2 + ", div3=" + div3 + ", priority=" + priority
				+ ", status=" + status + "]";
	}
	
	
	
	
	

}
