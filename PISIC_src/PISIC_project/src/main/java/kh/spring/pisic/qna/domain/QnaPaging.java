package kh.spring.pisic.qna.domain;

public class QnaPaging {
	
	private int totalCount;     // 게시판 전체 데이터 개수
	private int displayPageNum = 8;   // 게시판 화면에서 한번에 보여질 페이지 번호의 개수 ( 1,2,3,4,5,6,7,8)
	
	private int startPage;      // 현재 화면에서 보이는 startPage 번호
	private int endPage;        // 현재 화면에 보이는 endPage 번호
	private boolean prev;       // 페이징 이전 버튼 활성화 여부
	private boolean next;       // 페이징 다음 버튼 활서화 여부
	
	private Criteria cr;       // 앞서 생성한 Criteria를 주입받는다.

	public QnaPaging(Criteria cr, int totalQnaBoard) {
		totalCount = totalQnaBoard;
		this.cr = cr;
		endPage = (int) (Math.ceil(cr.getPage() / (double) displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cr.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * cr.getPerPageNum() >= totalCount ? false : true;
		
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getCr() {
		return cr;
	}

	public void setCr(Criteria cr) {
		this.cr = cr;
	}

	@Override
	public String toString() {
		return "QnaPaging [totalCount=" + totalCount + ", displayPageNum=" + displayPageNum + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", cr=" + cr + "]";
	}

	
	
	
}
