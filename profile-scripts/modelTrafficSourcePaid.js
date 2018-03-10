function detectTrafficSourcePaid(e) {
	return 3 == e ? 1 : 0
}

return detectTrafficSourcePaid(user.get("modelTrafficSource"));