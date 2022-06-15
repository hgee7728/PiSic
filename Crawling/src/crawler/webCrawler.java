package crawler;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class webCrawler {
	public static void main(String[] args) throws IOException {
//		// 오늘의집 침대 페이지
//		Document document = Jsoup.connect("https://ohou.se/store/category?category=0_22").get();
//		// 제품 제목 요소
//		Elements itemnames = document.select("div.virtualized-list span.production-item__header__name");
//		// 제품 가격 요소
//		Elements itemprices = document.select("div.virtualized-list span.production-item-price__price");
//		
//		for (int i = 0; i < 20; i++) {
//			Element name = itemnames.get(i);
//			Element price = itemprices.get(i);
//			System.out.println(name.text() + " " + price.text() + "\n");
//		}
//
//		System.out.println("=========================================================================");
//		
//		// 벅스 노래 차트 링크
//		Document docBugs = Jsoup.connect("https://music.bugs.co.kr/chart").get();
////		table > tbody > tr:nth-child(1) > td:nth-child(6) > a
////		table > tbody > tr:nth-child(2) > td:nth-child(6) > a
////		table > tbody > tr:nth-child(3) > td:nth-child(6) > a
////		...
////		table > tbody > tr:nth-child(100) > td:nth-child(6) > a
//		
//		String k1 = "table > tbody > tr:nth-child(";
//		String k2 = ") > td:nth-child(6) > a";
//		
//		for (int i = 1;  i < 2; i++)  {
//			// 각 순위에 따른 노래 가사버튼 선택자
//			Elements linkele = docBugs.select(k1 + i + k2);
//			
//			// 가사요소 안에서 href값 추출
//			String linkhrefget = linkele.attr("href");
//			Document doc =  Jsoup.connect(linkhrefget).get();
//			
//			// 곡명 선택자
//			Elements name = doc.select("#container > header > div > h1");
//			// 아티스트 선택자
//			Elements artist = doc.select("#container > section.sectionPadding.summaryInfo.summaryTrack > div > div.basicInfo > table > tbody > tr:nth-child(1) > td > a");
//			// 가사 선택자
//			Elements lyrics = doc.select("#container > section.sectionPadding.contents.lyrics > div > div > xmp");
//			
//			System.out.println(name.text() + "\t" +  artist.text());
//			System.out.println(lyrics.text());
//			System.out.println(lyrics.text().getBytes().length + "\n");
//			
//		}
		
		System.out.println("=========================================================================");
		// 아티스트명
		String artist = "몬스타엑스";
		// 한글 URL인코더
//		artist = URLEncoder.encode(artist, "UTF-8");
		
		// artist 곡목록 링크
		Document docList = Jsoup.connect("https://music.bugs.co.kr/search/track?q=" + artist).get();
		
		// 노래 가사 링크 선택자
//		#DEFAULT0 > table > tbody > tr:nth-child(1) > td:nth-child(5) > a
//		#DEFAULT0 > table > tbody > tr:nth-child(2) > td:nth-child(5) > a
//		#DEFAULT0 > table > tbody > tr:nth-child(3) > td:nth-child(5) > a
//		...
//		#DEFAULT0 > table > tbody > tr:nth-child(10) > td:nth-child(5) > a
		
		for (int i = 1; i < 2; i++) {
			// 각 노래 가사버튼 선택자
			Elements linkele = docList.selectXpath("//*[@id=\"DEFAULT0\"]/table/tbody/tr[" + i + "]/td[3]/a");
//			select("#DEFAULT0 > table > tbody > tr:nth-child(" + i + ") > td:nth-child(5) > a");
			
			// 가사버튼 안에서 href값 추출
			String linkhrefget = linkele.attr("href");
			Document docuEach=  Jsoup.connect(linkhrefget).get();
			
			// --각 노래별 정보 추출--

			// 곡명 선택자
			Elements name = docuEach.select("#container > header > div > h1");
			// 아티스트 선택자
			Elements singer = docuEach.select("#container > section.sectionPadding.summaryInfo.summaryTrack > div > div.basicInfo > table > tbody > tr:nth-child(1) > td > a");
			
			/* 작사가 작곡가
			 * 벅스 : a태그와 span태그 둘다 있음 
			 * 바이브 : span태그
			 * 멜론 : a태그 */
			// 작곡가 선택자
			ArrayList<String> listW = new ArrayList<String>();
			int w = 1;
			while(true) {
				Elements writer = docuEach.select("#container > section.sectionPadding.summaryInfo.summaryTrack > div > div.basicInfo > table > tbody > tr:nth-child(2) > td > span:nth-child(5) > a:nth-child(" + w + ")");
				if (writer.size() > 0) {
					listW.add(writer.text());
					w++;
				} else {
					break;
				}
			}	
			// 작사가 선택자
			ArrayList<String> listC = new ArrayList<String>();
			int c = 1;
			while(true) {
				Elements composer = docuEach.select("#container > section.sectionPadding.summaryInfo.summaryTrack > div > div.basicInfo > table > tbody > tr:nth-child(2) > td > span:nth-child(8) > a:nth-child(" + c + ")");
				if (composer.size() > 0) {
					listC.add(composer.text());
					c++;
				} else {
					break;
				}
			}
			// 앨범명 선택자
			Elements album = docuEach.select("#container > section.sectionPadding.summaryInfo.summaryTrack > div > div.basicInfo > table > tbody > tr:nth-child(3) > td > a");
			// 가사 선택자
			Elements lyrics = docuEach.select("#container > section.sectionPadding.contents.lyrics > div > div > xmp");
			
			System.out.println("/곡명 : " + name.text() + "\t" + "/가수명 : " + singer.text() + "\t" + "/앨범명 : " + album.text());
			System.out.print("/작곡 : ");
			for (String str : listW) {
				System.out.print(str + ", ");
			}
			System.out.println();
			System.out.print("/작사 : ");
			for (String str : listC) {
				System.out.print(str + ", ");
			}
			System.out.println();
			System.out.println(lyrics.text().substring(0, 1000));
			System.out.println(lyrics.text().substring(1000));
			System.out.println(lyrics.text().length());
			System.out.println(lyrics.text().getBytes().length + " bytes" + "\n");
		}
	
		System.out.println("==================================아티스트 검색=======================================");
		
		// 아티스트 검색
		String search1 = "버즈";
		// search1 아티스트 검색 링크
		Document doc1 = Jsoup.connect("https://music.bugs.co.kr/search/artist?q=" + search1).get();
		
		// 첫번쨰 아티스트 검색
		Elements link = doc1.selectXpath("//*[@id=\"container\"]/section/div/ul/li[1]/figure/figcaption/a[1]");
		
		// 가사버튼 안에서 href값 추출
		String linkhref = link.attr("href");
		Document docart = Jsoup.connect(linkhref).get();
		
		// 아티스트 명
		Elements name = docart.selectXpath("//*[@id=\"container\"]/header/div/h1");
		// 국적
		Elements con = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[3]/td");
		// 활동유형
		Elements type = doc1.selectXpath("//*[@id=\"container\"]/section/div/ul/li[1]/figure/figcaption/p/span[1]");
		// 그룹명
		
		// 그룹멤버
		ArrayList<String> listM = new ArrayList<String>();
		int m = 1;
		while(true) {
			Elements member = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[5]/td/a[" + m + "]");
			if (member.size() > 0) {
				listM.add(member.text());
				m++;
			} else {
				break;
			}
		}	
		
		// 아티스트 사진
		Elements pic = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/div/ul/li[1]/a/img");
		String picSrc = pic.attr("src");
		
		// 멜론에서 아티스트 검색
		Document docMel = Jsoup.connect("https://www.melon.com/search/total/index.htm?q=" + search1 + "&section=&mwkLogType=T").get();
		Elements linkMel = docMel.selectXpath("//*[@id=\"conts\"]/div[3]/div[1]/div[1]/div/a");

		// href 추출
		String linkMelhref = linkMel.attr("href"); // href가 javascript:
		String subNo1 = linkMelhref.substring(0, linkMelhref.lastIndexOf("'"));
		String subNo2 = subNo1.substring(subNo1.lastIndexOf("'") + 1);
			
		Document docMelart = Jsoup.connect("https://www.melon.com/artist/timeline.htm?artistId=" + subNo2).get();

		// linkMelhref 상세정보 추출
		Document docMeldetail = Jsoup.connect("https://www.melon.com/artist/detail.htm?artistId=" + subNo2).get();
		// 소속사
		Elements enter = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[1]/div/div[2]/dl[1]/dd[2]");
		// 아티스트 소개
		ArrayList<String> listI = new ArrayList<String>();
		int I = 1;
		while(true) {
			Elements artIntro = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]/div[" + I + "]");
			if (artIntro.size() > 0) {
				listI.add(artIntro.text());
				I++;
			} else {
				break;
			}
		}
		
		System.out.println(name.text() + "\t" + con.text() + "\t" + type.text() + "\t" + enter.text());
		for (String str : listM) {
			System.out.print(str + " ");
		}
		System.out.println("\n" + picSrc);
		for (String str : listI) {
			System.out.print(str + "\n");
		}
	}
}