var decaScoreCo = {
		b0: .65666,
		b1: -.25644,
		b2: .03622,
		b3: -.13148,
		b4: .19559,
		b5: -.09004,
		b6: .17112
	},
	logisticEq = function(b, c, e, o, r, t, a) {
		return 1 / (1 + Math.exp(-(b.b0 + b.b1 * c + b.b2 * e + b.b3 * o + b.b4 * r + b.b5 * t + b.b6 * a)))
	};

return logisticEq(decaScoreCo, user.get("modelPopDensity"), user.get("modelAvgIncome"), user.get("modelVisitNumber"), user.get("modelMobileCarrier"), user.get("modelOS"), user.get("modelTrafficSource"));