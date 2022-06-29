package kh.spring.pisic.artist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.artist.model.dao.ArtistDao;
import kh.spring.pisic.sound.domain.Artist;

@Service
public class ArtistService {
	@Autowired
	private ArtistDao dao;
	
	public List<Artist> selectArtistRandom(){
		return dao.selectArtistRandom();
	}
	
}
