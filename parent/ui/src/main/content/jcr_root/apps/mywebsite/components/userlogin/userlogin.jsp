<%--

  login component.



--%><%
%><%@include file="/libs/foundation/global.jsp"%><%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@ page import="com.day.cq.personalization.UserPropertiesUtil, com.day.cq.i18n.I18n , javax.jcr.Node ,org.apache.sling.api.resource.ResourceResolver" %>
<%@ page import=" org.apache.sling.api.resource.Resource" %>


<%@ page import="javax.jcr.Session" %>
<%@ page import=" org.apache.jackrabbit.api.security.user.UserManager" %>
<%@ page import=" org.apache.jackrabbit.api.security.user.User" %>
<%@ page import=" org.apache.jackrabbit.api.security.user.Authorizable, com.day.cq.security.profile.Profile, com.day.cq.security.profile.ProfileManager" %>



<%
%><%@page session="false" %><%
%><%@taglib prefix="personalization" uri="http://www.day.com/taglibs/cq/personalization/1.0" %><%

%>


    <cq:include script="head.jsp"/>
    <cq:defineObjects />



        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

        <link rel="stylesheet" type="text/css" href="/apps/mywebsite/components/contentpage/mainLibs/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="/apps/mywebsite/components/contentpage/mainLibs/css/style.css">
        <script src="/apps/mywebsite/components/contentpage/mainLibs/js/bootstrap.js"></script>

        <!--link rel="stylesheet" href="http://dev.day.com/docs/en/cq/current/touch-ui/coral-ui/css/cui.css">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,400,800' rel='stylesheet' type='text/css'
<script src="http://dev.day.com/docs/en/cq/current/touch-ui/coral-ui/js/CUI.js"></script>
-->

	<link rel="stylesheet" href="/apps/mywebsite/components/userlogin/myClientLibs/user.css">

<cq:defineObjects />

        <script>
$( document ).ready(function() {
    //  alert("PAge Loading");
});
    </script>
   <script type="text/javascript">

       function logout() {
    			//alert("Hi");
    			CQ_Analytics.ProfileDataMgr.clear();
                CQ_Analytics.CCM.reset(); 
     			CQ.shared.Util.load();
    			}
   </script>



<cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext"/>
	 <div class="container">
        <div id="mainContainer">
            <cq:include script="header.jsp" />
      	<div class="mainCenterContainerNab">

            <div id="errormessage"></div>
            <div id="loginModule">
            <div class="componentSample noCode">


				<%
     			final boolean isAnonymous = UserPropertiesUtil.isAnonymous(slingRequest);
				if (!isAnonymous) {
    			%>
                <section class="well"><h4>You Are Already Logged In</h4></section>

                <script type="text/javascript">
                       function continueMe() {

                           <% String redirectTo =  currentPage.getAbsoluteParent(2).getPath();
		                    redirectTo += ".html"; 
	                    %>
                           var Url = '<%= redirectTo %>';

                           //  alert('<%= currentPage.getAbsoluteParent(2).getPath() %>');
          	 				CQ.shared.Util.load(Url);
    			}
                </script>

                <button class="primary" onclick="continueMe()">Continue</button>
                <button class="primary" onclick="logout()">Sign Out</button>

                <% } else { %>
                <div id="form_wrapper" class="form_wrapper">
                	<!-- We will add our forms here -->
					<form class="register">
						<h3>Register</h3>
						<div class="column">
							<div>
								<label>First Name:</label>
								<input type="text" id="regFirstname" name="regFirstname" />
							</div>
							<div>
								<label>Last Name:</label>
								<input type="text" id="regLastname" name="regLastname" />
							</div>
							<div>
								<label>Password:</label>
								<input type="password" id="regPassword" name="regPassword" />
							</div>
						</div>
						<div class="column">
							<div>
								<label>Username:</label>
								<input type="text" id="regUsername" name="regUsername"/>
							</div>
							<div>
								<label>Email:</label>
								<input type="text" id="regEmail" name="regEmail" />
							</div>
							<div>
								<label>Confirm Password:</label>
								<input type="password" id="regConpass" name="regConpass" />
							</div>
						</div>
						<div class="bottom">
							<div class="remember">

							</div>
							<input type="submit" value="Register >>"  class="buttonCTA orangeWhite" onclick="getRegister();"/>
							<a href="javascript:void(0);" rel="login" class="linkform">
								Have an account already? Log in here
							</a>
							<div class="clear"></div>
						</div>
					</form>
                    <form id="loginform" action="/bin/authenticate.html" method="POST" class="login active">
						<h3>Login</h3>
						<div>
							<label>Username:</label>
							<input type="text" id="email" name="email"/>
						</div>
						<div>
							<label>Password:
                                <a href="javascript:void(0);" rel="forgot_password" class="forgot linkform">
									Forgot your password?
								</a>
							</label>
							<input type="password" id="password" name="email"/>
						</div>
						<div class="bottom">
							<div class="remember"><input type="checkbox" />
								<span>Keep me logged in</span>
							</div>
                            <input type="submit" value="Login >>" onclick="authenticate()" class="buttonCTA orangeWhite" />
							<a href="javascript:void(0);" rel="register" class="linkform">
								Don't have an account yet? Register here
							</a>
							<div class="clear"></div>
						</div>
					</form>
					<form class="forgot_password">
						<h3>Forgot Password</h3>
						<div>
							<label>Username or Email:</label>
							<input type="text" />
						</div>
						<div class="bottom">
                            <input type="submit" value="Send reminder >>"  class="buttonCTA orangeWhite"/>
                            <a href="javascript:void(0);" rel="login" class="linkform" style="display:inline-block;">
								LogIn here
							</a>
                            |
							<a href="javascript:void(0);" rel="register" class="linkform" style="display:inline-block;">
								Register here
							</a>
							<div class="clear"></div>
						</div>
					</form>
                </div>

				<!--<section class="well"><h4>Enter Credentials</h4></section>
				<form id="loginform" action="/bin/authenticate.html" method="POST">
                    <section>
                        <table class="data" border="3">
                            <tbody>
                                <tr>
                                    <td><label for="email">User Name</label></td>
                                    <td><input type="text" id="email" name="email"/></td>
                                   <!-- ${component.name} -- >
                                </tr>
                                <tr>
                                    <td><label for="password">Password</label></td>
                                    <td><input type="password" id="password" name="email"/></td>
                                </tr>                    
                            <tbody>
                        </table>
                    </section>
                </form>
				<button class="primary buttonCTA orangeWhite" onclick="authenticate()" >Login >> </button>-->

                <% } %>




           			 </div>
                </div>
            </div>

            <cq:include script="footer.jsp"/>
        </div>
        <script language="javascript">
					//the form wrapper (includes all forms)
			var $form_wrapper   = $('#form_wrapper'),
			 
			//the current form is the one with class "active"
			$currentForm    = $form_wrapper.children('form.active'),
				 
			//the switch form links
			$linkform       = $form_wrapper.find('.linkform');
			
			$form_wrapper.children('form').each(function(i){
    var $theForm    = $(this);
    //solve the inline display none problem when using fadeIn/fadeOut
    if(!$theForm.hasClass('active'))
        $theForm.hide();
    $theForm.data({
        width   : $theForm.width(),
        height  : $theForm.height()
    });
});
setWrapperWidth();

