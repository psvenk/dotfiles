// ==UserScript==
// @name Twitter to Nitter redirect
// @description Redirect twitter.com to nitter.net
// @namespace psvenk
// @version 0.1
// @match *://*.twitter.com/*
// @author psvenk
// @run-at document-start
// @qute-js-world user
// ==/UserScript==

const currentURL = window.location.toString();
const matches = currentURL.match(/(?:\w+\.)?twitter\.com/);
if (matches) {
	const newURL = currentURL.replace(matches[0], "nitter.net");
	window.location.replace(newURL);
}
