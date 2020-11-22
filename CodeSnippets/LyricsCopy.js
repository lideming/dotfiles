// ==UserScript==
// @name         LyricsCopy
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Copy lyrics from lyrics website
// @author       Li Deming
// @match        https://utaten.com/lyric/*
// @grant        none
// ==/UserScript==

(function () {
    'use strict';
    function getUtaten() {
        var lyricsBox = document.querySelector('.hiragana');
        var r = '';
        var lyricWork = document.querySelector('.lyricWork');
        if (lyricWork) {
            for (var child = lyricWork.firstElementChild; child; child = child.nextElementSibling) {
                r += child.textContent + ': ';
                child = child.nextElementSibling;
                r += child.textContent + '\n';
            }
            r += '\n';
        }
        for (var x = lyricsBox.firstChild; x != null; x = x.nextSibling) {
            if (x.nodeType == Node.TEXT_NODE) {
                r += x.textContent.replace(/(^\s+)|(\s+$)/g, '');
            } else if (x.nodeType == Node.ELEMENT_NODE) {
                /** @type {HTMLElement} */
                const element = x;
                if (element.tagName == 'SPAN' && element.className == 'ruby') {
                    r += '[' + element.childNodes[0].textContent + ']{' + element.childNodes[1].textContent + '}';
                } else if (element.tagName == 'BR') {
                    r += '\n';
                }
            }
        }
        return r;
    }
    window.setTimeout(() => {
        console.log(getUtaten());
    }, 2000);
    window.lc = {
        getUtaten
    };
})();