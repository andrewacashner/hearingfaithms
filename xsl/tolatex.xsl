<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xpath-default-namespace="http://www.tei-c.org/ns/1.0">
  <xsl:output method="text" indent="yes"/>

  <xsl:template match="text()">
    <xsl:value-of select="normalize-space()" />
  </xsl:template>

  <xsl:template match="/">
    <xsl:text>% Converted from TEI-XML by Andrew's custom XSL teitolatex.xsl
\documentclass{memoir}
\usepackage{lmodern}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[american]{babel}
\usepackage{microtype}
\usepackage{csquotes}
\usepackage[notes]{biblatex-chicago}
\addbibresource{master.bib}
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
    <xsl:text>&#xA;\begin{titlingpage}&#xA;</xsl:text>
    <xsl:apply-templates />
    <xsl:text>&#xA;\maketitle&#xA;\end{titlingpage}&#xA;\tableofcontents*&#xA;</xsl:text>
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

  <xsl:template match="div[@type='chapter']">
    <xsl:text>&#xA;\chapter{</xsl:text>
    <xsl:value-of select="normalize-space(head)" />
    <xsl:text>}&#xA;\label{</xsl:text>
    <xsl:value-of select="@xml:id" />
    <xsl:text>}&#xA;</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='section']">
    <xsl:text>&#xA;\section{</xsl:text>
    <xsl:value-of select="head" />}
    <xsl:text>&#xA;\label{</xsl:text>
    <xsl:value-of select="@xml:id" />
    <xsl:text>}&#xA;</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='subsection']">
    <xsl:text>&#xA;\subsection{</xsl:text>
    <xsl:value-of select="normalize-space(head)" />
    <xsl:text>}&#xA;</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='subsubsection']">
    <xsl:text>&#xA;\subsubsection{</xsl:text>
    <xsl:value-of select="normalize-space(head)" />
    <xsl:text>}&#xA;</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="head">
  </xsl:template>
  
  
  <xsl:template match="p">
    <xsl:text>&#xA;</xsl:text>
    <xsl:apply-templates />
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="emph">
    <xsl:text>\emph{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>
  <xsl:template match="term">
    <xsl:text>\emph{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>
  <xsl:template match="foreign">
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
    <xsl:text>\enquote{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>
  <xsl:template match="note">
    <xsl:text>\footnote{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="ptr[@type='bib']">
    <xsl:text>\autocite{</xsl:text>
    <xsl:value-of select="translate(@target,'#','')" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="ptr[@type='doc']">
    <xsl:text>\ref{</xsl:text>
    <xsl:value-of select="translate(@target,'#','')" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <!-- TODO ambiguous rule-->
  <xsl:template match="div[@type='chapter' and @xml:id='biblio']">
    <xsl:text>&#xA;\printbibliography&#xA;</xsl:text>
  </xsl:template>

</xsl:transform>
