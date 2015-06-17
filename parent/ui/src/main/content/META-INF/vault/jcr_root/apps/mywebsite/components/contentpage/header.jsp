<%@include file="/libs/foundation/global.jsp"%>

<header id="myHeader">
<cq:include path="logo" resourceType="mywebsite/components/logo" />
    <div style="float:right;">
<!-- new -->
<div style="float:right;">

        	<cq:include path="tagText" resourceType="mywebsite/components/mylogin"/>


        </div>


    <!-- control -->
		<div class="languageii-wrapper" style="float:right;">				
				<div class="languageii-js-wrapper" id="languageii-js-wrapper">
					<div class="languageii-header" id="languageii-header">
						<span class="languageii-header-name" tabindex="0" role="button">English (GB)</span>
                        <span class="language-arrow-up" style="display:none;">&#x25B4;</span><span class="language-arrow-down">&#x25BE;</span>
						<img class="languageii-header-flag" src="/etc/designs/mywebsite/images/Flag_of_the_United_Kingdom_W22H13px.ashx" alt="Flag of the United Kingdom">
					</div>
					<div class="languageii-dropdown-wrapper">
						<div class="languageii-dropdown" id="languageii-dropdown" style="display:none">
							<div class="languageii-countries" style="width:150px">
								<ul class="languageii-column" style="width:150px">				
									<li class="languageii-option opt1">
										<a href="#" class="languageii-link">
											<img class="languageii-flag flag1" src="/etc/designs/mywebsite/images/Flag_of_Ireland_W22H13px.ashx" alt="Flag of Ireland">
											<span class="languageii-name lang1">Irish (Ireland)</span>
										</a>
									</li>
									<li class="languageii-option opt2">
										<a href="#" class="languageii-link">
											<img class="languageii-flag flag2" src="/etc/designs/mywebsite/images/Flag_of_France_W22H13px.ashx" alt="Flag of France">
											<span class="languageii-name lang2">Fran&#231;ais (France)</span>
										</a>
									</li>
									<li class="languageii-option opt3">
										<a href="#" class="languageii-link">
											<img class="languageii-flag flag3" src="/etc/designs/mywebsite/images/Flag_of_Belgium_W22H13px.ashx" alt="Flag of France">
											<span class="languageii-name lang3">Fran&#231;ais (Belgium)</span>
										</a>
									</li>
                                    <li class="languageii-option opt4">
										<a href="#" class="languageii-link">
											<img class="languageii-flag flag4" src="/etc/designs/mywebsite/images/Flag_of_Germany_W22H13px.ashx" alt="Flag of Germany">
											<span class="languageii-name lang4">Deutsch (Germany)</span>
										</a>
									</li>
                                    <li class="languageii-option opt5">
										<a href="#" class="languageii-link">
											<img class="languageii-flag flag5" src="/etc/designs/mywebsite/images/Flag_of_Austria_W22H13px.ashx" alt="Flag of Germany">
											<span class="languageii-name lang5">Deutsch (Austria)</span>
										</a>
									</li>
								</ul>
								<div class="clear"></div>
							</div>
							<div class="languageii-close">
								<span class="languageii-close-link" id="languageii-close-link" tabindex="0" role="button">X Close</span>
							</div>
						</div>
					</div>
				</div>
			</div>
    <!-- /control -->


        </div>
    <div style="clear:both;"></div>
</header>
<cq:include path="topnav" resourceType="mywebsite/components/topnav" />

   <%-- 
    <cq:include path="tagText" resourceType="foundation/components/iparsys"/>
 <cq:include path="header" resourceType="foundation/components/iparsys"/>--%>

