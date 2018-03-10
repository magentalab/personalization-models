detectMobileCarrierVz = function(t) {
	return {
		verizon: 1
	}[t] || 0
};

return detectMobileCarrierVz(profile.geolocation.mobileCarrier);