package kh.spring.pisic.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.pisic.admin.model.dao.AdminDao;
import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;
	
	// 아티스트 총 명수
	@Override
	public int totalCntArtist() {
		return dao.totalCntArtist();
	}
	
	// 아티스트 목록 조회
	@Override
	public List<Artist> selectArtistList(Criteria cri) {
		return dao.selectArtistList(cri);
	}

	@Override
	public Artist selectArtist(String artist_no) {
		return dao.selectArtist(artist_no);
	}

	@Override
	public List<Artist> selectArtistAjax(String keyword) {
		return dao.selectArtistAjax(keyword);
	}

	@Override
	public int insertArtist(Artist artist) {
		return dao.insertArtist(artist);
	}
	
	@Override
	public int updateArtist(Artist artist) {
		return dao.updateArtist(artist);
	}

	@Override
	public int deleteArtist(List<Artist> aritstList) {
		return dao.deleteArtist(aritstList);
	}
	
	// 앨범 총 갯수
	@Override
	public int totalCntAlbum() {
		return dao.totalCntAlbum();
	}
	
	// 앨범 목록 조회
	@Override
	public List<Album> selectAlbumList(Criteria cri) {
		return dao.selectAlbumList(cri);
	}

	// 앨범 검색
	@Override
	public List<Album> selectSearchAlbumList(String keyword) {
		return dao.selectSearchAlbumList(keyword);
	}

	// 앨범 추가하기
	@Override
	public int insertAlbum(Album album) {
		return dao.insertAlbum(album);
	}

	// 앨범 수정하기 - 앨범 조회
	@Override
	public Album selectAlbum(int a_no) {
		return dao.selectAlbum(a_no);
	}

	// 앨범 정보 수정
	@Override
	public int updateAlbum(Album album) {
		return dao.updateAlbum(album);
	}

	// 앨범 삭제
	@Override
	public int deleteAlbum(List<Album> albumList) {
		return dao.deleteAlbum(albumList);
	}

	// 총 곡 갯수
	@Override
	public int totalCntSound() {
		return dao.totalCntSound();
	}
	
	// 곡 목록 조회
	@Override
	public List<Sound> selectSoundList(Criteria cri) {
		return dao.selectSoundList(cri);
	}

	// 곡 검색
	@Override
	public List<Sound> selectSearchSoundList(String keyword) {
		return dao.selectSearchSoundList(keyword);
	}

	// 곡 추가
	@Override
	public int insertSound(Sound sound, int[] singer_noArr, int[] writer_noArr, int[] composer_noArr) {
		return dao.insertSound(sound, singer_noArr, writer_noArr, composer_noArr);
	}

	// 곡 수정하기 - 곡 조회
	@Override
	public Sound selectSound(Sound sound) {
		return dao.selectSound(sound);
	}

	// 곡 수정
	@Override
	@Transactional
	public int updateSound(Sound sound, int[] singer_noArr, int[] writer_noArr, int[] composer_noArr) {
		dao.deleteSinger(sound);
		dao.insertSinger(sound, singer_noArr);
		dao.deleteWriter(sound);
		dao.insertWriter(sound, writer_noArr);
		dao.deleteComposer(sound);
		dao.insertComposer(sound, composer_noArr);
		return dao.updateSound(sound);
	}

	// 곡 삭제
	@Override
	public int deleteSound(List<Sound> soundList) {
		return dao.deleteSound(soundList);
	}

	@Override
	public List<Member> selectMemberList() {
		return dao.selectMemberList();
	}

	@Override
	public List<Member> selectAdminList() {
		return dao.selectAdminList();
	}

	@Override
	public List<Membership> selectMembershipList() {
		return dao.selectMembershipList();
	}

}
