package com.ninja.programmapedia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.ninja.programmapedia.models.Entry;
import com.ninja.programmapedia.services.EntryService;
import com.ninja.programmapedia.services.LanguageService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class EntryController {
	@Autowired
	private EntryService entryService;
	
	@Autowired
	private LanguageService languageService;
	
	// Add and create entry
	
	@GetMapping("/add")
	public String add(@ModelAttribute("entry") Entry entry, Model model, HttpSession session) {
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("languages", languageService.allLanguages());
		return "add.jsp";
	}
	
	@PostMapping("/entry/create")
	public String create(@Valid @ModelAttribute("entry") Entry entry, BindingResult result) {
		if(result.hasErrors()) {
			return "add.jsp";
		}
		entryService.createEntry(entry);
		return "redirect:/home";
	}
	
	// Edit and update entry
	
	@GetMapping("/edit/{entryId}")
	public String edit(@PathVariable("entryId") Long entryId, Model model) {
		model.addAttribute("entry", entryService.findEntry(entryId));
		model.addAttribute("languages", languageService.allLanguages());
		return "edit.jsp";
	}
	
	@PutMapping("/entry/update")
	public String update(@Valid @ModelAttribute("entry") Entry entry, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		entryService.updateEntry(entry);
		return "redirect:/home";
	}
	
	// Show entry
	
	@GetMapping("/views/{entryId}")
	public String view(@PathVariable("entryId") Long entryId, Model model, HttpSession session) {
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("entry", entryService.findEntry(entryId));
		return "view.jsp";
	}
	
	// Delete an entry
	
	@DeleteMapping("/entry/{entryId}/delete")
	public String delete(@PathVariable("entryId") Long entryId) {
		entryService.deleteEntry(entryId);
		return "redirect:/home";
	}
}
