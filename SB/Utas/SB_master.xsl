<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ext="http://some.namespace.com">
	<xsl:import href="attribute-sets.xsl"/>
	<xsl:import href="tables.xsl"/>
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
					<fo:bookmark-title><xsl:value-of select="concat(descendant::techName/text(),' - ',descendant::infoName/text())"/></fo:bookmark-title>
				</fo:bookmark>
				<fo:bookmark internal-destination="{'summary'}" starting-state="hide">
					<fo:bookmark-title><xsl:value-of select="'Summary'"/></fo:bookmark-title>
				</fo:bookmark>
				<fo:bookmark internal-destination="{'planning-info'}" starting-state="hide">
					<fo:bookmark-title><xsl:value-of select="'Planning Information'"/></fo:bookmark-title>
				</fo:bookmark>
				<fo:bookmark internal-destination="{'material-info'}" starting-state="hide">
					<fo:bookmark-title><xsl:value-of select="'Material Information'"/></fo:bookmark-title>
				</fo:bookmark>
				<fo:bookmark internal-destination="{'accomplish-instruc'}" starting-state="hide">
					<fo:bookmark-title><xsl:value-of select="'Accomplishment Instructions'"/></fo:bookmark-title>
				</fo:bookmark>
				<fo:bookmark internal-destination="{'additional-info'}" starting-state="hide">
					<fo:bookmark-title><xsl:value-of select="'Additional Information'"/></fo:bookmark-title>
				</fo:bookmark>
			</fo:bookmark-tree>
			<xsl:apply-templates select="dmodule"/>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="dmodule">
		<fo:page-sequence master-reference="Main" initial-page-number="1">
			<xsl:call-template name="static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block>
					<xsl:call-template name="title-page"/>
					<xsl:apply-templates select="descendant::sb"/>
					<fo:block>
					<fo:marker marker-class-name="endOfModule">
					<fo:block font-weight="bold" xsl:use-attribute-sets="normal-text" text-align="center">
					End of data module
					</fo:block>
					<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
					This document does not contain any export controlled technical data<fo:block/>
					UTC AEROSPACE SYSTEMS PRORPIETARY - Subject to the restriction on the title or cover page
					</fo:block>
						
					</fo:marker>
		</fo:block>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template match="note">
		<fo:block xsl:use-attribute-sets="normal-text">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="count(ancestor::proceduralStep)=2">
					<xsl:attribute name="start-indent">.6in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=3">
					<xsl:attribute name="start-indent">.9in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=4">
					<xsl:attribute name="start-indent">1.2in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=5">
					<xsl:attribute name="start-indent">1.5in</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<fo:list-block provisional-distance-between-starts=".56in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block text-decoration="underline">
							NOTE:
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates select="notePara"/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="caution">
		<fo:block  xsl:use-attribute-sets="normal-text">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="count(ancestor::proceduralStep)=2">
					<xsl:attribute name="start-indent">.5in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=3">
					<xsl:attribute name="start-indent">.8in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=4">
					<xsl:attribute name="start-indent">1.06in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=5">
					<xsl:attribute name="start-indent">1.3in</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<fo:list-block provisional-distance-between-starts=".9in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block text-decoration="underline">
							CAUTION:
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates select="warningAndCautionPara"/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="warning">
		<fo:block xsl:use-attribute-sets="normal-text" keep-together.within-page="always">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="count(ancestor::proceduralStep)=2">
					<xsl:attribute name="start-indent">.5in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=3">
					<xsl:attribute name="start-indent">.8in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=4">
					<xsl:attribute name="start-indent">1.06in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=5">
					<xsl:attribute name="start-indent">1.3in</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<fo:list-block provisional-distance-between-starts=".9in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block text-decoration="underline">
							WARNING:
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates select="warningAndCautionPara"/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="inlineSignificantData">
		<fo:basic-link color="blue">
			<xsl:attribute name="external-destination">
				<xsl:choose>
					<xsl:when test="@significantParaDataType='psd51'">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates/>
		</fo:basic-link>
	</xsl:template>
		
	<xsl:template match="figure/title">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" font-size="12pt">
			Figure <xsl:number count="figure" level="any" from="dmodule"/>
			<fo:leader leader-length=".06in"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="figure">
		<fo:block id="{@id}" keep-together="always">
			<xsl:apply-templates select="./graphic"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="graphic">
		<fo:block text-align="center" width="7in" padding-after=".15in" start-indent="0">
		<xsl:variable name="graphicPath">
			<xsl:value-of select="ext:getGraphicPath('dave')"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.cgm'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
					<xsl:attribute name="src" >
						<xsl:value-of select="concat($graphicPath,'/',@infoEntityIdent,'.cgm')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.jpg'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@infoEntityIdent,'.jpg')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.png'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
					<xsl:attribute name="src" >
						<xsl:value-of select="concat('C:/inetpub/wwwroot/Graphics/',@infoEntityIdent,'.png')"/>
					</xsl:attribute>
				</fo:external-graphic>
			</xsl:when>
			<xsl:when test="ext:fileExists(concat(@infoEntityIdent,'.tif'))" >
				<fo:external-graphic  content-height="210mm" scaling="uniform" content-width="7in">
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
	
	<xsl:template match="sbAccomplishmentInstructions">
		<fo:block xsl:use-attribute-sets="bold-titles" padding-after=".1in" keep-with-next.within-page="always" id="{'accomplish-instruc'}">
			Accomplishment Instructions
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="mainProcedure">
		<fo:block xsl:use-attribute-sets="italic-bold-titles" padding-after=".1in" keep-with-next.within-page="always">
			Procedure
		</fo:block>
		<fo:block padding-after=".1in"><xsl:apply-templates/></fo:block>
	</xsl:template>
	
	<xsl:template match="internalRef">
		<fo:basic-link color="blue" internal-destination="{@internalRefId}">
			<xsl:apply-templates/>
		</fo:basic-link>
	</xsl:template>
	
	<xsl:template match="para">
		<fo:block xsl:use-attribute-sets="normal-text">
			<xsl:if test="following-sibling::* or (parent::sbSupportEquipsList and not(following-sibling::*))">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose><!--
				<xsl:when test="count(ancestor::proceduralStep)=1 or count(ancestor::levelledPara)=1">
					<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
				</xsl:when>-->
				<xsl:when test="count(ancestor::proceduralStep)=2 or count(ancestor::levelledPara)=2">
					<xsl:attribute name="start-indent">.6in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=3 or count(ancestor::levelledPara)=3">
					<xsl:attribute name="start-indent">.9in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=4 or count(ancestor::levelledPara)=4">
					<xsl:attribute name="start-indent">1.2in</xsl:attribute>
				</xsl:when>
				<xsl:when test="count(ancestor::proceduralStep)=5 or count(ancestor::levelledPara)=5">
					<xsl:attribute name="start-indent">1.5in</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=0]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="ancestor::sbPlanningInfo">
					<xsl:apply-templates />
				</xsl:when>
				<xsl:otherwise>
					<fo:list-block provisional-distance-between-starts=".3in">
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:number count="levelledPara" format="1." level="single"/>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:apply-templates/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=1]">
		<fo:block start-indent=".2in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::levelledPara[count(ancestor::levelledPara)=1]][count(preceding-sibling::para)=0]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="ancestor::sbPlanningInfo">
					<fo:block xsl:use-attribute-sets="normal-text" start-indent=".2in" >
						<xsl:value-of select="./text()"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				<fo:block >
					<fo:list-block provisional-distance-between-starts=".3in" start-indent=".2in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:number count="levelledPara" format="A." level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
				</fo:block>
					
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=2]">
		<fo:block start-indent=".5in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::levelledPara[count(ancestor::levelledPara)=2]][count(preceding-sibling::para)=0]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="ancestor::sbPlanningInfo">
					<fo:block xsl:use-attribute-sets="normal-text" start-indent=".2in" >
						<xsl:value-of select="./text()"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<fo:list-block provisional-distance-between-starts=".3in">
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:number count="levelledPara" format="(1)" level="single"/>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:apply-templates/>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=3]">
		<fo:block start-indent=".75in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::levelledPara[count(ancestor::levelledPara)=3]][count(preceding-sibling::para)=0]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:number count="levelledPara" format="(a)" level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="levelledPara[count(ancestor::levelledPara)=4]">
		<fo:block start-indent="1.05in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::levelledPara[count(ancestor::levelledPara)=4]][count(preceding-sibling::para)=0]">
		<fo:block >
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in">
				<xsl:if test="following-sibling::levelledPara">
					<xsl:attribute name="padding-after">.1in</xsl:attribute>
				</xsl:if>
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block xsl:use-attribute-sets="normal-text" text-decoration="underline">
							<xsl:number count="levelledPara" format="1." level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=0]">
		<fo:block font-family="arial">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in" padding-after=".1in" keep-with-next.within-page="always">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block >
							<xsl:number count="proceduralStep" format="1." level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<xsl:apply-templates select="title"/>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
			<xsl:apply-templates select="proceduralStep"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="proceduralStep/title">
		<fo:block font-family="arial">
			<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=1]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::proceduralStep[count(ancestor::proceduralStep)=1]][count(preceding-sibling::para)=0]">
		<fo:block start-indent=".3in" >
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:number count="proceduralStep" format="A." level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=2]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::proceduralStep[count(ancestor::proceduralStep)=2]][count(preceding-sibling::para)=0]">
		<fo:block start-indent=".6in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:number count="proceduralStep" format="(1)" level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=3]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::proceduralStep[count(ancestor::proceduralStep)=3]][count(preceding-sibling::para)=0]">
		<fo:block start-indent=".9in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in">
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block xsl:use-attribute-sets="normal-text" text-decoration="underline">
							<xsl:number count="proceduralStep" format="(a)" level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="proceduralStep[count(ancestor::proceduralStep)=4]">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="para[parent::proceduralStep[count(ancestor::proceduralStep)=4]][count(preceding-sibling::para)=0]">
		<fo:block start-indent="1.2in">
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".3in">
				<xsl:if test="following-sibling::proceduralStep">
					<xsl:attribute name="padding-after">.1in</xsl:attribute>
				</xsl:if>
				<fo:list-item>
					<fo:list-item-label end-indent="label-end()">
						<fo:block xsl:use-attribute-sets="normal-text" text-decoration="underline">
							<xsl:number count="proceduralStep" format="1" level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block xsl:use-attribute-sets="normal-text">
							<xsl:apply-templates/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="sbMaterialInfo">
		<fo:block xsl:use-attribute-sets="bold-titles" padding-after=".1in" id="{'material-info'}">
			Material Information
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sbMaterialInfoContent">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sbSuppEquipsList">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" padding-after=".1in" keep-with-next.within-page="always">
			Support Equipment List
		</fo:block>
	</xsl:template>
	
	<xsl:template match="sbSupportEquipsList">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" padding-after=".1in" keep-with-next.within-page="always">
			Support Equipment List
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sbSupportEquipSet">
	<fo:block padding-after=".1in">
		<fo:table>
			<fo:table-column column-number="1" column-width="2.326in"/>
			<fo:table-column column-number="2" column-width="2.326in"/>
			<fo:table-column column-number="3" column-width="2.326in"/>
			<fo:table-header>
				<fo:table-row>
					<fo:table-cell>
						<xsl:attribute name="padding-before">3pt</xsl:attribute>
						<xsl:attribute name="padding-after">3pt</xsl:attribute>
						<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
						<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
							Tool				
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<xsl:attribute name="padding-before">3pt</xsl:attribute>
						<xsl:attribute name="padding-after">3pt</xsl:attribute>
						<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
						<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
							Source
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<xsl:attribute name="padding-before">3pt</xsl:attribute>
						<xsl:attribute name="padding-after">3pt</xsl:attribute>
						<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
						<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
							Use
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<xsl:for-each select="./sbIndividualSupportEquip">
					<fo:table-row>
						<fo:table-cell>
							<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
							<xsl:attribute name="padding-before">3pt</xsl:attribute>
							<xsl:attribute name="padding-after">3pt</xsl:attribute>
							<xsl:attribute name="padding-left">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text">
								<xsl:value-of select="descendant::name"/>		
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
							<xsl:attribute name="padding-before">3pt</xsl:attribute>
							<xsl:attribute name="padding-after">3pt</xsl:attribute>
							<xsl:attribute name="padding-left">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text">
								<xsl:value-of select="descendant::manufacturerCode"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
							<xsl:attribute name="padding-before">3pt</xsl:attribute>
							<xsl:attribute name="padding-after">3pt</xsl:attribute>
							<xsl:attribute name="padding-left">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text">
								<xsl:value-of select="descendant::simplePara"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</fo:block>
		
	</xsl:template>
	
	<xsl:template match="sbIndividualSupportEquip">
		<fo:table-row>
			<fo:table-cell>
				 <xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:value-of select="descendant::name"/>				
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
			
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:value-of select="descendant::manufacturerCode"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
			
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:value-of select="descendant::simplePara"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="sb">
		<xsl:apply-templates select="sbSummary|sbPlanningInfo|sbMaterialInfo|sbAccomplishmentInstructions|sbAdditionalInfo"/>
	</xsl:template>
	
	<xsl:template match="sbSummary">
		<fo:block xsl:use-attribute-sets="bold-titles" keep-with-next.within-page="always" id="{'summary'}">
			Summary
		</fo:block>
		<fo:block xsl:use-attribute-sets="normal-text" text-align="justify">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="sbPlanningInfo">
		<fo:block xsl:use-attribute-sets="bold-titles" keep-with-next.within-page="always" id="{'planning-info'}">
			Planning Information
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sbAdditionalInfo">
		<fo:block xsl:use-attribute-sets="bold-titles" padding-after=".1in" keep-with-next.within-page="always" id="{'additional-info'}">
			Additional Information
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sbTopic">
		<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" padding-after=".1in">
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>
			<fo:block padding-after=".1in" keep-with-next.within-page="always"><xsl:value-of select="./title"/></fo:block>
			<xsl:apply-templates select="sbTopicContent"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="sbTopicContent">
		<fo:block>
			<xsl:if test="following-sibling::*">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>	
	</xsl:template>
	
	<xsl:template name="title-page">
		<fo:block xsl:use-attribute-sets="normal-text" text-align="center" break-after="page" id="{'title-page'}">
			<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="14pt" padding-after=".1in">
				<xsl:apply-templates select="descendant::techName[1]"/><fo:block padding-after=".1in"/>
				<xsl:apply-templates select="infoName"/>
				<fo:block xsl:use-attribute-sets="italic-bold-titles" padding-before=".1in">
					Service Bulletin
				</fo:block>
			</fo:block>
			PROPRIETARY<fo:block padding-after=".1in"/>
			<fo:block text-align="justify" padding-after=".1in">
				<xsl:apply-templates select="descendant::dataDistribution[1]"/>
			</fo:block>
				
			<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="14pt" padding-after=".1in">
				<xsl:apply-templates select="descendant::simplePara[1]"/><fo:block padding-after=".1in"/>
				Management Information
			</fo:block>
			<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="14pt" padding-after=".1in" text-align="left">
				Compliance Category
				<fo:block padding-before=".1in" xsl:use-attribute-sets="normal-text">
					<xsl:choose>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc01'">
							Mandatory
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc02'">
							Recommended
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc03'">
							Desirable
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc04'">
							Optional
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc51'">
							1
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc52'">
							2
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc53'">
							3
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc54'">
							4
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc55'">
							5
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc56'">
							6
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc57'">
							7
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc58'">
							8
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc59'">
							9
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc60'">
							10
						</xsl:when>
						<xsl:when test="descendant::sbCompliance/@sbComplianceCategory='sbcc61'">
							11
						</xsl:when>
					</xsl:choose>
				</fo:block>
			</fo:block>
			<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="14pt" padding-after=".1in" text-align="left">
				Original Issue Date
				<xsl:apply-templates select="descendant::sbOriginalIssueDate"/>
			</fo:block>
			<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="14pt" padding-after=".1in" text-align="center">
				Revision Information
			</fo:block>
			<fo:block text-align="left">
				<xsl:apply-templates select="descendant::sbRevisionInfo/sbTopic"/>
			</fo:block>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="sbOriginalIssueDate">
		<fo:block padding-before=".1in" xsl:use-attribute-sets="normal-text">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="issueDate">
		<xsl:value-of select="concat(@month,'-',@day,'-',@year)"/>
	</xsl:template>
	
	<xsl:template match="techName|dataDistribution|simplePara"><xsl:apply-templates/></xsl:template>
	
	<xsl:template match="infoName">
		<fo:block xsl:use-attribute-sets="italic-bold-titles">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template name="static-content">
		<fo:static-content flow-name="Main.Header">
			<fo:block>
				<fo:block font-family="arial" font-size="10pt" font-weight="bold" text-align="center" padding-after=".1in">
					<fo:external-graphic content-height="scale-to-fit" content-width="3in" src="C:/inetpub/wwwroot/Projects/SB/Utas/UTAS_header_logo_small_black.cgm"/><fo:block/>
					Hamilton Sundstrand Corporation, a UTC Aerospace Systems Company
				</fo:block>
				<fo:block font-family="arial" font-size="35pt" font-weight="bold" text-align="center" padding-bottom="0" margin-bottom="0" line-height=".3in">
					SERVICE BULLETIN		
				</fo:block>
				<fo:leader leader-length="100%" leader-pattern="rule" padding-top="0" margin-top="0"/>	
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
									<xsl:choose>
										<xsl:when test="contains(descendant::content/sb/@id,'_')">
											<xsl:value-of select="substring-after(descendant::content/sb/@id,'_')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="descendant::content/sb/@id"/>
										</xsl:otherwise>
									</xsl:choose>
									
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
							<fo:table-cell padding-before=".1in">
								<fo:block xsl:use-attribute-sets="normal-text">
									Applicable to: <xsl:value-of select="descendant::applic/descendant::simplePara"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-before=".1in">
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
		
	<xsl:template match="content"/>
	
	<xsl:template match="identAndStatusSection"></xsl:template>
	
</xsl:stylesheet>