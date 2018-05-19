package cn.sheyao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Index {
	@RequestMapping("index")
	@ResponseBody
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
}
