function detectDeviceMac(e) {
	return ((-1 == e.indexOf("iPhone")) && (-1 !== e.indexOf("Mac"))) ? 1 : 0
}

return detectDeviceMac(user.browser);