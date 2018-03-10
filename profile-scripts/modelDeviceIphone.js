function detectDeviceIphone(e) {
	return -1 !== e.indexOf("iPhone") ? 1 : 0
}

return detectDeviceIphone(user.browser);