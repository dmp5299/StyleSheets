<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ext="http://some.namespace.com">
	<xsl:import href="attribute-sets.xsl"/>
	<xsl:import href="tables1.xsl"/>
	<xsl:output indent="yes"/>

	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="Main"
						page-width="8.5in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".1in">
					<fo:region-body margin-top="1.1in" margin-bottom="1.4in" column-count="1"/>
					<fo:region-before extent="1.1in" region-name="Main.Header"/>
					<fo:region-after extent="1.2in" region-name="Main.Footer"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
			</fo:layout-master-set><!--
			<fo:bookmark-tree>
				<fo:bookmark internal-destination="{'title-page'}" starting-state="hide">
					<fo:bookmark-title>
						<xsl:value-of select="concat(descendant::dmCode[1]/@modelIdentCode,'-',descendant::dmCode[1]/@systemDiffCode,'-',descendant::dmCode[1]/@systemCode,
						'-',descendant::dmCode[1]/@subSystemCode,descendant::dmCode[1]/@subSubSystemCode,'-',descendant::dmCode[1]/@assyCode,'-',
										descendant::dmCode[1]/@disassyCode,descendant::dmCode[1]/@disassyCodeVariant,'-',
										descendant::dmCode[1]/@infoCode,descendant::dmCode[1]/@infoCodeVariant,'-',descendant::dmCode[1]/@itemLocationCode)"/>
					</fo:bookmark-title>
				</fo:bookmark>
			</fo:bookmark-tree>-->
			<xsl:apply-templates select="dmodule"/>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="reasonForUpdate">
		<fo:change-bar-begin change-bar-class="{@id}" change-bar-style="solid"/>
			<xsl:apply-templates/>
		<fo:change-bar-end change-bar-class="{@id}"/>
	</xsl:template>
	
	<xsl:template match="dmodule">
		<fo:page-sequence master-reference="Main" initial-page-number="1">
			<xsl:call-template name="static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block id="{'title-page'}">
					<xsl:apply-templates select="descendant::dmtitle[1]"/>
					<xsl:apply-templates select="descendant::content"/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template match="dmtitle">
		<fo:block padding-after=".2in" color="blue" xsl:use-attribute-sets="bold-titles" text-align="left" font-weight="normal">
			<xsl:value-of select="techname/text()"/>
				<xsl:text> - </xsl:text>
			<xsl:value-of select="infoname/text()"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="toc">
		<fo:block padding-bottom=".2in">
			<fo:table>
				<fo:table-column column-number="1" column-width="3.49in"></fo:table-column>
				<fo:table-column column-number="2" column-width="3.49in"></fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2" padding-bottom="3pt">
							<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="12pt">
								Table of Contents
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								Paragraph / Topic
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
								Page
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="descendant::procedure|descendant::description|descendant::preliminaryRqmts|descendant::closeRqmts">
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:choose>
											<xsl:when test="self::procedure">Procedure</xsl:when>
											<xsl:when test="self::preliminaryRqmts">Preliminary Requirements</xsl:when>
											<xsl:when test="self::closeRqmts">Closing Requirements</xsl:when>
											<xsl:when test="self::description">Description</xsl:when>
										</xsl:choose>
										<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
											<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="lot">
		<fo:block padding-bottom=".2in">
			<fo:table>
				<fo:table-column column-number="1" column-width=".3in"></fo:table-column>
				<fo:table-column column-number="2" column-width="3.34in"></fo:table-column>
				<fo:table-column column-number="3" column-width="3.34in"></fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2" padding-bottom="3pt">
							<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="12pt">
								List of Tables
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								Table title
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
								Page
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="descendant::table">
						<fo:table-row>
							<fo:table-cell>
								<fo:block >
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:number count="table" level="single" format="1"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:value-of select="./title"/>
										<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
											<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="lof">
		<fo:block padding-bottom=".2in">
			<fo:table>
				<fo:table-column column-number="1" column-width=".3in"></fo:table-column>
				<fo:table-column column-number="2" column-width="3.34in"></fo:table-column>
				<fo:table-column column-number="3" column-width="3.34in"></fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2" padding-bottom="3pt">
							<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="12pt">
								List of Figures
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								Table title
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom=".1in">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
								Page
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="descendant::figure">
						<fo:table-row>
							<fo:table-cell>
								<fo:block >
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:number count="figure" level="any" from="dmodule"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:value-of select="./title"/>
										<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
											<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="mainfunc">
	<fo:block xsl:use-attribute-sets="bold-titles" color="blue" text-align="center" padding-bottom=".2in" keep-with-next.within-page="always">
			Procedure
		</fo:block>
	<xsl:apply-templates/></xsl:template>
	
	<xsl:template match="step1|step2|step3|step4|step5">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="levelledPara">
		<fo:block id="{generate-id(.)}" xsl:use-attribute-sets="bold-titles">
					<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/descendant::dmCode[1]/@modelIdentCode,'-',ancestor::dmodule/descendant::dmCode[1]/@systemDiffCode,'-',ancestor::dmodule/descendant::dmCode[1]/@systemCode,
						'-',ancestor::dmodule/descendant::dmCode[1]/@subSystemCode,ancestor::dmodule/descendant::dmCode[1]/@subSubSystemCode,'-',ancestor::dmodule/descendant::dmCode[1]/@assyCode,'-',
										ancestor::dmodule/descendant::dmCode[1]/@disassyCode,ancestor::dmodule/descendant::dmCode[1]/@disassyCodeVariant,'-',
										ancestor::dmodule/descendant::dmCode[1]/@infoCode,ancestor::dmodule/descendant::dmCode[1]/@infoCodeVariant,'-',ancestor::dmodule/descendant::dmCode[1]/@itemLocationCode)"/>
					</fo:marker>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="title[parent::levelledPara][count(ancestor::levelledPara)=1]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent=".52in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".5in" provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="levelledPara" format="1"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="acroterm">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<fo:inline white-space-treatment="preserve">
				<xsl:apply-templates/>
			</fo:inline>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="xref">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:variable name="id" select="@xrefid"/>
			<fo:basic-link internal-destination="{@xrefid}" white-space-treatment="preserve">
				<xsl:choose>
					<xsl:when test="@xidtype='supply'">
						<xsl:attribute name="font-style">italic</xsl:attribute>
						<xsl:value-of select="concat('Supplies: ',/descendant::supply[@id=$id]/descendant::nomen/text())"/>
					</xsl:when>
					<xsl:when test="@xidtype='figure'">
						<xsl:for-each select="ancestor::dmodule/descendant::figure">
							<xsl:if test="@id=$id">
									<xsl:text>Figure </xsl:text>
									<xsl:number count="figure" level="any" from="dmodule"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:when test="@xidtype='table'">
						<xsl:for-each select="ancestor::dmodule/descendant::table">
							<xsl:if test="@id=$id">
									<xsl:text>Table </xsl:text>
									<xsl:number count="table" level="any" from="dmodule"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
				</xsl:choose>
			</fo:basic-link>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="para[parent::step1 or parent::step2 or parent::step3 or parent::step4 or parent::step5][not(preceding-sibling::para)][not(preceding-sibling::title)]|
		title[parent::step1 or parent::step2 or parent::step3 or parent::step4 or parent::step5][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block id="{generate-id(.)}" padding-after=".1in">
			<fo:block xsl:use-attribute-sets="normal-text" text-align="left" start-indent="0">	
				<xsl:if test="self::title">
					<xsl:attribute name="font-weight">bold</xsl:attribute>
				</xsl:if>
				<fo:list-block provisional-distance-between-starts=".8in" text-indent="0">
					<fo:list-item>
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:if test="not(preceding-sibling::title)">
								<xsl:choose>
									<xsl:when test="parent::step1">
										<xsl:number count="step1" level="multiple" format="1"/>
									</xsl:when>
									<xsl:when test="parent::step2">
										<xsl:number count="step1|step2" level="multiple" format="1.1"/>
									</xsl:when>
									<xsl:when test="parent::step3">
										<xsl:number count="step1|step2|step3" level="multiple" format="1.1.1"/>
									</xsl:when>
									<xsl:when test="parent::step4">
										<xsl:number count="step1|step2|step3|step4" level="multiple" format="1.1.1.1"/>
									</xsl:when>
									<xsl:when test="parent::step5">
										<xsl:number count="step1|step2|step3|step4|step5" level="multiple" format="1.1.1.1.1"/>
									</xsl:when>
								</xsl:choose>
								</xsl:if>
							</fo:block>
						</fo:list-item-label>
						<fo:list-item-body start-indent="body-start()">
							<fo:block>
								<xsl:apply-templates/>
							</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
			</fo:block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="note">
		<fo:block id="{generate-id(.)}" keep-together.within-page="always" start-indent=".8in">
			<xsl:attribute name="padding-after">.1in</xsl:attribute>
			<xsl:if test="ancestor::entry">
				<xsl:attribute name="start-indent">.1in</xsl:attribute>
			</xsl:if>
			<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" text-align="center" space-after=".1in" keep-with-next.within-page="always">
				Note
			</fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="notePara">
		<fo:block xsl:use-attribute-sets="normal-text">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="reqSupplies">
		<fo:block space-after=".2in" id="{generate-id(.)}">
			<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
				Consumables, Materials and Expendables
			</fo:block>
			<fo:table>
				<fo:table-column column-number="1" column-width="1.76in"/>
				<fo:table-column column-number="2" column-width="1.79in"/>
				<fo:table-column column-number="3" column-width=".55in"/>
				<fo:table-column column-number="4" column-width="2.93in"/>
				<fo:table-header><!--
					<fo:table-row>
						<fo:table-cell number-columns-spanned="4" space-after="2pt" text-align="center" xsl:use-attribute-sets="normal-text" font-style="italic"
						start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block>
							<xsl:variable name="count"><xsl:number
							count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/></xsl:variable>
								Table <xsl:value-of select="$count + 1"/>
								<fo:leader leader-length=".06in"/>
								<xsl:value-of select="'Consumables, Materials and Expendables'"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>-->
					<fo:table-row>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Name
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Identification No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Qty
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Remarks
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<xsl:choose>
					<xsl:when test="./noSupplies">
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0" number-columns-spanned="4">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										None
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>						
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="supplyDescrGroup">
		<fo:table-body>
			<xsl:apply-templates select="supplyDescr"/>
		</fo:table-body>
	</xsl:template>
	
	<xsl:template match="spareDescrGroup">
		<fo:table-body>
			<xsl:apply-templates select="spareDescr"/>
		</fo:table-body>
	</xsl:template>
	
	<xsl:template match="supplyDescr|spareDescr">
		<fo:table-row>
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::supplyDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text" id="{generate-id(.)}">
					<xsl:apply-templates select="name"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::supplyDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="identNumber"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::supplyDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="reqQuantity"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell start-indent="0">
				<xsl:if test="not(following-sibling::supplyDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:leader/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="graphic">
		<fo:block text-align="center" width="7in" padding-after=".1in" start-indent="0" break-before="page" font-family="arial">
		<xsl:variable name="graphicPath">
			<xsl:value-of select="ext:getGraphicPath('dave')"/>
		</xsl:variable>
			<xsl:choose>
				<xsl:when test="count(../graphic) &gt; 1">
					<fo:block xsl:use-attribute-sets="normal-text" font-size="12pt" keep-together.within-page="always"
					break-after="page">
						Figure <xsl:number count="figure" level="any" from="dmodule"/>
						<fo:leader leader-length=".06in"/>
						<xsl:value-of select="ancestor::figure[1]/title/text()"/>
						<fo:leader leader-length=".06in"/>
						(Sheet <xsl:value-of select="position()"/>
						of<fo:leader leader-length=".06in"/>
						<xsl:value-of select="count(ancestor::figure[1]/graphic)"/>)
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="ancestor::figure/title"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
			<xsl:when test="ext:fileExists(concat(@boardno,'.cgm'))" >
				<fo:external-graphic  content-height="200mm" scaling="uniform" content-width="7in">
					<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat($graphicPath,'/',@boardno,'.cgm')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@boardno,'.jpg'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
					<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@boardno,'.jpg')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@boardno,'.png'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
				<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@boardno,'.png')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@boardno,'.tif'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
					<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@boardno,'.tif')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'Graphic Not Found'"/>
			</xsl:otherwise>
		</xsl:choose>
		</fo:block>
	</xsl:template>

	<xsl:template match="figure/title">
		<fo:block xsl:use-attribute-sets="normal-text" font-size="10pt">
			Figure <xsl:number count="figure" level="any" from="dmodule"/>
			<fo:leader leader-length=".06in"/>.
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="figure">

		<fo:block id="{@id}" keep-together.within-page="always">
			<xsl:apply-templates select="./graphic"/>
			
		</fo:block>
	</xsl:template>
	
	<xsl:template match="reqSupportEquips">
		<fo:block space-after=".2in" id="{generate-id(.)}">		
			<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
				Support Equipment
			</fo:block>
			<fo:table >
				<fo:table-column column-number="1" column-width="1.76in"/>
				<fo:table-column column-number="2" column-width="1.79in"/>
				<fo:table-column column-number="3" column-width=".55in"/>
				<fo:table-column column-number="4" column-width="2.93in"/>
				<fo:table-header><!--
					<fo:table-row>
						<fo:table-cell number-columns-spanned="4" space-after="2pt" text-align="center" xsl:use-attribute-sets="normal-text" font-style="italic"
						start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block>
								<xsl:variable name="count"><xsl:number
								count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/></xsl:variable>
								Table <xsl:value-of select="$count + 1"/>
								<fo:leader leader-length=".06in"/>
								<xsl:value-of select="'Support Equipment'"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>-->
					<fo:table-row>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Name
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Identification No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" >
							Qty
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Remarks
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<xsl:choose>
					<xsl:when test="noSupportEquips">
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0" number-columns-spanned="4">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										None
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>						
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="safety|spares">
		<fo:block padding-after=".2in" id="{generate-id(.)}">
			<fo:block xsl:use-attribute-sets="bold-titles" color="red" text-align="left" keep-with-next.within-page="always">
				<xsl:choose>
					<xsl:when test="self::safety">
						Safety Conditions:
					</xsl:when>
					<xsl:otherwise>
						Spares:
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<xsl:choose>
				<xsl:when test="nospares">
					<fo:block xsl:use-attribute-sets="normal-text">
						No spares are required
					</fo:block>
				</xsl:when>
				<xsl:when test="nosafety">
					<fo:block xsl:use-attribute-sets="normal-text">
						No safety requirements
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="supportEquipDescrGroup">
		<fo:table-body>
			<xsl:apply-templates select="supportEquipDescr"/>
		</fo:table-body>
	</xsl:template>
	
	<xsl:template match="supportEquipDescr">
		<fo:table-row>
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::supportEquipDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text" id="{generate-id(.)}">
					<xsl:apply-templates select="name"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::supportEquipDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="identNumber"/>
				</fo:block>
			</fo:table-cell >
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::supportEquipDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="reqQuantity"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell start-indent="0">
				<xsl:if test="not(following-sibling::supportEquipDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="remarks/simplePara"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="identNumber">
		<xsl:value-of select="'Pt. No: '"/>
		<xsl:apply-templates select="partAndSerialNumber"/>
		<fo:block/>
	    <xsl:value-of select="'NSCM: '"/>
		<xsl:apply-templates select="manufacturerCode"/>		
	</xsl:template>
	
	<xsl:template match="remarks|reqQuantity">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="simplePara">
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="internalRef[@internalRefTargetType='irtt05']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::supportEquipDescr">
				<xsl:if test="@id=$id">
					<xsl:variable name="name">
						<xsl:value-of select="name"/>
					</xsl:variable>
					<xsl:variable name="partnumber">
						<xsl:value-of select="descendant::partNumber"/>
					</xsl:variable>
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:value-of select="concat($name,' (Pt. No. ',$partnumber,')')"/>						
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="internalRef[@internalRefTargetType='graphic']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:if test="parent::title">
				<xsl:attribute name="font-size">14pt</xsl:attribute>
			</xsl:if>
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::graphic" >
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:text>Figure </xsl:text>
						<xsl:number count="figure" level="any" from="dmodule"/>
						<xsl:value-of select="' sheet '"/>
						<xsl:number count="graphic" level="single" from="figure"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="internalRef[@internalRefTargetType='step']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::proceduralStep ">
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:value-of select="'step '"/>
						<xsl:choose>
							<xsl:when test="count(ancestor::proceduralStep)= 0">
								<xsl:number count="proceduralStep" level="multiple" format="1"/>
							</xsl:when>							
							<xsl:when test="count(ancestor::proceduralStep) = 1">
								<xsl:number count="proceduralStep" level="multiple" format="1.1"/>
							</xsl:when>
							<xsl:when test="count(ancestor::proceduralStep) = 2">
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1"/>
							</xsl:when>
							<xsl:when test="count(ancestor::proceduralStep) = 3">
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1"/>
							</xsl:when>
							<xsl:when test="count(ancestor::proceduralStep) = 4">
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1.1"/>
							</xsl:when>
							<xsl:when test="count(ancestor::proceduralStep) = 5">
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1.1.1"/>
							</xsl:when>
							<xsl:when test="count(ancestor::proceduralStep) = 6">
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1.1.1.1"/>
							</xsl:when>
						</xsl:choose>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="internalRef[@internalRefTargetType='spares']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::spareDescr">
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:value-of select="name"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>

	<xsl:template match="internalRef[@internalRefTargetType='irtt04']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::supplyDescr">
				<xsl:if test="@id=$id">
					<xsl:variable name="name">
						<xsl:value-of select="name"/>
					</xsl:variable>
					<xsl:variable name="partnumber">
						<xsl:value-of select="descendant::partNumber"/>
					</xsl:variable>
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:value-of select="concat($name,' (Pt. No. ',$partnumber,')')"/>					
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>

	<xsl:template match="internalRef[@internalRefTargetType='irtt01']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:if test="parent::title">
				<xsl:attribute name="font-size">14pt</xsl:attribute>
			</xsl:if>
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::figure">
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:text>Figure </xsl:text>
						<xsl:number count="figure" level="any" from="dmodule"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="internalRef[@internalRefTargetType='figure']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:if test="parent::title">
				<xsl:attribute name="font-size">14pt</xsl:attribute>
			</xsl:if>
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::figure">
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:text>Figure </xsl:text>
						<xsl:number count="figure" level="any" from="dmodule"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="para">
		<fo:block xsl:use-attribute-sets="normal-text" padding-after=".1in" start-indent=".8in">
			<xsl:if test="parent::listItem">
				<xsl:attribute name="start-indent">1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="parent::commonInfo">
				<xsl:attribute name="start-indent">0</xsl:attribute>
			</xsl:if>
			<xsl:if test="ancestor::entry|ancestor::warning">
				<xsl:attribute name="start-indent">
					0
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="ancestor::thead">
				<xsl:attribute name="font-weight">bold</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="internalRef[@internalRefTargetType='irtt02']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:if test="parent::title">
				<xsl:attribute name="font-size">14pt</xsl:attribute>
			</xsl:if>
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::table">
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:text>Table </xsl:text>
						<xsl:variable name="count">
							<xsl:number
						count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/>
						</xsl:variable>
						<xsl:value-of select="$count+1"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="internalRef[@internalRefTargetType='table']">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<xsl:if test="parent::title">
				<xsl:attribute name="font-size">14pt</xsl:attribute>
			</xsl:if>
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::dmodule/descendant::table">
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{generate-id(.)}" white-space-treatment="preserve">
						<xsl:text>Table </xsl:text>
						<xsl:variable name="count">
							<xsl:number
						count="table" format="1" from="dmodule" level="any"/>
						</xsl:variable>
						<xsl:value-of select="$count"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>
	<!--
	<xsl:template match="reqCondGroup">
		<xsl:choose>
			<xsl:when test="noConds">
				<fo:block padding-after=".2in" id="{generate-id(.)}" span="all">
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Required Conditions
					</fo:block>
					<fo:table>
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.93in"/>
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell padding-after="2pt" number-columns-spanned="4" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-style="italic" text-align="center" >
										<xsl:variable name="count">
											<xsl:number count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										Table <xsl:value-of select="concat($count + 1,' ','Required Conditions')"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>-
							<fo:table-row>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Nomenclature
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Identification No.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Qty
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Remarks
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0">
									<fo:block xsl:use-attribute-sets="normal-text">
										None
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block id="{generate-id(.)}" span="all">
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" keep-with-next.within-page="always">
						Required Conditions
					</fo:block>
					<fo:table start-indent="0" span="all">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:table-column column-number="1" column-width="3.49in"/>
						<fo:table-column column-number="2" column-width="3.49in"/>
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell padding-after="2pt" number-columns-spanned="2" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-style="italic" text-align="center" >
													<xsl:variable name="count">
														<xsl:number count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/>
													</xsl:variable>
													Table <xsl:value-of select="concat($count + 1,' ','Required Conditions')"/>
												</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text"  font-weight="bold">
										Data Module/Technical Publication
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text"  font-weight="bold">
										Title
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:apply-templates select="reqCondDm"/>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	-->
	<xsl:template match="reqSafety">
		<fo:block space-after=".2in" id="{generate-id(.)}">
			<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
				Safety Conditions
			</fo:block>
			<xsl:choose>
				<xsl:when test="noSafety">
					<fo:block xsl:use-attribute-sets="normal-text">
						None
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="safetyRqmts">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="reqSpares">
		<fo:block space-after=".2in" id="{generate-id(.)}">
			
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Spares
					</fo:block>
					<fo:table>
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.93in"/>
						<fo:table-header><!--
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" space-after="2pt" text-align="center" xsl:use-attribute-sets="normal-text" font-style="italic"
								start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block>
									<xsl:variable name="count"><xsl:number
			count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/></xsl:variable>
										Table <xsl:value-of select="$count + 1"/>
										<fo:leader leader-length=".06in"/>
										<xsl:value-of select="'Spares'"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>-->
							<fo:table-row>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Name
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Identification No.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Qty
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Remarks
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<xsl:choose>
							<xsl:when test="noSpares">
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0" number-columns-spanned="4">
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text">
											None
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</fo:table-body>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates/>
							</xsl:otherwise>
						</xsl:choose>						
					</fo:table>
				</fo:block>
	</xsl:template>
	
	<xsl:template match="footnoteRef">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" vertical-align="super" font-size="6pt">
			<xsl:variable name="id" select="@internalRefId"/>
			<xsl:for-each select="ancestor::table/descendant::footnote">
				<xsl:if test="@id=$id">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:number count="footnote" from="table" format="1"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>	
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="footnote">
		<fo:block id="{@id}" xsl:use-attribute-sets="normal-text">
			<fo:inline xsl:use-attribute-sets="normal-text" color="blue" vertical-align="super" font-size="6pt">
				<xsl:number count="footnote" level="single" format="1"/>
			</fo:inline>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::footnote]">
		<fo:inline xsl:use-attribute-sets="normal-text">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="reqCondDm">
		<fo:table-row>
			<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0">
				<fo:block xsl:use-attribute-sets="normal-text" >
					<xsl:apply-templates select="descendant::dmCode"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0">
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="reqCond"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="content">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="prelreqs">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="safecond"><xsl:apply-templates/></xsl:template>
	
	<xsl:template match="warning|caution">
		<fo:block border-width="3px" border-style="solid" border-color="red" padding=".1in" keep-together.within-page="always" margin-bottom=".1in">
			<fo:block background-color="red" text-align="center" margin-bottom=".1in" font-weight="bold">
				<xsl:if test="self::warning">
					WARNING
				</xsl:if>
				<xsl:if test="self::caution">
					CAUTION
				</xsl:if>
			</fo:block>
			<xsl:apply-templates select="para"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="supequip|supplies">
		<fo:block space-after=".2in" id="{@id}">
			<fo:table>
				<fo:table-column column-number="1" column-width="1.74in"/>
				<fo:table-column column-number="2" column-width="1.74in"/>
				<fo:table-column column-number="3" column-width="1.74in"/>
				<fo:table-column column-number="4" column-width="1.74in"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell start-indent="0" number-columns-spanned="4">
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-titles" color="red" text-align="left">
								<xsl:choose>
								<xsl:when test="self::supequip">
									Support Equipment Required:
								</xsl:when>
								<xsl:otherwise>
									Materials Required:
								</xsl:otherwise>
							</xsl:choose>
								
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Nomenclature
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							CAGE Code
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Part No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Quantity
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:choose>
						<xsl:when test="descendant::supequi">
							<xsl:apply-templates select="descendant::supequi"/>
						</xsl:when>
						<xsl:when test="descendant::supply">
							<xsl:apply-templates select="descendant::supply"/>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-row>
									<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0" number-columns-spanned="4">
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text">
											None
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
						</xsl:otherwise>
					</xsl:choose>	
				</fo:table-body>				
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="supequi|supply">
		<fo:table-row>
			<fo:table-cell padding-top="3pt" padding-bottom="3pt">
				<fo:block xsl:use-attribute-sets="normal-text" id="{@id}">
					<xsl:apply-templates select="descendant::nomen"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="3pt" padding-bottom="3pt">
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="descendant::mfc"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="3pt" padding-bottom="3pt">
				<fo:block xsl:use-attribute-sets="normal-text">
						<xsl:apply-templates select="descendant::pnr"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="3pt" padding-bottom="3pt">
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="descendant::qty"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="qty|pnr|mfc|nomen">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="proced">
		<fo:block xsl:use-attribute-sets="bold-titles" color="blue" text-align="center" padding-bottom=".2in" keep-with-next.within-page="always">
			Preliminary Requirements
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="reqpers">
		<fo:block space-after=".2in" id="{generate-id(.)}">
			<fo:table>
				<fo:table-column column-number="1" column-width="2.32in"/>
				<fo:table-column column-number="2" column-width="2.32in"/>
				<fo:table-column column-number="3" column-width="2.32in"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell start-indent="0" number-columns-spanned="3">
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-titles" color="red" text-align="left">
								Required Personnel:
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Personnel
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Category
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Trade
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<xsl:choose>
					<xsl:when test="asrequir">
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0" number-columns-spanned="4">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
								<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										As Required
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>						
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="warningAndCautionPara">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="commonInfo">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" text-align="center" space-after=".1in" keep-with-next.within-page="always">
			Applicability
		</fo:block>
		<fo:block xsl:use-attribute-sets="normal-text" padding-after=".1in">
			Applicable to: <xsl:value-of select="ancestor::dmodule/descendant::applic/descendant::simplePara/text()"/>
		</fo:block>
		<fo:block xsl:use-attribute-sets="italic-bold-titles" text-align="center" space-after=".1in" keep-with-next.within-page="always">
			Common information
		</fo:block>
		<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after=".1in">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="title[parent::commonInfo]">
		<fo:block padding-after=".1in"><xsl:apply-templates/></fo:block>
	</xsl:template>
	
	<xsl:template match="procedure"><fo:block id="{generate-id(.)}"/><xsl:apply-templates select="preliminaryRqmts|mainProcedure|closeRqmts|commonInfo"/></xsl:template>
	
	<xsl:template match="description">
		<fo:block xsl:use-attribute-sets="bold-titles" space-after=".15in" keep-with-next.within-page="always" keep-with-previous.within-page="always" id="{generate-id(.)}" >
					Description
				</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="closeRqmts">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" space-after=".06in" keep-with-next.within-page="always" id="{generate-id(.)}">
			Closing Requirements
		</fo:block>
		<xsl:choose>
			<xsl:when test="descendant::noConds">
				<fo:block>
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Required Conditions
					</fo:block>
					<fo:table>
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.93in"/>
						<fo:table-header><!--
							<fo:table-row>
								<fo:table-cell padding-after="2pt" number-columns-spanned="4" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-style="italic" text-align="center" >
										<xsl:variable name="count">
											<xsl:number count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers|closeRqmts" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										Table <xsl:value-of select="concat($count+1,' ','Required Conditions')"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>-->
							<fo:table-row>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Nomenclature
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Identification No.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Qty
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<xsl:attribute name="border-top-style">solid</xsl:attribute>
									<xsl:attribute name="border-top-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
										Remarks
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0">
									<fo:block xsl:use-attribute-sets="normal-text">
										None
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="mainProcedure">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" space-after=".15in" id="{generate-id(.)}" keep-with-next.within-page="always">
			Procedure
		</fo:block>
		<xsl:apply-templates select="proceduralStep|figure|table"/>
	</xsl:template>	
	
	<xsl:template match="preliminaryRqmts">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" space-after=".15in" id="{generate-id(.)}" keep-with-next.within-page="always">
			Preliminary requirements
		</fo:block>
		<xsl:apply-templates select="reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqSafety"/>
	</xsl:template>
	
	<xsl:template match="safetyRqmts">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="refs">
		<fo:block xsl:use-attribute-sets="bold-titles" color="blue" text-align="center" space-after=".1in" keep-with-next.within-page="always">
			Reference Material Required
		</fo:block>
		<fo:block space-after=".2in">
			<fo:table border-bottom-style="solid" border-bottom-width="1pt">
				<fo:table-column column-number="1" column-width="6.98in"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell>
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" text-align="center">
									Data module/Technical publication
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:choose>
						<xsl:when test="child::refdm">
							<xsl:apply-templates/>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-row padding-after="3pt">
								<fo:table-cell
										number-columns-spanned="2" font-family="sans-serif">
									<xsl:attribute name="padding-top"
											>3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom"
											>3pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										<xsl:value-of
												select="'None'"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:otherwise>
					</xsl:choose>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="refdm[parent::refs]">
		<fo:table-row>
			<fo:table-cell padding-top="3pt" padding-bottom="3pt">
				<fo:block xsl:use-attribute-sets="normal-text" color="blue">
					<xsl:value-of select="concat(descendant::chapnum/text(),'-',descendant::section/text(),descendant::subsect/text(),'-',descendant::subject/text(),'-',descendant::discode/text(),descendant::discodev/text(),'-',
					descendant::incode/text(),descendant::incodev/text(),'-',descendant::itemloc/text())"/>
					<xsl:if test="descendant::techname or descendant::infoname">
						<xsl:value-of select="' , '"/>
					</xsl:if>
					<xsl:if test="not(descendant::techname)">
						<xsl:value-of select="descendant::techname/text()"/>
					</xsl:if>
					<xsl:if test="descendant::techname and descendant::infoname">
						<xsl:value-of select="' - '"/>
					</xsl:if>
					<xsl:if test="not(descendant::techname)">
					<xsl:value-of select="descendant::infoname/text()"/>
					</xsl:if>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="reftp[parent::refs]">
		<fo:table-row>
			<fo:table-cell padding-top="3pt" padding-bottom="3pt">
				<fo:block xsl:use-attribute-sets="normal-text" color="blue">
					<xsl:value-of select="concat(descendant::pubcode/text(),' - ',descendant::pubtitle/text())"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="reftp">
		<fo:inline xsl:use-attribute-sets="normal-text" color="blue" white-space-treatment="ignore">
			<fo:inline white-space-treatment="preserve">
				<xsl:apply-templates/>
			</fo:inline>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="pubcode">
			<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="refdm">
		<xsl:variable name="reference">
			<xsl:value-of select="concat(descendant::modelic/text(),'-',descendant::sdc/text(),'-',descendant::chapnum/text(),'-',descendant::section/text(),descendant::subsect/text(),'-',descendant::subject/text(),'-',
			descendant::discode/text(),descendant::discodev/text(),'-',descendant::incode/text(),descendant::incodev/text(),'-',descendant::itemloc/text())"/>
		</xsl:variable>
		<fo:basic-link color="blue">
							<xsl:value-of select="$reference"/>
						</fo:basic-link>
	</xsl:template>
	
	<xsl:template match="reqCond">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="dmRef"><xsl:apply-templates select="descendant::dmCode"/></xsl:template>
	
	<xsl:template match="dmRef[parent::refs]">
		<xsl:if test="@reasonForUpdateRefIds">
			<fo:change-bar-begin change-bar-class="{@reasonForUpdate}" change-bar-style="solid"/>
		</xsl:if>
		<fo:table-row>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<fo:block color="blue" xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{generate-id(.)}">
						<xsl:value-of select="concat(descendant::dmCode/@modelIdentCode,'-',descendant::dmCode/@systemDiffCode,'-',descendant::dmCode/@systemCode,'-',
						descendant::dmCode/@subSystemCode,descendant::dmCode/@subSubSystemCode,'-',descendant::dmCode/@assyCode,'-',
						descendant::dmCode/@disassyCode,descendant::dmCode/@disassyCodeVariant,'-',descendant::dmCode/@infoCode,descendant::dmCode/@infoCodeVariant,'-',descendant::dmCode/@itemLocationCode)"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text" color="blue">
					<xsl:value-of select="descendant::techName/text()"/>
					<xsl:text> - </xsl:text>
					<xsl:value-of select="descendant::infoName/text()"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="@reasonForUpdateRefIds">
			<fo:change-bar-end change-bar-class="{@reasonForUpdate}"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="externalPubRef|externalPubCode|externalPubTitle">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="externalPubRefIdent">
		<fo:table-row>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<fo:block color="blue" xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{generate-id(.)}">
						<xsl:apply-templates select="externalPubCode"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text" color="blue">
					<xsl:apply-templates select="externalPubTitle"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="randomList">
		<fo:block space-before=".1in" id="{generate-id(.)}">
			<xsl:if test="not(ancestor::table)">
				<xsl:attribute name="keep-together.within-page">always</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="listItem[parent::randomList/parent::para/parent::proceduralStep]">
		<fo:block start-indent=".8in">
			<fo:list-block provisional-distance-between-starts="1in"  text-indent="0">
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							&#8226;
						</fo:block>
					</fo:list-item-label>
					<!-- list text -->
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="listItem[ancestor::entry]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in"  text-indent="0">
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
						-
						</fo:block>
					</fo:list-item-label>
					<!-- list text -->
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="dmRefIdent"><xsl:apply-templates/></xsl:template>
	
	<xsl:template name="static-content">
		<fo:static-content flow-name="Main.Header">
			<fo:block padding-before=".2in">
				<fo:block font-family="arial" font-size="9pt" padding="3pt" border-width="1px"  border-style="solid">
					<fo:list-block provisional-distance-between-starts=".75in" provisional-label-separation="0.15cm">
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									Note:
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									This page may contain data that is out of date. Refer to latest IETM
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
					<fo:list-block provisional-distance-between-starts=".75in" provisional-label-separation="0.15cm">
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>Data Path:</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									CH53K Previewer\21 Environmental Control\21-10 Compression\21-10-01-01A - Compressor Outlet
									Temperature Sensor\Compressor Outlet Temperature Sensor - Install Procedures
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</fo:block>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="Main.Footer">
		<fo:block padding-after=".2in">
			<fo:block border-width="1px" border-style="solid" padding="3px">
				Sikorsky Proprietary and Confidential. Use or disclosure of information contained on this page is subject to the restriction on the Home Page of this
				IETM application. DESTRUCTIVE NOTICE # For unclassified, limited documents, destroy by any method that will prevent disclosure of contents
				or reconstruction of the document.<fo:block/>
				<fo:table>
					<fo:table-column column-number="1" column-width="1in"/>
					<fo:table-column column-number="2" column-width="2.5in"/>
					<fo:table-column column-number="3" column-width="1in"/>
					<fo:table-column column-number="4" column-width="2.5in"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									IETM No:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									3.08.34
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									IETM Date:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									15-Nov-2010
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									Pub Number:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									ERAC Version:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									0
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>
									Pub Date:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									Date Printed:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block>
									15 Nov 2016
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block text-align="right" padding-top=".2in">
				Page <fo:page-number/>
			</fo:block>
		</fo:block>
		</fo:static-content>
	</xsl:template>
	
	<xsl:template name="table-of-contents">
		
	</xsl:template>
	
	<xsl:template match="ipc">
		<fo:table break-after="page">
					<fo:table-column column-number="1" column-width=".5in"/>
					<fo:table-column column-number="2" column-width="1in"/>
					<fo:table-column column-number="3" column-width="1in"/>
					<fo:table-column column-number="4" column-width="1in"/>
					<fo:table-column column-number="5" column-width="1.5in"/>
					<fo:table-column column-number="6" column-width="1in"/>
					<fo:table-column column-number="7" column-width="1in"/>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell padding-bottom="3px" number-columns-spanned="7">
								<fo:block xsl:use-attribute-sets="normal-text">
									All
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-bottom="3px">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="left">
									ITEM
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Units per assembly
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									NCAGE
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Part No.
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Nomenclature
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									SMR
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									WUC
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:apply-templates select="csn"/>
					</fo:table-body>
				</fo:table>
				<xsl:apply-templates select="figure"/>
	</xsl:template>
	
	<xsl:template match="csn">
		<fo:table-row>
							<fo:table-cell padding-bottom="3px">
								<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:value-of select="@item"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:value-of select="descendant::qna/text()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:value-of select="descendant::mfc/text()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:value-of select="descendant::pnr/text()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
								<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:choose>
										<xsl:when test="@ind &gt; 1">
											<xsl:variable name="indenture">
												<xsl:call-template name="indenture_string">
													<xsl:with-param name="position" select="1"/>
													<xsl:with-param name="indent" select="@ind"/>
													<xsl:with-param name="char-string" select="''"/>
												</xsl:call-template>
											</xsl:variable>
												<xsl:value-of select="concat($indenture,descendant::dfp/text())"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="descendant::dfp/text()"/>
										</xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:value-of select="descendant::smr/text()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3px">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:value-of select="descendant::n2dvalue/text()"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
	</xsl:template>
	
	<xsl:template name="indenture_string">
		<xsl:param name="position" select="1"/>
		<xsl:param name="indent" select="@ind">
		</xsl:param>
		<xsl:param name="char-string" select="''"/>
		<xsl:choose>
			<xsl:when test="$position&lt;$indent">
				<xsl:call-template
name="indenture_string">
					<xsl:with-param name="position" select="$position+1"/>
					<xsl:with-param name="indent" select="$indent"/>
					<xsl:with-param name="char-string" select="concat($char-string,'.')"
/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$char-string"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>