function loginCheck(obj){
	if(!obj.id.value || obj.id.value.trim().length ==0){
		alert("You have to insert ID");
		obj.id.value = "";
		obj.id.focus();
		return false;
	}
	if(!obj.password.value || obj.password.trim().length ==0){
		alert("You have to insert Password");
		obj.password.value = "";
		obj.password.focus();
		return false;
	}
	return true;
}