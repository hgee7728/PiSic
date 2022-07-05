package kh.spring.pisic.pymusic.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.pymusic.model.dao.PymusicDao;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class PymusicServiceImpl implements PymusicService{

	@Autowired
	private PymusicDao dao;

	@Override
	public List<Sound> selectPyLocal() {
		return dao.selectPyLocal();
	}
}
