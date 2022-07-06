package com.springbook.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import lombok.Data;

/*
ORM - Object Relational Mapping, 객체(클래스)와 릴레이션(DB 테이블)을 일치하도록 관리하는 기술
--> Mybatis, JPA ...
JPA - Java Persistence API, ORM을 하는 구체적인 기술, Java의 클래스와 DB의 테이블을 같은 영속 계층으로 관리하는 기술
Hibernate - JPA를 실제로 구현한 구현체의 하나.

1. 매핑되는 클래스 위에 설정
@Entity - 해당 클래스를 JPA에서 관리하도록 하는 엔터티 객체
@Table - 실제 DB 테이블을 지정

2. 프로퍼티 위에 설정
@Column - 테이블의 컬럼과 일치, 
@Id - Primary Key
@GeneratedValue(strategy=GenerationType.AUTO) - 자동으로 생성되는 키의 전략
-- AUTO: JPA가 자동으로 결정, IDENTITY: auto-increment, SEQUENCE: sequence를 만들어 관리
@Lob - long text
@CreatedDate - Entity가 생성될 때의 시간을 저장
@LastModifiedDate - Entity가 변경될 때의 시간을 저장
@Column(name="cnt", columnDefinition="integer default '0'") - default 값을 설정
@Transient - 테이블과의 매핑에서 제외
*/

@Entity
@Table(name="board")
@Data
public class BoardDTO {
	
	@Id
	@Column(name="seq")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long seq;
	
	@Column(name="title", length=100, nullable=false)
	private String title;
	
	@Column(name="writer", length=20, nullable=false)
	private String writer;
	
	@Lob
	@Column(name="content", nullable=false)
	private String content;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="regdate", columnDefinition = "timestamp default current_timestamp")
	private Date regdate;
	
	@Column(name="cnt", columnDefinition="integer default '0'")
	private int cnt;
	
	@Transient
	private String searchCondition;
	
	@Transient
	private String searchKeyword;

}
