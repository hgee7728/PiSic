package kh.spring.pisic.crawling.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;

@Repository
public class CrawlingDao {
	@Autowired
	private SqlSession session;
	
	public int insertA(Artist at) {
		return session.insert("Crawling.insertA", at);
	}
	
	public int insertB(Album am) {
		return session.insert("Crawling.insertB", am);
	}
	
	public int insertS() {
		return session.insert(null);
	}
}
