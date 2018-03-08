var iScoreCo = {
		b0: -2.62054,
		b1: -.09881,
		b2: -.01819,
		b3: -.04679,
		b4: .12127,
		b5: .11625,
		b6: .44566
	},
	logisticEq = function(b, i, o, r, t, c, e) {
		return 1 / (1 + Math.exp(-(b.b0 + b.b1 * i + b.b2 * o + b.b3 * r + b.b4 * t + b.b5 * c + b.b6 * e)))
	};

return logisticEq(iScoreCo, user.get("modelPopDensity"), user.get("modelAvgIncome"), user.get("modelVisitNumber"), user.get("modelMobileCarrier"), user.get("modelOS"), user.get("modelTrafficSource"));