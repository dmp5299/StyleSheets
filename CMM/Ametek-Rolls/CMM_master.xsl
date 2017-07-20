﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:psmi="http://www.CraneSoftwrights.com/resources/psmi"
		xmlns:ext="http://some.namespace.com">
			
	<xsl:import href="../tables.xsl"/>

	<xsl:import href="../attribute-sets.xsl"/>

	<xsl:output indent="yes"/>
	<xsl:strip-space elements="acronym"/>
	
	
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:page-sequence-master master-name="main">       
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" odd-or-even="even" master-reference="Main.Blank"/>
						<fo:conditional-page-master-reference master-reference="main1" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference master-reference="main2" odd-or-even="even" page-position="any"/>   
					</fo:repeatable-page-master-alternatives>    
				</fo:page-sequence-master>
				<fo:page-sequence-master master-name="main2cols">       
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" odd-or-even="even" master-reference="Main.Blank"/>
						<fo:conditional-page-master-reference master-reference="main12" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference master-reference="main22" odd-or-even="even" page-position="any"/>   
					</fo:repeatable-page-master-alternatives>    
				</fo:page-sequence-master>
				<fo:page-sequence-master master-name="main3cols">       
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" odd-or-even="even" master-reference="Main.Blank"/>
						<fo:conditional-page-master-reference master-reference="main13" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference master-reference="main23" odd-or-even="even" page-position="any"/>   
					</fo:repeatable-page-master-alternatives>    
				</fo:page-sequence-master>
				<fo:simple-page-master master-name="main1" 
						page-width="8.5in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".3in">
					<fo:region-body margin-top=".8in" margin-bottom="1.55in"/>
					<fo:region-before extent="2cm"/>
					<fo:region-after extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="main2" 
						page-width="8.5in" page-height="11in"
						margin-left=".58in" margin-right=".94in" margin-top=".3in">
					<fo:region-body margin-top=".8in" margin-bottom="1.55in" />
					<fo:region-before extent="2cm"/>
					<fo:region-after extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="main12" 
						page-width="8.5in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".3in" >
					<fo:region-body margin-top=".8in" margin-bottom="1.55in" column-count="2" column-gap="1mm"/>
					<fo:region-before extent="3cm" region-name="xsl-region-before2Cols"/>
					<fo:region-after extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="main22" 
						page-width="8.5in" page-height="11in"
						margin-left=".58in" margin-right=".94in" margin-top=".3in" >
					<fo:region-body margin-top=".8in" margin-bottom="1.55in" column-count="2" column-gap="1mm"/>
					<fo:region-before extent="3cm" region-name="xsl-region-before2Cols"/>
					<fo:region-after extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="main13" 
						page-width="8.5in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".3in" >
					<fo:region-body margin-top=".8in" margin-bottom="1.55in" column-count="3" column-gap="1mm"/>
					<fo:region-before extent="2cm"/>
					<fo:region-after extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="main23" 
						page-width="8.5in" page-height="11in"
						margin-left=".58in" margin-right=".94in" margin-top=".3in" >
					<fo:region-body margin-top=".8in" margin-bottom="1.55in" column-count="3" column-gap="1mm"/>
					<fo:region-before extent="2cm"/>
					<fo:region-after extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Main.Blank"
						page-width="8.5in" page-height="11in"
						margin-left=".58in" margin-right=".94in" margin-top=".3in">
					<fo:region-body margin-top=".8in" margin-bottom="1.55in" />
					<fo:region-before region-name="main.blank.header" extent="2cm"/>
					<fo:region-after extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="frame-landbody" 
						page-width="15in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".3in">
					<fo:region-body margin-top=".8in" margin-bottom="1.55in"/>
					<fo:region-before extent="2cm" region-name="xsl-region-before-landscape"/>
					<fo:region-after extent="1.48in" region-name="xsl-region-after-landscape"/>
					<fo:region-start />
					<fo:region-end/>
						</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:bookmark-tree>
				<xsl:if test="not(ancestor::pm/descendant::dmodule[@infoCode = '001'])">
					<fo:bookmark internal-destination="'title'">
						<fo:bookmark-title>
							<xsl:value-of select="'Title'"/>
						</fo:bookmark-title>
					</fo:bookmark>
				</xsl:if>
				<xsl:for-each select="descendant::pmEntry[count(ancestor::pmEntry)=0]">
					<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
						<fo:bookmark-title>
							<xsl:value-of select="pmEntryTitle"/>
						</fo:bookmark-title>
						<xsl:if test="not(preceding-sibling::pmEntry)">
							<fo:bookmark internal-destination="{'LOEDM'}" starting-state="hide">
								<fo:bookmark-title>
									<xsl:value-of select="'List of Effective Data Modules'"/>
								</fo:bookmark-title>
							</fo:bookmark>
						</xsl:if>
						<xsl:if test="not(preceding-sibling::pmEntry)">
							<fo:bookmark internal-destination="{'toc1'}" starting-state="hide">
								<fo:bookmark-title>
									<xsl:value-of select="'Table of contents'"/>
								</fo:bookmark-title>
							</fo:bookmark>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="./pmEntry">
								<xsl:for-each select="./pmEntry">
								<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
									<fo:bookmark-title>
										<xsl:value-of select="pmEntryTitle"/>
									</fo:bookmark-title>
									<xsl:for-each select="./dmodule[not(descendant::infoName='Change record or highlights')]">
										<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
													<fo:bookmark-title>
														<xsl:value-of select="descendant::infoName"/>
														<xsl:value-of select="' '"/>
														<xsl:choose>
															<xsl:when test="descendant::infoName='Table of contents' or descendant::infoName='List of Support Equipment' or descendant::infoName='List of supplies'">
																<xsl:value-of select="ancestor::pm/descendant::pmTitle"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="descendant::techName"/>
															</xsl:otherwise>
														</xsl:choose>
													</fo:bookmark-title>
												</fo:bookmark>
									</xsl:for-each>
									<xsl:for-each select="./pmEntry">
										<fo:bookmark internal-destination="{generate-id(.)}">
											<fo:bookmark-title>
												<xsl:value-of select="pmEntryTitle"/>
											</fo:bookmark-title>
											<xsl:for-each select="./dmodule">
												<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
													<fo:bookmark-title>
														<xsl:value-of select="descendant::infoName"/>
														<xsl:value-of select="' '"/>
														<xsl:value-of select="descendant::techName"/>
													</fo:bookmark-title>
												</fo:bookmark>
											</xsl:for-each>
										</fo:bookmark>									
									</xsl:for-each>
								</fo:bookmark>
							</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="./dmodule">
									<xsl:if test="not(@infoCode = '001')">
										<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
											<xsl:if test="@infoCode = '005'">
												<xsl:attribute name="internal-destination">acronyms</xsl:attribute>
											</xsl:if>
											<xsl:if test="@infoCode = '006'">
												<xsl:attribute name="internal-destination">terms</xsl:attribute>
											</xsl:if>
											<xsl:if test="@infoCode = '007'">
												<xsl:attribute name="internal-destination">symbols</xsl:attribute>
											</xsl:if>
											<xsl:if test="@infoCode = '017'">
												<xsl:attribute name="internal-destination">spec</xsl:attribute>
											</xsl:if>
											<fo:bookmark-title>
												<xsl:value-of select="descendant::infoName"/>
												<xsl:value-of select="' '"/>
												<xsl:value-of select="descendant::techName"/>
											</fo:bookmark-title>
										</fo:bookmark>
									</xsl:if>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</fo:bookmark>
				</xsl:for-each>
			</fo:bookmark-tree>
			<xsl:call-template name="dmodules"/>
		</fo:root>
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
	
	<xsl:template match="foldout">
		<xsl:if test="child::figure">
			<psmi:page-sequence master-reference="frame-landbody">
				<xsl:call-template name="front-static-content"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:marker marker-class-name="dmcode">
							<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
											ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
						</fo:marker>
						<xsl:apply-templates/>
					
				</fo:flow>
			</psmi:page-sequence>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="dmodules">
		<xsl:apply-templates select="pm"/>
	</xsl:template>
	<!--
	<xsl:template match="symbol">
		<fo:inline font-family="Symbol">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	-->
	<xsl:template name="acronym">
		<xsl:apply-templates select="descendant::acronyms"/>
	</xsl:template>

	<xsl:template name="supportEquips">
		<xsl:apply-templates select="descendant::supportEquips"/>
	</xsl:template>

	<xsl:template name="listOfTables">
		<xsl:apply-templates select="descendant::listOfTables"/>
	</xsl:template>

	<xsl:template name="listOfFigures">
		<xsl:apply-templates select="descendant::listOfFigures"/>
	</xsl:template>

	<xsl:template name="tableOfContents">
		<xsl:apply-templates select="descendant::toc"/>
	</xsl:template>

	<xsl:template match="pm">
		<xsl:if test="not(preceding-sibling::pmEntry) and not(ancestor::pm/descendant::dmodule[@infoCode = '001'])">
			<xsl:call-template name="CreatetitlepageModule"/>
		</xsl:if>
		<xsl:apply-templates select="descendant::pmEntry"/>
	</xsl:template>
	
	<xsl:template name="CreatetitlepageModule">
		<fo:page-sequence master-reference="main" >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:marker marker-class-name="date">
					<xsl:variable name="date">
						<xsl:choose>
							<xsl:when test="descendant::issueDate[1]/@month = '01'">
								<xsl:value-of select="'Jan'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '02'">
								<xsl:value-of select="'Feb'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '03'">
								<xsl:value-of select="'Mar'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '04'">
								<xsl:value-of select="'April'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '05'">
								<xsl:value-of select="'May'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '06'">
								<xsl:value-of select="'Jun'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '07'">
								<xsl:value-of select="'Jul'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '08'">
								<xsl:value-of select="'Aug'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '09'">
								<xsl:value-of select="'Sept'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '10'">
								<xsl:value-of select="'Oct'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '11'">
								<xsl:value-of select="'Nov'"/>
							</xsl:when>
							<xsl:when test="descendant::issueDate[1]/@month = '12'">
								<xsl:value-of select="'Dec'"/>
							</xsl:when>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="concat($date,' ',descendant::issueDate[1]/@day,'/',descendant::issueDate[1]/@year)"/>
				</fo:marker>
				<fo:block span="all" id="{'title'}">
					<fo:marker marker-class-name="pmTitle">
						<xsl:value-of select="'Title'"/>
					</fo:marker><!--
					<fo:marker marker-class-name="dmcode">
						<xsl:value-of 
						select="concat(descendant::dmodule[1]/@modelIdentCode,'-',descendant::dmodule[1]/@systemDiffCode,'-',descendant::dmodule[1]/@systemCode,'-',descendant::dmodule[1]/@subSystemCode,descendant::dmodule[1]/@subSubSystemCode,'-',descendant::dmodule[1]/@assyCode,'-',
						<xsl:value-of select="concat(descendant::dmodule[1]/@modelIdentCode,'-',descendant::dmodule[1]/@systemDiffCode,'-',descendant::dmodule[1]/@systemCode,'-',descendant::dmodule[1]/@subSystemCode,descendant::dmodule[1]/@subSubSystemCode,'-',descendant::dmodule[1]/@assyCode,'-',
						descendant::dmodule[1]/@disassyCode,descendant::dmodule[1]/@disassyCodeVariant,'-','001',descendant::dmodule[1]/@infoCodeVariant,'-',descendant::dmodule[1]/@itemLocationCode)"/>
					</fo:marker>-->
					<xsl:call-template name="titlePage">
						<xsl:with-param name="hasDataModule" select="'true'"/>
					</xsl:call-template>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template> 
	
	<xsl:template name="dmoduleToc">
		<fo:block font-size="14pt" font-weight="bold" padding-after=".1in" span="all">
			<fo:table>
				<fo:table-column column-number="1" column-width="3.5in"/>
				<fo:table-column column-number="2" column-width="3.5in"/>
				<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding-after="3pt">
							<fo:block font-size="14pt" font-weight="bold" font-family="arial">
									Table of contents
							</fo:block>
						</fo:table-cell>
					<fo:table-cell padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="right">
									Page
							</fo:block>
						</fo:table-cell>
				</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block padding-after=".1in" span="all">
			<fo:table>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell start-indent=".75in" padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link>
									<xsl:attribute name="internal-destination">
										<xsl:value-of select="concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)"/>
									</xsl:attribute>
									References<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
									<fo:page-number-citation>
										<xsl:attribute name="ref-id">
										<xsl:value-of select="concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)"/>
									</xsl:attribute>
									</fo:page-number-citation>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell start-indent=".75in" padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link internal-destination="{generate-id(descendant::description)}">
									Description<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
									<fo:page-number-citation ref-id="{generate-id(descendant::description)}"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:if test="descendant::levelledPara[not(parent::levelledPara)][child::title]">
						<xsl:for-each select="descendant::levelledPara[not(parent::levelledPara)]">
							<fo:table-row>
								<fo:table-cell start-indent=".75in" padding-after="3pt">
									<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="./title/text()"/><fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
											<fo:page-number-citation ref-id="{generate-id(.)}"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</xsl:if>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="procedTOC">
		<fo:block font-size="14pt" font-weight="bold" padding-after=".1in" span="all">
			<fo:table>
				<fo:table-column column-number="1" column-width="3.5in"/>
				<fo:table-column column-number="2" column-width="3.5in"/>
				<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding-after="3pt">
							<fo:block font-size="14pt" font-weight="bold" font-family="arial">
									Table of contents
							</fo:block>
						</fo:table-cell>
					<fo:table-cell padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="right">
									Page
							</fo:block>
						</fo:table-cell>
				</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block padding-after=".1in" span="all">
			<fo:table>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell start-indent=".75in" padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link>
									<xsl:attribute name="internal-destination">
										<xsl:value-of select="concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)"/>
									</xsl:attribute>
									References<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
									<fo:page-number-citation ref-id="{concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)}"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell start-indent=".75in" padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link internal-destination="{generate-id(descendant::preliminaryRqmts)}">
									Preliminary Requirements<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
									<fo:page-number-citation ref-id="{generate-id(descendant::preliminaryRqmts)}"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell start-indent=".75in" padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link internal-destination="{generate-id(descendant::mainProcedure)}">
									Procedure<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
									<fo:page-number-citation ref-id="{generate-id(descendant::mainProcedure)}"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:for-each select="descendant::proceduralStep[not(parent::proceduralStep)][child::title]">
						<fo:table-row>
							<fo:table-cell start-indent=".75in" padding-after="3pt">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:value-of select="./title/text()"/><fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
					<fo:table-row>
						<fo:table-cell start-indent=".75in" padding-after="3pt">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link internal-destination="{generate-id(descendant::closeRqmts)}">
									Requirements after job completion<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
									<fo:page-number-citation ref-id="{generate-id(descendant::closeRqmts)}"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="preliminaryRqmts">
		<fo:block id="{generate-id(.)}" span="all">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="reqCondGroup">
		<xsl:choose>
			<xsl:when test="noConds">
				<fo:block padding-after=".37in" id="{generate-id(.)}" span="all">
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Required Conditions
					</fo:block>
					<fo:table start-indent=".7in">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.18in"/>
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
							</fo:table-row>
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
			<xsl:when test="reqCondNoRef">
				<fo:block space-after=".37in" id="{generate-id(.)}" span="all">
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Required Conditions
					</fo:block>
					<fo:table start-indent=".7in" space-after=".37in">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.18in"/>
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
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										Nomenclature
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										Identification No.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										Qty
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										Remarks
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0">
									<fo:block xsl:use-attribute-sets="normal-text">
										<xsl:apply-templates/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block padding-after=".37in" id="{generate-id(.)}" span="all">
						<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
							Required Conditions
						</fo:block>
						<fo:table start-indent=".7in" span="all">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:table-column column-number="1" column-width="3.15in"/>
							<fo:table-column column-number="2" column-width="3.15in"/>
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
										<fo:block xsl:use-attribute-sets="normal-text">
											Data Module/Technical Publication
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text">
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
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="dmoduleReferences">
		<fo:block padding-after=".2in" span="all">
			<fo:block font-size="14pt" font-weight="bold" padding-after=".1in" font-family="arial"
			text-align="center" span="all" id="{concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)}">
			References
		</fo:block>
		<fo:table start-indent=".7in">
			<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
			<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
			<fo:table-column column-number="1" column-width="3.15in"/>
			<fo:table-column column-number="2" column-width="3.15in"/>
			<fo:table-header>
				<fo:table-row>
					<fo:table-cell padding-after="2pt" number-columns-spanned="2" start-indent="0">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:block xsl:use-attribute-sets="normal-text" font-style="italic" text-align="center" >
							Table 1 References
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0" >
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" >
							Data Module/Technical Publication
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Title
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<xsl:choose>
					<xsl:when test="descendant::dmRef[not(ancestor::brexDmRef) and not(ancestor::applicCrossRefTableRef)]">
						<xsl:for-each select="descendant::dmRef[not(ancestor::brexDmRef) and not(ancestor::applicCrossRefTableRef)]">
							<xsl:if test="not(child::behavior)">
								<fo:table-row>
									<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0" >
										<fo:block xsl:use-attribute-sets="normal-text">
											<xsl:apply-templates select="descendant::dmCode"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before="3pt" padding-after="3pt" start-indent="0" >
										<fo:block xsl:use-attribute-sets="normal-text">
											<xsl:variable name="dmInfo">
												<xsl:value-of select="concat(descendant::dmCode/@modelIdentCode,'-',descendant::dmCode/@systemDiffCode,'-',descendant::dmCode/@systemCode,'-',descendant::dmCode/@subSystemCode,descendant::dmCode/@subSubSystemCode,'-',descendant::dmCode/@assyCode,'-',
												descendant::dmCode/@disassyCode,descendant::dmCode/@disassyCodeVariant,'-',descendant::dmCode/@infoCode,descendant::dmCode/@infoCodeVariant,'-',descendant::dmCode/@itemLocationCode)"/>
											</xsl:variable>
											<xsl:for-each select="/pm/descendant::dmodule">
												<xsl:variable name="dmInfo2">
													<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
													@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
												</xsl:variable>
												<xsl:if test="$dmInfo = $dmInfo2">
													<xsl:value-of select="concat(descendant::techName/text(),' - ',descendant::infoName/text())"/>
												</xsl:if>
											</xsl:for-each>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<fo:table-row>
							<fo:table-cell padding-after="4pt" padding-before="4pt" padding-left="3pt" number-columns-spanned="2" start-indent="0">
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

	<xsl:template match="dmodule">
	<xsl:if test="not(@infoCode = '009')">
		<fo:page-sequence force-page-count="end-on-even">
			<xsl:choose>
				<xsl:when test="@infoCode='014'">
					<xsl:attribute name="master-reference">main2cols</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="master-reference">main</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
			<fo:block id="{generate-id(.)}" span="all">
			
				<xsl:if test="@infoCode = '005'">
					<xsl:attribute name="id">acronyms</xsl:attribute>
				</xsl:if>
				<xsl:if test="@infoCode = '006'">
					<xsl:attribute name="id">terms</xsl:attribute>
				</xsl:if>
				<xsl:if test="@infoCode = '007'">
					<xsl:attribute name="id">symbols</xsl:attribute>
				</xsl:if>
				<xsl:if test="@infoCode = '017'">
					<xsl:attribute name="id">spec</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="descendant::infoName='List of abbreviations' or descendant::infoName='List of related data' or descendant::infoName='Technical standard record' or
				descendant::infoName='List of terms' or descendant::infoName='List of related data' or descendant::infoName='List of specifications' or descendant::infoName='List of Support Equipment' or 
				descendant::infoName='List of symbols' or descendant::infoName='Title page' or descendant::infoName='Table of contents' or descendant::infoName='Change record or highlights' or 
				descendant::infoName='List of illustrations' or descendant::infoName='List of Tables' or descendant::infoName='List of effective data modules' or descendant::infoName='List of acronyms' or descendant::infoName='List of supplies'">
						<xsl:if test="descendant::infoName='List of effective data modules' or descendant::infoName='Table of contents'">
							<xsl:attribute name="break-before">
								page
							</xsl:attribute>
						</xsl:if>
						
					</xsl:when>
				</xsl:choose>
			<!--
				<xsl:if test="not(preceding-sibling::dmodule) and not(@infoCode = 001)">
					<xsl:attribute name="break-before">page</xsl:attribute>
				</xsl:if>-->
				<fo:marker marker-class-name="module-statement">
					<fo:block font-size="6pt" font-weight="normal">
										UTC AEROSPACE SYSTEMS PROPRIETARY-Subject to the restriction on the title or cover page.
										Subject to the EAR - See the Title, First, or Cover Page for more information.
									</fo:block>
				</fo:marker>
				<fo:marker marker-class-name="date">
					<xsl:variable name="date">
						<xsl:choose>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '01'">
								<xsl:value-of select="'Jan'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '02'">
								<xsl:value-of select="'Feb'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '03'">
								<xsl:value-of select="'Mar'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '04'">
								<xsl:value-of select="'April'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '05'">
								<xsl:value-of select="'May'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '06'">
								<xsl:value-of select="'Jun'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '07'">
								<xsl:value-of select="'Jul'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '08'">
								<xsl:value-of select="'Aug'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '09'">
								<xsl:value-of select="'Sept'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '10'">
								<xsl:value-of select="'Oct'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '11'">
								<xsl:value-of select="'Nov'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '12'">
								<xsl:value-of select="'Dec'"/>
							</xsl:when>
							<xsl:otherwise>
								
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="concat($date,' ',ancestor::pm/descendant::issueDate[1]/@day,'/',ancestor::pm/descendant::issueDate[1]/@year)"/>
				</fo:marker>
				<fo:marker marker-class-name="dmcode">
					<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
				</fo:marker>
				
				<xsl:if test="not(descendant::techName='Title page')">
					<fo:block text-align="center" keep-together.within-page="always" keep-with-next.within-page="always" padding-after=".2in">
						<xsl:apply-templates select="descendant::techName[ancestor::dmAddress]"/>
						<xsl:apply-templates select="descendant::infoName[ancestor::dmAddress]"/>
					</fo:block>
				</xsl:if>
				<fo:block>
				<fo:marker marker-class-name="pmTitle">
					<xsl:value-of select="descendant::infoName"/>
				</fo:marker>
				</fo:block>
				<xsl:if test="descendant::description">
					<xsl:call-template name="dmoduleToc"/>
				</xsl:if>
				<xsl:if test="descendant::procedure">
					<xsl:call-template name="procedTOC"/>
				</xsl:if>
				<xsl:call-template name="list_of_tables"/>
				<xsl:if test="descendant::figure">
					<xsl:call-template name="list_of_figures"/>
				</xsl:if>
				<xsl:call-template name="dmoduleReferences"/>
				<!--
				<fo:block >
						<fo:marker marker-class-name="end">
							End of Data Module
						</fo:marker>
				</fo:block>-->
			</fo:block>
			<xsl:apply-templates select="content"/>
			</fo:flow>
		</fo:page-sequence>
	</xsl:if>
	</xsl:template>
	
	<xsl:template match="figure/title">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" font-size="12pt">
			Figure <xsl:number count="figure" level="any" from="dmodule"/>
			<fo:leader leader-length=".06in"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="list_of_tables">
		<fo:block font-size="14pt" font-weight="bold" padding-after=".1in" text-align-last="justify" span="all" font-family="arial">
			List of Tables<fo:leader leader-alignment="reference-area"/><fo:inline xsl:use-attribute-sets="normal-text">Page</fo:inline>
		</fo:block>
		<fo:block padding-after=".1in" span="all">
			<fo:table start-indent=".75in">
				<fo:table-column column-number="1" column-width=".78in"/>
				<fo:table-column column-number="2" column-width="5.45in"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell  padding-after="3pt" start-indent="0">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link internal-destination="{concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)}">
									1
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-after="3pt" start-indent="0">
							<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
								<fo:basic-link>
									<xsl:attribute name="internal-destination">
				<xsl:value-of select="concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)"/>
			</xsl:attribute>
									References<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
									<fo:page-number-citation>
										<xsl:attribute name="ref-id">
				<xsl:value-of select="concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)"/>
			</xsl:attribute>
									</fo:page-number-citation>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>					
					<xsl:for-each select="descendant::reqCondGroup[ancestor::preliminaryRqmts]">
						<fo:table-row>
							<fo:table-cell  padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:variable name="count">
											<xsl:number
			count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										<xsl:value-of select="$count + 1"/> 
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										Required Conditions<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
					<xsl:for-each select="descendant::reqSupportEquips[ancestor::preliminaryRqmts]">
						<fo:table-row>
							<fo:table-cell  padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:variable name="count">
											<xsl:number
			count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										<xsl:value-of select="$count + 1"/> 
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										Support Equipment<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>					
					<xsl:for-each select="descendant::reqSupplies[ancestor::preliminaryRqmts]">
						<fo:table-row>
							<fo:table-cell  padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:variable name="count">
											<xsl:number
			count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										<xsl:value-of select="$count + 1"/> 
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										Consumables, Materials and Expendables<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>		
					<xsl:for-each select="descendant::reqSpares[ancestor::preliminaryRqmts]">
						<fo:table-row>
							<fo:table-cell  padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{concat('refTable',@disassyCode,@infoCode,@infoCodeVariant)}">
										<xsl:variable name="count">
											<xsl:number
			count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										<xsl:value-of select="$count + 1"/> 
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										Spares<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										<fo:page-number-citation ref-id="{generate-id(.)}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>	
					<xsl:for-each select="descendant::table">
						<fo:table-row>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:variable name="count">
											<xsl:number
			count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										<xsl:value-of select="$count + 1"/> 
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<xsl:variable name="id">
										<xsl:value-of select="generate-id(.)"/>
									</xsl:variable>
									<fo:basic-link internal-destination="{$id}">
										<xsl:value-of select="descendant::title/text()"/>
										<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										<fo:page-number-citation ref-id="{$id}"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
					<xsl:for-each select="descendant::closeRqmts">
						<fo:table-row>
							<fo:table-cell  padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:variable name="count">
											<xsl:number
			count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|closeRqmts" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										<xsl:value-of select="$count + 1"/> 
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										Requirements after job completion<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
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
	
	<xsl:template name="list_of_figures">
		<fo:block font-size="14pt" font-weight="bold"  padding-after=".1in" text-align-last="justify" font-family="arial">
			List of Figures<fo:leader leader-alignment="reference-area"/><fo:inline xsl:use-attribute-sets="normal-text">Page</fo:inline>
		</fo:block>
		<fo:block padding-after=".1in">
			<fo:table start-indent=".75in">
				<fo:table-column column-number="1" column-width=".78in"/>
				<fo:table-column column-number="2" column-width="5.45in"/>
				<fo:table-body>
					<xsl:for-each select="descendant::figure">
						<fo:table-row>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:number count="figure" level="any" from="dmodule"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" start-indent="0">
								<fo:block xsl:use-attribute-sets="normal-text" text-align-last="justify">
									<fo:basic-link internal-destination="{generate-id(.)}">
										<xsl:value-of select="descendant::title/text()"/>
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

	<xsl:template match="illustratedPartsCatalog">
		<xsl:apply-templates select="figure"/>
		<xsl:call-template name="createIPD"/>
	</xsl:template>

	<xsl:template name="createIPD">
		<fo:block space-after=".37in">
			<fo:table wrap-option="wrap" hyphenate="true">
				<xsl:attribute name="border-top-style">solid</xsl:attribute>
				<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
				<xsl:attribute name="border-top-width">1pt</xsl:attribute>
				<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				<fo:table-column column-width=".36in" column-number="1"/>
				<fo:table-column column-width=".5in" column-number="2"/>
				<fo:table-column column-width=".75in" column-number="3"/>
				<fo:table-column column-width=".65in" column-number="4"/>
				<fo:table-column column-width="1.3in" column-number="5"/>
				<fo:table-column column-width="2.22in" column-number="6"/>
				<fo:table-column column-width=".91in" column-number="7"/>
				<fo:table-column column-width=".29in" column-number="8"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Fig.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Item
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Units
							per
							assembly/unit of Issue
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							NCAGE
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Pt. No NATO Stock Number
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Nomenclature
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Usable on
							code assy MV/Effect
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							ICY
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>					
					<xsl:apply-templates select="catalogSeqNumber"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="break">
		<fo:block/>
	</xsl:template>

	<xsl:template match="catalogSeqNumber">
		<xsl:if test="not(preceding-sibling::catalogSeqNumber)">
			<fo:table-row>
				<fo:table-cell number-columns-spanned="7">
					<xsl:attribute name="padding-top">3pt</xsl:attribute>
					<fo:block xsl:use-attribute-sets="normal-text">
						<xsl:for-each select="preceding-sibling::figure">
							<xsl:number level="any" count="figure" from="illustratedPartsCatalog"/>
						</xsl:for-each>
						
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<fo:table-row>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block>
					<xsl:apply-templates select="itemSequenceNumber/partLocationSegment/notIllustrated"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:choose>
						<xsl:when test="starts-with(@catalogItemNumber,'00')">
							<xsl:value-of select="substring(@catalogItemNumber,3)"/>
						</xsl:when>
						<xsl:when test="starts-with(@catalogItemNumber,'0')">
							<xsl:value-of select="substring(@catalogItemNumber,2)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@catalogItemNumber"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="itemSequenceNumber/quantityPerNextHigherAssy"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="itemSequenceNumber/manufacturerCode"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="itemSequenceNumber/partNumber"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:choose>
						<xsl:when test="@indenture &gt; 1">
							<xsl:variable name="indenture">
								<xsl:call-template name="indenture_string">
									<xsl:with-param name="position" select="1"/>
									<xsl:with-param name="indent" select="@indenture"/>
									<xsl:with-param name="char-string" select="''"/>
								</xsl:call-template>
							</xsl:variable>
							<fo:block>
								<xsl:variable name="distance" select="(@indenture - 1) * .09"/>
								<fo:list-block provisional-distance-between-starts="{concat($distance,'in')}">
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()">
											<fo:block>
												<xsl:value-of select="$indenture"/>
											</fo:block>
										</fo:list-item-label>
										<fo:list-item-body start-indent="body-start()">
											<fo:block>
												<xsl:apply-templates select="itemSequenceNumber/partIdentSegment"/>
												
											</fo:block>
										</fo:list-item-body>
									</fo:list-item>
								</fo:list-block>
							</fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates
										select="itemSequenceNumber/partIdentSegment">
							</xsl:apply-templates>
						</xsl:otherwise>							
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:if test="itemSequenceNumber/applicabilitySegment/usableOnCodeAssy">
						<xsl:text>* </xsl:text>
						<xsl:value-of select="itemSequenceNumber/applicabilitySegment/usableOnCodeAssy/text()"/>
					</xsl:if>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

	<xsl:template match="partIdentSegment">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="descrForPart">
		<xsl:apply-templates/><!--
		<xsl:if test="ancestor::itemSequenceNumber/descendant::attachStoreShipPart/@attachStoreShipPartCode = '1'">
			/AP
		</xsl:if>-->
	</xsl:template>

	<xsl:template name="indenture_string">
		<xsl:param name="position" select="1"/>
		<xsl:param name="indent" select="@indent">
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

	<xsl:template match="manufacturerCode|partNumber">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="createReferences">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" text-align="center" space-after=".15in" keep-with-next.within-page="always">
			References
		</fo:block>
		<fo:block space-after=".15in">
			<fo:table border-bottom-style="solid" border-bottom-width="1pt">
				<fo:table-column column-width="3.04in" column-number="1"/>
				<fo:table-column column-width="3.64in" column-number="2"/>
				<fo:table-header>
					<fo:table-row keep-with-next.within-page="always">
						<fo:table-cell number-columns-spanned="2" space-after="2pt" text-align="center" xsl:use-attribute-sets="normal-text" font-style="italic">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block>	
							Table <xsl:number count="table|reqSupportEquips[child::supportEquipDescrGroup]|reqSupplies[child::supplyDescrGroup]
							|dmodule[count(descendant::para/descendant::dmRef) &gt; 0]" level="any"/>
								<fo:leader leader-length=".06in"/>
								<xsl:value-of select="'References'"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Data module/Technical publication
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
									Title
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="descendant::para/dmRef/descendant::dmCode">
						<fo:table-row>
							<fo:table-cell>
								<xsl:attribute name="padding-top">3pt</xsl:attribute>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<xsl:variable name="dmCodeId">
									<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
								</xsl:variable>
								<fo:block id="{generate-id(.)}"/>
								<xsl:for-each select="ancestor::pm/descendant::dmodule">
									<xsl:variable name="dModId">
										<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
									</xsl:variable>
									<xsl:if test="$dmCodeId = $dModId">
										<fo:block color="blue" xsl:use-attribute-sets="normal-text">
											<fo:basic-link internal-destination="{generate-id(.)}">
												<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
											</fo:basic-link>
										</fo:block>
									</xsl:if>
								</xsl:for-each>
								<fo:block>
									<fo:leader/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<xsl:attribute name="padding-top">3pt</xsl:attribute>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:value-of select="ancestor::dmRef/descendant::techName"/>
									<xsl:text> - </xsl:text>
									<xsl:value-of select="ancestor::dmRef/descendant::infoName"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

	<xsl:template match="dmRef[parent::para or parent::notePara]">
		<fo:inline white-space-treatment="ignore">
			<xsl:apply-templates select="dmRefIdent"/>
		</fo:inline>
	</xsl:template>

	<xsl:template match="dmRefIdent[ancestor::para or ancestor::notePara]">
		<xsl:apply-templates select="dmCode"/>
	</xsl:template>

	<xsl:template match="dmCode[ancestor::entry]">
		<xsl:choose>
			<xsl:when test="ancestor::dmRef/preceding-sibling::text() or ancestor::dmRef/following-sibling::text()">
				<xsl:variable name="destination" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
				<xsl:for-each select="ancestor::pm/descendant::dmodule">
					<xsl:variable name="destination2" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
					<xsl:if test="$destination=$destination2">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
						</fo:basic-link>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<fo:block>
					<xsl:variable name="destination" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
					<xsl:for-each select="ancestor::pm/descendant::dmodule">
						<xsl:variable name="destination2" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
						<xsl:if test="$destination=$destination2">
							<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
								<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
							</fo:basic-link>
						</xsl:if>
					</xsl:for-each>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="dmCode[ancestor::para or ancestor::notePara or ancestor::reqCondGroup][not(ancestor::entry)]">
		<fo:inline>
			<xsl:variable name="destination" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
			<xsl:for-each select="ancestor::pm/descendant::dmodule">
				<xsl:variable name="destination2" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
				<xsl:if test="$destination=$destination2">
					<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
						<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
					</fo:basic-link>
				</xsl:if>
			</xsl:for-each>
		</fo:inline>
	</xsl:template>

	<xsl:template match="partLocationSegment">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="notIllustrated">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="description">
		<xsl:choose>
			<xsl:when test="ancestor::dmodule/descendant::infoName='Title page'">
				<xsl:call-template name="titlePage"/>
			</xsl:when>
			<xsl:otherwise>
				<fo:block xsl:use-attribute-sets="bold-titles" space-after=".15in" keep-with-next.within-page="always" keep-with-previous.within-page="always" id="{generate-id(.)}" >
					Description
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="levelledPara">
		<fo:block id="{generate-id(.)}" xsl:use-attribute-sets="bold-titles">
			<xsl:if test="following-sibling::*">
					<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="not(preceding-sibling::*)">
				<xsl:attribute name="padding-before">.1in</xsl:attribute>
			</xsl:if>
			<fo:marker marker-class-name="dmcode">
				<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
								ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',
								ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
			</fo:marker>
			
		</fo:block><xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=1]" >
		<fo:block id="{generate-id(.)}" text-align="left">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
		</fo:marker>

			</fo:block><xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=2]" >
		<fo:block id="{generate-id(.)}" text-align="left">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
		</fo:marker>

			</fo:block><xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=3]" >
		<fo:block id="{generate-id(.)}" text-align="left">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
		</fo:marker>

			</fo:block><xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=4]" >
		<fo:block id="{generate-id(.)}" text-align="left">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
		</fo:marker>

			</fo:block><xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=5]" >
		<fo:block id="{generate-id(.)}" text-align="left">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
		</fo:marker>

			</fo:block><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="randomList">
		<fo:block space-before=".15in" keep-together.within-page="always">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="sequentialList">
		<fo:block space-before=".15in">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="listItem[parent::randomList/parent::para/parent::proceduralStep]">
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
	
	<xsl:template match="referTo"/>

	<xsl:template match="closeRqmts">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" space-after=".06in" keep-with-next.within-page="always">
			Requirements after job completion
		</fo:block>
		<xsl:choose>
			<xsl:when test="descendant::noConds">
				<fo:block space-after=".15in" id="{generate-id(.)}">
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Required Conditions
					</fo:block>
					<fo:table start-indent=".7in">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.18in"/>
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell padding-after="2pt" number-columns-spanned="4" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" font-style="italic" text-align="center" >
										<xsl:variable name="count">
											<xsl:number count="table|reqCondGroup|reqSupportEquips|reqSupplies|reqSpares|reqpers|closeRqmts" format="1" from="dmodule" level="any"/>
										</xsl:variable>
										Table <xsl:value-of select="concat($count + 1,' ','Required Conditions')"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										Nomenclature
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										Identification No.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
										Qty
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before="4pt" padding-after="4pt" start-indent="0">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
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
		</xsl:choose>
	</xsl:template>

	<xsl:template name="title-para">
		<fo:block xsl:use-attribute-sets="normal-text" space-after=".15in">
			<fo:list-block provisional-distance-between-starts=".3in"  text-indent="0">
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="levelledPara" format="1."/>
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

	<xsl:template name="proceduralStep-title-para">
		<fo:block xsl:use-attribute-sets="normal-text" space-after=".15in">
			<fo:list-block provisional-distance-between-starts=".3in"  text-indent="0">
				<xsl:choose>
					<xsl:when test="self::para and parent::proceduralStep[parent::proceduralStep[parent::proceduralStep]]">
						<xsl:attribute name="start-indent">
								.76in
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::proceduralStep">
						<xsl:attribute name="start-indent">
							.5in
						</xsl:attribute>
					</xsl:when>
				</xsl:choose>
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:choose>
								<xsl:when test="self::para and parent::proceduralStep[parent::proceduralStep[parent::proceduralStep]]">
									<xsl:number count="proceduralStep" format="(1)"/>
								</xsl:when>
								<xsl:when test="parent::proceduralStep">
									<xsl:number count="proceduralStep" format="A."/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:number count="proceduralStep" format="1."/>
								</xsl:otherwise>
							</xsl:choose>
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

	<xsl:template match="listItem[parent::randomList/ancestor::randomList]">
		<fo:list-block provisional-distance-between-starts=".3in"  text-indent="0">
			<!-- list item -->
			<fo:list-item>
				<!-- insert a bullet -->
				<fo:list-item-label end-indent="label-end()">
					<fo:block>
						<xsl:choose>
							<xsl:when test="parent::sequentialList">
								<xsl:number count="listItem"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'&#8226;'"/>
							</xsl:otherwise>
						</xsl:choose>
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
	</xsl:template>

	<xsl:template match="acronym">
		<fo:inline id="{generate-id(.)}" white-space-treatment="ignore">
			<xsl:choose>
				<xsl:when test="@acronymType = 'at03'">
					<xsl:apply-templates select="acronymTerm"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="acronymDefinition"/>
					<xsl:apply-templates select="acronymTerm"/>
				</xsl:otherwise>
			</xsl:choose>			
		</fo:inline>
	</xsl:template>

	<xsl:template match="acronymTerm">
		<fo:inline xsl:use-attribute-sets="normal-text">
			<xsl:if test="./text() = '&#43;' or ./text() = '&#916;' or ./text() = '&#8800;' or ./text() = '&#8804;' or ./text() =  '&#8805;' or ./text() = '&#8486;'">
					<xsl:attribute name="font-family">Symbol</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="ancestor::acronym[@acronymType = 'at03']">
					<xsl:variable name="term">
						<xsl:apply-templates/>
					</xsl:variable>
					<xsl:variable name="text-after">
						<xsl:value-of select="following-sibling::text()"/>
					</xsl:variable>
					<xsl:variable name="following-char">
						<xsl:value-of select="substring($text-after,1,1)"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="contains($following-char,'.') or contains($following-char,',') or contains($following-char,'-')
						or contains($following-char,' ') or contains($following-char,'s') or contains($following-char,')')
						or ./text() = '±' or ./text() = '%'">
							<xsl:apply-templates/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="' '"/>
								<xsl:apply-templates/>
							<xsl:value-of select="' '"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="following-sibling::*[1][self::acronymDefinition]">
					<xsl:variable name="term">
						<xsl:apply-templates/>
					</xsl:variable>
					<xsl:variable name="text-after">
						<xsl:value-of select="ancestor::acronym/following-sibling::text()"/>
					</xsl:variable>
					<xsl:variable name="following-char">
						<xsl:value-of select="substring($text-after,1,1)"/>
					</xsl:variable>
					<fo:basic-link color="blue">
						<xsl:choose>
							<xsl:when test="ancestor::acronym[@acronymType = 'at02']">
								<xsl:attribute name="internal-destination">terms</xsl:attribute>
							</xsl:when>
							<xsl:when test="ancestor::acronym[@acronymType = 'at04']">
								<xsl:attribute name="internal-destination">spec</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="internal-destination">acronyms</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ancestor::acronym[@acronymType = 'at04']">
								<xsl:choose>
									<xsl:when test="contains($following-char,'.') or contains($following-char,',') or contains($following-char,'-')
									or contains($following-char,' ') or contains($following-char,'s')">
										<xsl:value-of select="concat(' ',$term)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat(' ',$term,' ')"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="contains($following-char,'.') or contains($following-char,',') or contains($following-char,'-')
									or contains($following-char,' ') or contains($following-char,'s') or contains($following-char,')')
									or ./text() = '±'">
										<xsl:value-of select="' ('"/>
										<xsl:apply-templates/>
										<xsl:value-of select="')'"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="' ('"/>
										<xsl:apply-templates/>
										<xsl:value-of select="') '"/>
									</xsl:otherwise>
								</xsl:choose>							
							</xsl:otherwise>
						</xsl:choose>											
					</fo:basic-link>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="term">
						<xsl:apply-templates/>
					</xsl:variable>
					<xsl:variable name="text-after">
						<xsl:value-of select="following-sibling::text()"/>
					</xsl:variable>
					<xsl:variable name="following-char">
						<xsl:value-of select="substring($text-after,1,1)"/>
					</xsl:variable>					
						<xsl:choose>
							<xsl:when test="contains($following-char,'.') or contains($following-char,',') or contains($following-char,'-')
							or (contains($following-char,' ') and not(string-length($text-after) = 1)) or contains($following-char,'s') or contains($following-char,')')
							or ./text() = '±'">
								<xsl:apply-templates/>
							</xsl:when>
							<xsl:when test="contains($following-char,' ') and string-length($text-after) = 1">
								<xsl:apply-templates/>
								<xsl:value-of select="' '"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="' '"/>
									<xsl:apply-templates/>
								<xsl:value-of select="' '"/>
							</xsl:otherwise>
						</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>			
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="acronymDefinition">
		<fo:inline xsl:use-attribute-sets="normal-text" white-space-treatment="preserve">
			<xsl:value-of select="concat(./text(),' ')"/>
		</fo:inline>
	</xsl:template>

	<xsl:template match="listItem[parent::sequentialList]">
		<fo:list-block provisional-distance-between-starts=".3in"  text-indent="0">
			<fo:list-item>
				<fo:list-item-label end-indent="label-end()">
					<fo:block>
						<xsl:number count="listItem"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
					<fo:block>
						<xsl:apply-templates/>
					</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>

	<xsl:template match="caution|warning">
		<fo:block xsl:use-attribute-sets="bold-normal-text" id="{generate-id(.)}" text-align="left" keep-together.within-page="always" keep-with-next.within-page="always">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="parent::proceduralStep">
					<xsl:choose>
						<xsl:when test="count(ancestor::proceduralStep)=1">
							<xsl:attribute name="start-indent">.52in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=2">
							<xsl:attribute name="start-indent">1.05in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=3">
							<xsl:attribute name="start-indent">1.72in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=4">
							<xsl:attribute name="start-indent">2.62in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=5">
							<xsl:attribute name="start-indent">3.6in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=6">
							<xsl:attribute name="start-indent">4.4in</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="parent::levelledPara">
					<xsl:choose>
						<xsl:when test="count(ancestor::levelledPara)=1">
							<xsl:attribute name="start-indent">.52in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=2">
							<xsl:attribute name="start-indent">1in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=3">
							<xsl:attribute name="start-indent">1.72in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=4">
							<xsl:attribute name="start-indent">2.62in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=5">
							<xsl:attribute name="start-indent">3.6in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=6">
							<xsl:attribute name="start-indent">4.4in</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
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
			<fo:block>
				<xsl:apply-templates/>
			</fo:block>
		</fo:block>
	</xsl:template>

	<xsl:template match="warningAndCautionPara">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="para[parent::listItem[parent::randomList/ancestor::randomList]]">
		<fo:block xsl:use-attribute-sets="normal-text">			
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="para[parent::listItem[parent::randomList]]">
		<fo:block xsl:use-attribute-sets="normal-text">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="para[parent::listItem[parent::sequentialList]]">
		<fo:block xsl:use-attribute-sets="normal-text">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="para[parent::listItem[parent::randomList[parent::para[parent::levelledPara]]]]">
		<fo:block xsl:use-attribute-sets="normal-text" margin-left=".3in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:block text-indent="-.3in">
				-
				<fo:leader leader-length=".2in"/>
				<xsl:apply-templates/>
			</fo:block>
		</fo:block>
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

	<xsl:template match="title[parent::levelledPara][count(ancestor::levelledPara)=2]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent="1.05in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".7in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="levelledPara" level="multiple" format="1.1"/>
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

	<xsl:template match="title[parent::levelledPara][count(ancestor::levelledPara)=3]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent="1.72in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".9in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="levelledPara" level="multiple" format="1.1.1"/>
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

	<xsl:template match="title[parent::levelledPara][count(ancestor::levelledPara)=4]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent="2.62in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts="1in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="levelledPara" level="multiple" format="1.1.1.1"/>
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

	<xsl:template match="title[parent::levelledPara][count(ancestor::levelledPara)=5]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent="3.6in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts="1.1in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="levelledPara" level="multiple" format="1.1.1.1.1"/>
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
	
	<xsl:template match="title[parent::levelledPara][count(ancestor::levelledPara)=6]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent="4.22in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts="1.1in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="levelledPara" level="multiple" format="1.1.1.1.1.1"/>
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
	
	

	<xsl:template match="title[parent::proceduralStep][count(ancestor::proceduralStep)=1]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent=".52in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".5in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="proceduralStep" level="multiple" format="1"/>
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

	<xsl:template match="title[parent::proceduralStep][count(ancestor::proceduralStep)=2]" >
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent="1.05in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".65in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="proceduralStep" level="multiple" format="1.1"/>
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

	<xsl:template match="title[parent::proceduralStep][count(ancestor::proceduralStep)=3]" >
		<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="left" keep-with-next.within-page="always" start-indent="1.72in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".75in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="proceduralStep" level="multiple" format="1.1.1"/>
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
	
	<xsl:template match="title[parent::proceduralStep][count(ancestor::proceduralStep)=4]">
		<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="left"  keep-with-next.within-page="always" start-indent="2.62in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".9in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1"/>
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
	
	<xsl:template match="title[parent::proceduralStep][count(ancestor::proceduralStep)=5]">
		<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="left" keep-with-next.within-page="always" start-indent="3.6in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts="1in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1.1"/>
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

	<xsl:template match="title[parent::proceduralStep][count(ancestor::proceduralStep)=6]">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" keep-with-next.within-page="always" start-indent="4.4in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".5in"
					provisional-label-separation="0.15cm">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:number count="proceduralStep" level="multiple" format="1"/>
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
	
	
	
	<xsl:template match="para[count(ancestor::proceduralStep)=1][parent::proceduralStep][not(preceding-sibling::para)][not(preceding-sibling::title)]">
	<fo:block id="{generate-id(.)}" padding-after=".1in">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
		<fo:block xsl:use-attribute-sets="normal-text" text-align="left" start-indent=".52in">	
		
			<fo:list-block provisional-distance-between-starts=".5in" text-indent="0">
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:if test="not(preceding-sibling::title)">
							<xsl:number count="proceduralStep" level="multiple" format="1"/>
							</xsl:if>
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
	</fo:block>
