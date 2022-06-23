package kh.spring.pisic.sound.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Album;

@Repository
public class SoundDao {
	
	@Autowired
	private SqlSession session;
	
	public Album selectAlbum(String a_no) {
		return session.selectOne("Sound.selectAlbum",a_no);
	}

}
