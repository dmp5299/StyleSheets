<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="illustratedPartsCatalog">
		<xsl:apply-templates select="figure"/>
		<xsl:call-template name="createIPD"/>
	</xsl:template>
	
	<xsl:template name="createIPD">
		<fo:block space-after=".37in">
			<fo:marker marker-class-name="date">
					<xsl:value-of select="concat(/descendant::issueDate[1]/@year,'-',/descendant::issueDate[1]/@month,'-',/descendant::issueDate[1]/@day)"/>
				</fo:marker>
				<fo:marker marker-class-name="dmcode">
							<xsl:value-of select="concat(ancestor::dmodule/@modelIdentCode,'-',ancestor::dmodule/@systemDiffCode,'-',ancestor::dmodule/@systemCode,'-',ancestor::dmodule/@subSystemCode,ancestor::dmodule/@subSubSystemCode,'-',ancestor::dmodule/@assyCode,'-',
											ancestor::dmodule/@disassyCode,ancestor::dmodule/@disassyCodeVariant,'-',ancestor::dmodule/@infoCode,ancestor::dmodule/@infoCodeVariant,'-',ancestor::dmodule/@itemLocationCode)"/>
						</fo:marker>
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
		<xsl:if test="@changeMark">
<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-style="solid"/>
</xsl:if>
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
		<xsl:apply-templates select="itemSequenceNumber"/>
		<xsl:if test="@changeMark">
	<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
</xsl:if>
	</xsl:template>
	
	<xsl:template match="itemSequenceNumber">
		<xsl:if test="@changeMark">
			<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-style="solid"/>
		</xsl:if>
		<fo:table-row>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block>
					<xsl:apply-templates select="partLocationSegment/notIllustrated"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:choose>
						<xsl:when test="starts-with(ancestor::catalogSeqNumber/@catalogItemNumber,'00')">
							<xsl:value-of select="substring(ancestor::catalogSeqNumber/@catalogItemNumber,3)"/>
						</xsl:when>
						<xsl:when test="starts-with(ancestor::catalogSeqNumber/@catalogItemNumber,'0')">
							<xsl:value-of select="substring(ancestor::catalogSeqNumber/@catalogItemNumber,2)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ancestor::catalogSeqNumber/@catalogItemNumber"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="quantityPerNextHigherAssy"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="manufacturerCode"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:apply-templates select="partNumber"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:if test="descendant::attachStoreShipPart and not(ancestor::catalogSeqNumber/preceding-sibling::*[1]/descendant::attachStoreShipPart)">
						<fo:block start-indent=".5in">
								(ATTACHING PARTS)
						</fo:block>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="ancestor::catalogSeqNumber/@indenture &gt; 1">
							<xsl:variable name="indenture">
								<xsl:call-template name="indenture_string">
									<xsl:with-param name="position" select="1"/>
									<xsl:with-param name="indent" select="ancestor::catalogSeqNumber/@indenture"/>
									<xsl:with-param name="char-string" select="''"/>
								</xsl:call-template>
							</xsl:variable>
							<fo:block>
								<xsl:variable name="distance" select="(ancestor::catalogSeqNumber/@indenture - 1) * .09"/>
								<fo:list-block provisional-distance-between-starts="{concat($distance,'in')}">
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()">
											<fo:block>
												<xsl:value-of select="$indenture"/>
											</fo:block>
										</fo:list-item-label>
										<fo:list-item-body start-indent="body-start()">
											<fo:block>
												<xsl:apply-templates select="partIdentSegment"/>
												
											</fo:block>
										</fo:list-item-body>
									</fo:list-item>
								</fo:list-block>
							</fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates
										select="partIdentSegment">
							</xsl:apply-templates>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="descendant::attachStoreShipPart and not(ancestor::catalogSeqNumber/following-sibling::*[1]/descendant::attachStoreShipPart)">
						<fo:block start-indent=".5in">
								---***---
						</fo:block>
					</xsl:if>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:attribute name="padding-top">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:if test="applicabilitySegment/usableOnCodeAssy">
						<xsl:text>* </xsl:text>
						<xsl:value-of select="applicabilitySegment/usableOnCodeAssy/text()"/>
					</xsl:if>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="@changeMark">
			<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
		</xsl:if>
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
</xsl:stylesheet>