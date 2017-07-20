<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ext="http://some.namespace.com">
	<xsl:import href="attribute-sets.xsl"/>
	<xsl:output method="xml"
      indent="yes"
      standalone="no"
      doctype-public="-//W3C//DTD SVG 1.1//EN"
      doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
      media-type="image/svg"/>

	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="Main"
						page-width="8.5in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".1in">
					<fo:region-body margin-top="1.4in" margin-bottom="1.4in" column-count="1"/>
					<fo:region-before extent="1.3in" region-name="Main.Header"/>
					<fo:region-after extent="1.2in" region-name="Main.Footer"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<xsl:apply-templates select="results"/>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="results">
		<fo:page-sequence master-reference="Main" initial-page-number="1">
			<xsl:call-template name="static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block id="{'title-page'}">
					<xsl:apply-templates select="module"/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template match="module">
	<fo:block xsl:use-attribute-sets="bold-titles" text-align="left">
			<xsl:value-of select="concat(descendant::ata/text(),' ')"/>
			<xsl:value-of select="descendant::fileName/text()"/>
		</fo:block>
		<fo:block xsl:use-attribute-sets="normal-text" padding-after=".5in" keep-together.within-page="always">
			<fo:table>
				<fo:table-column column-number="1" column-width="1in"></fo:table-column>
				<fo:table-column column-number="2" column-width="1in"></fo:table-column>
				<fo:table-column column-number="3" column-width="1in"></fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="4" padding-bottom="3pt">
							<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="12pt">
								Checking Information
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell >
							<fo:block>
								Terminology
							</fo:block>
						</fo:table-cell><!--
						<fo:table-cell >
							<fo:block text-align-last="justify">
								<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" >
								  <rect x="10" y="10" width="10px" 
									height="{10}" fill="red" stroke="black"/>  
								</svg>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select='format-number(($terminology div $total)*100,"#.00")'/>
							</fo:block>
						</fo:table-cell>-->
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select="concat(descendant::termCount/text(),' issues')"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell >
							<fo:block>
								Spelling
							</fo:block>
						</fo:table-cell><!--
						<fo:table-cell >
							<fo:block text-align-last="justify">
								<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" >
								  <rect x="10" y="10" width="10px" 
									height="{10}" fill="red" stroke="black"/>  
								</svg>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select='format-number(($spelling div $total)*100,"#.00")'/>
							</fo:block>
						</fo:table-cell>-->
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select="concat(descendant::spellCount/text(),' issues')"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell >
							<fo:block>
								Grammar
							</fo:block>
						</fo:table-cell><!--
						<fo:table-cell >
							<fo:block text-align-last="justify">
								<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" >
								  <rect x="10" y="10" width="10px" 
									height="{10}" fill="red" stroke="black"/>  
								</svg>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select='format-number(($grammar div $total)*100,"#.00")'/>
							</fo:block>
						</fo:table-cell>-->
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select="concat(descendant::grammarCount/text(),' issues')"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell >
							<fo:block>
								Style
							</fo:block>
						</fo:table-cell><!--
						<fo:table-cell >
							<fo:block text-align-last="justify">
								<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" >
								  <rect x="10" y="10" width="10px" 
									height="{10}" fill="red" stroke="black"/>  
								</svg>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select='format-number(($style div $total)*100,"#.00")'/>
							</fo:block>
						</fo:table-cell>-->
						<fo:table-cell >
							<fo:block>
								<xsl:value-of select="concat(descendant::styleCount/text(),' issues')"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="head">
		<fo:block padding-after=".1in">
			<xsl:apply-templates select="descendant::identifier[parent::inputText]"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="identifier">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left">
			<xsl:value-of select="ext:getATA('dave')"/>
			<xsl:value-of select="concat(' ',@filename)"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="static-content">
		<fo:static-content flow-name="Main.Header">
			<fo:block >
				<fo:block font-family="arial" font-size="9pt" text-align="left">
					<fo:external-graphic src="C:\inetpub\wwwroot\Projects\AcroLinx\Acrolinx\RCMTLogo.jpg"></fo:external-graphic>
					<fo:leader leader-length="100%" leader-pattern="rule"/>
				</fo:block>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="Main.Footer">
		<fo:block padding-after=".2in">
			<fo:block border-width="1px">
		</fo:block>
		</fo:block>
		</fo:static-content>
	</xsl:template>
	
</xsl:stylesheet>