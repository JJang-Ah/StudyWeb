package com.springbook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springbook.entity.MemberDTO;

/*
JpaRepository에서 제공하지 않는 SQL문은 여러 가지 방법으로 직접 만들어서 사용함.
-- JPQL, 

### JPA에서 sql문을 사용하는 방법
1번 방법. JpaRepository 인터페이스를 상속하는 인터페이스를 만들어 사용하는 방법
- 단점: crud에 대한 기본적인 sql문을 제공하므로, 복잡한 sql문의 처리는 불가함.

2번 방법. JPQL 문법을 사용하는 방법
- Java Persistence Query Language
- Entity 객체와 DB 테이블을 매핑하는 쿼리문을 만들어 사용하는 방법
- Query 어노테이션을 사용하여 sql문을 작성
- 장점: SQL문과 매우 유사함.
- 단점: 모든 SQL을 대신할 수 없음.
- 주의: 테이블에 대한 쿼리가 아니라, 엔터티에 대한 쿼리문임
- 주의: 엔터티와 속성은 대소문자로 구분해서 사용

3번 방법. QueryDSL 문법을 사용하는 문법


*/

public interface MemberRepository extends JpaRepository<MemberDTO, String> {
	
	@Query("select m from MemberDTO m where m.id = :id and m.password = :password")
	public MemberDTO findByLogin(@Param("id") String id, @Param("password") String password);
	
	@Query("select m from MemberDTO m where m.id = :id")
	public MemberDTO checkMemberId(@Param("id") String id);

}
