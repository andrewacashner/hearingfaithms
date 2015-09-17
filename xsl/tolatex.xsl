<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xpath-default-namespace="http://www.tei-c.org/ns/1.0">
  <xsl:output method="text" indent="yes"/>

  <!--
  <xsl:template match="text()">
    <xsl:value-of select="normalize-space()" />
  </xsl:template>
  -->

  <xsl:strip-space elements="*" />
  <xsl:preserve-space elements="p" />
  
  <xsl:template match="/">
    <xsl:text>% Converted from TEI-XML by Andrew's custom XSL teitolatex.xsl
\documentclass[oneside,12pt]{book}
\usepackage{tgtermes}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[american]{babel}
\usepackage{microtype}
\usepackage{csquotes}
\usepackage[notes]{biblatex-chicago}
\addbibresource{vcbook.export.bib}
\usepackage[margin=1in]{geometry}
\usepackage[none]{hyphenat}
\usepackage{setspace}
\doublespacing
\usepackage{sectsty}
\allsectionsfont{\large\bfseries}
\frenchspacing
\raggedbottom
</xsl:text>
    <xsl:apply-templates />
 </xsl:template>

  <xsl:template match="teiHeader">
    <!-- Discard header (instead, could include as comments) -->
  </xsl:template>

  <xsl:template match="TEI/text">
    <xsl:text>&#xA;\begin{document}&#xA;</xsl:text>
    <xsl:apply-templates />
    <xsl:text>&#xA;\end{document}&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="front">
    <xsl:text>&#xA;\frontmatter&#xA;</xsl:text>
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="titlePage">
    <xsl:text>&#xA;\clearpage&#xA;</xsl:text>
    <xsl:apply-templates />
    <xsl:text>
\maketitle
\tableofcontents
</xsl:text>
  </xsl:template>

  <xsl:template match="titlePart">
    <xsl:text>&#xA;\title{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}&#xA;</xsl:text>
  </xsl:template>
  <xsl:template match="byline">
    <xsl:text>&#xA;\author{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>
  <xsl:template match="docDate">
    <xsl:text>&#xA;\date{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="body">
    <xsl:text>&#xA;\mainmatter&#xA;</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div">
    <xsl:text>&#xA;\</xsl:text>
    <xsl:value-of select="@type" />
    <xsl:text>{</xsl:text>
    <xsl:value-of select="normalize-space(head)" />
    <xsl:text>}&#xA;</xsl:text>
    <xsl:text>\label{</xsl:text>
    <xsl:value-of select="@xml:id" />
    <xsl:text>}&#xA;</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='bibliography']">
    <xsl:text>&#xA;\printbibliography&#xA;</xsl:text>
  </xsl:template>
  
  <xsl:template match="head">
  </xsl:template>
  
  
  <xsl:template match="p">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="emph|term|foreign|title">
    <xsl:text>\emph{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>
  <xsl:template match="soCalled">
    <xsl:text>\enquote{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="q">
    <xsl:choose>
      <xsl:when test="@type='block'">
	<xsl:text>\begin{quote}&#xA;</xsl:text>
	<xsl:apply-templates />
	<xsl:text>&#xA;\end{quote}</xsl:text>
      </xsl:when>
      <xsl:when test="@type='textTranslation'">
	<xsl:text>&#xA;\begin{quote}&#xA;\emph{</xsl:text>
	<xsl:value-of select="normalize-space(seg[@type='orig'])" />
	<xsl:text>}&#xA;&#xA;</xsl:text>
	<xsl:value-of select="normalize-space(seg[@type='trans'])" />
	<xsl:text>&#xA;\end{quote}&#xA;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>\enquote{</xsl:text>
	<xsl:apply-templates />
	<xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="note">
    <xsl:text>%&#xA;\footnote{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="ptr">
    <xsl:choose>
      <xsl:when test="@type='doc'">
	<xsl:text>\ref</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>\autocite</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>{</xsl:text>
    <xsl:value-of select="translate(@target,'#','')" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="epigraph[cit]">
    <xsl:text>&#xA;\epigraph{</xsl:text>
    <xsl:value-of select="q" />
    <xsl:text>}{</xsl:text>
    <xsl:value-of select="bibl" />
    <xsl:text>}&#xA;</xsl:text>
  </xsl:template>

  

</xsl:transform>
