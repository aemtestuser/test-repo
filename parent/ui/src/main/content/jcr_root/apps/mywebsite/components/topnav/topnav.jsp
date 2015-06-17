<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="java.util.Iterator,
        com.day.text.Text, 
        com.day.cq.wcm.api.PageFilter, com.day.cq.wcm.api.Page" %>
            <%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n"%>


<cq:setContentBundle/>
<%

final Locale pageLocale = currentPage.getLanguage(false);
final ResourceBundle resourceBundle = slingRequest.getResourceBundle(pageLocale);
I18n i18n = new I18n(resourceBundle);



    /* get starting point of navigation */
            Page navRootPage= currentPage.getAbsoluteParent(1); 

            if(currentPage.getPath().contains("DessPoc")){

                if(currentPage.getPath().contains("en_GB")){
                    navRootPage =  pageManager.getPage("/content/DessPoc/en_GB");
                }
                else if(currentPage.getPath().contains("en_IE")){
                    navRootPage =  pageManager.getPage("/content/DessPoc/en_IE");
                }
               else if(currentPage.getPath().contains("fr_FR")){
                    navRootPage =  pageManager.getPage("/content/DessPoc/fr_FR");
                }
                else if(currentPage.getPath().contains("fr_BE")){
                    navRootPage =  pageManager.getPage("/content/DessPoc/fr_BE");
                }
                else if(currentPage.getPath().contains("de_DE")){
                    navRootPage =  pageManager.getPage("/content/DessPoc/de_DE");
                }
                else if(currentPage.getPath().contains("de_AT")){
                    navRootPage =  pageManager.getPage("/content/DessPoc/de_AT");
                    }
                else{
				navRootPage =  pageManager.getPage("/content/DessPoc/en_GB");
                }

                //out.print("New Website");
        }else{
                navRootPage= currentPage.getAbsoluteParent(1); 
                //out.print("Old Website");
        }



    if (navRootPage == null && currentPage != null) { 
    navRootPage = currentPage; 
    }
	%>
    	<li><a href="<%= navRootPage.getPath() %>.html"><%= i18n.get("Home")%></a></li>
    <%
    if (navRootPage != null) { 
        Iterator<Page> children = navRootPage.listChildren(new PageFilter(request));
        while (children.hasNext()) { 
            Page child = children.next(); 
            if(!child.isHideInNav()) {
            %> 
    			<li><a href="<%= child.getPath() %>.html"><%=  i18n.get(child.getTitle()) %></a></li>
    		<%
            } }
    } 
%></ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



