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
	
	// 날씨 (보여주기식)
	@RequestMapping("/weather/weather/weather")
	public String showweather() {
		rq.run();
		return "/weather/weather/weather";
	}
	// 날씨 (실시간)
	@RequestMapping("/weather/weather/weather2")
	public String showweather2() {
		rq.run();
		return "/weather/weather/weather2";
	}

}