package kh.spring.pisic.pick.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PickLocationController {
	@RequestMapping(value = "/testMap", method = RequestMethod.GET)
	public String mainPage(Locale locale, Model model) {
		return "pymusic/test";
	}
}
