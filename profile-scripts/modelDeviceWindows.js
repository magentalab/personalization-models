function detectDeviceWindows(e) {
	return -1 !== e.indexOf("Windows") ? 1 : 0
}

return detectDeviceWindows(user.browser);