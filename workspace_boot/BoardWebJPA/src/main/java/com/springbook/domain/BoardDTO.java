package com.springbook.domain;

import java.sql.Timestamp;

import lombok.Data;

// lombok 기능
//@Getter
//@Setter
//@ToString
@Data // 위에 3개 다합친거
public class BoardDTO {
	// property
	private int seq;
	private String title;
	private String writer;
	private String content;
	private Timestamp regdate;
	private int cnt;
	
	
}
