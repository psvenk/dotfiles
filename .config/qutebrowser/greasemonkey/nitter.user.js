// ==UserScript==
// @name Twitter to Nitter redirect
// @description Redirect twitter.com to nitter.eu
// @namespace psvenk
// @version 0.3
// @match *://*.twitter.com/*
// @author psvenk
// @run-at document-start
// @qute-js-world user
// @grant none
// ==/UserScript==

const currentURL = window.location.toString();
const matches = currentURL.match(/(?:\w+\.)?twitter\.com/);
if (matches) {
	const newURL = currentURL.replace(matches[0], "nitter.snopyta.org");
	window.location.replace(newURL);
}
