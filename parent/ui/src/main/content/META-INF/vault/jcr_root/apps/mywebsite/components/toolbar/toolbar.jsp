<%@page session="false"%><%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Toolbar component

  Draws a toolbar of links

--%><%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="java.util.Iterator,
                   com.day.cq.wcm.api.PageFilter" %><%

    // get starting point of toolbar
    Page toolbarParentPage = currentPage.getAbsoluteParent(currentStyle.get("absParent", 1));
    String toolbarParent = toolbarParentPage != null ? toolbarParentPage.getPath() : "";




    // if not deep enough or no "/toolbar" skip
    if (!toolbarParent.equals("")) {
        String toolbarPath = toolbarParent + "/toolbar";
        Resource rootRes = slingRequest.getResourceResolver().getResource(toolbarPath);
        Page rootPage = rootRes == null ? null : rootRes.adaptTo(Page.class);
        if (rootPage != null) {

                %><ul><%

            Iterator<Page> iter = rootPage.listChildren(new PageFilter(request));
            boolean first = true;
            while (iter.hasNext()) {
                Page child = iter.next();

                     %><li>
						<a href="<%= child.getPath() %>.html"><%=child.getTitle() %></a>

                    </li><%

            }

                %></ul><%

        }
	}
%>