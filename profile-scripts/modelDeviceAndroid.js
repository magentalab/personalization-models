function detectDeviceAndroid(e) {
	return -1 !== e.indexOf("Android") ? 1 : 0
}

return detectDeviceAndroid(user.browser);