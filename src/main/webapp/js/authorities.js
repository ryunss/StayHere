function YnCheck(obj) {
	var checked = obj.checked;
	if (checked) {
		obj.value = "ROLE_MEMBER";
	} else {
		obj.value = "";
	}

};