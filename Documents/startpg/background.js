chrome.browserAction.onClicked.addListener(function() {
	chrome.tabs.create({'url':"chrome://newtab"})
	})

document.getElementById("TimeDate").addEventListener("DOMContentLoaded", date);

function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  document.getElementById('txt').innerHTML =
  h + ":" + m;
}

function date() {
	var d = new Date ();
	document.getElementById("printdate").innerHTML = d.toLocaleDateString();
}
