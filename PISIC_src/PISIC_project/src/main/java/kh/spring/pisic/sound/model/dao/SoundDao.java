package kh.spring.pisic.sound.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.PlayInfo;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.domain.SoundRecomment;

@Repository
public class SoundDao {
	
	@Autowired
	private SqlSession session;
	
	// 앨범 상세조회
	public Album selectAlbum(String a_no) {
		return session.selectOne("Sound.selectAlbum", a_no);
	}

	// 곡 상세조회 - 곡정보
	public Sound selectSound(Sound sound) {
		return session.selectOne("Sound.selectSound", sound);
	}
	
	// 선택 재생
	public List<Sound> selectSoundList(Member member) {
		return session.selectList("Sound.selectSoundList", member);
	}
	
	// 노래 좋아요 - ajax
	public int insertLike(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.insert("Sound.insertLike", map);
	}
	
	// 곡 상세조회 - 수록 앨범
	public Album selectSoundAlbum(Sound sound) {
		return session.selectOne("Sound.selectSoundAlbum", sound);
	}
	
	// 노래 좋아요 여부 확인
	public int checkLike(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.selectOne("Sound.checkLike", map);
	}
	
	// 노래 좋아요 취소
	public int deleteLike(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.delete("Sound.deleteLike", map);
	}
	
	// 관련 아티스트 앨범
	public List<Album> selectRelArtistAlbum(Sound sound){
		return session.selectList("Sound.selectRelArtistAlbum", sound);
	}
	
	// 관련 플레이리스트 공유 게시판
	public List<PjBoard> selectRelPlaylistBoard(Sound sound) {
		return session.selectList("Sound.selectRelPlaylistBoard", sound);
	}
	
	// 내가 처음 들은 날
	public String selectSoundFirstDay(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.selectOne("Sound.selectSoundFirstDay", map);
	}
	
	// 총 감상 횟수
	public int selectTotalListen(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.selectOne("Sound.selectTotalListen", map);
	}
	
	// 노래 댓글 쓰기 - ajax
	public int insertSoundRecomment(Member member, SoundRecomment soundRecomment) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("soundRecomment", soundRecomment);
		return session.insert("Sound.insertSoundRecomment", map);
	}
	
	// 노래 댓글 삭제 - ajax
	public int deleteSoundRecomment(Member member, SoundRecomment soundRecomment) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("soundRecomment", soundRecomment);
		return session.delete("Sound.deleteSoundRecomment", map);
	}
	
	// 아티스트 상세조회
	public Artist selectArtist(String artist_no) {
		return session.selectOne("Artist.selectArtist", artist_no);
	}

	// 아티스트 참여앨범
	public List<Album> selectArtistJoinAlbum(String artist_no) {
		return session.selectList("Artist.selectArtistJoinAlbum", artist_no);
	}
	
	// 아티스트 참여곡
	public List<Sound> selectArtistJoinSound(String artist_no) {
		return session.selectList("Artist.selectArtistJoinSound", artist_no);
	}
	
	// 데일리 감상자수 
	public String selectDailyListen(Sound sound) {
		return session.selectOne("Sound.selectDailyListen", sound);
	}
	
	// 어제의 차트 순위
	public String selectYesterChart(Sound sound) {
		return session.selectOne("Sound.selectYesterChart", sound);
	}
	
	// 최고 순위 (일간)
	public PlayInfo selectBestChart(Sound sound) {
		return session.selectOne("Sound.selectBestChart", sound);
	}

	// playInfo 테이블에 데이터 삽입 - ajax
	public int insertPalyInfo(PlayInfo playInfo) {
		return session.insert("Sound.insertPalyInfo", playInfo);
	}
	
	// 가수명과 제목으로 s_no , a_no 가져오기
	public Sound checkAnoSno(Sound sound) {
		return session.selectOne("Sound.checkAnoSno", sound);
	}
	
	// 곡 검색
	public List<Sound> selectSearchSound(String keyword, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("limit", limit);
		return session.selectList("Sound.selectSearchSound", map);
	}
	
	// 앨범 검색
	public List<Album> selectSearchAlbum(String keyword, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("limit", limit);
		return session.selectList("Sound.selectSearchAlbum", map);
	}
	
	// 아티스트 검색
	public List<Artist> selectSearchArtist(String keyword, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("limit", limit);
		return session.selectList("Sound.selectSearchArtist", map);
	}
	
	// 플리 게시판 검색
	public List<PjBoard> selectSearchBoard(String keyword, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("limit", limit);
		return session.selectList("Sound.selectSearchBoard", map);
	}
	
	
	
	
	
	
	
	
}
