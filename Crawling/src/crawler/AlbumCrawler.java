package crawler;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class AlbumCrawler {
	public static void main(String[] args) throws IOException {
		// 아티스트 검색
		String artist = "몬스타엑스";
		
		// artist 아티스트 검색 링크
		Document doc1 = Jsoup.connect("https://www.genie.co.kr/search/searchAlbum?query=" + artist + "&Coll=").get();

		// 앨범명 요소
		//*[@id="body-content"]/div[4]/div[4]/div/ul/li[1]/dl/dt/a
		//*[@id="body-content"]/div[4]/div[4]/div/ul/li[2]/dl/dt/a
		//*[@id="body-content"]/div[4]/div[4]/div/ul/li[3]/dl/dt/a
		
		for(int i = 1; i < 6; i++) {
			Elements albumlink = doc1.selectXpath("//*[@id=\"body-content\"]/div[4]/div[4]/div/ul/li[" + i + "]/dl/dt/a");
			String albumlinknum = albumlink.attr("onClick");
			
			String subNo1 = albumlinknum.substring(0, albumlinknum.lastIndexOf("'"));
			String subNo2 = subNo1.substring(subNo1.lastIndexOf("'") + 1);
			
			Document doc2 = Jsoup.connect("https://www.genie.co.kr/detail/albumInfo?axnm=" + subNo2).get();
			
			// 앨범명
			Elements title = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/h2");
			System.out.println(title.text());
			
			// 앨범사진
			Elements pic = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[1]/a");
			String piclink = pic.attr("href");
			System.out.println(piclink);
			
			// 발매일
			Elements date = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[5]/span[2]");
			System.out.println(date.text());
			
			// 발매사
			Elements com1 = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[3]/span[2]");
			System.out.println(com1.text());
			
			// 기획사
			Elements com2 = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[4]/span[2]");
			System.out.println(com2.text());
			
			// 앨범소개
			Elements intro = doc2.select("#body-content > div.detail-descript > div.desc-cont > div");
			System.out.println(intro.html());
			System.out.println("--------------------------------------------------------------------");
			int j = 1;
			while(true) {
				Elements songlink = doc2.selectXpath("//*[@id=\"listContainer\"]/div[1]/div[2]/table/tbody/tr[" + j + "]/td[3]/a");
				if (songlink.size() > 0) {
					String songlinknum = songlink.attr("onClick");
					
					String subNo3 = songlinknum.substring(0, songlinknum.lastIndexOf(")"));
					String subNo4 = subNo3.substring(subNo3.lastIndexOf("(") + 1);
					
					Document doc3 = Jsoup.connect("https://www.genie.co.kr/detail/songInfo?xgnm=" + subNo4).get();
					
					// 노래 제목
					Elements songname = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/h2");
					System.out.println(songname.text());
					
					// 노래 가사
					Elements songly = doc3.selectXpath("//*[@id=\"pLyrics\"]/p");
					System.out.println(songly.text());
					
					// 작사가
					ArrayList<String> listsw = new ArrayList<String>();
					int k = 1;
					while(true) {
						Elements songw = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[5]/span[2]/a[" + k + "]");
						if (songw.size() > 0) {
							listsw.add(songw.text());
							k++;
						} else {
							break;
						}
					}
					String listswToString = listsw.toString();
					System.out.println(listswToString);
					
					// 작곡가
					ArrayList<String> listsc = new ArrayList<String>();
					int h = 1;
					while(true) {
						Elements songc = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[6]/span[2]/a[" + h + "]");
						if (songc.size() > 0) {
							listsc.add(songc.text());
							h++;
						} else {
							break;
						}
					}
					String listscToString = listsc.toString();
					System.out.println(listscToString);
					j++;
				} else {
					break;
				}
			}
			System.out.println("====================================================================");
		}
	}
}