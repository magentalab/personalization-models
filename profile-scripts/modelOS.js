function detectDevice(e) {
	var i = 0;
	return e && (-1 !== e.indexOf("Android") ? i = 1 : -1 !== e.indexOf("iPhone") || -1 !== e.indexOf("iPad") ? i = 2 : -1 !== e.indexOf("Windows") ? i = 3 : -1 !== e.indexOf("Mac") && (i = 4)), i
}

return detectDevice(user.browser);