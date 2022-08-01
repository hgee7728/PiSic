package kh.spring.pisic.membership.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Service
public class SubPayService {

private RestTemplate restTemplate;
	
	@Autowired
	private ImportService importService;
	
	public String SubRePay(
			String customer_uid
			, String price
			, String merchant_uid
			, Authentication auth) {
		// 현재 사용자 id
		UserDetails ud = (UserDetails)auth.getPrincipal();
		String uid = ud.getUsername();
		
		String token = importService.getToken();
		String access_token;
		token = token.substring(token.lastIndexOf("access_token"),token.lastIndexOf("now"));
		access_token = token.substring(token.lastIndexOf(":") + 2,token.lastIndexOf(",") - 1); 
		System.out.println(access_token);
		restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setBearerAuth(access_token);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("merchant_uid", uid + new Date().getTime());
		map.put("customer_uid", customer_uid);
		map.put("amount", price);
		map.put("name", uid);

		Gson var = new Gson();
		String json = var.toJson(map);
		System.out.println(json);
		HttpEntity<String> entity = new HttpEntity<String>(json, headers);
		
		return restTemplate.postForObject("https://api.iamport.kr/subscribe/payments/again", entity, String.class);
		
	}
	
	public String SubPaySchedule(
			String customer_uid
			, String price
			, String merchant_uid
			, Authentication auth) {
		// 현재 사용자 id
		UserDetails ud = (UserDetails)auth.getPrincipal();
		String uid = ud.getUsername();
		
		long timestamp = 0;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd", Locale.KOREA);
		cal.add(Calendar.MINUTE, + 1);
		String date = sdf.format(cal.getTime());
		try {
			Date stp = sdf.parse(date);
			timestamp = stp.getTime()/1000;
			System.out.println(timestamp);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String token = importService.getToken();
		String access_token;
		System.out.println("토큰: " + token);
		token = token.substring(token.lastIndexOf("access_token"), token.lastIndexOf("now"));
		access_token = token.substring(token.lastIndexOf(":") + 2, token.lastIndexOf(",") - 1); 
		System.out.println("엑세스토큰: " + access_token);

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setBearerAuth(access_token);

		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("merchant_uid", uid + new Date().getTime());
		jsonObject.addProperty("schedule_at", timestamp);
		jsonObject.addProperty("amount", Integer.parseInt(price));
		jsonObject.addProperty("currency", "KRW");
		
		JsonArray jsonArr = new JsonArray();
		
		jsonArr.add(jsonObject); JsonObject reqJson = new JsonObject();
		reqJson.addProperty("customer_uid", customer_uid); 
		reqJson.add("schedules", jsonArr);
		
		// Map<String, Object> map = new HashMap<String, Object>();
		// map.put("customer_uid", customer_uid);
		// map.put("merchant_uid", (String)session.getAttribute("userId")+new Date().getTime());
		// map.put("amount", Integer.parseInt(price));
		// map.put("schedule_at", timestamp);

		Gson var = new Gson();
		String json = var.toJson(reqJson);
		System.out.println(json);
		HttpEntity<String> entity = new HttpEntity<String>(json, headers);
		
		return restTemplate.postForObject("https://api.iamport.kr/subscribe/payments/schedule", entity, String.class);
		
	}
}
