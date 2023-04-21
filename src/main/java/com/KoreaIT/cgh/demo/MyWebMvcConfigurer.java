package com.KoreaIT.cgh.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.KoreaIT.cgh.demo.interceptor.BeforeActionInterceptor;

@Configuration //설정역할 spring bean에 자동으로 추가해줘
public class MyWebMvcConfigurer implements WebMvcConfigurer {
	
	// BeforeActionInterceptor 불러오기(연결)
	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;
	
	// /resource/common.css 등 제외 exclude
	// 인터셉터 적용
	public void addInterceptor(InterceptorRegistry registry) {
		                                                    //여기까지 실행    // 제외목록
		registry.addInterceptor(beforeActionInterceptor).addPathPatterns("/**").excludePathPatterns("/resource/**").excludePathPatterns("/error");
		
		
	}

}
