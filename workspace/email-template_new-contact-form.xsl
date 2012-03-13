<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
    <h1 style="font-size: 16px; font-weight: bold;">A new contact form has been submitted</h1>
    <xsl:for-each select="/data/contact-form-by-id/entry"> <!-- context -->
        <p>
            <strong>Name:</strong> <xsl:text> </xsl:text> <xsl:value-of select="name" />
        </p>
        <p>
            <strong>Email:</strong> <xsl:text> </xsl:text> <xsl:value-of select="email" />
        </p>

        <br /><br />

        <xsl:copy-of select="message/*" />
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
