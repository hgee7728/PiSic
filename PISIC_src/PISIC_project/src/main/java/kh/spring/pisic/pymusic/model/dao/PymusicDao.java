package kh.spring.pisic.pymusic.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Sound;

@Repository
public class PymusicDao {
	@Autowired
	private SqlSession session;
	
	public List<Sound> selectPyLocal() {
		return session.selectList("Pymusic.selectPyLocal");
	}
}
