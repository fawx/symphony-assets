/*
 * page functions are grouped by <body>'s class.
 * all pages in a class fire init().
 * named functions are fired according to <body>'s id.
 * hyphens are stripped from classes and ids automatically.
 *
 */


PROJECTNAME = {
    common : {
        init : function() {
            // all external links should open in a new tab
            $("a[href^='http']").attr("target", "_blank");
        }
    }
}

UTIL = {
    fire : function(func,funcname, args){
       var namespace = PROJECTNAME;  
       funcname = (funcname === undefined) ? 'init' : funcname;
       if (func !== '' && namespace[func] && typeof namespace[func][funcname] == 'function'){
           namespace[func][funcname](args);
       } 
    }, 
    loadEvents : function() {
         var bodyId = document.body.id;
         // hit up common first.
         UTIL.fire('common');
         // do all the classes too.
         $.each(document.body.className.split(/\s+/), function(i, classnm) {
             UTIL.fire(classnm.replace(/-/g, ''));
             UTIL.fire(classnm.replace(/-/g, ''),bodyId);
         });
         UTIL.fire('common','finalize');
     } 
}; 

$(document).ready(UTIL.loadEvents);
