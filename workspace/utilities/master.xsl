<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">




<xsl:import href="head.xsl" />
<xsl:import href="scripts.xsl" />




<xsl:output method="xml" 
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" 
    omit-xml-declaration="yes" 
    indent="yes" />




<xsl:template match="/">
    <xsl:comment><![CDATA[[if lte IE 8]> <html lang="en" class="ie"> <![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if gt IE 9]><!]]></xsl:comment> <html lang="en" class="no-js"> <xsl:comment><![CDATA[<![endif]]]></xsl:comment>
        <xsl:call-template name="head" />



        <body class="{$current-page}">
            <header>
                <nav>
                    <ul>
                        <!-- pages that shouldn't show up in navigation should have the type 'nonav' -->
                        <xsl:apply-templates select="/data/navigation/page[not(types//type = 'nonav')]" />
                    </ul>
                </nav>
            </header>


            <div class="page-content">
                <xsl:apply-templates select="/data" />
            </div>


            <footer>
                <small>&#169; <xsl:value-of select="$this-year" /> </small>
            </footer>


            <!-- scripts called at the end of page to speed up loading time -->
            <xsl:call-template name="scripts" />
        </body>
    </html>
</xsl:template>




<!-- navigation -->
<xsl:template match="navigation/page">
    <li>
        <xsl:attribute name="class">
            <xsl:value-of select="@handle" /><xsl:if test="$current-page = @handle"> active</xsl:if>
        </xsl:attribute>

        <a href="/{@handle}/">
            <xsl:value-of select="name" />
        </a>
    </li> 
</xsl:template>
</xsl:stylesheet>

