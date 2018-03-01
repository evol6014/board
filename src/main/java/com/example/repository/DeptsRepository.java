package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.example.domain.DeptVO;
import com.example.domain.QDeptVO;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;

public interface DeptsRepository extends JpaRepository<DeptVO, Integer>, QuerydslPredicateExecutor<DeptVO>{

	// dynamic쿼리를 만들어내기 위함
	public default Predicate makePredicate(String type, String keyword) {
		
		BooleanBuilder builder = new BooleanBuilder();
		
		QDeptVO dept = QDeptVO.deptVO;
		
		builder.and(dept.deptno.gt(0));
		
		if (type == null) {
			return builder;
		}
		
		switch(type) {
		case "n":
			builder.and(dept.deptno.like("%" + keyword + "%"));
			break;
		case "i":
			builder.and(dept.dname.like("%" + keyword + "%"));
			break;
		case "l":
			builder.and(dept.loc.like("%" + keyword + "%"));
			break;
		
		}
		
		return builder;
		
	}
	
}
