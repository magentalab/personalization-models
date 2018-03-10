detectMobileCarrierSprint = function(t) {
	return {
		sprint: 1
	}[t] || 0
};

return detectMobileCarrierSprint(profile.geolocation.mobileCarrier);