// ==UserScript==
// @name        Let there be Light
// @description Change page background to white.
// @version     0.1
// @author      loiccoyle
// @include     *
// ==/UserScript==

var sheets = window.document.styleSheets;
var i
for (i=0; i<sheets.length; i++){
    try {
        if (sheets[i].href == null) {
            sheets[i].insertRule('body { background-color: white; }', 0);
        }
    } catch(e) {
        console.log(e)
        console.log(sheets[i])
    }
}
