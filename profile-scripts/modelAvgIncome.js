function detectIncome(e) {
	return -1 !== e.indexOf("8818876") ? 1 : -1 !== e.indexOf("8818878") ? 2 : -1 !== e.indexOf("8818877") ? 3 : -1 !== e.indexOf("8818875") ? 4 : -1 !== e.indexOf("8818874") || -1 !== e.indexOf("8818869") || -1 !== e.indexOf("8818870") || -1 !== e.indexOf("8818871") || -1 !== e.indexOf("8818872") || -1 !== e.indexOf("8818873") ? 5 : 0
}

return detectIncome(String(user.get('aam.segments')));