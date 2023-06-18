package com.ninja.programmapedia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ninja.programmapedia.services.EntryService;

@Controller
public class EntryController {
	@Autowired
	private EntryService entryService;
	
	@GetMapping("/home")
	public String home() {
		return "home.jsp";
	}
}
