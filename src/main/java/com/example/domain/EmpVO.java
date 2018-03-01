package com.example.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.ToString;


@Entity	// JPA에서 엔티티를 관리하기 위해 준다. 테이블을 내가 만들어준다. 이걸로.
@Table(name="p_emp")
@Data
@ToString(exclude={"mgr", "dept"})
public class EmpVO {
	
	public enum Gender {
		M, F;
	}
	
	@Id
	private Integer empno;
	private String ename;
	@Enumerated(EnumType.STRING)
	private Gender gender;
	private String job;
	
//	private Integer mgr;
	@OneToOne(fetch=FetchType.LAZY)		// mgr을 별도로 조회하기전에는 조회하지 않는다.(fetch=LAZY)
	@JoinColumn(name="mgr")
	private EmpVO mgr;
	
	@Temporal(TemporalType.DATE)
	private Date hiredate;
	private BigDecimal sal;
	private BigDecimal comm;
	
//	private Integer deptno;
	@ManyToOne(fetch=FetchType.LAZY)	// foreign key
	@JoinColumn(name="deptno")	// 별도테이블을 만드는게 디폴트. 이거말고 조인컬럼을 만듦. 
	private DeptVO dept;			// 이렇게 함으로 MyDept와 연관관계가 생긴다.
	
}






