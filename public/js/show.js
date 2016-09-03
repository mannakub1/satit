function show(ele) {
         var srcElement = document.getElementById(ele);
         if(srcElement != null) {
	   if(srcElement.style.display == "block") {
     		  srcElement.style.display= 'none';
   	    }
            else {
                   srcElement.style.display='block';
            }
            return false;
       }
  }

function setVisibility(id) {

if(document.getElementById(id).style.display === 'inline'){
	document.getElementById(id).style.display = 'none';
}
else{
	document.getElementById(id).style.display = 'inline';
}
}
function setVisibility2(id,id2,id3) {
	if(document.getElementById(id).style.display==='none'){
	document.getElementById(id).style.display='inline';
	document.getElementById(id2).style.display = 'none';
	document.getElementById(id3).style.display = 'none';

	}

}