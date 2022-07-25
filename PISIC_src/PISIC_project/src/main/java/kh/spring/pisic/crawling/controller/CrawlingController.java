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
import kh.spring.pisic.sound.domain.AssociationAS;
import kh.spring.pisic.sound.domain.Sound;

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
//		Elements name = docart.selectXpath("//*[@id=\"container\"]/header/div/h1");
		Document docartname = Jsoup.connect("https://www.genie.co.kr/search/searchArtist?query=" + artist + "&Coll=").get();
		Elements name = docartname.selectXpath("//*[@id=\"body-content\"]/div[4]/div[4]/div[1]/div/p/span[1]/a");
		String geartlink = name.attr("onclick");
		String nsubNo1 = geartlink.substring(0, geartlink.lastIndexOf("'"));
		String nsubNo2 = nsubNo1.substring(nsubNo1.lastIndexOf("'") + 1);
		Document gedocartde = Jsoup.connect("https://www.genie.co.kr/detail/artistInfo?xxnm=" + nsubNo2).get();
		
		// 국적
		int a = 1;
		String con = "";
		while (true) {
			Elements conImg = gedocartde
					.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + a + "]/span[1]/img");
			Elements conspan = gedocartde
					.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + a + "]/span[2]");
			// conImg가 존재하면
			if (conImg.size() > 0) {
				// conImg의 alt가 국적 이면
				if (conImg.attr("alt").equals("국적")) {
					con = conspan.text();
					break;
				// conImg의 text가 국적이 아니면
				} else {
					a++;
				}
			// conImg가 존재하지 않으면
			} else {
				break;
			}
		}
		// 활동유형
