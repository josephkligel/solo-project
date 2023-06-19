package com.ninja.programmapedia.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ninja.programmapedia.models.Entry;
import com.ninja.programmapedia.models.Language;
import com.ninja.programmapedia.models.User;
import com.ninja.programmapedia.repositories.EntryRepository;

@Service
public class EntryService {
	private final EntryRepository entryRepo;
	
	public EntryService(EntryRepository entryRepo) {
		this.entryRepo = entryRepo;
	}
	
	public List<Entry> allEntries(){
		return entryRepo.findAll();
	}
	
	public Entry createEntry(Entry e) {
		return entryRepo.save(e);
	}
	
	public Entry updateEntry(Entry e) {
		return entryRepo.save(e);
	}
	
	public Entry findEntry(Long entryId) {
		Optional<Entry> optionalEntry = entryRepo.findById(entryId);
		if(optionalEntry.isPresent()) {
			return optionalEntry.get();
		} else {
			return null;
		}
	}
	
	// Find entries by user_id
	
	public List<Entry> findByUser(User user){
		return entryRepo.findByUser(user);
	}
	
	// Delete entry by id
	public void deleteEntry(Long entryId) {
		entryRepo.deleteById(entryId);
	}
	
	// Find entries by language_id
	
	public List<Entry> findByLanguage(Language language){
		return entryRepo.findByLanguage(language);
	}

}