</xsl:template>

	<xsl:template match="para[count(ancestor::proceduralStep)=2][parent::proceduralStep][not(preceding-sibling::para)][not(preceding-sibling::title)]">
			<fo:block xsl:use-attribute-sets="normal-text" padding-after=".1in" start-indent="1.05in" id="{generate-id(.)}">
				<fo:marker marker-class-name="dmcode">
					<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
					ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
				</fo:marker>
				<fo:list-block provisional-distance-between-starts=".65in" text-indent="0">
					<!-- list item -->
					<fo:list-item>
						<!-- insert a bullet -->
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:number count="proceduralStep" level="multiple" format="1.1"/>
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
	
	<xsl:template match="para[count(ancestor::proceduralStep)=3][parent::proceduralStep][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block id="{generate-id(.)}" padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:block xsl:use-attribute-sets="normal-text" start-indent="1.72in">	
				<fo:list-block provisional-distance-between-starts=".75in" text-indent="0">
					<!-- list item -->
					<fo:list-item>
						<!-- insert a bullet -->
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1"/>
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
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[count(ancestor::proceduralStep)=4][parent::proceduralStep][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block id="{generate-id(.)}" padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:block xsl:use-attribute-sets="normal-text" start-indent="2.62in">	
				<fo:list-block provisional-distance-between-starts=".9in" text-indent="0">
					<!-- list item -->
					<fo:list-item>
						<!-- insert a bullet -->
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1"/>
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
		</fo:block>
	</xsl:template>

	<xsl:template match="para[count(ancestor::proceduralStep)=5][parent::proceduralStep][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block id="{generate-id(.)}" padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:block xsl:use-attribute-sets="normal-text" start-indent="3.6in"> 	
				<fo:list-block provisional-distance-between-starts="1in" text-indent="0">
					<!-- list item -->
					<fo:list-item>
						<!-- insert a bullet -->
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1.1"/>
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
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[count(ancestor::proceduralStep)=6][parent::proceduralStep][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block id="{generate-id(.)}" padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:block xsl:use-attribute-sets="normal-text" >	
				<fo:list-block provisional-distance-between-starts="1.1in" text-indent="0" start-indent="4.4in">
					<!-- list item -->
					<fo:list-item>
						<!-- insert a bullet -->
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:number count="proceduralStep" level="multiple" format="1.1.1.1.1.1"/>
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
		</fo:block>
	</xsl:template>

	

	<!--
	<xsl:template match="para[parent::levelledPara]|para[parent::proceduralStep][../title]">
		<fo:block start-indent=".5in" xsl:use-attribute-sets="normal-text" space-after=".22in">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	-->
	
	<xsl:template match="para[count(ancestor::levelledPara[child::para or child::title])=1][parent::levelledPara][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block xsl:use-attribute-sets="normal-text" padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:block xsl:use-attribute-sets="normal-text" space-after=".15in" start-indent=".52in">
				<fo:list-block provisional-distance-between-starts=".615in"  text-indent="0">
					<!-- list item -->
					<fo:list-item>
						<!-- insert a bullet -->
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:if test="not(preceding-sibling::title)">
									<xsl:number count="levelledPara[child::para or child::title]" level="multiple" format="1"/>
								</xsl:if>
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
		</fo:block>
	</xsl:template>
	
	
	<xsl:template match="para[count(ancestor::levelledPara[child::para or child::title])=2][parent::levelledPara][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block xsl:use-attribute-sets="normal-text"  padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:block xsl:use-attribute-sets="normal-text" start-indent="1.05in">
				<fo:list-block provisional-distance-between-starts=".615in"  text-indent="0">
					<!-- list item -->
					<fo:list-item>
						<!-- insert a bullet -->
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:if test="not(preceding-sibling::title)">
									<xsl:number count="levelledPara[child::para or child::title]" level="multiple" format="1.1"/>
								</xsl:if>
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
		</fo:block>
	</xsl:template>

	<xsl:template match="para[count(ancestor::levelledPara[child::para or child::title])=3][parent::levelledPara][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block xsl:use-attribute-sets="normal-text" start-indent="1.72in"  padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:list-block provisional-distance-between-starts=".74in" text-indent="0" >
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:if test="not(preceding-sibling::title)">
								<xsl:number count="levelledPara[child::para or child::title]" level="multiple" format="1.1.1"/>
							</xsl:if>
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


	<xsl:template match="para[count(ancestor::levelledPara[child::para or child::title])=4][parent::levelledPara][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block xsl:use-attribute-sets="normal-text" start-indent="2.62in"  padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:list-block provisional-distance-between-starts=".85in" text-indent="0">
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:if test="not(preceding-sibling::title)">
								<xsl:number count="levelledPara[child::para or child::title]" level="multiple" format="1.1.1.1"/>
							</xsl:if>
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
	
	<xsl:template match="para[count(ancestor::levelledPara[child::para or child::title])=5][parent::levelledPara][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block xsl:use-attribute-sets="normal-text" start-indent="3.6in"  padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:list-block provisional-distance-between-starts=".85in" text-indent="0">
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:if test="not(preceding-sibling::title)">
								<xsl:number count="levelledPara[child::para or child::title]" level="multiple" format="1.1.1.1.1"/>
							</xsl:if>
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
	
	<xsl:template match="para[count(ancestor::levelledPara[child::para or child::title])=6][parent::levelledPara][not(preceding-sibling::para)][not(preceding-sibling::title)]">
		<fo:block xsl:use-attribute-sets="normal-text" start-indent="4.4in"  padding-after=".1in">
			<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<fo:list-block provisional-distance-between-starts=".85in" text-indent="0">
				<!-- list item -->
				<fo:list-item>
					<!-- insert a bullet -->
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:if test="not(preceding-sibling::title)">
								<xsl:number count="levelledPara[child::para or child::title]" level="multiple" format="1.1.1.1.1.1"/>
							</xsl:if>
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

	<xsl:template match="issueInfo">
		<fo:block>
			Issue No.
			<xsl:value-of select="concat(' ',@inWork)"/>
		</fo:block>
	</xsl:template>

	<xsl:template name="titlePage">
		<xsl:param name="hasDataModule" select="'false'"/>
		<fo:block>
		<fo:marker marker-class-name="dmcode">
			<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
		</fo:marker>
		<fo:block text-align="center" padding-after=".15in">
				<fo:external-graphic content-height="50px" content-width="300px">
					<xsl:attribute name="src">
						<xsl:value-of select="'C:/inetpub/wwwroot/Projects/CMM/Ametek-Rolls/big_utas_logo.cgm'"/>
					</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
			<fo:block padding-after=".2in" font-size="18pt" font-family="arial" text-align="center" font-weight="bold">
				Component Maintenance Publication (CMP)
			</fo:block>
			<fo:block padding-after=".2in" font-size="18pt" font-family="arial" text-align="center" font-weight="bold">
				<xsl:value-of select="/pm/descendant::pmTitle/text()"/>
			</fo:block>
			<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" text-align="center" font-size="14pt">
				<xsl:value-of select="concat('Model: ',/pm/descendant::pmCode/@modelIdentCode)"/>
			</fo:block>
			<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" text-align="center" font-size="14pt">
				<xsl:value-of select="concat('Part Number ',descendant::catalogSeqNumber[1]/descendant::partNumber/text())"/>
			</fo:block>
			<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3.5in" text-align="center" font-size="14pt">
				Issue Number: 000
			</fo:block>
			<fo:block padding-after=".1in" font-size="7pt" font-family="arial"  text-align="center">
				THIS DOCUMENT CONTAINS TECHNICAL DATA AND IS SUBJECT TO U.S. EXPORT REGULATIONS. THESE COMMODITIES, 
				TECHNOLOGY OR SOFTWARE WERE EXPORTED FROM THE UNITED STATES IN ACCORDANCE WITH THE EXPORT ADMINISTRATION 
				REGULATIONS. DIVERSION CONTRARY TO U.S. LAW IS PROHIBITED.
			</fo:block>
			<fo:block padding-after=".1in" font-size="7pt" font-family="arial"  text-align="center">
				U.S. EXPORT CLASSIFICATION: EAR 9E991, NLR ELIGIBLE
			</fo:block>
			<fo:block padding-after=".1in" font-size="7pt" font-family="arial"  text-align="center">
				THE TECHNICAL INFORMATION IN THIS DOCUMENT HAS BEEN APPROVED BY ROLLS-ROYCE PLC UNDER THE AUTHORITY OF DESIGN ORGANISATION APPROVAL EASA.21J.035
			</fo:block>
		</fo:block>
	</xsl:template>

	<xsl:template match="pmEntry[parent::pmEntry]">
		<fo:page-sequence master-reference="main" force-page-count="end-on-even" initial-page-number="1">
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:marker marker-class-name="module-statement">
					<fo:block font-size="6pt" font-weight="normal">
										UTC AEROSPACE SYSTEMS PROPRIETARY-Subject to the restriction on the title or cover page.
										Subject to the EAR - See the Title, First, or Cover Page for more information.
									</fo:block>
				</fo:marker>
				<fo:marker marker-class-name="date">
					<xsl:variable name="date">
						<xsl:choose>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '01'">
								<xsl:value-of select="'Jan'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '02'">
								<xsl:value-of select="'Feb'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '03'">
								<xsl:value-of select="'Mar'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '04'">
								<xsl:value-of select="'April'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '05'">
								<xsl:value-of select="'May'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '06'">
								<xsl:value-of select="'Jun'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '07'">
								<xsl:value-of select="'Jul'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '08'">
								<xsl:value-of select="'Aug'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '09'">
								<xsl:value-of select="'Sept'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '10'">
								<xsl:value-of select="'Oct'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '11'">
								<xsl:value-of select="'Nov'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '12'">
								<xsl:value-of select="'Dec'"/>
							</xsl:when>
							<xsl:otherwise>
								
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="concat($date,' ',ancestor::pm/descendant::issueDate[1]/@day,'/',ancestor::pm/descendant::issueDate[1]/@year)"/>
				</fo:marker>
				<fo:block xsl:use-attribute-sets="bold-titles" padding-before="4.07in" id="{generate-id(.)}" keep-with-next.within-page="always" span="all">
						<xsl:value-of select="pmEntryTitle"/>
					</fo:block>
				<fo:block>
					<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
					</fo:marker>
					<fo:marker marker-class-name="pmTitle">
						<xsl:value-of select="./pmEntryTitle"/>
					</fo:marker>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
		<xsl:apply-templates select="dmodule"/>
	</xsl:template>
	
	<xsl:template match="pmEntry[not(parent::pmEntry)]">
		<fo:page-sequence master-reference="main" force-page-count="end-on-even" initial-page-number="1">
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:marker marker-class-name="module-statement">
					<fo:block font-size="6pt" font-weight="normal">
										UTC AEROSPACE SYSTEMS PROPRIETARY-Subject to the restriction on the title or cover page.
										Subject to the EAR - See the Title, First, or Cover Page for more information.
									</fo:block>
				</fo:marker>
				<fo:marker marker-class-name="date">
					<xsl:variable name="date">
						<xsl:choose>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '01'">
								<xsl:value-of select="'Jan'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '02'">
								<xsl:value-of select="'Feb'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '03'">
								<xsl:value-of select="'Mar'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '04'">
								<xsl:value-of select="'April'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '05'">
								<xsl:value-of select="'May'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '06'">
								<xsl:value-of select="'Jun'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '07'">
								<xsl:value-of select="'Jul'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '08'">
								<xsl:value-of select="'Aug'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '09'">
								<xsl:value-of select="'Sept'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '10'">
								<xsl:value-of select="'Oct'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '11'">
								<xsl:value-of select="'Nov'"/>
							</xsl:when>
							<xsl:when test="ancestor::pm/descendant::issueDate[1]/@month = '12'">
								<xsl:value-of select="'Dec'"/>
							</xsl:when>
							<xsl:otherwise>
								
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="concat($date,' ',ancestor::pm/descendant::issueDate[1]/@day,'/',ancestor::pm/descendant::issueDate[1]/@year)"/>
				</fo:marker>
				<fo:block xsl:use-attribute-sets="bold-titles" padding-before="4.07in" padding-after=".3in" id="{generate-id(.)}" keep-with-next.within-page="always" span="all">
					<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
					</fo:marker>
					<xsl:if test="not(descendant::dmodule/@infoCode = '001')">
						<xsl:value-of select="pmEntryTitle"/>
					</xsl:if>
				</fo:block>	
				<fo:block>					
					<fo:marker marker-class-name="pmTitle">
						<xsl:value-of select="./pmEntryTitle"/>
					</fo:marker>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
		<xsl:if test="not(preceding-sibling::pmEntry)">
			<xsl:call-template name="buildLOEDM"/>
		</xsl:if>
		<xsl:if test="not(preceding-sibling::pmEntry)">
			<xsl:call-template name="buildToc"/>
		</xsl:if>
		<xsl:apply-templates select="dmodule"/>
	</xsl:template>
	
	<xsl:template name="buildLOEDM">
		<fo:page-sequence master-reference="main" force-page-count="end-on-even" initial-page-number="1">
			<xsl:call-template name="front-static-content"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:block id="{'LOEDM'}" span="all" break-after="page">	
						<fo:marker marker-class-name="module-statement">
					<fo:block font-size="6pt" font-weight="normal">
										UTC AEROSPACE SYSTEMS PROPRIETARY-Subject to the restriction on the title or cover page.
										Subject to the EAR - See the Title, First, or Cover Page for more information.
									</fo:block>
				</fo:marker>
						<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
						</fo:marker>
						<fo:block font-size="14pt" padding-after="5pt" text-align="center" font-weight="bold" font-family="arial">
							List of Effective Data Modules
						</fo:block>
						<fo:block font-size="9pt" padding-after="5pt">
							The list of documents are included in Issue 001, dated <xsl:value-of select="concat(ancestor::pm/descendant::issueDate[1]/@year,'-',
							ancestor::pm/descendant::issueDate[1]/@month,'-',ancestor::pm/descendant::issueDate[1]/@day)"/>, of this publication.<fo:block/>
							C = Changed data module<fo:block/>
							N = New data module
						</fo:block>
						<fo:table border-bottom-style="solid" border-bottom-width="1px">
							<fo:table-column column-number="1" column-width="2.2in"/>
							<fo:table-column column-number="2" column-width="2.8in"/>
							<fo:table-column column-number="3" column-width=".8in"/>
							<fo:table-column column-number="4" column-width=".5in"/>
							<fo:table-column column-number="5" column-width=".7in"/>
							<fo:table-header>
								<fo:table-row>
									<fo:table-cell start-indent="0">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text">
											Document Title
										</fo:block>
									</fo:table-cell>
									<fo:table-cell start-indent="0">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="padding-left">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text">
										Data module code
										</fo:block>
									</fo:table-cell>
									<fo:table-cell start-indent="0">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
										Issue Date
										</fo:block>
									</fo:table-cell>
									<fo:table-cell start-indent="0">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
										No. of pages
										</fo:block>
									</fo:table-cell>
									<fo:table-cell start-indent="0">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
										Effectivity
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-header>
							<fo:table-body>
								<xsl:for-each select="/pm/descendant::dmodule[not(@infoCode = '009') and not(@infoCode = '00T')]">
									<fo:table-row>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text">
												<xsl:value-of select="concat(descendant::techName,' - ',descendant::infoName)"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<xsl:attribute name="padding-left">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text">
												<xsl:variable name="destination" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
												<xsl:for-each select="ancestor::pm/descendant::dmodule">
													<xsl:variable name="destination2" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
																	@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
													<xsl:if test="$destination=$destination2">
														<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
															<xsl:if test="@infoCode = '005'">
																<xsl:attribute name="internal-destination">acronyms</xsl:attribute>
															</xsl:if>
															<xsl:if test="@infoCode = '006'">
																<xsl:attribute name="internal-destination">terms</xsl:attribute>
															</xsl:if>
															<xsl:if test="@infoCode = '007'">
																<xsl:attribute name="internal-destination">symbols</xsl:attribute>
															</xsl:if>
															<xsl:if test="@infoCode = '017'">
																<xsl:attribute name="internal-destination">spec</xsl:attribute>
															</xsl:if>
															<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
																	@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
														</fo:basic-link>
														<xsl:value-of select="' N'"/>
													</xsl:if>
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text">
												<xsl:value-of select="concat(/pm/descendant::issueDate[1]/@year,'-',/pm/descendant::issueDate[1]/@month,'-',
												/pm/descendant::issueDate[1]/@day)"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
												
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
												All
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>						
						</fo:table>
					</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template name="buildToc">
		<fo:page-sequence master-reference="main" force-page-count="end-on-even" initial-page-number="1">
			<xsl:call-template name="front-static-content"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:block id="{'toc1'}" span="all" break-after="page">
						<fo:marker marker-class-name="module-statement">
					<fo:block font-size="6pt" font-weight="normal">
										UTC AEROSPACE SYSTEMS PROPRIETARY-Subject to the restriction on the title or cover page.
										Subject to the EAR - See the Title, First, or Cover Page for more information.
									</fo:block>
				</fo:marker>
						<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
						</fo:marker>
						<fo:block font-size="14pt" font-weight="bold" text-align="center" padding-after="5pt" font-family="arial">
							Table of contents 
						</fo:block>
						<fo:table border-bottom-style="solid" border-bottom-width="1px">
							<fo:table-column column-number="1" column-width="3in"/>
							<fo:table-column column-number="2" column-width="3in"/>
							<fo:table-column column-number="3" column-width="1in"/>
							<fo:table-header>
								<fo:table-row>
									<fo:table-cell start-indent="0">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text">
											Document Title
										</fo:block>
									</fo:table-cell>
									<fo:table-cell start-indent="0">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="padding-left">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text">
										Data module code
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
										<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
										<xsl:attribute name="padding-left">3pt</xsl:attribute>
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:attribute name="border-top-style">solid</xsl:attribute>
										<xsl:attribute name="border-top-width">1pt</xsl:attribute>
										<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
											Effectivity
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-header>
							<fo:table-body>
								<xsl:for-each select="/pm/descendant::dmodule[not(@infoCode = '009')]">
									<fo:table-row>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text">
												<xsl:value-of select="concat(descendant::techName,' - ',descendant::infoName)"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<xsl:attribute name="padding-left">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text">
												<xsl:variable name="destination" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
												<xsl:for-each select="ancestor::pm/descendant::dmodule">
													<xsl:variable name="destination2" select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
																	@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
													<xsl:if test="$destination=$destination2">
														<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
															<xsl:if test="@infoCode = '005'">
																<xsl:attribute name="internal-destination">acronyms</xsl:attribute>
															</xsl:if>
															<xsl:if test="@infoCode = '006'">
																<xsl:attribute name="internal-destination">terms</xsl:attribute>
															</xsl:if>
															<xsl:if test="@infoCode = '007'">
																<xsl:attribute name="internal-destination">symbols</xsl:attribute>
															</xsl:if>
															<xsl:if test="@infoCode = '017'">
																<xsl:attribute name="internal-destination">spec</xsl:attribute>
															</xsl:if>
															<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
																	@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
														</fo:basic-link>
													</xsl:if>
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:attribute name="padding-top">3pt</xsl:attribute>
											<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
												All
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>						
						</fo:table>
					</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template match="pmEntry">
		<fo:block xsl:use-attribute-sets="bold-titles" padding-before=".3in" padding-after=".3in" id="{generate-id(.)}">
			<xsl:value-of select="./pmEntryTitle"/>
		</fo:block>
		<fo:block>
			<fo:marker marker-class-name="module-statement">
					<fo:block font-size="6pt" font-weight="normal">
										UTC AEROSPACE SYSTEMS PROPRIETARY-Subject to the restriction on the title or cover page.
										Subject to the EAR - See the Title, First, or Cover Page for more information.
									</fo:block>
				</fo:marker>
			<fo:marker marker-class-name="dmcode">
						<fo:leader/>
				</fo:marker>
			<fo:marker marker-class-name="pmTitle">
				<xsl:value-of select="pmEntryTitle"/>
			</fo:marker>
			<xsl:apply-templates select="dmodule|pmEntry"/>
		</fo:block>
	</xsl:template>

	<!--
	<xsl:template match="pmEntry[parent::pmEntry]">
		<xsl:choose>
		
			<xsl:when test="dmodule[descendant::infoName='Title page']">
				<xsl:call-template name="displayFrontMatter"/>
			</xsl:when>
			<xsl:when test="dmodule[descendant::infoName='Table of contents']">
		</xsl:when>
			<xsl:otherwise>
				<fo:block>
					<fo:marker marker-class-name="pmTitle">
						<xsl:value-of select="pmEntryTitle"/>
					</fo:marker>
					<xsl:apply-templates select="dmodule|pmEntry"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
