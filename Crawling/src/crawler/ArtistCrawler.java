package crawler;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class ArtistCrawler {
	public static void main(String[] args) throws IOException {
		// 아티스트 검색
		String artist = "몬스타엑스";
		// artist 아티스트 검색 링크
		Document doc1 = Jsoup.connect("https://music.bugs.co.kr/search/artist?q=" + artist).get();

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
		while (true) {
			Elements member = docart
					.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[5]/td/a[" + m + "]");
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
		Document docMel = Jsoup
				.connect("https://www.melon.com/search/total/index.htm?q=" + artist + "&section=&mwkLogType=T").get();
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
		while (true) {
			//*[@id="d_artist_intro"]/p[1]
			Elements artIntroDiv = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]/div[" + I + "]");
			Elements artIntroP = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]/p[" + I + "]");
			if (artIntroDiv.size() > 0) {
				listI.add(artIntroDiv.text());
				I++;
			} else if (artIntroP.size() > 0) {
				listI.add(artIntroP.text());
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
