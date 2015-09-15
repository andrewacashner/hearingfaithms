<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xpath-default-namespace="http://www.tei-c.org/ns/1.0">
  <xsl:output method="text"/>
  
 <xsl:template match="/">
    % Converted from TEI-XML by Andrew's custom XSL teitolatex.xsl
    \documentclass{memoir}
    \usepackage{lmodern}
    \usepackage[T1]{fontenc}
    \usepackage[utf8]{inputenc}
    \usepackage[american]{babel}
    \usepackage{microtype}
    \usepackage{csquotes}
    <xsl:apply-templates />
 </xsl:template>

  <xsl:template match="teiHeader">
    <!-- Discard header (instead, could include as comments) -->
  </xsl:template>

  <xsl:template match="text">
    \begin{document}
    <xsl:apply-templates />
    \end{document}
  </xsl:template>

  <xsl:template match="front">
    \frontmatter
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="titlePage">
    \begin{titlingpage}
    <xsl:apply-templates />
    \maketitle
    \end{titlingpage}
    \tableofcontents*
  </xsl:template>
  <xsl:template match="titlePart">
    \title{<xsl:apply-templates />}
  </xsl:template>
  <xsl:template match="byline">
    \author{<xsl:apply-templates />}
  </xsl:template>
  <xsl:template match="docDate">
    \date{<xsl:apply-templates />}
  </xsl:template>

  <xsl:template match="body">
    \mainmatter
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='chapter']">
    \chapter{<xsl:value-of select="head" />}
    \label{<xsl:value-of select="@xml:id" />}
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='section']">
    \section{<xsl:value-of select="head" />}
    \label{<xsl:value-of select="@xml:id" />}
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='subsection']">
    \subsection{<xsl:value-of select="head" />}
    \label{<xsl:value-of select="@xml:id" />}
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="div[@type='subsubsection']">
    \subsection{<xsl:value-of select="head" />}
    \label{<xsl:value-of select="@xml:id" />}
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="head"></xsl:template>
  
    
  <xsl:template match="p"><xsl:apply-templates />
    
  </xsl:template>

  <xsl:template match="emph">\emph{<xsl:apply-templates />}</xsl:template>
  <xsl:template match="soCalled">\enquote{<xsl:apply-templates />}</xsl:template>

  <xsl:template match="note">\footnote{<xsl:apply-templates />}</xsl:template>

  <xsl:template match="ptr[@type='bib']">\autocite{<xsl:value-of select="@target" />}</xsl:template>
  <xsl:template match="ptr[@type='doc']">\ref{<xsl:value-of select="@target" />}</xsl:template>
  
  
</xsl:transform>
