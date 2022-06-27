package kh.spring.pisic.common;

import org.springframework.stereotype.Component;

@Component
public class PisicUtil {
	
	public static String substringByBytes1(String str, int beginBytes, int endBytes) {
	    if (str == null || str.length() == 0) {
	        return "";
	    }

	    if (beginBytes < 0) {
	        beginBytes = 0;
	    }

	    if (endBytes < 1) {
	        return "";
	    }

	    int len = str.length();

	    int beginIndex = -1;
	    int endIndex = 0;

	    int curBytes = 0;
	    String ch = null;
	    for (int i = 0; i < len; i++) {
	        ch = str.substring(i, i + 1);
	        curBytes += ch.getBytes().length;

	        if (beginIndex == -1 && curBytes >= beginBytes) {
	            beginIndex = i;
	        }

	        if (curBytes > endBytes) {
	            break;
	        } else {
	            endIndex = i + 1;
	        }
	    }
	    return str.substring(beginIndex, endIndex);
	}
	
	public static String substringByBytes2(String str, int cutlen) {
		if (!str.isEmpty()) {
			str = str.trim();
			if (str.getBytes().length <= cutlen)  {
				return str;
			} else {
				StringBuffer sbStr = new StringBuffer(cutlen);
				int nCnt = 0;
				for (char ch : str.toCharArray()) {
					nCnt += String.valueOf(ch).getBytes().length;
					if (nCnt > cutlen) {
						break;
					}
					sbStr.append(ch);
				}
				return sbStr.toString();
			}
		} else {
			return "";
		}
	}
	
	public static boolean isExistData(Object obj) {
		if(obj == null)
			return false;
		if(obj.equals(""))
			return false;
		return true;
	}
}
