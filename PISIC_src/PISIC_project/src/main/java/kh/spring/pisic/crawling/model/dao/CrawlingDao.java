package kh.spring.pisic.crawling.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.AssociationAS;
import kh.spring.pisic.sound.domain.Sound;

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
	
	public int insertS(Sound sd) {
		return session.insert("Crawling.insertS", sd);
	}
	
	public int insertG(Sound sd) {
		return session.insert("Crawling.insertG", sd);
	}
	
	public int insertSinger(AssociationAS as) {
		return session.insert("Crawling.insertSinger", as);
	}
	
	public int insertSoundWriter(AssociationAS as) {
		return session.insert("Crawling.insertSoundWriter", as);
	}
	
	public int insertSoundComposer(AssociationAS as) {
		return session.insert("Crawling.insertSoundComposer", as);
	}
	
	public int selectA(String art) {
		return session.selectOne("Crawling.selectA", art);
	}
	
	public int selectG(Sound sd) {
		return session.selectOne("Crawling.selectG", sd);
	}
}
