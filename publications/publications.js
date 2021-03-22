/* OPTIONS */
var zoteroURL = 'https://api.zotero.org/groups/1114225/items?v=3&format=json&include=bib,tei,data,coins',
    refreshCache = false ;
    
var addRandomParam = '';

if ( refreshCache ) {
    addRandomParam = '&t=' + Math.random();
};

function loadDoc(url, cFunction) {
    jQuery.get(url,"",cFunction(this),"")
}

function escapeRegEx(text) {
    return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
}

// escapeHTML function from https://github.com/janl/mustache.js/blob/master/mustache.js#L60
var entityMap = {
  '&': '&amp;',
  '<': '&lt;',
  '>': '&gt;',
  '"': '&quot;',
  "'": '&#39;',
  '/': '&#x2F;',
  '`': '&#x60;',
  '=': '&#x3D;'
};

function escapeHtml (string) {
  return String(string).replace(/[&<>"'`=\/]/g, function (s) {
    return entityMap[s];
  });
}

function escapeUnicode (string) {
    var regex = new RegExp("\&\#([A-Za-z0-9]+)\;");
    var replacement = String(string).replace(regex, function () {
        parseInt("0$1");
    });
    return replacement;
}

function parseZoteroData ( zoteroURL ) {
    $.get( zoteroURL + addRandomParam, function( data ) {
            for (x in data) {
            var item = data[x],
                bib = item.bib,
                coins = item.coins,
                key = item.key,
                itemType = item.data.itemType,
                tei = item.tei,
                children = ""; 

            var url = item.data.url;
            var title = item.data.title;
            var bibEscaped = escapeUnicode ( bib ); //testing. For replacement will need to convert characters in bib, not title
            
            var titleRegEx = new RegExp( '(' + escapeRegEx( escapeHtml ( title ) ) + ')' ,'gi');
            var link = '<a href=\"' + url + '\">' + url + '</a>';
/*            This still doesn't properly escape special characters like in al-Jahiz title. */
/*            Could make this span with class instead, so that user can style it. */
            var bibLinked = bib.replace(url, link).replace( titleRegEx , "<b>$1</b>");
           
            //title replacement is not working bc bib uses unicode hex whereas title does not. Need to convert hex first? 
            //The following works for single characters -- perhaps use splice function to apply to multiple characters?
            /*var myString = "&#x101;";
             var regex = new RegExp("\&\#([A-Za-z0-9]+)\;");
             var replacedString = myString.replace(regex,"0$1");
             var convertedString = parseInt(replacedString);
             document.getElementById("demo").innerHTML = String.fromCharCode(convertedString);*/
            
            var thumbnail;
            
            if (itemType == "journalArticle"||itemType == "bookSection") {
                for (y in data) {
                    var parentItem = data[y].data.parentItem,
                        url = data[y].data.url,
                        title = data[y].data.title;
                    if (parentItem == key && url && title) {
                        if (title == 'Thumbnail') {
                            var thumbnail = url;
                        } else {
                            children += '<a class="badge" href="' + url + '">' + title + '</a>\n';
                        }
                    };
                    if (children) {
                        var childrenList = children;
                    } else {
                        var childrenList = "";
                    }  
                                     
                };
                
                var teiText = escapeHtml( tei );   
                
                //enable popovers
                $(function () {
                  $('[data-toggle="popover"]').popover();
                })
                
                

                var htmlItem = 
                    '<img src="' + thumbnail + '" class="img-responsive img-circle col-md-1"/>\n'
                    + '<div class="col-md-11">' 
                    + bibLinked
                    + bibEscaped //testing
                    + coins 
                    + '<div class="badge-links">' 
                    + childrenList 
                    + '<button type="button" class="btn btn-default btn-xs" data-toggle="popover" title="TEI-XML" data-placement="bottom" data-content="' 
                    + teiText 
                    + '"><img src="../img/TEIlogo.svg"/></button>'
/*                    + '<a onclick="newWindow()">new window</a>'*/
                    + '</div>'
                    + '\n</div>';
                $( "#articles" ).append( htmlItem ); // Could do the .replace(title, titleBold) here after conversion to HTML element so that unicode doesn't matter.
                
/*                This fires an event to tell Zotero to re-detect metadata on the page (Zotero 3.0+). See https://www.zotero.org/support/dev/exposing_metadata */
                var ev = document.createEvent('HTMLEvents');
                ev.initEvent('ZoteroItemUpdated', true, true);
                document.dispatchEvent(ev);
                
                /*jQuery(function($) {
                    $('a.new-window').click(function(){
                
                    teiWindow.document.open();
                    teiWindow.document.write(teiText);
                    teiWindow.document.close();
                
                    return false;
                
                    });
                });*/
            }
              }
          }, "json" );
};

parseZoteroData ( zoteroURL ) ;
        
/*function newWindow (content) {
    
    var recipe =  window.open('','RecipeWindow','width=600,height=600');
    var html = '<html><head><title>Print Your Recipe</title></head><body><div id="myprintrecipe">' + $('<div />').append($('#recipe1').clone()).html() + '</div></body></html>';
    recipe.document.open();
    recipe.document.write(html);
    recipe.document.close();

    return false;
}*/



function loadDoc(url, cFunction) {
    jQuery.get(url,"",cFunction(this),"")
}

/*function loadDoc(url, cFunction) {
    //Create xmlhttp request
  var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
        } else {
        // code for IE6, IE5
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    //What to do when data is loaded
  xhttp.onreadystatechange = function() {
    // If loaded and successfully accessed ...
    if (this.readyState == 4 && this.status == 200) {
        // Callback function
        cFunction(this);
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
}*/

function loadHTMLdata(xhttp) {
    var dataString = xhttp;
    var data = jQuery.parseJSON(dataString);
    for (x in data) {
        //document.getElementById("articles").innerHTML = data[x].bib;
        $( "#articles" ).append( data[x].bib );
    };
      
}


/*var data = JSON.parse('{"item1":1, "item2":2}');
for (x in data) {
    document.getElementById("titles").innerHTML += data[x] + "<br>";
}*/