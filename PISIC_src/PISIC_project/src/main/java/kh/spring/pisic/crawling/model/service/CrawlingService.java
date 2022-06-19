package kh.spring.pisic.crawling.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.crawling.model.dao.CrawlingDao;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.AssociationAS;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class CrawlingService {
	@Autowired
	private CrawlingDao dao;
	
	public int insertA(Artist at) {
		return dao.insertA(at);
	}
	
	public int insertB(Album am) {
		return dao.insertB(am);
	}
	
	public int insertS(Sound sd) {
		return dao.insertS(sd);
	}
	
	public int insertG(Sound sd) {
		return dao.insertG(sd);
	}
	
	public int insertSinger(AssociationAS as) {
		return dao.insertSinger(as);
	}
	
	public int insertSoundWriter(AssociationAS as) {
		return dao.insertSoundWriter(as);
	}
	
	public int insertSoundComposer(AssociationAS as) {
		return dao.insertSoundComposer(as);
	}
	
	public int selectA(String art) {
		return dao.selectA(art);
	}
	
	public int selectG(Sound sd) {
		return dao.selectG(sd);
	}
}
