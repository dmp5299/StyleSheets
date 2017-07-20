<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	

	<xsl:template match="row">
		<fo:table-row>
			<xsl:apply-templates/>
		</fo:table-row>
	</xsl:template>

	<xsl:template match="mainProcedure">
		<fo:block padding-after=".1in">
			<xsl:apply-templates/>
		</fo:block>
		
	</xsl:template>
	
	<xsl:template match="table">
		<xsl:if test="descendant::tbody/descendant::entry">
			<fo:block space-after=".15in" hyphenate="true" wrap-option="wrap" id="{generate-id(.)}" start-indent="0">
				<xsl:if test="@id">
					<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
				</xsl:if>
				<fo:table hyphenate="true" wrap-option="wrap" border-bottom-style="solid" border-bottom-width="1pt">
					<xsl:variable name="count" select="count(descendant::colspec)"/>
					<xsl:for-each select="./tgroup/colspec">
							<fo:table-column>
								<xsl:choose>
									<xsl:when test="@colwidth and contains(@colwidth,'*')">
										<xsl:variable name="width" select="6.98 div $count" />
										<xsl:attribute name="column-width"><xsl:value-of select="concat($width,'in')"/></xsl:attribute>
									<!--
										<xsl:attribute name="column-width"><xsl:value-of select="concat(substring-before(@colwidth,'*'),'%')"/></xsl:attribute>-->
									</xsl:when>
									<xsl:when test="@colwidth and not(contains(@colwidth,'*'))">
										<xsl:attribute name="column-width"><xsl:value-of select="@colwidth"/></xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="width" select="6.98 div $count" />
										<xsl:attribute name="column-width"><xsl:value-of select="concat($width,'in')"/></xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>							
								<xsl:attribute name="column-number"><xsl:value-of select="position()"/></xsl:attribute>
							</fo:table-column>
					</xsl:for-each>
					<xsl:choose>
						<xsl:when test="./title">
							<fo:table-header>
								<fo:table-row keep-with-next.within-page="always">
									<fo:table-cell number-columns-spanned="{descendant::tgroup/@cols}" keep-with-next="always" padding-after="3pt">
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<xsl:apply-templates select="./title"/>
									</fo:table-cell>
								</fo:table-row>
								<xsl:apply-templates select="./tgroup/thead"/>
							</fo:table-header>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-header>
								<fo:table-row keep-with-next.within-page="always">
									<fo:table-cell number-columns-spanned="{descendant::tgroup/@cols}" keep-with-next="always" padding-after="3pt">
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
										<fo:block font-style="italic" xsl:use-attribute-sets="normal-text" text-align="center">
											<xsl:variable name="count">
												<xsl:number count="table" format="1" from="dmodule" level="any"/>
											</xsl:variable>
											<xsl:text>Table </xsl:text>
											<xsl:value-of select="$count"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-header>
						</xsl:otherwise>
					</xsl:choose><!--
					<fo:table-footer>
						<fo:table-row keep-with-next.within-page="always">
							<fo:table-cell number-columns-spanned="{descendant::tgroup/@cols}" keep-with-next="always">
								<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
								<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								<xsl:attribute name="number-columns-spanned">
									<xsl:value-of select="count(descendant::colspec)"/>
								</xsl:attribute>
								<fo:block>
									<fo:leader/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-footer>-->
					<fo:table-body>
						<xsl:apply-templates select="./tgroup/tbody"/>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="thead|tbody">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="find-start">
		<xsl:param name="start"/>
		<xsl:param name="position"/>
		<xsl:param name="totalCount"/>
		<xsl:choose>
			<xsl:when test="$position &lt;= $totalCount and ancestor::tgroup/colspec[$position]/@colname != $start">
				<xsl:call-template name="find-start">
					<xsl:with-param name="start" select="$start"/>
					<xsl:with-param name="position" select="$position + 1"/>
					<xsl:with-param name="totalCount" select="$totalCount"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$position"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="find-end">
		<xsl:param name="end"/>
		<xsl:param name="position"/>
		<xsl:param name="totalCount"/>
		<xsl:choose>
			<xsl:when test="$position &lt;= $totalCount and ancestor::tgroup/colspec[$position]/@colname != $end">
				<xsl:call-template name="find-end">
					<xsl:with-param name="end" select="$end"/>
					<xsl:with-param name="position" select="$position + 1"/>
					<xsl:with-param name="totalCount" select="$totalCount"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$position"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="entry">
		<fo:table-cell wrap-option="wrap" hyphenate="true">
			<xsl:if test="not(ancestor::row/preceding-sibling::row) and not(ancestor::thead)">
				<xsl:attribute name="border-top-style">solid</xsl:attribute>
				<xsl:attribute name="border-top-width">1pt</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="start-indent">0</xsl:attribute>
			<xsl:if test="@namest">
				<xsl:variable name="start">
					<xsl:call-template name="find-start">
						<xsl:with-param name="start" select="@namest"/>
						<xsl:with-param name="position" select="1"/>
						<xsl:with-param name="totalCount" select="count(ancestor::tgroup/colspec)"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="end">
					<xsl:call-template name="find-end">
						<xsl:with-param name="end" select="@nameend"/>
						<xsl:with-param name="position" select="1"/>
						<xsl:with-param name="totalCount" select="count(ancestor::tgroup/colspec)"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:attribute name="number-columns-spanned">
					<xsl:value-of select="($end - $start) + 1"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@morerows">
				<xsl:attribute name="number-rows-spanned">
					<xsl:value-of select="@morerows + 1"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="ancestor::table/title='List of support equipment' and ancestor::thead">
				<xsl:attribute name="font-weight">
					bold
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="padding-before">3pt</xsl:attribute>
			<xsl:attribute name="padding-after">3pt</xsl:attribute>
			<xsl:attribute name="padding-right">3pt</xsl:attribute>
			<xsl:attribute name="padding-left">3pt</xsl:attribute>
			
			<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
			<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
			<xsl:attribute name="border-right-style">solid</xsl:attribute>
			<xsl:attribute name="border-right-width">1pt</xsl:attribute>
			<xsl:if test="not(preceding-sibling::entry)">
				<xsl:attribute name="border-left-style">solid</xsl:attribute>
				<xsl:attribute name="border-left-width">1pt</xsl:attribute>
			</xsl:if>
			<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
			<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
			<xsl:if test="@valign">
				<xsl:variable name="display-align">
					<xsl:choose>
						<xsl:when test="translate(@valign,$uppercase,$smallcase)='middle'">
							<xsl:value-of select="'center'"/>
						</xsl:when>
						<xsl:when test="translate(@valign,$uppercase,$smallcase)='top'">
							<xsl:value-of select="'before'"/>
						</xsl:when>
						<xsl:when test="translate(@valign,$uppercase,$smallcase)='bottom'">
							<xsl:value-of select="'after'"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate(@valign,$uppercase,$smallcase)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="display-align"><xsl:value-of select="$display-align"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="ancestor::thead">
					<xsl:attribute name="font-weight">bold</xsl:attribute>
				</xsl:if>
			<fo:block xsl:use-attribute-sets="normal-text" start-indent="0" hyphenate="true" wrap-option="wrap">
				<xsl:if test="ancestor::thead">
					<xsl:attribute name="font-weight">bold</xsl:attribute>
				</xsl:if>
				<xsl:variable name="smallcase1" select="'abcdefghijklmnopqrstuvwxyz'" />
				<xsl:variable name="uppercase1" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
				<xsl:variable name="align">
					<xsl:value-of select="translate(@align,$uppercase1,$smallcase1)" />
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="@align">
						<xsl:attribute name="text-align">
							<xsl:value-of select="$align"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="text-align">
							left
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="not(descendant::text())">
						<fo:leader/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./para/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="para[parent::entry]">
		<xsl:apply-templates/>here
	</xsl:template>

	<xsl:template match="table/title">
		<fo:block xsl:use-attribute-sets="normal-text" text-align="center" padding-after="2pt" font-style="italic">
			<xsl:variable name="count">
				<xsl:number count="table" format="1" from="dmodule" level="any"/>
			</xsl:variable>
			<xsl:text>Table </xsl:text>
			<xsl:value-of select="concat($count,' ')"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

</xsl:stylesheet>