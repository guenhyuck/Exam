package com.KoreaIT.cgh.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KoreaIT.cgh.demo.vo.Rq;

@Controller
public class UsrHomeController {
	
	private Rq rq;
	
	public UsrHomeController(Rq rq) {
		this.rq = rq;
	}
	
	@RequestMapping("/usr/home/beforeMain")
	public String showbeforeMain() {
		rq.run();
		return "usr/home/beforeMain";
	}
	@RequestMapping("/usr/home/main")
	public String showMain() {
		rq.run();
		return "usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}

}