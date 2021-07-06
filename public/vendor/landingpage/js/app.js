/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is not neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/js/app.js":
/*!***********************!*\
  !*** ./src/js/app.js ***!
  \***********************/
/*! namespace exports */
/*! exports [not provided] [no usage info] */
/*! runtime requirements: __webpack_require__, __webpack_require__.n, __webpack_require__.r, __webpack_exports__, __webpack_require__.* */
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_app_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../css/app.css */ \"./src/css/app.css\");\n/* harmony import */ var _menu_toggler__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./menu-toggler */ \"./src/js/menu-toggler.js\");\n/* harmony import */ var _menu_toggler__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_menu_toggler__WEBPACK_IMPORTED_MODULE_1__);\n\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9qb25hdGhhbi13ZWJwYWNrLy4vc3JjL2pzL2FwcC5qcz85MGU5Il0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7QUFBQSIsImZpbGUiOiIuL3NyYy9qcy9hcHAuanMuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgXCIuLi9jc3MvYXBwLmNzc1wiO1xuXG5pbXBvcnQgXCIuL21lbnUtdG9nZ2xlclwiO1xuIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./src/js/app.js\n");

/***/ }),

/***/ "./src/js/menu-toggler.js":
/*!********************************!*\
  !*** ./src/js/menu-toggler.js ***!
  \********************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements:  */
