<%--

  register component.



--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %> <%
%>

<!--link rel="stylesheet" href="http://dev.day.com/docs/en/cq/current/touch-ui/coral-ui/css/cui.css" --> 
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="http://dev.day.com/docs/en/cq/current/touch-ui/coral-ui/js/CUI.js"></script>

<section class="well"><h4>Enter Details For Registration</h4></section>
<div id="errormessage"></div>

<div class="componentSample noCode">

<form action="/bin/poc/registration.html" method="POST" id="registrationform" enctype="multipart/form-data">

    <section>
        <table class="data" border="3">
            <tbody>
                <tr>
                    <td><label for="salutation">Salutation</label></td>
                    <td><input type="text" id="salutation"/></td>
                </tr>
                <tr>
                    <td><label for="firstname">FirstName</label></td>
                    <td><input type="text" id="firstname"/></td>
                </tr>
                <tr>
                    <td><label for="lastname">LastName</label>
                    <td><input type="text" id="lastname"/></td>
                </tr>    
                <tr>
                    <td><label for="">Gender</label></td>
                    <td>
                        <div class="selector">
                            <input type="radio" name="gender"><span>Male</span>
                            <input type="radio" name="gender"><span>Female</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="currentcity">Current City</label></td>
                    <td><input type="text" id="currentcity"/></td>
    
                </tr>
                <tr>
                    <td><label for="topcity">Top City</label></td>
                    <td><input type="text" id="topcity"/></td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td><input type="email" id="email"/></td>
                </tr>
                <tr>
                    <td><label for="password">Password</label></td>
                    <td><input type="password" id="password"/></td>
                </tr>
                <tr>
                    <td><label for="contactnumber">Contact Number</label></td>
                    <td><input type="tel" id="contactnumber"/></td>
                </tr>
                <tr>
                    <td><label for="">OK To Contact?</label></td>
                    <td>
                        <div class="selector">
                            <input type="radio" name="oktocontact"><span>Yes</span>
                            <input type="radio" name="oktocontact"><span>No</span>
                        </div>
                    </td>
                </tr>
            <tbody>
        </table>
    </section>
</form>
<button class="primary" onclick="register()">Register</button>
</div>
<script language="javascript">
    function register(){

        	$("#registrationform").submit(function(e)
            {
                 var email= $('#email').val() ;
                var postData = $(this).serializeArray();
                var formURL =  $(this).attr("action");
                $.ajax(
                {
                    url : '/bin/poc/registration',
                    type: "POST",
                    data : 'email='+ email,
                    error:function(data, textStatus, jqXHR) 
                    {
                       document.getElementById("errormessage").innerHTML = "Registration now Failed";
                    },

                    /*
                    success:function(data, textStatus, jqXHR){
						 if("success" == textStatus){
                            window.location.href = '<%=properties.get("./targetPage",String.class)%>';
                        }else{
							document.getElementById("errormessage").innerHTML = "Registration Failed";
                        }
                        } */

                    success: function(msg){
					alert(msg);
                    }

                });
                e.preventDefault(); //STOP default action
                //e.unbind(); //unbind. to stop multiple form submit.
            });

            $("#registrationform").submit();

    }
</script>