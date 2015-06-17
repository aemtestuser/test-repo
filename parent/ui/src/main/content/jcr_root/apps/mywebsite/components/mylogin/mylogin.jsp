<%@include file="/libs/foundation/global.jsp"%>
<%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n,com.day.cq.personalization.UserPropertiesUtil"%>
<%@page import="com.adobe.granite.security.user.UserProperties"%>
<%


// Get an array of Cookies associated with this domain
   String loggedUserName="";
   String loggedName="";
   Cookie cookie = null;
   Cookie[] cookies = null;
   cookies = request.getCookies();
   if( cookies != null ){
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];
         if (cookie.getName().equals("userName")) {
             //out.print(cookie.getName()+" : " + cookie.getValue( ));
             //out.print("userName : " + cookie.getValue( ));
             loggedUserName = cookie.getValue();
             //out.print("userName : " + loggedUserName);
         }
      }
  }

//out.print("Welcome " + loggedUserName);

    if(loggedUserName == null || loggedUserName.equals("")) {
        final Locale pageLocale = currentPage.getLanguage(false);
		final ResourceBundle resourceBundle = slingRequest.getResourceBundle(pageLocale);
		I18n i18n = new I18n(resourceBundle);




	String test = i18n.get("Login / Register") ;
		final boolean isAnonymous = UserPropertiesUtil.isAnonymous(slingRequest);
		if(isAnonymous)
        {
            String curLoc=request.getRequestURL().toString();
			String lang="en_GB";
            if	(curLoc.indexOf("en_IE") > -1)
            {	lang="en_IE";	}

            else if	(curLoc.indexOf("fr_FR") > -1)
            {	lang="fr_FR";	}
    
            else if	(curLoc.indexOf("fr_BE") > -1)
            {	lang="fr_BE";	}
    
            else if	(curLoc.indexOf("de_DE") > -1)
            {	lang="de_DE";	}
    
            else if	(curLoc.indexOf("de_AT") > -1)
            {	lang="de_AT";	}

            out.print("<a href=\"/content/DessPoc/"+lang+"/login.html\" style=\"float:right;\">"+test+"</a>"); 
         }
         else{

            final UserProperties userProperties = slingRequest.adaptTo(UserProperties.class);
			out.print("<span  style=\"float:left;padding: 10px 0;color: white;\">Welcome, </span>"); 
            out.print("<a href=\"/content/DessPoc/en/login.html\" style=\"float:right;\"><b>"+userProperties.getDisplayName()+"</b></a>"); 
            //out.print("<b>"+userProperties.getDisplayName()+"</b>"); 
        }

	}
	else {
        out.print("Welcome " + loggedUserName);
	}

%>
