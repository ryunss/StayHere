package common;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class C {
   public static final String REDIRECT_ATTR_NAME = "REDIRECT_ATTR";
   public static void addRedirectAttribute(HttpServletRequest request, String name, Object value) {
      if(request == null || name == null || value == null) return;
      
      HttpSession session = request.getSession();
      
      HashMap<String, Object> redirectAttr = (HashMap<String, Object>)session.getAttribute(REDIRECT_ATTR_NAME);
      if(redirectAttr == null) {
         redirectAttr = new HashMap<String, Object>();
         session.setAttribute(REDIRECT_ATTR_NAME, redirectAttr);
      }
      
      redirectAttr.put(name, value);
   } // end addRedirectAttribute()
   
   public static void retrieveRedirectAttribute(HttpServletRequest request) {
      if(request == null) return;
      HttpSession session = request.getSession();
      
      HashMap<String, Object> redirectAttr = (HashMap<String, Object>)session.getAttribute(REDIRECT_ATTR_NAME);
      
      if(redirectAttr == null) return;
      
      request.setAttribute(REDIRECT_ATTR_NAME, redirectAttr);
      
      session.removeAttribute(REDIRECT_ATTR_NAME);
   }
}// end class