#!/usr/local/bin/perl

# The above statement must be the first statement and it tells the 
# server where to find the perl interpreter so that the script can run
# (NOTE: this statement is machine dependent) 


do  "cgi-lib.pl" ||die "Fatal Error: Can't load cgi library";

# The above statement calls subroutines in the cgi-lib.pl library, 
# which are needed to run a perl program
# If cgi-lib.pl fails to load, then an error message is printed 


&ReadParse;

# The above line reads the stream of name=value pairs from the form
# and puts the values in a perl table called  in


print "Content-type: text/html\n\n";

# The above line indicates the Mime type of the information
# that the script is sending back to the browser thru the Web server
# In perl, a \n is a "carriage return, next line"
# \n\n is required here



# The next line says to output the following information, until the
# the statement    _END_   is reached

print<<"_END_";


<html>

<head>
<title>Feedback Form</title>

<meta http-equiv="Page-Enter"
 content="RevealTrans(Duration=3.000,Transition=2)">

<link rel="stylesheet"  href="homework/vCSS.css" type="text/css" />
 
<style>

body {font-family: comic sans ms; background-color: #8f0052; background-image: url(images/z_city.jpg)}

#content
{
	width:600px;
	text-align:center;
	background-color: #f5f5dc;
	font-family: Georgia, serif;
	box-shadow: 10px 10px 5px #888888; 
}

a:hover {color: purple; background-color: yellow;}

</style>

</head>

<body>

<div id="content">


<h2>Thanks, <span style="color: #990000;">$in{'name'}</span>, for completing the form!</h2>

<!-- The above line substitutes the value associated with the name 'name' from the form, that was entered by the user-->

<form action="emailz.pl" method="Post">

<!-- obtain user's name -->
<input type="hidden" value="$in{'name'}" name="name">  

<p>Your email address is  <span style="color: #990000">$in{'email'}</span></p>

<!-- The above line substitutes the value associated with the name 'email'  from the form, that was entered by the user-->

<!-- obtain user's email -->
<input type="hidden" value="$in{'email'}" name="email"> 

<p>You indicated that you are a fan of <span style="color: #990000">$in{'tv_vs_comic'}</span></p>

<!-- The above line substitutes the value associated with name 'tv_vs_comic' that is used for radio box-->

<!-- obtains user's radio box input -->
<input type="hidden" value="$in{'tv_vs_comic'}" name="tv_vs_comic"> 

<p>You have watched/read/played:  <br /> 


<span style="color: #990000">$in{'checkbox_info1'}</span>
<span style="color: #990000">$in{'checkbox_info2'}</span>
<span style="color: #990000">$in{'checkbox_info3'}</span>
<span style="color: #990000">$in{'checkbox_info4'}</span>

</p>

<!-- The above line substitutes the value(s) associated with the name 'checkbox_info#' that is used for checkboxes -->

<!-- obtains user's input based on checkboxes -->
<input type="hidden" value="$in{'checkbox_info1'}" name="checkbox_info1"> 
<input type="hidden" value="$in{'checkbox_info2'}" name="checkbox_info2"> 
<input type="hidden" value="$in{'checkbox_info3'}" name="checkbox_info3"> 
<input type="hidden" value="$in{'checkbox_info4'}" name="checkbox_info4"> 

<p>You indicated that you enjoyed: <span style="color: #990000">$in{'other_games'}</span></p>

<!-- The above line substitutes the value associated with the name 'other_games' used in drop down menu-->

<!-- obtains user's input from drop-down menu -->
<input type="hidden" value="$in{'other_games'}" name="other_games"> 

<p>Your comments: <span style="color: #990000">$in{'user_comments'}</span></p>

<!-- The above line substitutes the value associated with the name 'user_comments'  from the form, that was entered by the user-->

<!-- obtains user's comments -->
<input type="hidden" value="$in{'user_comments'}" name="user_comments"> 

<div style="font-size: 12pt; color: red; padding: 3px; margin: 30px; border-style: solid;">
Review this information. Select the submit button if your are satisfied with the above data.
This will send me the data via email.<br><br>
<div align="center"><input type="submit" value="SUBMIT"></div>
</div>

</form>

<p><hr></p>

<p align="center">
<a href="http://hills.ccsf.edu/~vmalchik/homework/hw8a.html">Return to Form</a></p>


</div>
</body>
</html>

_END_
;