package com.example.controller;

import javax.inject.Inject;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.DeptVO;
import com.example.repository.DeptsRepository;
import com.example.vo.PageMaker;
import com.example.vo.PageVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/depts/")
@Log
public class DeptsController {

	@Inject
	DeptsRepository repo;
	
	// return 없으면 이것을 논리적인 view로 봄.
	@GetMapping("/list")
	public String list(@ModelAttribute("pageVO") PageVO vo, Model model) {
		
		Pageable page = vo.makePageable(0, "deptno");
		
		Page<DeptVO> result = repo.findAll(
									repo.makePredicate(vo.getType(), vo.getKeyword()), page);
		
		log.info("" + page);
		log.info("" + result);

		log.info("TOTAL PAGE NUMBER: " + result.getTotalPages());
		
		model.addAttribute("pageMaker", new PageMaker<DeptVO>(result));
		
		return "thymeleaf/depts/list";
	}
	
	@GetMapping("/register")
	public String registerGET(@ModelAttribute("vo") DeptVO vo) {
		log.info("register get");
		vo.setDeptno(9999);
		vo.setDname("부서 이름");
		vo.setLoc("지역명");
		
		return "thymeleaf/depts/register";
	}
	
	@PostMapping("/register")
	public String registerPOST(@ModelAttribute("vo") DeptVO vo, 
													RedirectAttributes rttr) {
		log.info("register post");
		log.info("" +  vo);
		
		repo.save(vo);
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/depts/list";
	}
	
	@GetMapping("/view")
	public String view(Integer deptno, @ModelAttribute("pageVO") PageVO vo, Model model){
		
		log.info("DEPTNO: "+ deptno);
		
		repo.findById(deptno).ifPresent(dept -> model.addAttribute("vo", dept));
		
		return "thymeleaf/depts/view";
	}
	
	@GetMapping("/modify")
	public String modify(Integer deptno, @ModelAttribute("pageVO") PageVO vo, Model model){
		
		log.info("MODIFY Deptno: "+ deptno);
		
		repo.findById(deptno).ifPresent(dept -> model.addAttribute("vo", dept));
		
		return "thymeleaf/depts/modify";
	}
	
	@PostMapping("/modify")
	public String modifyPost(DeptVO dept, PageVO vo, RedirectAttributes rttr ){
		
		log.info("Modify Dept: " + dept);
		
		repo.findById(dept.getDeptno()).ifPresent( origin ->{
		 
			origin.setDeptno(dept.getDeptno());
			origin.setDname(dept.getDname());
			origin.setLoc(dept.getLoc());
			
			repo.save(origin);
			rttr.addFlashAttribute("msg", "success");
			rttr.addAttribute("deptno", origin.getDeptno());
		});
		
		//페이징과 검색했던 결과로 이동하는 경우 
		rttr.addAttribute("page", vo.getPage());
		rttr.addAttribute("size", vo.getSize());
		rttr.addAttribute("type", vo.getType());
		rttr.addAttribute("keyword", vo.getKeyword());

		return "redirect:/depts/view";
	}
	
	@PostMapping("/delete")
	public String delete(Integer deptno, PageVO vo, RedirectAttributes rttr ){
		
		log.info("DELETE Deptno: " + deptno);
		
		repo.deleteById(deptno);
		
		rttr.addFlashAttribute("msg", "success");

		//페이징과 검색했던 결과로 이동하는 경우 
		rttr.addAttribute("page", vo.getPage());
		rttr.addAttribute("size", vo.getSize());
		rttr.addAttribute("type", vo.getType());
		rttr.addAttribute("keyword", vo.getKeyword());

		return "redirect:/depts/list";
	}
}


