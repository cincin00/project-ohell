function siteselected(emailsite){
	for(var i=0;i<document.is.emailsite.size;i++){
		if(document.is.emailsite.options[i].value == emailsite){
			document.is.emailsite.options[i].selected;
		}
	}
}

function init(){
	alert(emailsite);
}