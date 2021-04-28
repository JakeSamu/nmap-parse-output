<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:npo="http://xmlns.sven.to/npo">
<npo:comment>
        Extracts a list of all SSH ports in host:port format.
</npo:comment>
<npo:category>extract</npo:category>

    <xsl:output method="text" />
    <xsl:strip-space elements="*" />
    <xsl:template match="/nmaprun/host/ports/port[state/@state='open' and (service/@name='ssh')]">
        <xsl:choose>
            <xsl:when test="../../hostnames/hostname/@name != ''">
                <xsl:value-of select="../../hostnames/hostname/@name" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="../../address/@addr" />
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>:</xsl:text>
        <xsl:value-of select="@portid"/>
        <xsl:text>
</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="text()" />
</xsl:stylesheet>
