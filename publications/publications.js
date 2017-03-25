var data = JSON.parse('{"item1":1, "item2":2}');
        for (x in data) {
            document.getElementById("titles").innerHTML += data[x] + "<br>";
        }
        
function loadDoc() {
    //Create xmlhttp request
  var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
        } else {
        // code for IE6, IE5
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "https://api.zotero.org/groups/1114225/items?v=3&format=json&include=bib", true);
  xhttp.send();
}