var samsungScoreCo = {
		b0: -0.496356,
		b1: 0.165877,
		b2: -0.084161,
		b3: -0.545317,
		b4: -0.455359,
		b5: -0.687524,
		b6: -0.939770,
		b7: 1.266893,
		b8: 0.364284,
		b9: -0.398112,
		b10: -0.550191,
		b11: -0.795694,
		b12: -0.189060,
		b13: 0.092454,
		b14: 0.027409

	},
	logisticEq = function(b, c, d, e, f, g, h, i, j, k, l, m, n, o) {
		return 1 / (1 + Math.exp(-(b.b0 + b.b1 * c + b.b2 * d + b.b3 * e + b.b4 * f + b.b5 * g + b.b6 * h + b.b7 * i + b.b8 * j + b.b9 * k + b.b10 * l + b.b11 * m + b.b12 * n + b.b13 * o)))
	};

return logisticEq(samsungScoreCo, user.get("modelVisitNumber"), user.get("modelMobileCarrierTmo"),user.get("modelMobileCarrierAtt"),user.get("modelMobileCarrierVz"),user.get("modelMobileCarrierSprint"),user.get("modelDeviceIphone"),user.get("modelDeviceAndroid"),user.get("modelDeviceWindows"),user.get("modelDeviceMac"),user.get("modelTrafficSourceDirect"),user.get("modelTrafficSourceNs"),user.get("modelTrafficSourcePaid"),user.get("modelPopDensity"), user.get("modelAvgIncome");