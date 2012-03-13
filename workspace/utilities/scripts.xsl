<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- javascript to run at the end of page load -->
<xsl:template name="scripts">
    <script>
        window._gaq = [['_setAccount','UAXXXXXXXX1'],['_trackPageview'],['_trackPageLoadTime']];
        Modernizr.load({
            load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'
        });
    </script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('&lt;script src="/workspace/js/libs/jquery-1.7.1.min.js">&lt;\/script>')</script>

    <script type="text/javascript" src="{$workspace}/js/plugins.js"></script>
    <script type="text/javascript" src="{$workspace}/js/script.js"></script>
    <!-- chrome frame -->
    <!--[if lt IE 7 ]>
        <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
        <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
    <![endif]-->
</xsl:template>
</xsl:stylesheet>
