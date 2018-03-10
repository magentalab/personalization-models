detectMobileCarrierTmo = function(t) {
	return {
		"t-mobile": 1,
	}[t] || 0
};

return detectMobileCarrierTmo(profile.geolocation.mobileCarrier);