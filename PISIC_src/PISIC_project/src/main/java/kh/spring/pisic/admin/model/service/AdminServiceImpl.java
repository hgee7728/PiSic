package kh.spring.pisic.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.admin.model.dao.AdminDao;
import kh.spring.pisic.sound.domain.Artist;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;
	
	@Override
	public List<Artist> selectArtistList() {
		return dao.selectArtistList();
	}

	@Override
	public Artist selectArtist(String artist_no) {
		return dao.selectArtist(artist_no);
	}

	@Override
	public List<Artist> selectArtistAjax(String keyword) {
		return dao.selectArtistAjax(keyword);
	}

	@Override
	public int insertArtist(Artist artist) {
		return dao.insertArtist(artist);
	}

	@Override
	public int deleteArtist(String artist_no) {
		return dao.deleteArtist(artist_no);
	}

}
