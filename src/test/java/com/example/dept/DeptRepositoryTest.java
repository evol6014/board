package com.example.dept;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.domain.DeptVO;
import com.example.repository.DeptsRepository;

import lombok.extern.java.Log;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log
@Commit
public class DeptRepositoryTest {

	@Inject
	DeptsRepository repo;
	
	@Test
	public void insert() {
		
		DeptVO dept = new DeptVO();
		
		dept.setDeptno(60);
		dept.setDname("감찰부");
		dept.setLoc("청주");
		
		repo.save(dept);
	}

	@Test
	public void testList1() {
		
		Pageable pageable = PageRequest.of(0, 20, Direction.DESC, "deptno");
		
		Page<DeptVO> result = repo.findAll(repo.makePredicate(null, null), pageable);
		
		log.info("PAGE: " + result.getPageable());
		
		log.info("------------------------------");
		result.getContent().forEach(dept -> log.info(""+ dept));
	}
	
	@Test
	public void testList2() {
		
		Pageable pageable = PageRequest.of(0, 20, Direction.DESC, "deptno");
		
		Page<DeptVO> result = repo.findAll(repo.makePredicate("n", "0"), pageable);
		
		log.info("PAGE: " + result.getPageable());
		
		log.info("-----------------------");
		result.getContent().forEach(dept -> log.info(""+ dept));
	}
}
