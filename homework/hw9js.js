

// ********** load expanding header *********
var textSize = 0;
var time = 0;
function loadHeader()
{
  if(textSize < 20)
  {
	 time = setTimeout("loadHeader()", 50);
     document.getElementById('header').style.fontSize = textSize+"px";
	 //increase text size
     textSize++;
  }
}

// ********** load expanding header *********
function setColor(colorstr) {

     document.bgColor = colorstr;
}

// ********** alert message link *************
function respond(myForm)
{ 
    //get input from user 
    var input= myForm.question.value;
	//check and reply based on input
	if(input == "")
       alert("Please type y or n");	
	else if(input == "n")
	   alert("Wrong answer");
	else if(input != "y")
	   alert("Bad input");
	else
	   alert("Thanks!");
}


// ********** change image functions *************
function changeImage() //loads new image 
{
	//create new image and assign it existing image that is in the same directory
	var image = new Image(240, 341);
	image.src = "../images/devil.png";
	//apply new image 
	document.swap.src = image.src;

}

function resetImage() //loads starting image 
{
    //create new image and assign it existing image that is in the same directory
	var image = new Image();
	image.src = "../images/angel.png";
	//apply new image 
	document.getElementById("swap").src = image.src;
}

// ********** load new page *************
function loadPage(myForm)
{
  //get the selected index from the selected tag array via keyword: selectedIndex
  var selected = myForm.links.selectedIndex;
  //get the link based on selected index
  var link = myForm.links.options[selected].value;
  //open new window based on link
  if(selected == 0)
     alert("No link selected!");
  else
  {
     //window.location = link;
     //create a new window
	 var newWindow = window.open(link, "Desired Page", "width=600, height=600, resizable,scrollbars,menubar,status,location,toolbar");
	 newWindow.focus();
  }

}

// ********** popup warning page *************
function warningPage()
{   //note: take out status parameter to make window pop-out
 	var newWindow = window.open("hw9warning.html", "Warning Page", "width=500, height=500");
	newWindow.focus();
}

// ********** check password  *************
function checkPassword(pwForm)
{
   var input = document.getElementById("pw").value;
   //check if password matches the input
   if(input == "rosebud")
   {
       alert("Password is correct.");
	   //load new page in same tab
       window.location = "hw_forms.html";   
   }
   else
       alert("Password is incorrect.");
}


