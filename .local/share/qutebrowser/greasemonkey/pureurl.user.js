// ==UserScript==
// @name          Pure URL userscript
// @description   Strip unwanted URL parameters (to prevent tracking)
// @namespace     psvenk
// @version       0.1
// @include       http://*
// @include       https://*
// @author        psvenk
// @license       ISC
// @run-at        document-start
// @qute-js-world user
// ==/UserScript==

/**
 * @license
 * Copyright 2020 psvenk
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 * SPDX-License-Identifier: ISC
*/

/**
 * List of parameters to strip, with the option of limiting a parameter to
 * running on a specific domain name.
 *
 * If a domain name is provided (after an '@' sign), that domain and all of its
 * subdomains will be included.
 *
 * @constant {string[]}
 */
const STRIP_LIST = (`
__tn__
__twitter_impression
__xts__
_branch_match_id
_nc_cat
_openstat
action_object_map
action_ref_map
action_type_map
amp
cid
correlation_id
deep_link
eid
fb_action_ids
fb_action_types
fb_ref
fb_source
fbclid
fbrefresh
ga_campaign
ga_content
ga_medium
ga_place
ga_source
ga_term
gclid
gs_l
hilit
igshid
impression_id
mbid
partner
pcampaignid
pfmredir
ref_src
sdsrc
sfnsn
srid
theater
trk
uclick
uclickhash
utm_brand
utm_campaign
utm_content
utm_cta
utm_medium
utm_name
utm_place
utm_reader
utm_social-type
utm_source
utm_term
ved
yclid
`.trim() + `
src@addons.mozilla.org
ref@amazon.in
m@blogspot.com
fref@facebook.com
hc_location@facebook.com
hc_ref@facebook.com
ref@facebook.com
ei@google.com
ref_@imdb.com
midToken@linkedin.com
refId@linkedin.com
trkEmail@linkedin.com
source@medium.com
action@nytimes.com
algo@nytimes.com
block@nytimes.com
context@nytimes.com
fellback@nytimes.com
imp_id@nytimes.com
index@nytimes.com
module@nytimes.com
pgtype@nytimes.com
region@nytimes.com
req_id@nytimes.com
state@nytimes.com
surface@nytimes.com
ch@quora.com
share@quora.com
itid@washingtonpost.com
feature@youtube.com
`).trim().split("\n");

/**
 * Whether or not to dynamically replace links added by JavaScript code on the
 * page. This incurs a slight performance penalty because it traverses every
 * element added or modified by JavaScript.
 *
 * @constant {boolean}
 */
const DYNAMIC = true;

/**
 * If this is set to true, the test suite will be run (logging errors, if any,
 * to the developer tools console) and no URLs will be replaced.
 *
 * @constant {boolean}
 */
const DEBUG = false;

/**
 * Escape a literal string for a regular expression.
 * https://stackoverflow.com/a/9310752
 *
 * @param {string} text
 * @returns {string}
 */
RegExp.escape = s => String(s).replace(/[\\^$*+?.()|[\]{}]/g, '\\$&');

/**
 * Check if a URL matches a given domain specification (including subdomains).
 * @param {URL} url
 * @param {string} domain
 * @returns {boolean}
 */
function checkDomain(url, domain) {
	return !domain || url.hostname.match(new RegExp(
		`^(.*\\.)?${RegExp.escape(domain)}`
	));
}

/**
 * Strip unwanted URL parameters from a URL object.
 * @param {URL} url - URL object from which to strip parameters (mutated)
 * @param {string[]} strip_list - List of parameters to strip
 * @returns {boolean} Whether or not any parameters were stripped
 */
function sanitize(url, strip_list) {
	const params = url.searchParams;
	let modified = false;
	for (const x of strip_list) {
		const [param, domain] = x.split("@");
		if (params.has(param) && checkDomain(url, domain)) {
			params.delete(param);
			modified = true;
		}
	}
	return modified;
}

/**
 * Sanitize an <a> element on the page.
 * @param {HTMLAnchorElement} link - (mutated)
 * @param {string[]} strip_list
 */
function sanitizeLink(link, strip_list) {
	const linkUrl = new URL(link.href);
	if (sanitize(linkUrl, strip_list)) {
		link.href = linkUrl.toString();
	}
}

// Test suite
function test() {
	const strip_list = ["utm_source", "utm_campaign", "tracker@google.com"];
	const inputs = [
		"https://example.org/?utm_source&regular_property=true",
		"https://example.org/?q=JavaScript+URLSearchParams&utm_campaign=abc",
		"https://example.com/?safeparam",
		"https://maps.google.com/?tracker=true",
		"https://notgoogle.com/?tracker=false",
	];
	const outputs = [
		["https://example.org/?regular_property=true", true],
		["https://example.org/?q=JavaScript+URLSearchParams", true],
		["https://example.com/?safeparam", false],
		["https://maps.google.com/", true],
		["https://notgoogle.com/?tracker=false", false],
	];
	inputs.forEach((input, i) => {
		const url = new URL(input);
		const modified = sanitize(url, strip_list);
		console.assert(url.toString() === outputs[i][0],
			"In converting %s, expected %s but got %s",
			input, outputs[i][0], url.toString()
		);
		console.assert(modified === outputs[i][1],
			"In converting %s, expected %s but got %s",
			input, ...[outputs[i][1], modified].map(x =>
				(x ? "" : "un") + "modified"
			)
		);
	});
}

function main() {
	if (DEBUG) {
		test();
		return;
	}

	// Sanitize current URL
	const url = new URL(window.location.href);
	if (sanitize(url, STRIP_LIST)) {
		window.location.replace(url.toString());
		return;
	}

	// Sanitize all links on page
	window.addEventListener("load", () => {
		for (link of document.querySelectorAll("a[href]")) {
			sanitizeLink(link, STRIP_LIST);
		}
	});
	// Dynamic sanitization
	if (DYNAMIC) {
		const observer = new MutationObserver(mutations => {
			for (const mutation of mutations) {
				if (mutation.type === "attributes") {
					if (mutation.target.nodeName.toLowerCase() === "a"
							&& mutation.attributeName === "href") {
						sanitizeLink(mutation.target, STRIP_LIST);
					}
				} else for (const node of mutation.addedNodes) {
					if (node.nodeType == Node.ELEMENT_NODE) {
						for (link of node.querySelectorAll("a[href]")) {
							sanitizeLink(link, STRIP_LIST);
						}
					}
				}
			}
		});
		observer.observe(document, {
			attributes: true,
			childList: true,
			subtree: true,
		});
	}
}

main();

// vim: set noet tw=80:
