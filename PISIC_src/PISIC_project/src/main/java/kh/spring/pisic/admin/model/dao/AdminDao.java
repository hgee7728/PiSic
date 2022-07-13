package kh.spring.pisic.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Artist;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession session;
	
	public List<Artist> selectArtistList() {
		return session.selectList("Admin.selectArtistList");
	}
}
