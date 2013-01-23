<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">




<!-- <head> -->
<xsl:template name="head">
    <meta charset="utf-8" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <meta name="viewport" content="width=device-width" />


    <title>
        <xsl:call-template name="title" />
        <xsl:text> | </xsl:text>
        <xsl:value-of select="data/params/website-name" />
    </title>


    <link rel="stylesheet" href="{$workspace}/css/style.css" />


    <script src="{$workspace}/js/libs/modernizr-2.6.2.min.js"></script>
</xsl:template>



<xsl:template name="title">
    <xsl:value-of select="/data/params/page-title" />
</xsl:template>
</xsl:stylesheet>
