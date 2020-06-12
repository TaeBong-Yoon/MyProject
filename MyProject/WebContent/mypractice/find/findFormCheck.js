function idFormCheck(obj){
	if(!obj.nameInId.value || obj.nameInId.value.trim().length ==0){
		alert("You have to insert Name");
		obj.nameInId.value = "";
		obj.nameInId.focus();
		return false;
	}
	if(!obj.phone.value || obj.phone.trim().length ==0){
		alert("You have to insert Phone");
		obj.phone.value = "";
		obj.phone.focus();
		return false;
	}
	return true;
}
function pwFormCheck(obj){
	if(!obj.id.value || obj.id.value.trim().length ==0){
		alert("You have to insert ID");
		obj.id.value = "";
		obj.id.focus();
		return false;
	}
	if(!obj.nameInPw.value || obj.nameInPw.trim().length ==0){
		alert("You have to insert Name");
		obj.nameInPw.value = "";
		obj.nameInPw.focus();
		return false;
	}
	return true;
}