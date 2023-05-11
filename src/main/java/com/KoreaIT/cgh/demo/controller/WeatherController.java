package com.KoreaIT.cgh.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KoreaIT.cgh.demo.vo.Rq;

@Controller
public class WeatherController {
	
	private Rq rq;
	
	public WeatherController(Rq rq) {
		this.rq = rq;
	}
	
	@RequestMapping("/weather/weather")
	public String showweather() {
		rq.run();
		return "/weather/weather";
	}

}