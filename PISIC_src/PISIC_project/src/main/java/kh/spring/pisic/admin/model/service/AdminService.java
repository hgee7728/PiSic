package kh.spring.pisic.admin.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.pjboard.domain.PjBoardReport;
import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Sound;

public interface AdminService {
	public int totalCntArtist(); 
	public List<Artist> selectArtistList(Criteria cri);
	public Artist selectArtist(String artist_no);
	public List<Artist> selectArtistAjax(String keyword);
	public int insertArtist(Artist artist);
	public int updateArtist(Artist artist);
	public int deleteArtist(List<Artist> aritstList);
	
	public int totalCntAlbum();
	public List<Album> selectAlbumList(Criteria cri);
	public List<Album> selectSearchAlbumList(String keyword);
	public int insertAlbum(Album album);
	public Album selectAlbum(int a_no);
	public int updateAlbum(Album album);
	public int deleteAlbum(List<Album> albumList);
	
	public int totalCntSound();
	public List<Sound> selectSoundList(Criteria cri);
	public List<Sound> selectSearchSoundList(String keyword);
	public int insertSound(Sound sound, int[] singer_noArr, int[] writer_noArr, int[] composer_noArr);
	public Sound selectSound(Sound sound);
	public int updateSound(Sound sound, int[] singer_noArr, int[] writer_noArr, int[] composer_noArr);
	public int deleteSound(List<Sound> soundList);
	
	public List<Member> selectMemberList();
	public List<Member> selectAdminList();
	public List<Membership> selectMembershipList();
	public int totalCntMember();
	public int totalCntAdmin();
	
	public int totalCntReportBoard();
	public List<PjBoardReport> selectReportBoardList(Criteria cri);
	public PjBoardReport selectReprotBoard(PjBoardReport pjBoardReport);
	public int deleteReportBoard(List<PjBoard> boardList);
	
	public int updateMemberDeleteYn(List<Member> memberList);
	public int insertAdmin(Member member);
	
	public int totalQnaBoard();
	public List<QnaBoard> selectQnaList(Criteria cri);
}
