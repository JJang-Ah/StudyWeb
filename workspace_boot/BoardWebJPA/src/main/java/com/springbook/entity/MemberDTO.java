package com.springbook.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Entity
@Table(name="member")
@Data
public class MemberDTO {
	@Id
	@Column(length=20)
	private String id;
	
	@Column(length=20, nullable=false)
	private String password;
	
	@Column(length=30, nullable=false)
	private String name;
	
	@Column(length=30, nullable=false)
	private String email;
	
	@Column(length=20, nullable=false)
	private String tel;
	
	@Column(length=300, nullable=false)
	private String address;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="regdate", columnDefinition = "timestamp default current_timestamp")
	private Date regdate;

}
