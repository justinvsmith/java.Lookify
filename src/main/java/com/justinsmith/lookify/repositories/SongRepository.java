package com.justinsmith.lookify.repositories;

import java.util.List;


import org.springframework.data.repository.CrudRepository;


import com.justinsmith.lookify.models.Song;

public interface SongRepository extends CrudRepository<Song, Long> {
	//this method retrieves all the languages from the database
	List<Song> findAll();
	
	//this method finds songs with titles containing the search string
	List<Song> findByTitleContaining(String search);
	
	//this method counts how many songs contain a certain string
	Long countByTitleContaining(String search);
	
	//this method deletes a song that starts with a specific name
	Long deleteByTitleContaining(String search);
	
	
	List<Song>  findByArtistContaining(String search);
	
	List<Song> findTop10ByOrderByRatingDesc();
	
}