/***/ (() => {

eval("var navMenuDiv = document.getElementById(\"nav-content\");\nvar navMenu = document.getElementById(\"nav-toggle\");\ndocument.onclick = check;\n\nfunction check(e) {\n  var target = e && e.target || event && event.srcElement; //Nav Menu\n\n  if (!checkParent(target, navMenuDiv)) {\n    // click NOT on the menu\n    if (checkParent(target, navMenu)) {\n      // click on the link\n      if (navMenuDiv.classList.contains(\"hidden\")) {\n        navMenuDiv.classList.remove(\"hidden\");\n      } else {\n        navMenuDiv.classList.add(\"hidden\");\n      }\n    } else {\n      // click both outside link and outside menu, hide menu\n      navMenuDiv.classList.add(\"hidden\");\n    }\n  }\n}\n\nfunction checkParent(t, elm) {\n  while (t.parentNode) {\n    if (t == elm) {\n      return true;\n    }\n\n    t = t.parentNode;\n  }\n\n  return false;\n}//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9qb25hdGhhbi13ZWJwYWNrLy4vc3JjL2pzL21lbnUtdG9nZ2xlci5qcz84Y2Q3Il0sIm5hbWVzIjpbIm5hdk1lbnVEaXYiLCJkb2N1bWVudCIsImdldEVsZW1lbnRCeUlkIiwibmF2TWVudSIsIm9uY2xpY2siLCJjaGVjayIsImUiLCJ0YXJnZXQiLCJldmVudCIsInNyY0VsZW1lbnQiLCJjaGVja1BhcmVudCIsImNsYXNzTGlzdCIsImNvbnRhaW5zIiwicmVtb3ZlIiwiYWRkIiwidCIsImVsbSIsInBhcmVudE5vZGUiXSwibWFwcGluZ3MiOiJBQUFBLElBQUlBLFVBQVUsR0FBR0MsUUFBUSxDQUFDQyxjQUFULENBQXdCLGFBQXhCLENBQWpCO0FBQ0EsSUFBSUMsT0FBTyxHQUFHRixRQUFRLENBQUNDLGNBQVQsQ0FBd0IsWUFBeEIsQ0FBZDtBQUVBRCxRQUFRLENBQUNHLE9BQVQsR0FBbUJDLEtBQW5COztBQUNBLFNBQVNBLEtBQVQsQ0FBZUMsQ0FBZixFQUFrQjtBQUNqQixNQUFJQyxNQUFNLEdBQUlELENBQUMsSUFBSUEsQ0FBQyxDQUFDQyxNQUFSLElBQW9CQyxLQUFLLElBQUlBLEtBQUssQ0FBQ0MsVUFBaEQsQ0FEaUIsQ0FHakI7O0FBQ0EsTUFBSSxDQUFDQyxXQUFXLENBQUNILE1BQUQsRUFBU1AsVUFBVCxDQUFoQixFQUFzQztBQUNyQztBQUNBLFFBQUlVLFdBQVcsQ0FBQ0gsTUFBRCxFQUFTSixPQUFULENBQWYsRUFBa0M7QUFDakM7QUFDQSxVQUFJSCxVQUFVLENBQUNXLFNBQVgsQ0FBcUJDLFFBQXJCLENBQThCLFFBQTlCLENBQUosRUFBNkM7QUFDNUNaLFFBQUFBLFVBQVUsQ0FBQ1csU0FBWCxDQUFxQkUsTUFBckIsQ0FBNEIsUUFBNUI7QUFDQSxPQUZELE1BRU87QUFDTmIsUUFBQUEsVUFBVSxDQUFDVyxTQUFYLENBQXFCRyxHQUFyQixDQUF5QixRQUF6QjtBQUNBO0FBQ0QsS0FQRCxNQU9PO0FBQ047QUFDQWQsTUFBQUEsVUFBVSxDQUFDVyxTQUFYLENBQXFCRyxHQUFyQixDQUF5QixRQUF6QjtBQUNBO0FBQ0Q7QUFDRDs7QUFDRCxTQUFTSixXQUFULENBQXFCSyxDQUFyQixFQUF3QkMsR0FBeEIsRUFBNkI7QUFDNUIsU0FBT0QsQ0FBQyxDQUFDRSxVQUFULEVBQXFCO0FBQ3BCLFFBQUlGLENBQUMsSUFBSUMsR0FBVCxFQUFjO0FBQ2IsYUFBTyxJQUFQO0FBQ0E7O0FBQ0RELElBQUFBLENBQUMsR0FBR0EsQ0FBQyxDQUFDRSxVQUFOO0FBQ0E7O0FBQ0QsU0FBTyxLQUFQO0FBQ0EiLCJzb3VyY2VzQ29udGVudCI6WyJ2YXIgbmF2TWVudURpdiA9IGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKFwibmF2LWNvbnRlbnRcIik7XG52YXIgbmF2TWVudSA9IGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKFwibmF2LXRvZ2dsZVwiKTtcblxuZG9jdW1lbnQub25jbGljayA9IGNoZWNrO1xuZnVuY3Rpb24gY2hlY2soZSkge1xuXHR2YXIgdGFyZ2V0ID0gKGUgJiYgZS50YXJnZXQpIHx8IChldmVudCAmJiBldmVudC5zcmNFbGVtZW50KTtcblxuXHQvL05hdiBNZW51XG5cdGlmICghY2hlY2tQYXJlbnQodGFyZ2V0LCBuYXZNZW51RGl2KSkge1xuXHRcdC8vIGNsaWNrIE5PVCBvbiB0aGUgbWVudVxuXHRcdGlmIChjaGVja1BhcmVudCh0YXJnZXQsIG5hdk1lbnUpKSB7XG5cdFx0XHQvLyBjbGljayBvbiB0aGUgbGlua1xuXHRcdFx0aWYgKG5hdk1lbnVEaXYuY2xhc3NMaXN0LmNvbnRhaW5zKFwiaGlkZGVuXCIpKSB7XG5cdFx0XHRcdG5hdk1lbnVEaXYuY2xhc3NMaXN0LnJlbW92ZShcImhpZGRlblwiKTtcblx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdG5hdk1lbnVEaXYuY2xhc3NMaXN0LmFkZChcImhpZGRlblwiKTtcblx0XHRcdH1cblx0XHR9IGVsc2Uge1xuXHRcdFx0Ly8gY2xpY2sgYm90aCBvdXRzaWRlIGxpbmsgYW5kIG91dHNpZGUgbWVudSwgaGlkZSBtZW51XG5cdFx0XHRuYXZNZW51RGl2LmNsYXNzTGlzdC5hZGQoXCJoaWRkZW5cIik7XG5cdFx0fVxuXHR9XG59XG5mdW5jdGlvbiBjaGVja1BhcmVudCh0LCBlbG0pIHtcblx0d2hpbGUgKHQucGFyZW50Tm9kZSkge1xuXHRcdGlmICh0ID09IGVsbSkge1xuXHRcdFx0cmV0dXJuIHRydWU7XG5cdFx0fVxuXHRcdHQgPSB0LnBhcmVudE5vZGU7XG5cdH1cblx0cmV0dXJuIGZhbHNlO1xufVxuIl0sImZpbGUiOiIuL3NyYy9qcy9tZW51LXRvZ2dsZXIuanMuanMiLCJzb3VyY2VSb290IjoiIn0=\n//# sourceURL=webpack-internal:///./src/js/menu-toggler.js\n");

/***/ }),

/***/ "./src/css/app.css":
/*!*************************!*\
  !*** ./src/css/app.css ***!
  \*************************/
/*! namespace exports */
/*! exports [not provided] [no usage info] */
/*! runtime requirements: __webpack_require__.r, __webpack_exports__, __webpack_require__.* */
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n// extracted by mini-css-extract-plugin\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9qb25hdGhhbi13ZWJwYWNrLy4vc3JjL2Nzcy9hcHAuY3NzP2ZkNjMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IjtBQUFBIiwiZmlsZSI6Ii4vc3JjL2Nzcy9hcHAuY3NzLmpzIiwic291cmNlc0NvbnRlbnQiOlsiLy8gZXh0cmFjdGVkIGJ5IG1pbmktY3NzLWV4dHJhY3QtcGx1Z2luXG5leHBvcnQge307Il0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./src/css/app.css\n");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	(() => {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = (module) => {
/******/ 			var getter = module && module.__esModule ?
/******/ 				() => module['default'] :
/******/ 				() => module;
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => Object.prototype.hasOwnProperty.call(obj, prop)
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	// startup
/******/ 	// Load entry module
/******/ 	__webpack_require__("./src/js/app.js");
/******/ 	// This entry module used 'exports' so it can't be inlined
/******/ })()
;