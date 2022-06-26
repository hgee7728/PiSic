package kh.spring.pisic.artist.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ArtistDao {
	
	@Autowired
	private SqlSession session;
	
	public List<kh.spring.pisic.sound.domain.Artist> selectArtistRandom() {
		return session.selectList("Artist.selectArtistRandom");
	}

}
