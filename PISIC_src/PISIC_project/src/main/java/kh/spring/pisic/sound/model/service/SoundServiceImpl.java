package kh.spring.pisic.sound.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.model.dao.SoundDao;

@Service
public class SoundServiceImpl implements SoundService{

	@Autowired
	private SoundDao dao;
	
	@Override
	public Album selectAlbum(String a_no) {
		return dao.selectAlbum(a_no);
	}

}
