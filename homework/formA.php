<?php
$msg = "E-MAIL SENT FROM FOG\n";
$msg .= "Sender's Name:    $_POST[name]\n";
$msg .= "Sender's E-mail:    $_POST[email]\n";
$msg .= "Sender's Party:       $_POST[party]\n";
$msg .= "Sender's TV News:       $_POST[tv]\n";
$msg .= "Comments/Questions:     $_POST[user_comments]\n\n";
$to = "victormalchikov@yahoo.com";
$subject = "Form Feedback from Fog";
$mailheaders = "From: $_POST[email]\n";
$mailheaders .= "Reply-To: $_POST[email]\n\n";
mail($to, $subject, $msg, $mailheaders);
?>

<html>
<head>
<title>The following email has been sent to Victor</title>

</head>
<body background="http://www.solidsmack.com/wp-content/uploads/2007/07/orange-burst.png">

<!-- general layout -->
<div align="center">

<!-- banner -->
<div align="center">
<img src="http://www.atg.wa.gov/uploadedImages/Another/Safeguarding_Consumers/File_a_Complaint/Mail_Complaint_Banner.jpg"
     width="658" height="108" align="middle" alt="header" title="banner" border="0" />
</div>

<br />
<!-- fancy divider -->
<div align="center">
<img src="images/break.png" width="318" height="11" 
     alt="separator" title="separator" align="middle" border="0"/>
</div>

<br />

<table bgcolor="#FFFFCC" border="1">
<tr>
<td colspan="2">
<h3>Thank You! The following information has been sent to Victor.</h3>
</td>
</tr>
<tr>
<td> <b>Your Name: </b> </td>
<td> <?php echo "$_POST[name]"; ?> </td>
</tr>
<tr>
<td> <b>Your E-mail Address: </b> </td>
<td> <?php echo "$_POST[email]"; ?> </td>
</tr>
<tr>
<td> <b>Your voting party: </b> </td>
<td> <?php echo "$_POST[party]"; ?> </td>
</tr>
<tr>
<td> <b>News you watch the most: </b> </td>
<td> <?php echo "$_POST[tv]"; ?> </td>
</tr>
<tr>
<td> <b>Your comments/questions:</b> </td>
<td> <?php echo "$_POST[user_comments]"; ?> </td> 
</tr>
</table>

<br />
<!-- fancy divider -->
<div align="center">
<img src="images/break.png" width="318" height="11" 
     alt="separator" title="separator" align="middle" border="0"/>
</div>

</div>

</body>
</html>


