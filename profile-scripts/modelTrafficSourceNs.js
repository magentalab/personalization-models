function detectTrafficSourceNs(e) {
	return 2 == e ? 1 : 0
}

return detectTrafficSourceNs(user.get("modelTrafficSource"));