package com.justinsmith.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.justinsmith.lookify.models.Song;
import com.justinsmith.lookify.repositories.SongRepository;

@Service
public class SongService {
	//adding the Song repository as a dependency
	private final SongRepository songRepository;
	Song song = null;
	
	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	//returns all the songs
	public List<Song> allSongs(){
		return songRepository.findAll();
	}
	
	//creates a song
	public Song createSong(Song song) {
		return songRepository.save(song);
	}
	
	//retrieves a song
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
		if(optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}
	
	//finds songs by artist
	public List<Song> artistSongs(String artist) {
		List<Song> optionalSong = songRepository.findByArtistContaining(artist);
		return optionalSong;
	}
	
	//sorts songs
	public List<Song> sortSong(){
	List<Song> optionalSong = songRepository.findTop10ByOrderByRatingDesc();
	return optionalSong;
	}
	
	//updates a song
	public Song updateSong(Long id, String title, String artist, Integer rating) {
		Optional<Song> optionalSong = songRepository.findById(id);
		if(optionalSong.isPresent()) {
			song = optionalSong.get();
			song.setTitle(title);
			song.setArtist(artist);
			song.setRating(rating);
		}
		return songRepository.save(song);
	}
	
	public void deleteSong(Long id) {
		songRepository.deleteById(id);
	}
	
}
