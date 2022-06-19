package kh.spring.pisic.crawling.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.crawling.model.dao.CrawlingDao;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;

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
	
	public int insertS() {
		return dao.insertS();
	}
}
