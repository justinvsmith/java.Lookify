package com.justinsmith.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.justinsmith.lookify.models.Song;
import com.justinsmith.lookify.services.SongService;

@Controller
public class SongController {
	private final SongService songService;
	
	public SongController(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "/songs/index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model, @ModelAttribute("songs") Song song) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("song", songs);
		return "/songs/dashboard.jsp";
	}
	
	@RequestMapping("/search/topTen")
	public String topTen(Model model, @ModelAttribute("songs") Song song) {
		List<Song> songs = songService.sortSong();
		model.addAttribute("song", songs);
		return "/songs/topTen.jsp";
	}
	
	@RequestMapping("/songs/{id}")
	public String show(@PathVariable("id")Long id, Model model) {
		Song songs = songService.findSong(id);
		model.addAttribute("song", songs);
		return "/songs/songs.jsp";
	}
	
	@RequestMapping("songs/new")
	public String create(@ModelAttribute("songs") Song song) {
		return "/songs/new.jsp";
	}
	
	@RequestMapping(value="/newSong", method=RequestMethod.POST)
	public String newSong(@Valid @ModelAttribute("songs") Song song, BindingResult result) {
		if(result.hasErrors()) {
			return "/songs/new.jsp";
		} else {
			songService.createSong(song);
			return "redirect:/dashboard";
		}
	}
			
	@RequestMapping(value="songs/{id}", method=RequestMethod.DELETE)
	public void destroy(@PathVariable("id")Long id) {
		songService.deleteSong(id);
	}
	
	@RequestMapping(value="/searchSong", method=RequestMethod.POST)
		public String search(@RequestParam("artist")String artist, Model model) {
		List<Song> music = songService.artistSongs(artist);
		model.addAttribute("music", music);
		String link = "redirect:/search/" + artist;
		return link;
	}
	
	@RequestMapping("/search/{artist}")
	public String searchResult(@PathVariable("artist") String artist, Model model, 
						 	   @ModelAttribute("songs") Song song) {
		List<Song> music = songService.artistSongs(artist);
		model.addAttribute("music", music);
		return "/songs/search.jsp";
	}

}
