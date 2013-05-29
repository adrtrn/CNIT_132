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
}

a:hover {color: purple; background-color: yellow;}

</style>

</head>

<body>

<div id="content">

<table align="center" bgcolor="#f5f5dc" cellpadding="5">
<tr>
<td>

<h2>Thanks, <span style="color: blue; ; background-color: yellow;">$in{'name'}</span>, for visiting my web site.</h2>

<!-- The above line substitutes the value associated with the name 'name' from the form, that was entered by the user-->


<p>Your email address is  <span style="color: blue">$in{'email'}</span></p>

<!-- The above line substitutes the value associated with the name 'email'  from the form, that was entered by the user-->


<p>You indicated that you are a fan of <span style="color: blue">$in{'tv_vs_comic'}</span></p>


<!-- The above line substitutes the value associated with name 'tv_vs_comic' that is used for radio box-->


<p>You have watched/read/played:  <br /> 


<span style="color: blue">$in{'checkbox_info1'}</span>
<span style="color: blue">$in{'checkbox_info2'}</span>
<span style="color: blue">$in{'checkbox_info3'}</span>
<span style="color: blue">$in{'checkbox_info4'}</span>

</p>


<!-- The above line substitutes the value(s) associated with the name 'checkbox_info#' that is used for checkboxes -->


<p>You indicated that you enjoyed: <span style="color: blue">$in{'other_games'}</span></p>

<!-- The above line substitutes the value associated with the name 'other_games' used in drop down menu-->


<p>Your comments: <span style="color: blue">$in{'user_comments'}</span></p>

<!-- The above line substitutes the value associated with the name 'user_comments'  from the form, that was entered by the user-->


<p><hr></p>

<p align="center">
<a href="http://hills.ccsf.edu/~vmalchik/homework/hw8a.html">Return to Form</a></p>


</td>
</tr>
</table>
</div>
</body>
</html>

_END_
;