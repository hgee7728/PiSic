package kh.spring.pisic.pick.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/pymusic")
public class PickLocationController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage() {
		return "pymusic/pymusicMain";
	}
	
	@RequestMapping(value = "/local", method = RequestMethod.GET)
	public String detailPage() {
		return "pymusic/local";
	}
}
