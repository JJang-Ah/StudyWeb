package com.springbook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import com.springbook.entity.BoardDTO;

/*
< Repository interface의 상속 관계 >
Repository <- CrudRepository <- PagingAndSortingRepository <- JpaReposirory 
1. Repository - 거의 기능이 없는 최상위 인터페이스
2. CrudRepository - 기본적인 CRUD 기능을 제공하는 인터페이스
3. PagingAndSortingRepository - 페이징 처리와 정렬 기능이 추가된 인터페이스
4. JpaReposirory - 스프링 데이터 JPA에서 기능을 추가한 인터페이스

< JpaRepository<BoardDTO, Long> 인터페이스의 메소드 정리 >
-- <영속성을 관리할 객체(DTO, VO), 객체의 Id>
1. 조회
- 1. findAll() - 테이블의 전체 데이터를 리스트로 가져올 때 사용
- 2. findById() - Entity의 프로퍼티 이름을 조건으로 조회할 때 사용
- 3. findOne() - Primary Key로 값을 1건 조회할 때 사용 -> 확인 필요
- 4. findByXXX() - XXX은 프로퍼티 이름, 프로퍼티 이름으로 조회할 때 사용 -> 확인 필요
- getXXX - deprecated된 메소드

2. 추가, 수정
- 1. save(객체) - 데이터를 저장하고, 수정할 때 사용, 수정할 때는 Id(PK)로 지정된 값을 사용

3. 삭제
- 1. delete(객체) - Id(PK)를 사용하여 값을 삭제할 때 사용
- 2. deleteById() - Entity의 프로퍼티 이름을 조건으로 삭제할 때 사용
- 3. deleteAll() - 모든 데이터를 삭제할 때 사용

*/

public interface BoardRepository extends JpaRepository<BoardDTO, Long>, QuerydslPredicateExecutor<BoardDTO> {
	
	// JPQL 사용
	@Modifying
	@Query("update BoardDTO b set b.cnt = b.cnt + 1 where b.seq = :seq")
	void updateBoardCnt(@Param("seq") long seq);
	
	// JPQL 사용
	@Modifying
	@Query("delete BoardDTO b where b.writer = :id")
	void deleteByBoardWriter(@Param("id") String writer);
	
	// QueryDSL 사용
}
