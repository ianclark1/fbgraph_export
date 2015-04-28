<!--- 
This is an example of how to login to a website via javascript.  It will automatically
refresh the page after a successful login so that you can access the user's
facebook data wiithout having to refresh the page.

Jeff Gladnick
facebookgraph.riaforge.org
9/13/2010
--->

<!--- FILL THIS IN WITH YOUR SETTINGS FROM YOUR FACEBOOK APPLICATION --->

<cfset appID = ""/>
<cfset api_key = ""/>
<cfset secret_key = ""/>

<!--- create a connection to the fb graph cfc --->
<cfset graphCFC = createObject("component", "fbgraph").init(appID, api_key, secret_key) />

<html>
<head>
	<title>test3</title>
</head>

  <body>
  <cfoutput>
    <!--- Your FB application IDS --->

    <!--- Facebook login/logout button --->
<!--- 

    <p><fb:login-button perms="email,user_birthday" autologoutlink="true"></fb:login-button></p>
 --->

<a href="javascript:login();">Login</a>

    <!--- Facebook login/logout button that publishes to your wall--->
<!---     <p><fb:like></fb:like></p> --->
    <!--- Facebook script that connects your site to facebook and creates the needed cookies after authentication --->
    <div id="fb-root"></div>
    <script>
      window.fbAsyncInit = function() {
        FB.init({appId: '#appID#', status: true, cookie: true,
                 xfbml: true});

/*
      FB.login(function(response) {
		  if (response.session) {
				alert('it worked, do something');
		  } else {
				alert('cancelled');
		  }
	});
*/
      };
      (function() {
        var e = document.createElement('script');
        e.type = 'text/javascript';
        e.src = document.location.protocol +
          '//connect.facebook.net/en_GB/all.js';
        e.async = true;
        document.getElementById('fb-root').appendChild(e);

      }());


	function login(){
		FB.login(function(response) {
			  if (response.session) {
					window.location.reload();
			  } else {
					alert('cancelled');
			  }
		});
	}      

      
      
    </script>
    <!--- End Facebook script that connects your site to facebook and creates the needed cookies after authentication. Now a cookie is created with a name that starts with fbs_ApplicationID --->




    <cfset uid=graphCFC.getUID()>
	<cfdump var="#uid#" label="uid">
	
    <cfset access_token=graphCFC.getAccessToken()>
	<cfdump var="#access_token#" label="access_token">

<cfdump var="#cookie#" label="cookie">

<cfdump var="#graphCFC.getProfile()#">
<!--- 
	
<cfdump var="#graphCFC.getFriends()#">
<cfdump var="#graphCFC.getLikes()#">
<cfdump var="#graphCFC.getMovies()#">
<cfdump var="#graphCFC.getWall()#">
<cfdump var="#graphCFC.getNewsFeed()#">

<cfdump var="#graphCFC.getBooks()#">
<cfdump var="#graphCFC.getNotes()#">
<cfdump var="#graphCFC.getPhotoTags()#">
<cfdump var="#graphCFC.getPhotoAlbums()#">
<cfdump var="#graphCFC.getVideos()#">
<cfdump var="#graphCFC.getEvents()#">
<cfdump var="#graphCFC.getGroups()#">
 --->

</cfoutput>
  </body> 
</html>