//		Elements type = docart.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[1]/td");
		Elements type = gedocartde.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[1]/span[2]");
		
		// 그룹멤버
		ArrayList<String> listM = new ArrayList<String>();
		int b = 1;
		int c = 1;
		while (true) {
			Elements memberTh = docart
					.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + b + "]/th");
			// memberTh가 존재하면
			if (memberTh.size() > 0) {
				// memberTh의 text가 멤버 이면
				if (memberTh.text().equals("멤버")) {
					while (true) {
						// 멤버 각 1명의 이름
						Elements memberTdA = docart
								.selectXpath("//*[@id=\"contentArea\"]/section[1]/div/div[1]/table/tbody/tr[" + b
										+ "]/td/a[" + c + "]");
						// memberTdA 가 존재하면
						if (memberTdA.size() > 0) {
							listM.add(memberTdA.text());
							c++;
						// memberTdA 가 존재하지 않으면
						} else {
							b++;
							break;
						}
					}
				// memberTh의 text가 멤버가 아니면
				} else {
					b++;
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
		int d = 1;
		while (true) {
			// *[@id="conts"]/div[4]/h3
			// *[@id="conts"]/div[5]/h3
//			Elements enterDt = docMeldetail.selectXpath("");
			Elements enterDt = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dt[" + d + "]");
			// enterDt가 존재하면
			if (enterDt.size() > 0) {
				// enterDt의 text가 소속사명 이면
				if (enterDt.text().equals("소속사명")) {
					enter = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dd[" + d + "]").text();
					break;
				// enterDt의 text가 소속사명이 아니면
				} else {
					d++;
				}
			// enterDt가 존재하지 않으면
			} else {
				break;
			}
		}
		// 그룹명
		ArrayList<String> listG = new ArrayList<String>();
		int e = 1;
		int f = 1;
		while (true) {
			Elements groupNameDt = docMeldetail.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dt[" + e + "]");
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
								.selectXpath("//*[@id=\"conts\"]/div[6]/dl/dd[" + e + "]/a[" + f + "]");
						// groupNameTdA 가 존재하면
						if (groupNameDdA.size() > 0) {
							listG.add(groupNameDdA.text());
							f++;
						// groupNameTdA 가 존재하지 않으면
						} else {
							e++;
							break;
						}
					}
				// groupNameDt의 text가 소속사명이 아니면
				} else {
					e++;
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
		String strArtTypeb = type.text();
		String strArtType = strArtTypeb.substring(strArtTypeb.lastIndexOf("/") + 1);
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
		if (strArtIntro.length() > 1700) {
			strArtIntro1 = strArtIntro.substring(0, 1700);
			if (strArtIntro.length() > 3400) {
				strArtIntro2 = strArtIntro.substring(1700, 3400);
			} else {
				strArtIntro2 = strArtIntro.substring(1700, strArtIntro.length());
			}
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
	public ModelAndView insertB(ModelAndView mv, @RequestParam(name = "artist") String artistText, Sound sd, Album am, Artist at, AssociationAS as)
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
//		Elements name = docart.selectXpath("//*[@id=\"container\"]/header/div/h1");
//		System.out.println("아티스트명 : " + name.text());
		Document docartname = Jsoup.connect("https://www.genie.co.kr/search/searchArtist?query=" + artist + "&Coll=").get();
		Elements name = docartname.selectXpath("//*[@id=\"body-content\"]/div[4]/div[4]/div[1]/div/p/span[1]/a");
		
		// artist 아티스트 검색 링크
		Document doc1 = Jsoup.connect("https://www.genie.co.kr/search/searchAlbum?query=" + artist + "&Coll=").get();

		// 앨범명 요소
		//*[@id="body-content"]/div[4]/div[4]/div/ul/li[1]/dl/dt/a
		//*[@id="body-content"]/div[4]/div[4]/div/ul/li[2]/dl/dt/a
		//*[@id="body-content"]/div[4]/div[4]/div/ul/li[3]/dl/dt/a
		
		for(int g = 1; g < 6; g++) {
			Elements albumlink = doc1.selectXpath("//*[@id=\"body-content\"]/div[4]/div[4]/div/ul/li[" + g + "]/dl/dt/a");
			String albumlinknum = albumlink.attr("onclick");
			
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
					if (strsongly.length() > 1700) {
						strsongly1 = strsongly.substring(0, 1700);
						if (strsongly.length() > 3400) {
							strsongly2  = strsongly.substring(1700, 3400);
						} else {
							strsongly2 = strsongly.substring(1700, strsongly.length());
						}
						sd.setS_lyrics1(strsongly1);
						sd.setS_lyrics2(strsongly2);
					} else {
						sd.setS_lyrics1(strsongly);
						sd.setS_lyrics2(strsongly2);
					}
					
					// 앨범명
					String strsongalname = "";
					int h = 1;
					while (true) {
						Elements songalnameImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + h + "]/span[1]/img");
						if (songalnameImg.size() > 0) {
							if (songalnameImg.attr("src").equals("//image.genie.co.kr/imageg/web/detail/txt_6.png")) {
								Elements songalname = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + h + "]/span[2]/a");
								strsongalname = songalname.text();
								break;
							} else {
								h++;
							}
						} else {
							break;
						}
					}
					
					// 장르
					String strsongtype = "";
					int i = 1;
					while (true) {
						Elements songtypeImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + i + "]/span[1]/img");
						if (songtypeImg.size() > 0) {
							if (songtypeImg.attr("alt").equals("장르")) {
								Elements songtype = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + i + "]/span[2]");
								strsongtype = songtype.text();
								break;
							} else {
								i++;
							}
						} else {
							break;
						}
					}
					
					// 작사가
					ArrayList<String> listsw = new ArrayList<String>();
					int l = 1;
					int k = 1;
					while(true) {
						Elements songwImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + l + "]/span[1]/img");
						if (songwImg.size() > 0) {
							if (songwImg.attr("alt").equals("작사가")) {
								while (true) {
									Elements songw = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + l + "]/span[2]/a[" + k + "]");
									if (songw.size() > 0) {
										listsw.add(songw.text());
										int selectA = service.selectA(songw.text());
										if (selectA == 0) {
											String songwlink = songw.attr("onclick");
											String wsubNo1 = songwlink.substring(0, songwlink.lastIndexOf("'"));
											String wsubNo2 = wsubNo1.substring(wsubNo1.lastIndexOf("'") + 1);
											Document gedocartwde = Jsoup.connect("https://www.genie.co.kr/detail/artistInfo?xxnm=" + wsubNo2).get();
											Elements wname = gedocartwde.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/h2");
											Elements wtypeb = gedocartwde.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[1]/span[2]");
											String wtype = wtypeb.text().substring(wtypeb.text().lastIndexOf("/") + 1);
											Elements wpic = gedocartwde.selectXpath("//*[@id=\"body-content\"]/div[2]/div[1]/a/span/img");
//											int q = 3;
//											int s = 1;
//											while (true) {
//												Elements wgroupImg = gedocartwde.selectXpath("//*[@id=\"body-content\"]/div[" + q + "]/div[1]/h3/img");
//												if (wgroupImg.size() > 0) {
//													if (wgroupImg.attr("alt").equals("아티스트 소개")) {
//														while (true) {
//															Elements wgroupdiv = gedocartwde.selectXpath("//*[@id=\"body-content\"]/div[" + q + "]/div[2]/div/div[" + s + "]");
//															Elements wgroupspan = gedocartwde.selectXpath("//*[@id=\"body-content\"]/div[" + q + "]/div[2]/div/div[" + s + "]/span");
//															if (wgroupdiv.size() > 0) {
//																if (wgroupdiv.text().length() > 4) {
//																	if ((wgroupdiv.text().substring(0, 2).equals("소속") || wgroupdiv.text().substring(0, 2).equals("그룹") || wgroupdiv.text().substring(0, 4).equals("소속그룹")) && !wgroupdiv.text().substring(0, 3).equals("소속사")) {
//																		at.setArtist_group(wgroupdiv.text().substring(wgroupdiv.text().lastIndexOf(":" + 1)));
//																		q++;
//																		break;
//																	} else if (wgroupspan.size() > 0) {
//																		if (wgroupspan.text().length() > 4) {
//																			if ((wgroupspan.text().substring(0, 2).equals("소속") || wgroupspan.text().substring(0, 2).equals("그룹") || wgroupspan.text().substring(0, 4).equals("소속그룹")) && !wgroupspan.text().substring(0, 3).equals("소속사")) {
//																				at.setArtist_group(wgroupspan.text().substring(wgroupspan.text().lastIndexOf(":" + 1)));
//																				q++;
//																				break;
//																			} else {
//																				s++;
//																			}
//																		} else {
//																			s++;
//																		}
//																	} else {
//																		s++;
//																	}
//																} else {
//																	s++;
//																}
//															} else {
//																q++;
//																break;
//															}
//														}
//													} else {
//														q++;
//													}
//												} else {
//													break;
//												}
//											}
											int m = 1;
											String wcon = "";
											while (true) {
												Elements conImg = gedocartwde
														.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + m + "]/span[1]/img");
												Elements conspan = gedocartwde
														.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + m + "]/span[2]");
												// conImg가 존재하면
												if (conImg.size() > 0) {
													// conImg의 alt가 국적 이면
													if (conImg.attr("alt").equals("국적")) {
														wcon = conspan.text();
														break;
													// conImg의 text가 국적이 아니면
													} else {
														m++;
													}
												// conImg가 존재하지 않으면
												} else {
													break;
												}
											}
											at.setArtist_name(wname.text());
											at.setArtist_type(wtype);
											at.setArtist_profile(wpic.attr("src"));
											at.setArtist_nation(wcon);
											if(wname.text() != null && !wname.text().equals("")) {
												int insertA = service.insertA(at);
											}
										}
										k++;
									} else {
										l++;
										break;
									}
								}
							} else {
								l++;
							}
						} else {
							break;
						}
					}
					String listswToString = listsw.toString().substring(1, listsw.toString().length() - 1);
					
					// 작곡가
					ArrayList<String> listsc = new ArrayList<String>();
					int o = 1;
					int n = 1;
					while(true) {
						Elements songcImg = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + o + "]/span[1]/img");
						if (songcImg.size() > 0) {
							if (songcImg.attr("alt").equals("작곡가")) {
								while (true) {
									Elements songc = doc3.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + o + "]/span[2]/a[" + n + "]");
									if (songc.size() > 0) {
										listsc.add(songc.text());
										int selectA = service.selectA(songc.text());
										if (selectA == 0) {
											String songclink = songc.attr("onclick");
											String csubNo1 = songclink.substring(0, songclink.lastIndexOf("'"));
											String csubNo2 = csubNo1.substring(csubNo1.lastIndexOf("'") + 1);
											Document gedocartcde = Jsoup.connect("https://www.genie.co.kr/detail/artistInfo?xxnm=" + csubNo2).get();
											Elements cname = gedocartcde.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/h2");
											Elements ctypeb = gedocartcde.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[1]/span[2]");
											String ctype = ctypeb.text().substring(ctypeb.text().lastIndexOf("/") + 1);
											Elements cpic = gedocartcde.selectXpath("//*[@id=\"body-content\"]/div[2]/div[1]/a/span/img");
//											int r = 3;
//											int t = 1;
//											while (true) {
//												Elements cgroupImg = gedocartcde.selectXpath("//*[@id=\"body-content\"]/div[" + r + "]/div[1]/h3/img");
//												if (cgroupImg.size() > 0) {
//													if (cgroupImg.attr("alt").equals("아티스트 소개")) {
//														while (true) {
//															Elements cgroupdiv = gedocartcde.selectXpath("//*[@id=\"body-content\"]/div[" + r + "]/div[2]/div/div[" + t + "]");
//															Elements cgroupspan = gedocartcde.selectXpath("//*[@id=\"body-content\"]/div[" + r + "]/div[2]/div/div[" + t + "]/span");
//															if (cgroupdiv.size() > 0) {
//																if (cgroupdiv.text().length() > 4) {
//																	if ((cgroupdiv.text().substring(0, 2).equals("소속") || cgroupdiv.text().substring(0, 2).equals("그룹") || cgroupdiv.text().substring(0, 4).equals("소속그룹")) && !cgroupdiv.text().substring(0, 3).equals("소속사")) {
//																		at.setArtist_group(cgroupdiv.text().substring(cgroupdiv.text().lastIndexOf(":" + 1)));
//																		r++;
//																		break;
//																	} else if (cgroupspan.size() > 0) {
//																		if (cgroupspan.text().length() > 4) {
//																			if ((cgroupspan.text().substring(0, 2).equals("소속") || cgroupspan.text().substring(0, 2).equals("그룹") || cgroupspan.text().substring(0, 4).equals("소속그룹")) && !cgroupspan.text().substring(0, 3).equals("소속사")) {
//																				at.setArtist_group(cgroupspan.text().substring(cgroupspan.text().lastIndexOf(":" + 1)));
//																				r++;
//																				break;
//																			} else {
//																				t++;
//																			}
//																		} else {
//																			t++;
//																		}
//																	} else {
//																		t++;
//																	}		
//																} else {
//																	t++;
//																}
//															} else {
//																r++;
//																break;
//															}
//														}
//													} else {
//														r++;
//													}
//												} else {
//													break;
//												}
//											}
											int p = 1;
											String ccon = "";
											while (true) {
												Elements conImg = gedocartcde
														.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + p + "]/span[1]/img");
												Elements conspan = gedocartcde
														.selectXpath("//*[@id=\"body-content\"]/div[2]/div[2]/ul/li[" + p + "]/span[2]");
												// conImg가 존재하면
												if (conImg.size() > 0) {
													// conImg의 alt가 국적 이면
													if (conImg.attr("alt").equals("국적")) {
														ccon = conspan.text();
														break;
													// conImg의 text가 국적이 아니면
													} else {
														p++;
													}
												// conImg가 존재하지 않으면
												} else {
													break;
												}
											}
											at.setArtist_name(cname.text());
											at.setArtist_type(ctype);
											at.setArtist_profile(cpic.attr("src"));
											at.setArtist_nation(ccon);
											if(cname.text() != null && !cname.text().equals("")) {
												int insertA = service.insertA(at);
											}
										}
										n++;		
									} else {
										o++;
										break;
									}
								}
							} else {
								o++;
							}
						} else {
							break;
						}
					}
					String listscToString = listsc.toString().substring(1, listsc.toString().length() - 1);
					
					System.out.println("앨범명 : " + strsongalname);
					System.out.println("장르 : " + strsongtype);
					System.out.println("노래 제목 : " + strsongname);
					sd.setS_age_yn("N");
					if (strsongname.length() > 3) {
						if (strsongname.substring(0, 3).equals("19금")) {
							sd.setS_age_yn("Y");
						}
					}
					System.out.println("노래 가사 : " + strsongly);
					System.out.println("노래 가사1 : " + strsongly1);
					System.out.println("------------------------");
					System.out.println("노래 가사2 : " + strsongly2);
					System.out.println(strsongly.length());
					System.out.println(strsongly.getBytes().length);
					System.out.println("작사가 : " + listswToString);
					System.out.println("작곡가 : " + listscToString);
					
					sd.setA_name(strsongalname);
					sd.setG_name(strsongtype);
					sd.setS_name(strsongname);
					sd.setS_no(j);
					
					as.setS_name(strsongname);
					as.setA_name(strsongalname);
					as.setArtist_name(artname);
					
					int selectG = service.selectG(sd);
					if (selectG == 0) {
						int insertG = service.insertG(sd);
					}
					int insertS = service.insertS(sd);
					int insertSinger = service.insertSinger(as);
					
					for (String str : listsw) {
						System.out.print(str);
						as.setArtist_name(str);
						int selectA = service.selectA(str);
						if (selectA > 0) {
							int insertSoundWriter = service.insertSoundWriter(as);
						}
					}
					
					for (String str : listsc) {
						System.out.print(str);
						as.setArtist_name(str);
						int selectA = service.selectA(str);
						if (selectA >  0) {
							int insertSoundComposer = service.insertSoundComposer(as);	
						}
					}
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