$linkform.bind('click',function(e){
    var $link   = $(this);
    var target  = $link.attr('rel');
    $currentForm.fadeOut(400,function(){
        //remove class "active" from current form
        $currentForm.removeClass('active');
        //new current form
        $currentForm= $form_wrapper.children('form.'+target);
        //animate the wrapper
        $form_wrapper.stop()
                     .animate({
                        width   : $currentForm.data('width') + 'px',
                        height  : $currentForm.data('height') + 'px'
                     },500,function(){
                        //new form gets class "active"
                        $currentForm.addClass('active');
                        //show the new form
                        $currentForm.fadeIn(400);
                     });
    });
    e.preventDefault();
});

function setWrapperWidth(){
    $form_wrapper.css({
        width   : $currentForm.data('width') + 'px',
        height  : $currentForm.data('height') + 'px'
    });
}

$form_wrapper.find('input[type="submit"]')
             .click(function(e){
                e.preventDefault();
             }); 
            function getRegister(){
               $.ajax({
                   url: "/bin/poc/registration",
                type: "POST",
                data: { regFirstname : $('#regFirstname').val(),regLastname : $('#regLastname').val(),regPassword : $('#regPassword').val(),regUsername : $('#regUsername').val(),regEmail : $('#regEmail').val()},
                dataType: "html"
                }).done(function(response){alert(response);});
            }

			 /******jogin js *******/
        function authenticate(){

        var u = document.getElementById("email").value;
     	var loaded = CQ_Analytics.ProfileDataMgr.loadProfile(u);

		<% I18n i18n = new I18n(slingRequest); %>

		if (loaded) {
					 CQ.shared.Util.load();
							}
             else {
                        alert("<%=i18n.get("The user could not be found.")%>");
                    }



            /*  $("#loginform").submit(function(e)
            {
                var postData = $(this).serializeArray();
                var formURL = $(this).attr("action");
                $.ajax(
                {
                    url : formURL,
                    type: "POST",
                    data : postData,
                    error:function(data, textStatus, jqXHR) 
                    {
                       document.getElementById("errormessage").innerHTML = "Authentication Failed";
                    },
                    success:function(data, textStatus, jqXHR)
                    {
                        if("success" == textStatus){
                            window.location.href = '<%=properties.get("./targetPage",String.class)%>';
                        }else{
							document.getElementById("errormessage").innerHTML = "Authentication Failed";
                        }
                    }

                });
                e.preventDefault(); //STOP default action
                //e.unbind(); //unbind. to stop multiple form submit.
            });

            $("#loginform").submit();
			*/

        }
		</script>
</div>

<style>footer{float:left;}#mainContainer{border-bottom:1px solid #fff;}</style>