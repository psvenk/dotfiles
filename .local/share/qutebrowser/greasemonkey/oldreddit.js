// ==UserScript==
// @name Old Reddit redirect
// @description Redirect www.reddit.com to old.reddit.com
// @namespace psvenk
// @version 0.1
// @match *://www.reddit.com/*
// @author psvenk
// ==/UserScript==

const currentURL = window.document.location.toString();
if (currentURL.includes("://www.reddit.com")) {
	let newURL = currentURL.replace("://www", "://old");
	window.document.location.replace(newURL);
}
