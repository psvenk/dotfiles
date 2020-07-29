// ==UserScript==
// @name Twitter to Nitter redirect
// @description Redirect twitter.com to nitter.net
// @namespace psvenk
// @version 0.1
// @match *://*.twitter.com/*
// @author psvenk
// ==/UserScript==

const currentURL = window.document.location.toString();
let matches = currentURL.match(/(?:\w+\.)?twitter\.com/);
if (matches) {
	let newURL = currentURL.replace(matches[0], "www.nitter.net");
	window.document.location.replace(newURL);
}
