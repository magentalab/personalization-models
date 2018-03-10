function detectTrafficSourceDirect(e) {
	return 1 == e ? 1 : 0
}

return detectTrafficSourceDirect(user.get("modelTrafficSource"));