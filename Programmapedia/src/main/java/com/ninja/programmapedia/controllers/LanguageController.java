package com.ninja.programmapedia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ninja.programmapedia.models.Language;
import com.ninja.programmapedia.services.EntryService;
import com.ninja.programmapedia.services.LanguageService;

import jakarta.validation.Valid;

@Controller
public class LanguageController {
	@Autowired
	private LanguageService languageService;
	
	@Autowired
	private EntryService entryService;
	
	@GetMapping("/language/add")
	public String add(@ModelAttribute("language") Language language) {
		return "add_language.jsp";
	}
	
	@PostMapping("/language/create")
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if(result.hasErrors()) {
			return "add_language.jsp";
		}
		languageService.createLanguage(language);
		return "redirect:/home";
	}
	
	// Show entries by language
	
	@GetMapping("/language/{languageId}")
	public String language(@PathVariable("languageId") Long languageId, Model model) {
		model.addAttribute("language", languageService.findLanguage(languageId));
		return "language.jsp";
	}
}
