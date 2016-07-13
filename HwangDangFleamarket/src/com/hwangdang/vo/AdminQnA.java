package com.hwangdang.vo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AdminQnA implements Serializable{

	private int adminQnaNo;
	private String adminQnaTitle;  //제목
	private String adminQnaContent; //글내용
	private String adminQnaWriter;  //작성자
	private Date adminQnaDate;  //작성일 
	private int adminQnaHit;  //조회수 
	private String adminQnaPublished;  // 공개여부 
	private AdminQnAReply reply; 
	private String adminQnaPassword;
	private String adminQnaReplyExist;
	
public AdminQnA(){};

public AdminQnA(int adminQnaNo, String adminQnaTitle, String adminQnaContent, String adminQnaWriter, Date adminQnaDate,
		int adminQnaHit, String adminQnaPublished, String adminQnaPassword) {
	super();
	this.adminQnaNo = adminQnaNo;
	this.adminQnaTitle = adminQnaTitle;
	this.adminQnaContent = adminQnaContent;
	this.adminQnaWriter = adminQnaWriter;
	this.adminQnaDate = adminQnaDate;
	this.adminQnaHit = adminQnaHit;
	this.adminQnaPublished = adminQnaPublished;
	this.adminQnaPassword = adminQnaPassword;
}

public AdminQnA(int adminQnaNo, String adminQnaTitle, String adminQnaContent, String adminQnaWriter, Date adminQnaDate,
		int adminQnaHit, String adminQnaPublished, AdminQnAReply reply, String adminQnaPassword) {
	super();
	this.adminQnaNo = adminQnaNo;
	this.adminQnaTitle = adminQnaTitle;
	this.adminQnaContent = adminQnaContent;
	this.adminQnaWriter = adminQnaWriter;
	this.adminQnaDate = adminQnaDate;
	this.adminQnaHit = adminQnaHit;
	this.adminQnaPublished = adminQnaPublished;
	this.reply = reply;
	this.adminQnaPassword = adminQnaPassword;
}




public String getAdminQnaReplyExist() {
	return adminQnaReplyExist;
}

public void setAdminQnaReplyExist(String adminQnaReplyExist) {
	this.adminQnaReplyExist = adminQnaReplyExist;
}

public String getAdminQnaPassword() {
	return adminQnaPassword;
}

public void setAdminQnaPassword(String adminQnaPassword) {
	this.adminQnaPassword = adminQnaPassword;
}

public AdminQnAReply getReply() {
	return reply;
}

public void setReply(AdminQnAReply reply) {
	this.reply = reply;
}

public String getAdminQnaContent() {
	return adminQnaContent;
}



public void setAdminQnaContent(String adminQnaContent) {
	this.adminQnaContent = adminQnaContent;
}


public int getAdminQnaNo() {
	return adminQnaNo;
}

public void setAdminQnaNo(int adminQnaNo) {
	this.adminQnaNo = adminQnaNo;
}

public String getAdminQnaTitle() {
	return adminQnaTitle;
}

public void setAdminQnaTitle(String adminQnaTitle) {
	this.adminQnaTitle = adminQnaTitle;
}

public String getAdminQuaContent() {
	return adminQnaContent;
}

public void setAdminQuaContent(String adminQuaContent) {
	this.adminQnaContent = adminQuaContent;
}

public String getAdminQnaWriter() {
	return adminQnaWriter;
}

public void setAdminQnaWriter(String adminQnaWriter) {
	this.adminQnaWriter = adminQnaWriter;
}

public Date getAdminQnaDate() {
	return adminQnaDate;
}

public void setAdminQnaDate(Date adminQnaDate) {
	this.adminQnaDate = adminQnaDate;
}

public int getAdminQnaHit() {
	return adminQnaHit;
}

public void setAdminQnaHit(int adminQnaHit) {
	this.adminQnaHit = adminQnaHit;
}

public String getAdminQnaPublished() {
	return adminQnaPublished;
}

public void setAdminQnaPublished(String adminQnaPublished) {
	this.adminQnaPublished = adminQnaPublished;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((adminQnaDate == null) ? 0 : adminQnaDate.hashCode());
	result = prime * result + adminQnaHit;
	result = prime * result + adminQnaNo;
	result = prime * result + ((adminQnaPublished == null) ? 0 : adminQnaPublished.hashCode());
	result = prime * result + ((adminQnaTitle == null) ? 0 : adminQnaTitle.hashCode());
	result = prime * result + ((adminQnaWriter == null) ? 0 : adminQnaWriter.hashCode());
	result = prime * result + ((adminQnaContent == null) ? 0 : adminQnaContent.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	AdminQnA other = (AdminQnA) obj;
	if (adminQnaDate == null) {
		if (other.adminQnaDate != null)
			return false;
	} else if (!adminQnaDate.equals(other.adminQnaDate))
		return false;
	if (adminQnaHit != other.adminQnaHit)
		return false;
	if (adminQnaNo != other.adminQnaNo)
		return false;
	if (adminQnaPublished == null) {
		if (other.adminQnaPublished != null)
			return false;
	} else if (!adminQnaPublished.equals(other.adminQnaPublished))
		return false;
	if (adminQnaTitle == null) {
		if (other.adminQnaTitle != null)
			return false;
	} else if (!adminQnaTitle.equals(other.adminQnaTitle))
		return false;
	if (adminQnaWriter == null) {
		if (other.adminQnaWriter != null)
			return false;
	} else if (!adminQnaWriter.equals(other.adminQnaWriter))
		return false;
	if (adminQnaContent == null) {
		if (other.adminQnaContent != null)
			return false;
	} else if (!adminQnaContent.equals(other.adminQnaContent))
		return false;
	return true;
}

@Override
public String toString() {
	return "AdminQnA [adminQnaNo=" + adminQnaNo + ", adminQnaTitle=" + adminQnaTitle + ", adminQnaContent="
			+ adminQnaContent + ", adminQnaWriter=" + adminQnaWriter + ", adminQnaDate=" + adminQnaDate
			+ ", adminQnaHit=" + adminQnaHit + ", adminQnaPublished=" + adminQnaPublished + ", reply=" + reply
			+ ", adminQnaPassword=" + adminQnaPassword + ", adminQnaReplyExist=" + adminQnaReplyExist + "]";
}



}
