detectMobileCarrier = function(t) {
	return {
		"t-mobile": 1,
		att: 2,
		verizon: 3,
		sprint: 4
	}[t] || 0
};

return detectMobileCarrier(profile.geolocation.mobileCarrier);