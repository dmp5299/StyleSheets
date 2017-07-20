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
					<fo:region-body margin-top="1.3in" margin-bottom="1.4in" column-count="1"/>
					<fo:region-before extent="1.1in" region-name="Main.Header"/>
					<fo:region-after extent="1.2in" region-name="Main.Footer"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master><!--
				<fo:simple-page-master master-name="Main"
						page-width="8.5in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".1in">
					<fo:region-body margin-top="1.1in" margin-bottom="1.55in" column-count="1"/>
					<fo:region-before extent="1in" region-name="Main.Header"/>
					<fo:region-after extent="1.48in" region-name="Main.Footer"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:page-sequence-master master-name="Main">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="PageMaster-Body" blank-or-not-blank="not-blank"/>
						<fo:conditional-page-master-reference master-reference="PageMaster-Blank" blank-or-not-blank="blank"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>-->
			</fo:layout-master-set>
			<fo:bookmark-tree>
				<fo:bookmark internal-destination="{'title-page'}" starting-state="hide">
					<fo:bookmark-title>
						<xsl:value-of select="concat(descendant::dmCode[1]/@modelIdentCode,'-',descendant::dmCode[1]/@systemDiffCode,'-',descendant::dmCode[1]/@systemCode,
						'-',descendant::dmCode[1]/@subSystemCode,descendant::dmCode[1]/@subSubSystemCode,'-',descendant::dmCode[1]/@assyCode,'-',
										descendant::dmCode[1]/@disassyCode,descendant::dmCode[1]/@disassyCodeVariant,'-',
										descendant::dmCode[1]/@infoCode,descendant::dmCode[1]/@infoCodeVariant,'-',descendant::dmCode[1]/@itemLocationCode)"/>
					</fo:bookmark-title>
				</fo:bookmark>
			</fo:bookmark-tree>
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
					<fo:block font-weight="bold" font-size="14pt" text-align="center" padding-after=".2in" font-style="italic">
						<xsl:value-of select="descendant::techName[1]/text()"/>
						<fo:block font-size="12pt">
							<xsl:value-of select="descendant::infoName[1]/text()"/>
						</fo:block>
					</fo:block>
					<xsl:call-template name="toc"/>
					<xsl:if test="descendant::figure">
						<xsl:call-template name="lof"/>
					</xsl:if>
					<xsl:if test="descendant::table">
						<xsl:call-template name="lot"/>
					</xsl:if>
					<xsl:call-template name="createReferencTable"/>
					<xsl:apply-templates select="descendant::content"/>
					<fo:block>
						<fo:marker marker-class-name="endOfModule">
							<fo:block font-weight="bold" xsl:use-attribute-sets="normal-text" text-align="center">
							End of data module
							</fo:block>
						</fo:marker>
					</fo:block>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
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
	
	<xsl:template match="proceduralStep">
		<xsl:if test="@reasonForUpdateRefIds">
			<fo:change-bar-begin change-bar-class="{@reasonForUpdate}" change-bar-style="solid"/>
		</xsl:if>
		<fo:block id="{generate-id(.)}" xsl:use-attribute-sets="bold-titles">
					<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/descendant::dmCode[1]/@modelIdentCode,'-',ancestor::dmodule/descendant::dmCode[1]/@systemDiffCode,'-',ancestor::dmodule/descendant::dmCode[1]/@systemCode,
						'-',ancestor::dmodule/descendant::dmCode[1]/@subSystemCode,ancestor::dmodule/descendant::dmCode[1]/@subSubSystemCode,'-',ancestor::dmodule/descendant::dmCode[1]/@assyCode,'-',
										ancestor::dmodule/descendant::dmCode[1]/@disassyCode,ancestor::dmodule/descendant::dmCode[1]/@disassyCodeVariant,'-',
										ancestor::dmodule/descendant::dmCode[1]/@infoCode,ancestor::dmodule/descendant::dmCode[1]/@infoCodeVariant,'-',ancestor::dmodule/descendant::dmCode[1]/@itemLocationCode)"/>
					</fo:marker>
		</fo:block>
		<xsl:apply-templates/>
		<xsl:if test="@reasonForUpdateRefIds">
			<fo:change-bar-end change-bar-class="{@reasonForUpdate}"/>
		</xsl:if>
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
	
	<xsl:template match="para[parent::proceduralStep or parent::levelledPara][not(preceding-sibling::para)][not(preceding-sibling::title)]|
		title[parent::proceduralStep or parent::levelledPara]">
		<fo:block id="{generate-id(.)}" padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
				<xsl:value-of select="concat(ancestor::dmodule/descendant::dmCode[1]/@modelIdentCode,'-',ancestor::dmodule/descendant::dmCode[1]/@systemDiffCode,'-',
				ancestor::dmodule/descendant::dmCode[1]/@systemCode,'-',ancestor::dmodule/descendant::dmCode[1]/@subSystemCode,ancestor::dmodule/descendant::dmCode[1]/@subSubSystemCode,'-',
				ancestor::dmodule/descendant::dmCode[1]/@assyCode,'-',
				ancestor::dmodule/descendant::dmCode[1]/@disassyCode,ancestor::dmodule/descendant::dmCode[1]/@disassyCodeVariant,'-',ancestor::dmodule/descendant::dmCode[1]/@infoCode,
				ancestor::dmodule/descendant::dmCode[1]/@infoCodeVariant,'-',ancestor::dmodule/descendant::dmCode[1]/@itemLocationCode)"/>
			</fo:marker>
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
									<xsl:when test="count(ancestor::proceduralStep)=1 or count(ancestor::levelledPara)=1">
										<xsl:number count="proceduralStep|levelledPara" level="multiple" format="1"/>
									</xsl:when>
									<xsl:when test="count(ancestor::proceduralStep)=2 or count(ancestor::levelledPara)=2">
										<xsl:number count="proceduralStep|levelledPara" level="multiple" format="1.1"/>
									</xsl:when>
									<xsl:when test="count(ancestor::proceduralStep)=3 or count(ancestor::levelledPara)=3">
										<xsl:number count="proceduralStep|levelledPara" level="multiple" format="1.1.1"/>
									</xsl:when>
									<xsl:when test="count(ancestor::proceduralStep)=4 or count(ancestor::levelledPara)=4">
										<xsl:number count="proceduralStep|levelledPara" level="multiple" format="1.1.1.1"/>
									</xsl:when>
									<xsl:when test="count(ancestor::proceduralStep)=5 or count(ancestor::levelledPara)=5">
										<xsl:number count="proceduralStep|levelledPara" level="multiple" format="1.1.1.1.1"/>
									</xsl:when>
									<xsl:when test="count(ancestor::proceduralStep)=6 or count(ancestor::levelledPara)=6">
										<xsl:number count="proceduralStep|levelledPara" level="multiple" format="1.1.1.1.1.1"/>
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
				<xsl:if test="not(following-sibling::supplyDescr) and not(following-sibling::spareDescr)">
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
				<xsl:if test="not(following-sibling::supplyDescr) and not(following-sibling::spareDescr)">
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
				<xsl:if test="not(following-sibling::supplyDescr) and not(following-sibling::spareDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="reqQuantity"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell start-indent="0">
				<xsl:if test="not(following-sibling::supplyDescr) and not(following-sibling::spareDescr)">
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
		<xsl:if test="@reasonForUpdateRefIds">
				<fo:change-bar-begin change-bar-class="{@reasonForUpdate}" change-bar-style="solid"/>
		</xsl:if>
		<xsl:variable name="graphicPath">
			<xsl:value-of select="ext:getGraphicPath('dave')"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.cgm'))" >
				<fo:external-graphic  content-height="200mm" scaling="uniform" content-width="7in">
					<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat($graphicPath,'/',@infoEntityIdent,'.cgm')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.jpg'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
					<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@infoEntityIdent,'.jpg')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.png'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
				<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@infoEntityIdent,'.png')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.tif'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
					<xsl:if test="ancestor::foldout">
						<xsl:attribute name="content-width">13in</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@infoEntityIdent,'.tif')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'Graphic Not Found'"/>
			</xsl:otherwise>
		</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(../graphic) &gt; 1">
					<fo:block xsl:use-attribute-sets="italic-bold-titles" font-size="12pt" keep-together.within-page="always"
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
			<xsl:if test="@reasonForUpdateRefIds">
				<fo:change-bar-end change-bar-class="{@reasonForUpdate}"/>
			</xsl:if>
		</fo:block>
	</xsl:template>

	<xsl:template match="figure/title">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" font-size="12pt">
			Figure <xsl:number count="figure" level="any" from="dmodule"/>
			<fo:leader leader-length=".06in"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="figure"><xsl:if test="@reasonForUpdateRefIds">
				<fo:change-bar-begin change-bar-class="{@reasonForUpdate}" change-bar-style="solid"/>
			</xsl:if>
		<fo:block id="{generate-id(.)}" keep-together.within-page="always">
			
			<fo:marker marker-class-name="dmcode">
				<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
								ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
			</fo:marker>
			<xsl:apply-templates select="./graphic"/>
			
		</fo:block><xsl:if test="@reasonForUpdateRefIds">
				<fo:change-bar-end change-bar-class="{@reasonForUpdate}"/>
			</xsl:if>
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
			<xsl:if test="ancestor::entry">
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
						<fo:table-header><!--
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
				<fo:block padding-after=".2in" id="{generate-id(.)}" span="all">
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" keep-with-next.within-page="always">
						Required Conditions
					</fo:block>
					<fo:table start-indent="0" span="all">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:table-column column-number="1" column-width="3.49in"/>
						<fo:table-column column-number="2" column-width="3.49in"/>
						<fo:table-header><!--
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
							</fo:table-row>-->
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
							<xsl:apply-templates select="reqCondDm|reqCond"/>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
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
	
	<xsl:template match="reqCond">
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
		<xsl:apply-templates select="procedure|description|illustratedPartsCatalog"/>
	</xsl:template>
	
	<xsl:template match="warningAndCautionPara">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="caution|warning">
		<fo:block xsl:use-attribute-sets="bold-normal-text" id="{generate-id(.)}" 
		text-align="left" keep-together.within-page="always" keep-with-next.within-page="always" start-indent=".8in">
			<xsl:if test="ancestor::entry">
				<xsl:attribute name="start-indent">0</xsl:attribute>
			</xsl:if>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="self::caution">
					<fo:block text-align="center" text-decoration="underline" space-after=".1in" keep-with-next.within-page="always">
						CAUTION
					</fo:block>
				</xsl:when>
				<xsl:when test="self::warning">
					<fo:block text-align="center" text-decoration="underline" space-after=".1in" keep-with-next.within-page="always">
						WARNING
					</fo:block>
				</xsl:when>
			</xsl:choose>
			<fo:block xsl:use-attribute-sets="normal-text">
				<xsl:apply-templates/>
			</fo:block>
		</fo:block>
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
	
	<xsl:template name="createReferencTable">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" text-align="center" space-after=".1in" keep-with-next.within-page="always">
			References
		</fo:block>
		<fo:block space-after=".2in" break-after="page">
			<fo:table border-bottom-style="solid" border-bottom-width="1pt">
				<fo:table-column column-width="3.04in" column-number="1"/>
				<fo:table-column column-width="3.94in" column-number="2"/>
				<fo:table-header><!--
					<fo:table-row keep-with-next.within-page="always">
						<fo:table-cell number-columns-spanned="2" space-after="2pt" text-align="center" xsl:use-attribute-sets="normal-text" font-style="italic">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block>
								Table <xsl:value-of select="concat('1',' ')"/>
								<xsl:value-of select="'References'"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>-->
					<fo:table-row>
						<fo:table-cell>
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Data module/Technical publication
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Title
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:choose>
						<xsl:when test="descendant::refs">
							<xsl:apply-templates select="descendant::refs"/>
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
	
	<xsl:template match="refs">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="dmCode">
		<xsl:variable name="reference">
			<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
			@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
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
			<fo:block>
				<fo:block font-family="arial" font-size="10pt" font-weight="bold" text-align="center" padding-after=".4in" padding-before=".4in">
					Export Classification ECCN 9E991
					<fo:leader leader-length="100%" leader-pattern="rule"/>
				</fo:block>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="Main.Footer">
			<fo:block>
				<fo:leader leader-length="100%" leader-pattern="rule"/>
				<fo:table>
					<fo:table-column column-number="1" column-width="50%"/>
					<fo:table-column column-number="2" column-width="50%"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bold-normal-text">
									See Applicability
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block  xsl:use-attribute-sets="bold-normal-text" text-align="right">
									<xsl:variable name="modelIdentCode" select="descendant::dmCode[1]/@modelIdentCode"/>
									<xsl:variable name="systemDiffCode" select="descendant::dmCode[1]/@systemDiffCode"/>
									<xsl:variable name="systemCode" select="descendant::dmCode[1]/@systemCode"/>
									<xsl:variable name="subSystemCode" select="descendant::dmCode[1]/@subSystemCode"/>
									<xsl:variable name="subSubSystemCode" select="descendant::dmCode[1]/@subSubSystemCode"/>
									<xsl:variable name="assyCode" select="descendant::dmCode[1]/@assyCode"/>
									<xsl:variable name="disassyCode" select="descendant::dmCode[1]/@disassyCode"/>
									<xsl:variable name="disassyCodeVariant" select="descendant::dmCode[1]/@disassyCodeVariant"/>
									<xsl:variable name="infoCode" select="descendant::dmCode[1]/@infoCode"/>
									<xsl:variable name="infoCodeVariant" select="descendant::dmCode[1]/@infoCodeVariant"/>
									<xsl:variable name="itemLocationCode" select="descendant::dmCode[1]/@itemLocationCode"/>
									<xsl:value-of select="concat($modelIdentCode,'-',$systemDiffCode,'-',$systemCode,'-',$subSystemCode,$subSubSystemCode,'-',$assyCode,'-'
									,$disassyCode,$disassyCodeVariant,'-',$infoCode,$infoCodeVariant,'-',$itemLocationCode)"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-before=".1in" number-columns-spanned="2">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
									<xsl:for-each select="descendant::issueDate[1]">
										<xsl:value-of select="concat(@year,'-',@month,'-',@day)"/> Page <fo:page-number/>
									</xsl:for-each>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">
							<fo:block><fo:retrieve-marker retrieve-class-name="endOfModule"></fo:retrieve-marker></fo:block>								
							</fo:table-cell>
							
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:static-content>
	</xsl:template>
	
	<xsl:template name="table-of-contents">
		
	</xsl:template>
	
	
</xsl:stylesheet>