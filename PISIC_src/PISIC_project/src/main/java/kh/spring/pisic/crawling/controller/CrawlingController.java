package kh.spring.pisic.crawling.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.crawling.model.service.CrawlingService;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.common.PisicUtil;

@Controller
@RequestMapping("/crawling")
public class CrawlingController {

	@Autowired
	private CrawlingService service;

	@GetMapping("/insert")
	public String pageInsertA() {
		return "crawling/insert";
	}

	@PostMapping("/insertA")
	public ModelAndView insertA(ModelAndView mv, @RequestParam(name = "artist") String artistText, Artist at)
			throws IOException {
		// 아티스트 검색
		String artist = artistText;
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
		int b = 1;
		String con = "";
		while (true) {
			Elements conTh = docart
					.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + b + "]/th");
			Elements conTd = docart
					.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + b + "]/td");
			// conTh가 존재하면
			if (conTh.size() > 0) {
				// conTh의 text가 국적 이면
				if (conTh.text().equals("국적")) {
					con = conTd.text();
					break;
				// conTh의 text가 국적이 아니면
				} else {
					b++;
				}
			// conTh가 존재하지 않으면
			} else {
				break;
			}
		}
		// 활동유형
		Elements type = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[1]/td");
		// 그룹멤버
		ArrayList<String> listM = new ArrayList<String>();
		int m = 1;
		int e = 1;
		while (true) {
			Elements memberTh = docart
					.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + m + "]/th");
			// memberTh가 존재하면
			if (memberTh.size() > 0) {
				// memberTh의 text가 멤버 이면
				if (memberTh.text().equals("멤버")) {
					while (true) {
						// 멤버 각 1명의 이름
						Elements memberTdA = docart
								.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + m
										+ "]/td/a[" + e + "]");
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
			// *[@id="conts"]/div[4]/h3
			// *[@id="conts"]/div[5]/h3
//			Elements enterDt = docMeldetail.selectXpath("");
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
						// *[@id="conts"]/div[6]/dl/dt[5]
						// *[@id="conts"]/div[6]/dl/dt[6]
						// *[@id="conts"]/div[6]/dl/dd[6]/a[1]
						// *[@id="conts"]/div[6]/dl/dd[6]/a[2]
						Elements groupNameDdA = docMeldetail
								.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dd[" + u + "]/a[" + y + "]");
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
		// 아티스트 소개 container
		Elements artIntro = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]");
//		int I = 1;
//		while (true) {
//			// 아티스트 소개 각 div
//			Elements artIntroDiv = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]/div[" + I + "]");
//			// 아티스트 소개 각 p
//			Elements artIntroP = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]/p[" + I + "]");
//			// 아티스트 소개 각 text
//			Elements artIntroText = docMeldetail.selectXpath("//*[@id=\"d_artist_intro\"]/text()[" + I + "]");
//			// 아티스트 소개가 div 태그로 존재하면
//			if (artIntroDiv.size() > 0) {
//				listI.add(artIntroDiv.text());
//				I++;
//			// 아티스트 소개가 p 태그로 존재하면
//			} else if (artIntroP.size() > 0) {
//				listI.add(artIntroP.text());
//				I++;
//			// 아티스트 소개가 text로 있으면
//			} else if (artIntroText.size() > 0) {
//				listI.add(artIntroText.text());
//				I++;
//			} else {
//				break;
//			}
//		}
		// 아티스트 소개가 위 유형이 아니면
		if (listI.isEmpty() == true) {
			String subIno = artIntro.html().substring(artIntro.html().lastIndexOf("-->") + 4);
			listI.add(subIno);
		}

		// 아티스트명
		String strArtName = name.text();
		System.out.println("아티스트명 : " + strArtName);
		// 국적
		String strArtCon = con;
		System.out.println("국적 : " + strArtCon);
		// 소속사
		String strArtEnter = enter;
		System.out.println("소속사 : " + strArtEnter);
		// 활동유형
		String strArtType = type.text();
		System.out.println("활동유형 : " + strArtType);
		// 그룹명
		String strArtGroupname = "";
//		if (listG.isEmpty() == true) {
//			strArtGroupname = strArtName;
//		} else {
		strArtGroupname = listG.toString().substring(1, listG.toString().length() - 1);
//		}
		System.out.println("그룹명 : " + strArtGroupname);
		// 그룹멤버
		String strArtGroupmember = listM.toString().substring(1, listM.toString().length() - 1);
		System.out.println("그룹멤버 : " + strArtGroupmember);
		// 아티스트 사진
		String strArtPic = picSrc;
		System.out.println("아티스트 사진 : " + strArtPic);
		// 아티스트 소개
		String strArtIntro = listI.toString().substring(1, listI.toString().length() - 1);
		System.out.println(strArtIntro.length());
		System.out.println(strArtIntro.getBytes().length);
		String strArtIntro1 = "";
		String strArtIntro2 = "";
		if (strArtIntro.length() > 1500) {
			strArtIntro1 = strArtIntro.substring(0, 1500);
			strArtIntro2 = strArtIntro.substring(1500, strArtIntro.length());
			at.setArtist_info1(strArtIntro1);
			at.setArtist_info2(strArtIntro2);
		} else {
			at.setArtist_info1(strArtIntro);
			at.setArtist_info2(strArtIntro2);
		}
		System.out.println("아티스트 소개1 : " + strArtIntro1);
		System.out.println("-----------------------------");
		System.out.println("아티스트 소개2 : " + strArtIntro2);
//		if (listM.isEmpty() == false) {
//			for (String str : listM) {
//				System.out.print(str + " ");
//			}
//		}
//		for (String str : listI) {
//			System.out.print(str + "\n");
//		}
		at.setArtist_name(strArtName);
		at.setArtist_nation(strArtCon);
		at.setArtist_company(strArtEnter);
		at.setArtist_type(strArtType);
		at.setArtist_group(strArtGroupname);
		at.setArtist_member(strArtGroupmember);
		at.setArtist_profile(strArtPic);

		int result = service.insertA(at);

		mv.setViewName("redirect:/crawling/insert");
		return mv;
	}
	
	@PostMapping("/insertB")
	public ModelAndView insertB(ModelAndView mv, @RequestParam(name = "artist") String artistText, Sound sd, Album am)
			throws IOException {
		// 아티스트 검색
		String artist = artistText;
		// artist 아티스트명 검색 링크
		Document doc = Jsoup.connect("https://music.bugs.co.kr/search/artist?q=" + artist).get();

		// 첫번쨰 아티스트 검색
		Elements link = doc.selectXpath("//*[@id=\"container\"]/section/div/ul/li[1]/figure/figcaption/a[1]");

		// 첫번째 아티스트 Elements 안에서 href값 추출
		String linkhref = link.attr("href");
		Document docart = Jsoup.connect(linkhref).get();

		// 아티스트 명
		Elements name = docart.selectXpath("//*[@id=\"container\"]/header/div/h1");
		System.out.println("아티스트명 : " + name.text());
		
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
			
			// 앨범사진
			Elements pic = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[1]/a");
			String piclink = pic.attr("href");
			
			// 발매일
			Elements date = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[5]/span[2]");
			
			// 발매사
			Elements com1 = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[3]/span[2]");
			
			// 기획사
			Elements com2 = doc2.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[4]/span[2]");
			
			// 앨범소개
			Elements intro = doc2.select("#body-content > div.detail-descript > div.desc-cont > div");
			String artname = name.text();
			System.out.println("아티스트명 : " + artname);
			String Altitle = title.text();
			System.out.println("앨범명 : " + Altitle);
			String Alpic = piclink;
			System.out.println("앨범사진 : " + Alpic);
			String Aldate = date.text();
			String AldateRe = Aldate.replace(".", "-");
			Date AldateD = Date.valueOf(AldateRe);
			System.out.println("발매일 : " + AldateRe);
			String Alcom1 = com1.text();
			System.out.println("발매사 : " + Alcom1);
			String Alcom2 = com2.text();
			System.out.println("기획사 : " + Alcom2);
			String Alintro = intro.html();
			String Alintro1 = "";
			String Alintro2 = "";
			if (Alintro.length() > 1700) {
				Alintro1 = Alintro.substring(0, 1700);
				if (Alintro.length() > 3400) {
					Alintro2 = Alintro.substring(1700, 3400);
				} else {
					Alintro2 = Alintro.substring(1700, Alintro.length());
				}
				am.setA_introduce1(Alintro1);
				am.setA_introduce2(Alintro2);
			} else {
				am.setA_introduce1(Alintro);
				am.setA_introduce2(Alintro2);
			}
			System.out.println("앨범소개 : " + Alintro);
			System.out.println("앨범소개1 : "  + Alintro1);
			System.out.println(Alintro1.length());
			System.out.println(Alintro1.getBytes().length);
			System.out.println("----------------------");
			System.out.println("앨범소개2 : "  + Alintro2);
			System.out.println(Alintro2.length());
			System.out.println(Alintro2.getBytes().length);
			System.out.println(Alintro.length());
			System.out.println(Alintro.getBytes().length);
			
			am.setA_name(Altitle);
			am.setA_cover(Alpic);
			am.setA_date(AldateD);
			am.setA_publishing(Alcom1);
			am.setA_agency(Alcom2);
			am.setArtist_name(artname);
			
			int result1 = service.insertB(am);
			
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
					String strsongname = songname.text();
					
					// 노래 가사
					Elements songly = doc3.selectXpath("//*[@id=\"pLyrics\"]/p");
					String strsongly = songly.text();
					String strsongly1 = "";
					String strsongly2 = "";
					if (strsongly.length() > 1500) {
						strsongly1 = strsongly.substring(0, 1500);
						strsongly2 = strsongly.substring(1500, strsongly.length());
					} else {
						
					}
					
					// 앨범명
					String strsongalname = "";
					int c = 1;
					while (true) {
						Elements songalnameImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + c + "]/span[1]/img");
						if (songalnameImg.size() > 0) {
							if (songalnameImg.attr("src").equals("//image.genie.co.kr/imageg/web/detail/txt_6.png")) {
								Elements songalname = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + c + "]/span[2]/a");
								strsongalname = songalname.text();
								break;
							} else {
								c++;
							}
						} else {
							break;
						}
					}
					
					// 장르
					String strsongtype = "";
					int d = 1;
					while (true) {
						Elements songtypeImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + d + "]/span[1]/img");
						if (songtypeImg.size() > 0) {
							if (songtypeImg.attr("alt").equals("장르")) {
								Elements songtype = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + d + "]/span[2]");
								strsongtype = songtype.text();
								break;
							} else {
								d++;
							}
						} else {
							break;
						}
					}
					
					// 작사가
					ArrayList<String> listsw = new ArrayList<String>();
					int a = 1;
					int k = 1;
					while(true) {
						Elements songwImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + a + "]/span[1]/img");
						if (songwImg.size() > 0) {
							if (songwImg.attr("alt").equals("작사가")) {
								while (true) {
									Elements songw = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + a + "]/span[2]/a[" + k + "]");
									if (songw.size() > 0) {
										listsw.add(songw.text());
										k++;
									} else {
										a++;
										break;
									}
								}
							} else {
								a++;
							}
						} else {
							break;
						}
					}
					String listswToString = listsw.toString().substring(1, listsw.toString().length() - 1);
					
					// 작곡가
					ArrayList<String> listsc = new ArrayList<String>();
					int b = 1;
					int h = 1;
					while(true) {
						Elements songcImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + b + "]/span[1]/img");
						if (songcImg.size() > 0) {
							if (songcImg.attr("alt").equals("작곡가")) {
								while (true) {
									Elements songc = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + b + "]/span[2]/a[" + h + "]");
									if (songc.size() > 0) {
										listsc.add(songc.text());
										h++;		
									} else {
										b++;
										break;
									}
								}
							} else {
								b++;
							}
						} else {
							break;
						}
					}
					String listscToString = listsc.toString().substring(1, listsc.toString().length() - 1);
					
					System.out.println("앨범명 : " + strsongalname);
					System.out.println("장르 : " + strsongtype);
					System.out.println("노래 제목 : " + strsongname);
					System.out.println("노래 가사 : " + strsongly);
					System.out.println("노래 가사1 : " + strsongly1);
					System.out.println("------------------------");
					System.out.println("노래 가사2 : " + strsongly2);
					System.out.println(strsongly.length());
					System.out.println(strsongly.getBytes().length);
					System.out.println("작사가 : " + listswToString);
					System.out.println("작곡가 : " + listscToString);
					j++;
				} else {
					break;
				}
			}
			System.out.println("====================================================================");
		}
		mv.setViewName("redirect:/crawling/insert");
		return mv;
	}
}
