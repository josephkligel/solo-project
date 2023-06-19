package com.ninja.programmapedia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ninja.programmapedia.models.LoginUser;
import com.ninja.programmapedia.models.User;
import com.ninja.programmapedia.services.EntryService;
import com.ninja.programmapedia.services.LanguageService;
import com.ninja.programmapedia.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	@Autowired
	public UserService userService;
	@Autowired
	public LanguageService languageService;
	@Autowired
	public EntryService entryService;

	@GetMapping("/")
	public String index(Model model) {
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		// Attempt to register a new user
		userService.register(newUser, result);
		// Check for errors and pass in newLogin object if error is present and index page has to be returned
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		// Else if no errors save user to a session and go to user home
		session.setAttribute("user", newUser);
		return "redirect:/home";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		// Calling login method from UserService
		// Assign return object to a new user
		User user = userService.login(newLogin, result);
		// Check for errors
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		
		// If no errors save user object in session and redirect to home page
		session.setAttribute("user", user);
		return "redirect:/home";
	}
		
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// User homepage
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		// Get username to display on page
		model.addAttribute("user", session.getAttribute("user"));
		// Get all programming languages and display them
		model.addAttribute("languages", languageService.allLanguages());
		// Create user and get entries by logged-in user
		model.addAttribute("entries", entryService.findByUser((User) model.getAttribute("user")));
		return "home.jsp";
	}
	
}
