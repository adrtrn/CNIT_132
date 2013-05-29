#!/usr/local/bin/perl
#file name emailz.pl
print "content-type: text/html\n\n";
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
@pairs=split(/&/,$buffer);

foreach $pair(@pairs)
{
($name,$value)=split(/=/, $pair);  
  
if ($value eq "")    
{	    
$value = 'none';
}	
else	
{	
$value=~ tr/+/ /;
    
$value=~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;

$value=~ s/~!/ /g;    

$FORM{$name}=$value;    
}

}

$mailprog='/usr/sbin/sendmail';
$recipient='victormalchikov@yahoo.com';
open(MAIL,"|$mailprog $recipient") || die "Can't open $mailprog!\n";
print MAIL "Reply-to: $FORM{'email'}
($FORM{'name'})\n";
print MAIL "Subject: Form Data\n\n";
foreach $key (keys(%FORM))
{print MAIL "$key=$FORM{$key}\n";}
close(MAIL);
open(FORMFILE,">>../formdata.dat") || die "Can open file";
print FORMFILE $FORM{"name"},"\:",$FORM{"email"},"\:",$FORM{"tv_vs_comic"},"\:",$FORM{"checkbox_info1"},"\:",$FORM{"checkbox_info2"},"\:",$FORM{"checkbox_info3"},"\:",$FORM{"checkbox_info4"},"\:",$FORM{"other_games"},"\:",$FORM{"user_comments"},"\n";
#print FORMFILE $FORM{"name"},"\:",$FORM{"email"},"\n";
close(FORMFILE);
print<<EndHTML;

<html>
<head>
<title>Thank you</title>

<meta http-equiv="Page-Enter"
 content="RevealTrans(Duration=2.000,Transition=10)">
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
</style>

</head>
<body>
<pre>


</pre>
<div id="content">
<h3>Thank You, <span style="color: #990033;">$FORM{"name"}</span>,
for submitting your information.<br> Your form data was emailed to me.</h3>

<b>You may now return to the  
<a href="http://hills.ccsf.edu/~vmalchik/homework/hw8a.html">form</a>

or you may go back 
<a href="http://hills.ccsf.edu/~vmalchik/">home</a>.
<br><br>
</b>

</div>

</body>
</html>
EndHTML

