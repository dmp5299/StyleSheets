<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	
	<xsl:template match="ipc">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block>			
			<xsl:variable name="id">
				<xsl:value-of select="concat('ipc',$volCount,$chapCount,$dmCount)"/>
			</xsl:variable>
			<xsl:attribute name="id">
				<xsl:value-of select="$id"/>
			</xsl:attribute>
			<xsl:apply-templates select="figure"/>
			<xsl:call-template name="createIPD"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="createIPD">
		<fo:block space-after=".37in">
			<fo:table hyphenate="true" wrap-option="wrap">
				<xsl:attribute name="border-top-style">solid</xsl:attribute>
				<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
				<xsl:attribute name="border-top-width">1pt</xsl:attribute>
				<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				<fo:table-column column-width=".36in" column-number="1"/>
				<fo:table-column column-width=".5in" column-number="2"/>
				<fo:table-column column-width=".68in" column-number="3"/>
				<fo:table-column column-width=".65in" column-number="4"/>
				<fo:table-column column-width="1.66in" column-number="5"/>
				<fo:table-column column-width="2.38in" column-number="6"/>
				<fo:table-column column-width=".74in" column-number="7"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Fig
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
							assembly
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
							Part No./
							NSN
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							Description
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="padding-top">.24in</xsl:attribute>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">
							* Usable on
							code assy
							• mv/Effect
							</fo:block>
						</fo:table-cell>
					</fo:table-row>					
					<xsl:for-each select="descendant::figure">
						<fo:table-row>
							<fo:table-cell number-columns-spanned="7">
								<fo:block xsl:use-attribute-sets="normal-text">
									<fo:block xsl:use-attribute-sets="normal-text">
										<xsl:number level="any" count="figure" from="dmodule"/>
									</fo:block>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-header>
				<fo:table-footer>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="7">
							<fo:block>
									<fo:retrieve-table-marker retrieve-class-name="footer-continued" 
                                    retrieve-position="first-including-carryover"
                                    retrieve-boundary-within-table="table"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-footer>
				<fo:table-body>
					<fo:table-row>
					  <fo:table-cell>
							<fo:block>
								<fo:marker marker-class-name="footer-continued">(continued)</fo:marker>
							</fo:block>
					   </fo:table-cell>
					</fo:table-row>
					<xsl:for-each select="./csn">
						<fo:table-row>
							<fo:table-cell>
								<fo:block/>
							</fo:table-cell>
							<fo:table-cell>
								<xsl:choose>
									<xsl:when test="not(preceding-sibling::csn)">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
									</xsl:when>
								</xsl:choose>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:choose>
										<xsl:when test="starts-with(@item,'00')">
											<xsl:value-of select="substring(@item,3)"/>
										</xsl:when>
										<xsl:when test="starts-with(@item,'0')">
											<xsl:value-of select="substring(@item,2)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="@item"/>
										</xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<xsl:choose>
									<xsl:when test="not(preceding-sibling::csn)">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
									</xsl:when>
								</xsl:choose>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:apply-templates select="descendant::qna"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<xsl:choose>
									<xsl:when test="not(preceding-sibling::csn)">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
									</xsl:when>
								</xsl:choose>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:apply-templates select="descendant::mfc"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell wrap-option="wrap" hyphenate="true">
								<xsl:choose>
									<xsl:when test="not(preceding-sibling::csn)">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
									</xsl:when>
								</xsl:choose>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="normal-text" language="en" hyphenate="true" keep-together.within-column="always">
									<xsl:apply-templates select="descendant::pnr"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<xsl:choose>
									<xsl:when test="not(preceding-sibling::csn)">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
									</xsl:when>
								</xsl:choose>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="normal-text">
									<xsl:if test="@ind &gt; 0">
										<xsl:variable name="indenture">
											<xsl:call-template name="indenture_string">
												<xsl:with-param name="position" select="0"/>
												<xsl:with-param name="indent" select="@ind"/>
												<xsl:with-param name="char-string" select="''"/>
											</xsl:call-template>
										</xsl:variable>
										<fo:inline>
											<xsl:value-of select="$indenture"/>
										</fo:inline>
									</xsl:if>
									<xsl:apply-templates select="descendant::dfp"/>
									<xsl:apply-templates select="descendant::cbs"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<xsl:choose>
									<xsl:when test="not(preceding-sibling::csn)">
										<xsl:attribute name="padding-top">3pt</xsl:attribute>
									</xsl:when>
								</xsl:choose>
								<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:if test="descendant::uca/text()">
										<xsl:text>* </xsl:text>
										<xsl:value-of select="descendant::uca/text()"/>
									</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
				
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="partLocationSegment|notIllustrated|quantityPerNextHigherAssy|descrForPart">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="notIllustrated">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="partIdentSegment">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="cbs">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="dfl">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="descrForPart">
		<xsl:apply-templates/>
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