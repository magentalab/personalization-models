detectMobileCarrierAtt = function(t) {
	return {
		att: 1
	}[t] || 0
};

return detectMobileCarrierAtt(profile.geolocation.mobileCarrier);