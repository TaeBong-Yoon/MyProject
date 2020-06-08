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

function joinCheck(obj){
	if(!obj.id.value || obj.id.value.trim().length == 0){
		alert("Input ID !")
		obj.id.value="";
		obj.id.focus();
		return false;
	}
	if(!obj.password.value || obj.password.value.trim().length == 0){
		alert("Input Password !")
		obj.password.value="";
		obj.password.focus();
		return false;
	}
	if(!obj.name.value || obj.name.trim().length == 0){
		alert("Input Name !")
		obj.name.value="";
		obj.name.focus();
		return false;
	}
	if(!obj.age.value || obj.age.trim().length == 0){
		alert("Input age !")
		obj.age.value="";
		obj.age.focus();
		return false;
	}
	return true;
}
