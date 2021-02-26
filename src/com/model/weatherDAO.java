package com.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class weatherDAO {

	public static ArrayList<String> mise() {
		// 미세먼지 경보 정보 조회 서비스 - 한국환경공단 api 서비스

		ArrayList<String> miselist = new ArrayList();

		StringBuffer sb1 = null;
		try {
			// 인증키
			String serviceKey = "41exlFGitZU3xRpfc4vMNZpHK1ymsZFqeTSeoSFFzVJ1FBrVdlf8wqY%2FKpz0TMR6%2BSxSTCMDaysaPWPIvqAl7w%3D%3D";

			String urlStr = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst";
			urlStr += "?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey;
			urlStr += "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=1";
			urlStr += "&" + URLEncoder.encode("pageNo", "UTF-8") + "=1";
			urlStr += "&" + URLEncoder.encode("itemCode", "UTF-8") + "=PM10";
			urlStr += "&" + URLEncoder.encode("dataGubun", "UTF-8") + "=HOUR";
			urlStr += "&" + URLEncoder.encode("searchCondition", "UTF-8") + "=WEEK";
			urlStr += "&" + URLEncoder.encode("_returnType", "UTF-8") + "=json";

			URL url = new URL(urlStr);

			String line = "";
			String result = "";

			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			while ((line = br.readLine()) != null) {
				result = result.concat(line);
				// System.out.println(line);
			}
			// System.out.println(result);

			// JSON parser 만들어 문자열 데이터를 객체화한다.
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);

			System.out.println("result mise " + result);
			// list 아래가 배열형태로
			// {"list" : [ {"returnType":"json","clearDate":"--",.......} ]
			JSONArray parse_listArr = (JSONArray) obj.get("list");

			// 객체형태로
			// {"returnType":"json","clearDate":"--",.......},...
			for (int i = 0; i < parse_listArr.size(); i++) {
				JSONObject weather = (JSONObject) parse_listArr.get(i);

				String dataTime = (String) weather.get("dataTime"); // 발령시간
				String gyeongbuk = (String) weather.get("gyeongbuk");
				String gyeonggi = (String) weather.get("gyeonggi");
				String gyeongnam = (String) weather.get("gyeongnam");
				String jeonbuk = (String) weather.get("jeonbuk");
				String jeonnam = (String) weather.get("jeonnam");

				String busan = (String) weather.get("busan");
				String seoul = (String) weather.get("seoul");
				String daegu = (String) weather.get("daegu");
				String daejeon = (String) weather.get("daejeon");
				String gwangju = (String) weather.get("gwangju");
				String jeju = (String) weather.get("jeju");

				// 어레이리스트에 담아주자.
				miselist.add(dataTime);
				miselist.add(gyeongbuk);
				miselist.add(gyeonggi);
				miselist.add(gyeongnam);
				miselist.add(jeonbuk);
				miselist.add(jeonnam);
				miselist.add(busan);
				miselist.add(seoul);
				miselist.add(daegu);
				miselist.add(daejeon);
				miselist.add(gwangju);
				miselist.add(jeju);

				// sb1 = new StringBuffer();
				// sb1.append("시간 : " + dataTime + " 경기:" + gyeonggi + " 경북:" + gyeongbuk + "
				// 경남:" + gyeongnam + " 전북:" + jeonbuk + " 전남:" + jeonnam +" 서울:" + seoul +" 부산
				// :" + busan + " 광주 :"+ gwangju + " 대구:" + daegu + " 대전:" + daejeon + " 제주:" +
				// jeju);

				// System.out.println(sb1.toString());

			}
			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println(miselist);
		return miselist;

	}

	public static ArrayList<String> uvtoday() {
		// 미세먼지 경보 정보 조회 서비스 - 한국환경공단 api 서비스

		ArrayList<String> uvlist = new ArrayList();

		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHH");

		Date time = new Date();

		String today = format1.format(time);

		StringBuffer sb1 = null;

		try {
			// 인증키

			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1360000/LivingWthrIdxService01/getUVIdx"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
					+ "=41exlFGitZU3xRpfc4vMNZpHK1ymsZFqeTSeoSFFzVJ1FBrVdlf8wqY%2FKpz0TMR6%2BSxSTCMDaysaPWPIvqAl7w%3D%3D"); /*
																															 * Service
																															 * Key
																															 */
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "="
					+ URLEncoder.encode("-", "UTF-8")); /* 공공데이터포털에서 받은 인증키 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
					+ URLEncoder.encode("json", "UTF-8")); /* 요청자료형식(XML/JSON) Default: XML */
			urlBuilder.append("&" + URLEncoder.encode("areaNo", "UTF-8") + "="
					+ URLEncoder.encode("1100000000", "UTF-8")); /* 서울지점 (공백일떄: 전체지점조회) */
			urlBuilder.append("&" + URLEncoder.encode("time", "UTF-8") + "="
					+ URLEncoder.encode(today, "UTF-8")); /* 2017년 6월 8일 6시 발표 */

			URL url = new URL(urlBuilder.toString());

			String line = "";
			String result = "";

			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			while ((line = br.readLine()) != null) {
				result = result.concat(line);
				// System.out.println(line);
			}

			// JSON parser 만들어 문자열 데이터를 객체화한다.
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);

			System.out.println("result uv " + result);

			JSONObject parse_listArr1 = (JSONObject) obj.get("response");
			System.out.println("parse_listArr " + parse_listArr1);

			JSONObject parse_listArr2 = (JSONObject) parse_listArr1.get("body");
			System.out.println("parse_listArr2 " + parse_listArr2);

			JSONObject parse_listArr3 = (JSONObject) parse_listArr2.get("items");
			System.out.println("parse_listArr3" + parse_listArr3);

			JSONArray parse_listArr = (JSONArray) parse_listArr3.get("item");
			System.out.println("parse_listArr" + parse_listArr);

			// 객체형태로
			for (int i = 0; i < parse_listArr.size(); i++) {
				JSONObject uv = (JSONObject) parse_listArr.get(i);

				String uvdate = (String) uv.get("date");
				String areano = (String) uv.get("areaNo");
				String uvtoday = (String) uv.get("today");
				String uvtomorrow = (String) uv.get("tomorrow");
				String uvtheDayAfterTomorrow = (String) uv.get("theDayAfterTomorrow");

				// uvlist 정보 순서 시간, 장소, 오늘uv, 내일uv, 모레uv
				// 어레이리스트에 담아주자.
				uvlist.add(uvdate);
				uvlist.add(areano);
				uvlist.add(uvtoday);
				uvlist.add(uvtomorrow);
				uvlist.add(uvtheDayAfterTomorrow);

			}
			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println(miselist);
		return uvlist;

	}
}