-->
	<xsl:template name="pmEntry-static-content">
		<fo:static-content flow-name="xsl-region-before">
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt">
				<xsl:value-of select="'NATO '"/>
				<xsl:choose>
					<xsl:when test="/descendant::security[1]/@securityClassification='01'">
						Unclassified
					</xsl:when>
					<xsl:otherwise>
						Classified
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block space-before=".39in">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-after">
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
				<fo:block space-before=".48in"/>
				<fo:table>
					<fo:table-column column-number="1" column-width="2.3in">
					</fo:table-column>
					<fo:table-column column-number="2" column-width="2.3in">
					</fo:table-column>
					<fo:table-column column-number="3" column-width="2.3in">
					</fo:table-column>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="right">
									<xsl:value-of select="pmEntryTitle"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block text-align="left">
									<xsl:value-of select="concat(descendant::dmodule[1]/@systemCode,'-',descendant::dmodule[1]/@subSystemCode,descendant::dmodule[1]/@subSubSystemCode,'-',descendant::dmodule[1]/@assyCode)"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center">
									<xsl:value-of select="'NATO '"/>
									<xsl:choose>
										<xsl:when test="pm/descendant::security[1]/@securityClassification='01'">
											Unclassified
										</xsl:when>
										<xsl:otherwise>
											Classified
										</xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="right">
									<xsl:text>Page </xsl:text>
									<fo:page-number/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:static-content>
	</xsl:template>
	<!--
	<xsl:template match="pmEntry[parent::pmEntry[parent::pmEntry]]">
		<fo:marker marker-class-name="pmTitle">
			<xsl:value-of select="pmEntryTitle"/>
		</fo:marker>
		<xsl:choose>
			<xsl:when test="dmodule[descendant::infoName='Title page']">
				<xsl:call-template name="displayFrontMatter"/>
			</xsl:when>
			<xsl:when test="dmodule[descendant::infoName='Table of contents']">
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="dmodule"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
-->
	<xsl:template match="internalRef[@internalRefTargetType='supequip']">
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

	<xsl:template match="internalRef[@internalRefTargetType='supply']">
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

	<xsl:template name="toc">
		<fo:block space-after=".5in">
			
			<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" space-after=".31in" keep-with-next="always" text-align-last="justify" end-indent=".19in" font-family="arial">
				Table of contents
				<fo:leader leader-alignment="reference-area"/>
				<fo:inline font-weight="normal" xsl:use-attribute-sets="normal-text">
					Page
				</fo:inline>
			</fo:block>
			<fo:block start-indent=".77in">
				<fo:table start-indent=".77in">
					<fo:table-column column-number="1" column-width=".59in"/>
					<fo:table-column column-number="2" column-width="5.1in"/>
					<fo:table-column column-number="3" column-width=".28in"/>
					<fo:table-body>
						<xsl:for-each select="descendant::techName">
							<fo:table-row>
								<fo:table-cell start-indent="0in" number-columns-spanned="2">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="."/>
											<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align="right" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<fo:page-number-citation ref-id="{generate-id(.)}">
											</fo:page-number-citation>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
						<xsl:for-each select="descendant::preliminaryRqmts">
							<fo:table-row>
								<fo:table-cell start-indent="0in" number-columns-spanned="2">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="'Preliminary requirements'"/>
											<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align="right" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<fo:page-number-citation ref-id="{generate-id(.)}">
											</fo:page-number-citation>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
						<xsl:for-each select="descendant::mainProcedure">
							<fo:table-row>
								<fo:table-cell start-indent="0in" number-columns-spanned="2">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="'Procedure'"/>
											<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align="right" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<fo:page-number-citation ref-id="{generate-id(.)}">
											</fo:page-number-citation>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
						<xsl:for-each select="descendant::proceduralStep[child::title]">
							<fo:table-row>
								<fo:table-cell start-indent="0in" number-columns-spanned="2">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="./title"/>
											<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align="right" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<fo:page-number-citation ref-id="{generate-id(.)}">
											</fo:page-number-citation>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
						<xsl:for-each select="descendant::description">
							<fo:table-row>
								<fo:table-cell start-indent="0in" number-columns-spanned="2">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="'Description'"/>
											<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align="right" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<fo:page-number-citation ref-id="{generate-id(.)}">
											</fo:page-number-citation>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
						<xsl:for-each select="descendant::levelledPara[parent::description][child::title]">
							<fo:table-row>
								<fo:table-cell start-indent="0in" number-columns-spanned="2">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="./title"/>
											<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align="right" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<fo:page-number-citation ref-id="{generate-id(.)}">
											</fo:page-number-citation>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
						<xsl:for-each select="descendant::levelledPara[parent::levelledPara]">
							<fo:table-row>
								<fo:table-cell start-indent="0in">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:number count="levelledPara" format="A."/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align-last="justify" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<xsl:value-of select="./title"/>
											<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0in">
									<fo:block text-align="right" xsl:use-attribute-sets="normal-text" padding-after=".1in">
										<fo:basic-link internal-destination="{generate-id(.)}">
											<fo:page-number-citation ref-id="{generate-id(.)}">
											</fo:page-number-citation>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:block>
	</xsl:template>

	<xsl:template match="refs">
	</xsl:template>

	<xsl:template match="figure">
		<fo:block id="{generate-id(.)}" keep-together="always">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
			<xsl:apply-templates select="./graphic"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="caption">
		<fo:block xsl:use-attribute-sets="normal-text" padding-after=".1in">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="definitionList">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="emphasis">
		<xsl:choose>
			<xsl:when test="@emphasisType = 'em01'">
				<fo:inline font-weight="bold">
					<xsl:apply-templates/>
				</fo:inline>
			</xsl:when>
			<xsl:otherwise>
				<fo:inline font-weight="bold">
					<xsl:apply-templates/>
				</fo:inline>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="definitionListItem">
			<fo:table start-indent="none">
				<fo:table-column column-number="1"/>
				<fo:table-column column-number="2"/>
				<fo:table-body>
					<xsl:for-each select="listItemTerm">
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-before">3pt</xsl:attribute>
							<fo:block>
								<xsl:apply-templates/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-before">3pt</xsl:attribute>
							<fo:block>
								<xsl:apply-templates select="following-sibling::*[1]"/>
							</fo:block>
						</fo:table-cell>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>			
	</xsl:template>

	<xsl:template match="graphic">
		<fo:block text-align="center" width="7in" padding-after=".1in" start-indent="0" break-before="page" font-family="arial" id="{generate-id(.)}">
		<xsl:variable name="graphicPath">
			<xsl:value-of select="ext:getGraphicPath('dave')"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.cgm'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
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
		</fo:block>
	</xsl:template>

	<xsl:template match="figure/title">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" font-size="12pt">
			Figure <xsl:number count="figure" level="any" from="dmodule"/>
			<fo:leader leader-length=".06in"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="subScript">
		<fo:inline xsl:use-attribute-sets="normal-text" vertical-align="sub"><!--
			<xsl:variable name="text-after">
				<xsl:value-of select="following-sibling::text()"/>
			</xsl:variable>
			<xsl:variable name="following-char">
				<xsl:value-of select="substring($text-after,1,1)"/>
			</xsl:variable>-->
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="superScript">
		<fo:inline xsl:use-attribute-sets="normal-text" vertical-align="super">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>

	<xsl:template match="infoName">
		<fo:inline xsl:use-attribute-sets="bold-titles" keep-with-next.within-page="always">
			
			<fo:leader leader-length=".06in"/>
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>

	<xsl:template match="techName">
		<fo:inline xsl:use-attribute-sets="bold-titles" id="{generate-id(.)}" keep-with-next.within-page="always">
			<xsl:choose>
				<xsl:when test="./text()='Table of contents' or ./text()='List of Support Equipment' or ./text()='List of supplies'">
					<xsl:value-of select="ancestor::pm/descendant::pmTitle"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> - </xsl:text>
		</fo:inline>
	</xsl:template>

	<xsl:template match="content">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="procedure">
		<fo:block id="{generate-id(.)}"></fo:block>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="note">
		<fo:block id="{generate-id(.)}" keep-together.within-page="always">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="parent::proceduralStep">
					<xsl:choose>
						<xsl:when test="count(ancestor::proceduralStep)=1">
							<xsl:attribute name="start-indent">.52in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=2">
							<xsl:attribute name="start-indent">1.05in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=3">
							<xsl:attribute name="start-indent">1.72in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=4">
							<xsl:attribute name="start-indent">2.62in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=5">
							<xsl:attribute name="start-indent">3.6in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::proceduralStep)=6">
							<xsl:attribute name="start-indent">4.4in</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="parent::levelledPara">
					<xsl:choose>
						<xsl:when test="count(ancestor::levelledPara)=1">
							<xsl:attribute name="start-indent">.52in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=2">
							<xsl:attribute name="start-indent">1.05in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=3">
							<xsl:attribute name="start-indent">1.72in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=4">
							<xsl:attribute name="start-indent">2.62in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=5">
							<xsl:attribute name="start-indent">3.6in</xsl:attribute>
						</xsl:when>
						<xsl:when test="count(ancestor::levelledPara)=6">
							<xsl:attribute name="start-indent">4.4in</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
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


	<xsl:template match="preliminaryRqmts">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" space-after=".15in" id="{generate-id(.)}" keep-with-next.within-page="always">
			Preliminary requirements
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>

	

	<xsl:template match="reqSupportEquips">
		<fo:block space-after=".37in" id="{generate-id(.)}">		
			<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
				Support Equipment
			</fo:block>
			<fo:table start-indent=".75in">
				<fo:table-column column-number="1" column-width="1.76in"/>
				<fo:table-column column-number="2" column-width="1.79in"/>
				<fo:table-column column-number="3" column-width=".55in"/>
				<fo:table-column column-number="4" column-width="2.18in"/>
				<fo:table-header>
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
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text">
							Name
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text">
							Identification No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" >
							Qty
							</fo:block>
						</fo:table-cell>
						<fo:table-cell start-indent="0">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text">
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
	
	

	<xsl:template match="reqSupplies">
		<fo:block space-after=".37in" id="{generate-id(.)}">
			
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Consumables, Materials and Expendables
					</fo:block>
					<fo:table start-indent=".75in">
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.18in"/>
						<fo:table-header>
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
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
									Name
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
									Identification No.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" >
									Qty
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
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
			<xsl:for-each select="./supplyDescr">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</fo:table-body>
	</xsl:template>

	<xsl:template match="supportEquipDescrGroup">
		<fo:table-body>
			<xsl:for-each select="./supportEquipDescr">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
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
	
	<xsl:template match="remarks">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="simplePara">
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="supplyDescr">
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


	<xsl:template match="reqQuantity">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="identNumber">
		<xsl:value-of select="'Pt. No: '"/>
		<xsl:apply-templates select="partAndSerialNumber"/>
		<fo:block/>
	    <xsl:value-of select="'NSCM: '"/>
		<xsl:apply-templates select="manufacturerCode"/>		
	</xsl:template>

	<xsl:template match="partAndSerialNumber">
		<xsl:apply-templates select="partNumber"/>
	</xsl:template>

	<xsl:template match="partNumber">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="reqSpares">
		<fo:block space-after=".37in" id="{generate-id(.)}">
			
					<fo:block font-weight="bold" font-size="14pt" font-family="arial" padding-after=".1in" keep-with-next.within-page="always">
						Spares
					</fo:block>
					<fo:table start-indent=".75in">
						<fo:table-column column-number="1" column-width="1.76in"/>
						<fo:table-column column-number="2" column-width="1.79in"/>
						<fo:table-column column-number="3" column-width=".55in"/>
						<fo:table-column column-number="4" column-width="2.18in"/>
						<fo:table-header>
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
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
									Name
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
									Identification No.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text" >
									Qty
									</fo:block>
								</fo:table-cell>
								<fo:table-cell start-indent="0">
									<xsl:attribute name="padding-top">3pt</xsl:attribute>
									<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									<fo:block xsl:use-attribute-sets="normal-text">
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
	
	<xsl:template match="spareDescrGroup">
		<fo:table-body>
			<xsl:for-each select="./spareDescr">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</fo:table-body>
	</xsl:template>
	
	<xsl:template match="spareDescr">
		<fo:table-row>
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::spareDescr)">
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
				<xsl:if test="not(following-sibling::spareDescr)">
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
				<xsl:if test="not(following-sibling::spareDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="reqQuantity"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell start-indent="0">
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
				<xsl:if test="not(following-sibling::spareDescr)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="remarks"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="remarks">
		<xsl:value-of select="./simplepara/text()"/>
	</xsl:template>
	
	<xsl:template match="name|reqQuantity">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="catalogSeqNumberRef">
		<xsl:value-of select="@catalogSeqNumberValue"/>
	</xsl:template>
	<!--
	<xsl:template match="identNumber">
		<xsl:value-of select="manufacturerCode\text()"/>
		<fo:block/>
		<xsl:apply-templates select="partAndSerialNumber"/>
	</xsl:template>
	-->
	<xsl:template match="partAndSerialNumber">
		<xsl:value-of select="partNumber/text()"/>
	</xsl:template>

	<xsl:template match="reqSafety">
		<fo:block space-after=".37in" id="{generate-id(.)}">
			
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

	<xsl:template match="mainProcedure">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" space-after=".15in" id="{generate-id(.)}" keep-with-next.within-page="always">
			Procedure
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>	

	<xsl:template match="proceduralStep">
		<fo:block id="{generate-id(.)}" xsl:use-attribute-sets="bold-titles">
					<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',
										ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=1]" >
		<fo:block id="{generate-id(.)}" text-align="left">
			<fo:marker marker-class-name="dmcode">
							<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
											ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
			</fo:marker>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=2]">
		<fo:block id="{generate-id(.)}">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker></fo:block>
		<xsl:apply-templates/>	
	</xsl:template>

	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=3]">
		<fo:block id="{generate-id(.)}" >
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
		</fo:marker></fo:block>
			<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=4]">
		<fo:block id="{generate-id(.)}">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
					</fo:marker></fo:block>
			<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=5]">
		<fo:block id="{generate-id(.)}">
		<fo:marker marker-class-name="dmcode">
						<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
										ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
		</fo:marker></fo:block>
			<xsl:apply-templates/>
	</xsl:template>
	<!--
	<xsl:template match="para[parent::entry][ancestor::table]">
		<fo:block space-after="0" xsl:use-attribute-sets="normal-text" hyphenate="true" wrap-option="wrap">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>-->
	
	<xsl:template match="para[parent::entry]">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="para">
		<fo:block xsl:use-attribute-sets="normal-text" padding-after=".1in">
			<xsl:choose>
				<xsl:when test="parent::entry or parent::listItemDefinition">
					<xsl:attribute name="start-indent">0</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::levelledPara|ancestor::proceduralStep)=1">
					<xsl:attribute name="start-indent">.52in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::levelledPara|ancestor::proceduralStep)=2">
					<xsl:attribute name="start-indent">1.05in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::levelledPara|ancestor::proceduralStep)=3">
					<xsl:attribute name="start-indent">1.72in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::levelledPara|ancestor::proceduralStep)=4">
					<xsl:attribute name="start-indent">2.62in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::levelledPara|ancestor::proceduralStep)=5">
					<xsl:attribute name="start-indent">3.6in</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="start-indent">.3in</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<!-- Named templates -->
	
	<xsl:template match="commonInfo">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="module-end">
		<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" space-after=".15in" text-align="center" keep-with-previous.within-page="always" keep-together="always">
			<fo:leader leader-length="100%" leader-pattern="rule" color="blue"/>
			<fo:block padding-after="4pt"/>
			<xsl:text>End of Module </xsl:text>
			<xsl:value-of select="concat(@modelIdentCode,'-',@systemDiffCode,'-',@systemCode,'-',@subSystemCode,@subSubSystemCode,'-',@assyCode,'-',
									@disassyCode,@disassyCodeVariant,'-',@infoCode,@infoCodeVariant,'-',@itemLocationCode)"/>
			<fo:block/>
			<fo:leader leader-length="100%" leader-pattern="rule" color="blue"/>
		</fo:block>
	</xsl:template>

	<xsl:template name="displayFrontMatter">
		<fo:block>
			<xsl:apply-templates select="descendant::dmodule[descendant::infoName='List of abbreviations']"/>
		</fo:block>
		<fo:block>
			<xsl:apply-templates select="descendant::dmodule[descendant::infoName='List of terms']"/>
		</fo:block>
		<fo:block>
			<xsl:apply-templates select="descendant::dmodule[descendant::infoName='List of symbols']"/>
		</fo:block>
		<fo:block>
			<xsl:apply-templates select="descendant::dmodule[descendant::infoName='List of Support Equipment']"/>
		</fo:block>
		<fo:block>
			<xsl:apply-templates select="descendant::dmodule[descendant::infoName='List of supplies']"/>
		</fo:block>
		<fo:block>
			<xsl:apply-templates select="descendant::dmodule[descendant::infoName='Technical standard record']"/>
		</fo:block>
		<fo:block>
			<xsl:apply-templates select="descendant::dmodule[descendant::infoName='List of related data']"/>
		</fo:block>
	</xsl:template>
	

	<xsl:template name="front-static-content">
		<fo:static-content flow-name="main.blank.header">
			<fo:table>
				<fo:table-column column-number="1" column-width="3.5in"/>
				<fo:table-column column-number="2" column-width="3.5in"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<fo:external-graphic src="C:/inetpub/wwwroot/Projects/CMM/Ametek-Rolls/big_utas_logo.cgm" content-height=".25in" content-width="200px"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
								<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt">
				<xsl:choose>
					<xsl:when test="/descendant::security[1]/@securityClassification='01'">
						UNCLASSIFIED
					</xsl:when>
					<xsl:otherwise>
						CLASSIFIED
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block space-before=".09in">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
			</fo:block>
			<fo:block padding-before="4.1in" xsl:use-attribute-sets="normal-text" text-align="center" font-weight="bold" font-size="10pt">
				Intentionally left blank
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-before">
			<fo:table>
				<fo:table-column column-number="1" column-width="3.5in"/>
				<fo:table-column column-number="2" column-width="3.5in"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<fo:external-graphic src="C:/inetpub/wwwroot/Projects/CMM/Ametek-Rolls/big_utas_logo.cgm" content-height=".25in" content-width="200px"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
								<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt">
				<xsl:choose>
					<xsl:when test="/descendant::security[1]/@securityClassification='01'">
						UNCLASSIFIED
					</xsl:when>
					<xsl:otherwise>
						CLASSIFIED
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block space-before=".09in">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-before2Cols">
			<fo:table>
				<fo:table-column column-number="1" column-width="3.5in"/>
				<fo:table-column column-number="2" column-width="3.5in"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<fo:external-graphic src="C:/inetpub/wwwroot/Projects/CMM/Ametek-Rolls/big_utas_logo.cgm" content-height=".25in" content-width="200px"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
								<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt">
				<xsl:choose>
					<xsl:when test="/descendant::security[1]/@securityClassification='01'">
						UNCLASSIFIED
					</xsl:when>
					<xsl:otherwise>
						CLASSIFIED
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block space-before=".09in" text-align="center" font-family="arial" font-style="italic" span="all">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
				<fo:retrieve-marker retrieve-class-name="generatedModuleTitle"/>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-before-landscape">
			<fo:table>
				<fo:table-column column-number="1" column-width="6.75in"/>
				<fo:table-column column-number="2" column-width="6.75in"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<fo:external-graphic src="C:/inetpub/wwwroot/Projects/CMM/Ametek-Rolls/big_utas_logo.cgm" content-height=".25in" content-width="200px"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
								<xsl:value-of select="concat(/pm/descendant::pmCode/@modelIdentCode,'-',/pm/descendant::pmCode/@pmIssuer,'-',
								/pm/descendant::pmCode/@pmNumber,'-',/pm/descendant::pmCode/@pmVolume)"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt">
				<xsl:choose>
					<xsl:when test="/descendant::security[1]/@securityClassification='01'">
						UNCLASSIFIED
					</xsl:when>
					<xsl:otherwise>
						CLASSIFIED
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block space-before=".09in">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-after">
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt" padding-before=".2in">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
				<fo:table >
					<fo:table-column column-width="3.49in" column-number="1"/>
					<fo:table-column column-width="3.49in" column-number="2"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
									Effectivity: All
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
									<fo:retrieve-marker retrieve-class-name="dmcode" retrieve-position="last-starting-within-page"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block padding-after=".2in"/>
				<fo:table>
					<fo:table-column column-width="2.5in" column-number="1"/>
					<fo:table-column column-width="2in" column-number="2"/>
					<fo:table-column column-width="2.5in" column-number="3"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell display-align="after">
								<fo:block xsl:use-attribute-sets="normal-text">
									<fo:block text-align="left" font-size="28pt">
										<xsl:value-of select="concat(/pm/descendant::dmodule[1]/@systemCode,'-',/pm/descendant::dmodule[1]/@subSystemCode,
										/pm/descendant::dmodule[1]/@subSubSystemCode,'-',/pm/descendant::dmodule[1]/@assyCode)"/>
									</fo:block>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center">
									<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="11pt">
										<fo:retrieve-marker retrieve-class-name="end" retrieve-boundary="page"/>
										<xsl:choose>
											<xsl:when test="/descendant::security[1]/@securityClassification='01'">
												UNCLASSIFIED
											</xsl:when>
											<xsl:otherwise>
												CLASSIFIED
											</xsl:otherwise>
										</xsl:choose>
									</fo:block>
									<fo:retrieve-marker retrieve-class-name="module-statement"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
									<xsl:variable name="month" select="/descendant::issueDate[1]/@month"/>
									<xsl:variable name="day" select="/descendant::issueDate[1]/@day"/>
									<xsl:variable name="year" select="/descendant::issueDate[1]/@year"/>
									<xsl:value-of select="concat($month,'-',$day,'-',$year,' ','Page',' ')"/>
									<fo:page-number/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>			
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-after-landscape">
			<fo:block xsl:use-attribute-sets="bold-titles" font-size="11pt" padding-before=".2in">
				<fo:leader leader-pattern="rule" leader-length="100%"/>
				<fo:table >
					<fo:table-column column-number="1" column-width="6.7in"/>
					<fo:table-column column-number="2" column-width="6.7in"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
									Effectivity: All
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
									<fo:retrieve-marker retrieve-class-name="dmcode" retrieve-position="last-starting-within-page"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block padding-after=".2in"/>
				<fo:table>
					<fo:table-column column-number="1" column-width="3.7in"/>
					<fo:table-column column-number="2" column-width="6in"/>
					<fo:table-column column-number="3" column-width="3.7in"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell display-align="after">
								<fo:block xsl:use-attribute-sets="normal-text">
									<fo:block text-align="left" font-size="28pt">
										<xsl:value-of select="concat(/pm/descendant::dmodule[1]/@systemCode,'-',/pm/descendant::dmodule[1]/@subSystemCode,
										/pm/descendant::dmodule[1]/@subSubSystemCode,'-',/pm/descendant::dmodule[1]/@assyCode)"/>
									</fo:block>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center">
									<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="11pt">
										<fo:retrieve-marker retrieve-class-name="end" retrieve-boundary="page"/>
										<xsl:choose>
											<xsl:when test="/descendant::security[1]/@securityClassification='01'">
												UNCLASSIFIED
											</xsl:when>
											<xsl:otherwise>
												CLASSIFIED
											</xsl:otherwise>
										</xsl:choose>
									</fo:block>
									<fo:retrieve-marker retrieve-class-name="module-statement"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="right">
									<xsl:variable name="month" select="/descendant::issueDate[1]/@month"/>
									<xsl:variable name="day" select="/descendant::issueDate[1]/@day"/>
									<xsl:variable name="year" select="/descendant::issueDate[1]/@year"/>
									
									<xsl:value-of select="concat($month,'-',$day,'-',$year,' ','Page',' ')"/>
									<fo:page-number/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				
			</fo:block>
		</fo:static-content>
	</xsl:template>

</xsl:stylesheet>


