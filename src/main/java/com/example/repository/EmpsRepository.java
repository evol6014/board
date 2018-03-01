package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.example.domain.DeptVO;
import com.example.domain.EmpVO;
import com.example.domain.QDeptVO;
import com.example.domain.QEmpVO;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;

public interface EmpsRepository extends JpaRepository<EmpVO, Integer>, QuerydslPredicateExecutor<EmpVO>{

	// dynamic쿼리를 만들어내기 위함
	public default Predicate makePredicate(String type, String keyword) {
		
		BooleanBuilder builder = new BooleanBuilder();
		
		QEmpVO emp = QEmpVO.empVO;
		
		builder.and(emp.empno.gt(0));
		
		if (type == null) {
			return builder;
		}
		
		switch(type) {
		case "n":
			builder.and(emp.empno.like("%" + keyword + "%"));
			break;
		case "i":
			builder.and(emp.ename.like("%" + keyword + "%"));
			break;
		case "j":
			builder.and(emp.job.like("%" + keyword + "%"));
			break;
		case "s":
			builder.and(emp.sal.like("%" + keyword + "%"));
			break;
		case "c":
			builder.and(emp.comm.like("%" + keyword + "%"));
			break;
		case "d":
			builder.and(emp.dept.deptno.like("%" + keyword + "%"));
			break;
		
		}
		
		return builder;
		
	}
	
}
