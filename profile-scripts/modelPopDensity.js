function detectPopDensity(e) {
	return -1 !== e.indexOf("8818850") ? 1 : -1 !== e.indexOf("8818851") ? 2 : -1 !== e.indexOf("8818852") ? 3 : -1 !== e.indexOf("8818849") ? 4 : -1 !== e.indexOf("8818853") ? 5 : 0
}

return detectPopDensity(String(user.get('aam.segments')));