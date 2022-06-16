package kh.spring.pisic.weather.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Region {
	// 입력한 지역의 행정 코드 찾는 메서드(카카오 api 사용)
	public JSONObject lookUpRegion(String city, String gu) throws Exception {
		String address = city + " " + gu + " " ;
		// 주소안에 띄어쓰기때문에 400에러가 나는것을 해결
		try {
			address = URLEncoder.encode(address, "UTF-8");
			String url = "https://dapi.kakao.com/v2/local/search/address.json?query=" + address;
			String jsonString = new String();
			String line;
			
			URL Url = new URL(url);
			
			HttpsURLConnection conn = (HttpsURLConnection) Url.openConnection();
			String auth = "KakaoAK " + "47376b419ee56700e9a580b50b27b1bc";
			conn.setRequestMethod("GET");
			conn.setRequestProperty("X-Requested-With", "curl");
			conn.setRequestProperty("Authorization", auth);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			while ((line = br.readLine()) != null) {
				jsonString += line;
			}
			JSONParser paser = new JSONParser();
			
			JSONObject J = (JSONObject) paser.parse(jsonString);
			JSONObject meta = (JSONObject) J.get("meta");
			
			JSONArray data = (JSONArray) J.get("documents");
			long size = (Long) meta.get("total_count");
			
			System.out.println("size:: "+size);
			System.out.println("data: "+data.toJSONString());
			
			if (size > 0) {
				JSONObject jsonX = (JSONObject) data.get(0);
				JSONObject jsonAddress = (JSONObject) jsonX.get("address");
				
				return getGridXY(jsonAddress.get("h_code").toString());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// 행정구역코드로 기상청 격자좌표 구하는 메서드
	public JSONObject getGridXY(String hCode) {
		System.out.println("행정코드: " + hCode);

		String code = hCode.substring(0, 5); // 격자 좌표가 행정코드 맨 앞부터 5자리까지만 이용하여 조회됨.

		try {
			JSONObject resultObj = new JSONObject();
			URL url = new URL("http://www.kma.go.kr/DFSROOT/POINT/DATA/leaf." + code + ".json.txt");
			URLConnection conn = url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String result = br.readLine().toString();
			br.close();

			JSONParser parser = new JSONParser();
			JSONArray jarr = (JSONArray) parser.parse(result);
			
			System.out.println(jarr.toJSONString());
			
			for (int i = 0; i < jarr.size(); i++) {
				resultObj = (JSONObject) jarr.get(i);
				if (resultObj.get("code").equals(hCode)) {
					String x = (String) resultObj.get("x");
					String y = (String) resultObj.get("y");
					System.out.println("x값 : " + x + ", y값 :" + y);
					break;
				}
			}
			return resultObj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
