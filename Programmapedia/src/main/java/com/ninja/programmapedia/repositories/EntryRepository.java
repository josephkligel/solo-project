package com.ninja.programmapedia.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ninja.programmapedia.models.Entry;
import com.ninja.programmapedia.models.User;

@Repository
public interface EntryRepository extends CrudRepository<Entry, Long> {
	List<Entry> findAll();
	
	List<Entry> findByUser(User user);
	
	List<Entry> findByLanguage(String Language);
	
}
