// ==UserScript==
// @name Twitter to Nitter redirect
// @description Redirect twitter.com to a Nitter instance
// @namespace psvenk
// @version 0.5
// @match *://*.twitter.com/*
// @author psvenk
// @run-at document-start
// @qute-js-world user
// @grant none
// ==/UserScript==

const currentURL = window.location.toString();
const matches = currentURL.match(/(?:\w+\.)?twitter\.com/);
if (matches) {
	const newURL = currentURL.replace(matches[0], "nitter.skrep.in");
	window.location.replace(newURL);
}
