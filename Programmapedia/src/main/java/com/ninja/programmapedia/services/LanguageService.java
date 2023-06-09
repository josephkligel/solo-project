package com.ninja.programmapedia.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ninja.programmapedia.models.Language;
import com.ninja.programmapedia.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepo;
	
	public LanguageService(LanguageRepository languageRepo) {
		this.languageRepo = languageRepo;
	}
	
	public List<Language> allLanguages(){
		return languageRepo.findAll();
	}
	
	public Language createLanguage(Language language) {
		return languageRepo.save(language);
	}
	
	public Language findLanguage(Long languageId) {
		Optional<Language> optionalLanguage = languageRepo.findById(languageId);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}
}
