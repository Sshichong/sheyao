package cn.sheyao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsController {
	
	@RequestMapping("/toStatistics")
	public String toStatistics() {
		return "statistics";
	}

}
