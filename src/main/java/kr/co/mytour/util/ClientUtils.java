package kr.co.mytour.util;

import javax.servlet.http.HttpServletRequest;

public class ClientUtils {
	public static String getRemoteIP(HttpServletRequest request) {
        String ip = request.getHeader("X-FORWARDED-FOR"); 
        
        //proxy �솚寃쎌씪 寃쎌슦
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        //�쎒濡쒖쭅 �꽌踰꾩씪 寃쎌슦
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr() ;
        }
        
        return ip;
   }
}
