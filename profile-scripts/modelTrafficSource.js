function detectTrafficSource(e, o) {
	var s, c = function(e) {
			return user.sessionId != e ? (user.setLocal("lastSessionId", user.sessionId), 4) : user.getLocal("trafficScore")
		}(user.getLocal("lastSessionId")),
		r = /google|yahoo|bing|duckduckgo|baidu|yandex|naver|dogpile|ecosia|earthlink|m.sm.cn|avg.com|aol.com|msn.com|myway.com|ask.com/g,
		o = o.toLowerCase();
	return s = -1 != e.search(r) && -1 != o.indexOf("_pb_") || 3 == c ? 3 : -1 != e.search(r) && -1 == o.indexOf("cmpid") || 2 == c ? 2 : "none" == e || 1 == c ? 1 : 0, user.setLocal("trafficScore", s), s
}

return detectTrafficSource(referrer.domain || "none", landing.url);