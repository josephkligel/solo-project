package com.ninja.programmapedia.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ninja.programmapedia.models.Entry;
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
	// May not be needed since all users have entries
	public List<Entry> findByUser(Long userId){
		return entryRepo.findByUserId(userId);
	}
	
	public void deleteEntry(Long entryId) {
		entryRepo.deleteById(entryId);
	}

}
