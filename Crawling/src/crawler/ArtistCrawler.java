package crawler;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ArtistCrawler {
	public static void main(String[] args) throws IOException {
		// 아티스트 검색
		String artist = "위위";
		// artist 아티스트 검색 링크
		Document doc1 = Jsoup.connect("https://music.bugs.co.kr/search/artist?q=" + artist).get();

		// 첫번쨰 아티스트 검색
		Elements link = doc1.selectXpath("//*[@id=\"container\"]/section/div/ul/li[1]/figure/figcaption/a[1]");

		// 첫번째 아티스트 Elements 안에서 href값 추출
		String linkhref = link.attr("href");
		Document docart = Jsoup.connect(linkhref).get();

		// 아티스트 명
		Elements name = docart.selectXpath("//*[@id=\"container\"]/header/div/h1");
		// 국적
		Elements con = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[3]/td");
		// 활동유형
		Elements type = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[1]/td");
		// 그룹멤버
		ArrayList<String> listM = new ArrayList<String>();
		int m = 1;
		int e = 1;
		while (true) {
			Elements memberTh = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + m + "]/th");
			// memberTh가 존재하면
			if (memberTh.size() > 0) {
				// memberTh의 text가 멤버 이면
				if (memberTh.text().equals("멤버")) {
					while (true) {
						// 멤버 각 1명의 이름
						Elements memberTdA = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + m + "]/td/a[" + e + "]");
						// memberTdA 가 존재하면
						if (memberTdA.size() > 0) {
							listM.add(memberTdA.text());
							e++;
						// memberTdA 가 존재하지 않으면
						} else {
							m++;
							break;
						}
					}
				// memberTh의 text가 멤버가 아니면
				} else {
					m++;
				}
			// memberTh가 존재하지 않으면
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
		// 소속사명
		String enter = "";
		int q = 1;
		while (true) {
			Elements enterDt = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dt[" + q + "]");
			// enterDt가 존재하면
			if (enterDt.size() > 0) {
				// enterDt의 text가 소속사명 이면
				if (enterDt.text().equals("소속사명")) {
					enter = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dd[" + q + "]").text();
					break;
				// enterDt의 text가 소속사명이 아니면
				} else {
					q++;
				}
			// enterDt가 존재하지 않으면
			} else {
				break;
			}
		}
		// 그룹명
		ArrayList<String> listG = new ArrayList<String>();
		int u = 1;
		int y = 1;
		while (true) {
			Elements groupNameDt = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dt[" + u + "]");
			// groupNameDt가 존재하면
			if (groupNameDt.size() > 0) {
				// groupNameDt의 text가 소속사명 이면
				if (groupNameDt.text().equals("소속그룹")) {
					while (true) {
						// 그룹 각 하나의 이름
						//*[@id="conts"]/div[6]/dl/dt[5]
						//*[@id="conts"]/div[6]/dl/dt[6]
						//*[@id="conts"]/div[6]/dl/dd[6]/a[1]
						//*[@id="conts"]/div[6]/dl/dd[6]/a[2]
						Elements groupNameDdA = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dd[" + u + "]/a[" + y + "]");
						// groupNameTdA 가 존재하면
						if (groupNameDdA.size() > 0) {
							listG.add(groupNameDdA.text());
							y++;
						// groupNameTdA 가 존재하지 않으면
						} else {
							u++;
							break;
						}
					}
				// groupNameDt의 text가 소속사명이 아니면
				} else {
					u++;
				}
			// groupNameDt가 존재하지 않으면
			} else {
				break;
			}
		}
		
//		Elements enter = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[1]/div/div[2]/dl[1]/dd[2]");
				
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
			} else if (artIntroDiv.size() == 0 && artIntroP.size() == 0) {
				Elements artIntro = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]");
				if (artIntro.size() > 0) {
					Elements artIntroText = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]/text()[" + I + "]");
					if (artIntroText.size() > 0) {
						listI.add(artIntroText.text());
						I++;
					} else {
						break;
					}
				} else {
					break;
				}
			} else {
				break;
			}
		}

		// 아티스트명
		String strArtName = name.text();
		System.out.println("아티스트명 : " + strArtName);
		// 국적
		String strArtCon = con.text();
		System.out.println("국적 : " + strArtCon);
		// 소속사
		String strArtEnter = enter;
		System.out.println("소속사 : " + strArtEnter);
		// 활동유형
		String strArtType = type.text();
		System.out.println("활동유형 : " + strArtType);
		// 그룹명
		String strArtGroupname = listG.toString();
		System.out.println("그룹명 : " + strArtGroupname);
		// 그룹멤버
		String strArtGroupmember = listM.toString();
		System.out.println("그룹멤버 : " + strArtGroupmember);
		// 아티스트 사진
		String strArtPic = picSrc;
		System.out.println("아티스트 사진 : " + strArtPic);
		// 아티스트 소개
		String strArtIntro = listI.toString();
		System.out.println("아티스트 소개 : " + strArtIntro);
		
//		if (listM.isEmpty() == false) {
//			for (String str : listM) {
//				System.out.print(str + " ");
//			}
//		}
//		for (String str : listI) {
//			System.out.print(str + "\n");
//		}
	}
}
