package kh.spring.pisic.artist.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Artist;


@Repository
public class ArtistDao {
	
	@Autowired
	private SqlSession session;
	
	public List<Artist> selectArtistRandom() {
		return session.selectList("Artist.selectArtistRandom");
	}

}
