// ==UserScript==
// @name Old Reddit redirect
// @description Redirect www.reddit.com to old.reddit.com
// @namespace psvenk
// @version 0.1
// @match *://www.reddit.com/*
// @author psvenk
// @run-at document-start
// @qute-js-world user
// ==/UserScript==

const currentURL = window.location.toString();
if (currentURL.includes("://www.reddit.com")) {
	const newURL = currentURL.replace("://www", "://old");
	window.location.replace(newURL);
}
