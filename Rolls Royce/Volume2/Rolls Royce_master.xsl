<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:psmi="http://www.CraneSoftwrights.com/resources/psmi">

	<xsl:import href="../Rolls_Royce_Styles.xsl"/>

	<xsl:output indent="yes"/>

	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:page-sequence-master master-name="Main">       
					<fo:repeatable-page-master-alternatives><!--
						<fo:conditional-page-master-reference blank-or-not-blank="blank" odd-or-even="even" master-reference="Main.Even.Blank"/>-->
						<fo:conditional-page-master-reference master-reference="Main.Odd" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference master-reference="Main.Even" odd-or-even="even" page-position="any"/>      
					</fo:repeatable-page-master-alternatives>    
				</fo:page-sequence-master>
				<fo:page-sequence-master master-name="Landscape">       
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="Landscape.Odd" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference master-reference="Landscape.Even" odd-or-even="even" page-position="any"/>      
					</fo:repeatable-page-master-alternatives>    
				</fo:page-sequence-master>
				<fo:simple-page-master master-name="Main.Odd"
						page-width="8.5in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".3in">
					<fo:region-body margin-top="1in" margin-bottom="1.55in" column-count="1"/>
					<fo:region-before extent="2cm" region-name="Main.Odd.Header"/>
					<fo:region-after extent="1.48in" region-name="Main.Odd.Footer"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Main.Even"
						page-width="8.5in" page-height="11in"
						margin-left=".58in" margin-right=".94in" margin-top=".3in">
					<fo:region-body margin-top="1in" margin-bottom="1.55in" column-count="1"/>
					<fo:region-before region-name="Main.Even.Header" extent="3cm"/>
					<fo:region-after region-name="Main.Even.Footer" extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Main.Even.Blank"
						page-width="8.5in" page-height="11in"
						margin-left=".58in" margin-right=".94in" margin-top=".3in">
					<fo:region-body margin-top="1in" margin-bottom="1.55in" column-count="1"/>
					<fo:region-before region-name="Main.Even.Blank.Header" extent="3cm"/>
					<fo:region-after region-name="Main.Even.Footer" extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Landscape.Odd" 
						page-width="15in" page-height="11in"
						margin-left=".94in" margin-right=".58in" margin-top=".3in">
					<fo:region-body margin-top="1in" margin-bottom="1.55in" column-count="1"/>
					<fo:region-before region-name="xsl-region-before-landscape" extent="3cm"/>
					<fo:region-after extent="1.48in" region-name="xsl-region-after-landscape"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="Landscape.Even"
						page-width="15in" page-height="11in"
						margin-left=".58in" margin-right=".94in" margin-top=".3in">
					<fo:region-body margin-top="1in" margin-bottom="1.55in" column-count="1"/>
					<fo:region-before region-name="xsl-region-before-landscape" extent="3cm"/>
					<fo:region-after region-name="xsl-region-after-landscape" extent="1.48in"/>
					<fo:region-start />
					<fo:region-end/>
				</fo:simple-page-master>
						</fo:layout-master-set>
			<fo:bookmark-tree><!--
				<fo:bookmark internal-destination="{'doc_title'}" starting-state="hide">
					<fo:bookmark-title>Title page</fo:bookmark-title>
				</fo:bookmark>
				<fo:bookmark internal-destination="{'highlights'}" starting-state="hide">
					<fo:bookmark-title>Highlights</fo:bookmark-title>
				</fo:bookmark>
				<fo:bookmark internal-destination="{'doc_toc'}" starting-state="hide">
					<fo:bookmark-title>Volume table of contents</fo:bookmark-title>
				</fo:bookmark>-->
				<xsl:for-each select="descendant::pmentry[parent::content][./title/text() = 'Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Operation (Volume 2 of 6)']">
						<xsl:variable name="volumeCount">
							<xsl:number count="pmentry[parent::content]" from="pm"/>
						</xsl:variable>
						<fo:bookmark internal-destination="'doc_title'" starting-state="hide">
							<fo:bookmark-title>
								<xsl:value-of select="concat('Volume ',$volumeCount,' - ',./title)"/>
							</fo:bookmark-title>
						<fo:bookmark internal-destination="{'highlights'}" starting-state="hide">
				<fo:bookmark-title>Highlights</fo:bookmark-title>							
			</fo:bookmark>
						<xsl:if test="./refdm[descendant::incode/text() = '009']">
							<fo:bookmark internal-destination="'maintoc'" starting-state="hide">
								<fo:bookmark-title>Table of contents</fo:bookmark-title>							
							</fo:bookmark>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="./title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Operation and  Maintenance - Description (Volume 1 of 6)'">
								<xsl:call-template name="volume1FrontMatterBookmarks"/>
							</xsl:when>
							<xsl:when test="./title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Operation (Volume 2 of 6)'">
								<xsl:call-template name="volume2FrontMatterBookmarks"/>
							</xsl:when>
							<xsl:when test="./title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Maintenance (Volume 3 of 6)'">
								<xsl:call-template name="volume3FrontMatterBookmarks"/>
							</xsl:when>
							<xsl:when test="./title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Troubleshooting (Volume 4 of 6)'">
								<xsl:call-template name="volume4FrontMatterBookmarks"/>
							</xsl:when>
							<xsl:when test="./title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance -  IPD (Volume 5 of 6)'">
								<xsl:call-template name="volume5FrontMatterBookmarks"/>
							</xsl:when>
						</xsl:choose>																				
						<xsl:choose>
								<xsl:when test="./pmentry">
									<xsl:for-each select="./pmentry">
										<xsl:variable name="chapCount">
											<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]"/>
										</xsl:variable>
										<xsl:variable name="id"><xsl:value-of select="concat('chap',$volumeCount,$chapCount)"/></xsl:variable>
										<fo:bookmark starting-state="hide" internal-destination="{generate-id(.)}">
											<fo:bookmark-title>
												<xsl:value-of select="concat('Chapter ',$chapCount,' - ',./title)"/>
											</fo:bookmark-title>
											<xsl:choose>
												<xsl:when test="./refdm[descendant::incode = 009]">
													<xsl:for-each select="./refdm[descendant::incode/text() = 009]">
														<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
															<xsl:variable name="dmCount">
																<xsl:number count="refdm[descendant::incode/text() = 009]" from="pmentry[parent::pmentry]"/>
															</xsl:variable>
															<fo:bookmark-title>
																<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
															</fo:bookmark-title>
															<xsl:call-template name="build-mid-chapter-bookmarks">
																<xsl:with-param name="position" select="1"/>
																<xsl:with-param name="dmCount" select="$dmCount - 1"/>
																<xsl:with-param name="chapCount" select="$chapCount"/>
																<xsl:with-param name="volumeCount" select="$volumeCount"/>
															</xsl:call-template>
														</fo:bookmark>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="./dmodule">
														<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
															<xsl:variable name="dmCount">
																<xsl:number count="dmodule" from="pmentry[parent::pmentry]"/>
															</xsl:variable>
															<fo:bookmark-title>
																<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
															</fo:bookmark-title>
														</fo:bookmark>
													</xsl:for-each>
												</xsl:otherwise>
											</xsl:choose>											
										</fo:bookmark>										
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>										
									<xsl:for-each select="./dmodule">
										<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
											<xsl:variable name="dmCount">
												<xsl:number count="dmodule" from="pmentry"/>
											</xsl:variable>
											<fo:bookmark-title>
												<xsl:value-of select="concat('Chapter ','1','.',$dmCount,' - ',descendant::techname/text())"/>
											</fo:bookmark-title>
										</fo:bookmark>
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</fo:bookmark>
					</xsl:for-each>
			</fo:bookmark-tree>
			<xsl:apply-templates select="pm"/>
		</fo:root>
	</xsl:template>
	
	<xsl:template name="volume5FrontMatterBookmarks">
		<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '018'][1]">
			<fo:bookmark internal-destination="{'introduction'}" starting-state="hide">
				<fo:bookmark-title>Introduction</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:for-each>
		<fo:bookmark starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of abbreviations</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'loi'" starting-state="hide">
			<fo:bookmark-title>List of illustrations</fo:bookmark-title>							
		</fo:bookmark>
		<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '044']">
			<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
				<fo:bookmark-title>Change Proposal Form (CPF) Instructions</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:for-each>
		<fo:bookmark internal-destination="'warning/caution'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '012']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>General warnings and cautions and related safety data</fo:bookmark-title>
		</fo:bookmark>
		<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '010']">
			<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
				<fo:bookmark-title>General Data</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="volume4FrontMatterBookmarks">
		<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '018'][1]">
			<fo:bookmark internal-destination="{'introduction'}" starting-state="hide">
				<fo:bookmark-title>Introduction</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:for-each>
		<fo:bookmark starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of abbreviations</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'los'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of symbols</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'loi'" starting-state="hide">
			<fo:bookmark-title>List of illustrations</fo:bookmark-title>							
		</fo:bookmark>
		<xsl:if test="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '044']">
			<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '044']">
				<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
					<fo:bookmark-title>Change Proposal Form (CPF) Instructions</fo:bookmark-title>							
				</fo:bookmark>
			</xsl:for-each>
		</xsl:if>
		<fo:bookmark internal-destination="'warning/caution'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '012']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>General warnings and cautions and related safety data</fo:bookmark-title>
		</fo:bookmark>
	</xsl:template>
	
	<xsl:template name="volume3FrontMatterBookmarks">
		<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '010']">
			<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
				<fo:bookmark-title>General Data</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:for-each>
		<fo:bookmark starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of abbreviations</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'los'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of symbols</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'loi'" starting-state="hide">
			<fo:bookmark-title>List of illustrations</fo:bookmark-title>							
		</fo:bookmark>
		<fo:bookmark internal-destination="'warning/caution'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '012']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>General warnings and cautions and related safety data</fo:bookmark-title>
		</fo:bookmark>
	</xsl:template>
	
	<xsl:template name="volume2FrontMatterBookmarks">
		<fo:bookmark starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of abbreviations</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'los'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of symbols</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'loi'" starting-state="hide">
			<fo:bookmark-title>List of illustrations</fo:bookmark-title>							
		</fo:bookmark>
		<fo:bookmark internal-destination="'warning/caution'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '012']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>General warnings and cautions and related safety data</fo:bookmark-title>
		</fo:bookmark>
	</xsl:template>
	
	<xsl:template name="volume1FrontMatterBookmarks">
		
		<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '010']">
			<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
				<fo:bookmark-title>General Data</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:for-each><!--
		<fo:bookmark internal-destination="'loedm'" starting-state="hide">
			<fo:bookmark-title>List of effective data modules</fo:bookmark-title>							
		</fo:bookmark>-->
		<fo:bookmark starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of abbreviations</fo:bookmark-title>
		</fo:bookmark>
		<fo:bookmark internal-destination="'los'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>List of symbols</fo:bookmark-title>
		</fo:bookmark>
		<xsl:if test="descendant::refdm[parent::pmentry[parent::content]]/descendant::incode/text() = '00A'">
			<fo:bookmark internal-destination="'loi'" starting-state="hide">
				<fo:bookmark-title>List of illustrations</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:if>
		<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '044']">
			<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
				<fo:bookmark-title>Change Proposal Form (CPF) Instructions</fo:bookmark-title>							
			</fo:bookmark>
		</xsl:for-each>
		<fo:bookmark internal-destination="'warning/caution'" starting-state="hide">
			<xsl:variable name="id">
				<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '012']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
			<fo:bookmark-title>General warnings and cautions and related safety data</fo:bookmark-title>
		</fo:bookmark>
	</xsl:template>
	
	<xsl:template name="build-mid-chapter-toc-rows">
		<xsl:param name="position"/>
		<xsl:param name="refdm_count"/>
		<xsl:param name="chap_count"/>
		<xsl:choose>
			<xsl:when test="following-sibling::*[$position][self::dmodule]">
				<xsl:for-each select="following-sibling::*[$position]">
					<fo:table-row>
						<fo:table-cell padding-before=".1in">
							<fo:block xsl:use-attribute-sets="normal-text">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
									<xsl:value-of select="concat($chap_count,'.',$refdm_count,'.',$position)"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-before=".1in">
							<fo:block xsl:use-attribute-sets="normal-text">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
									<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="following-sibling::*[$position + 1][self::dmodule]">
					<xsl:call-template name="build-mid-chapter-toc-rows">
						<xsl:with-param name="position" select="$position + 1"/>
						<xsl:with-param name="refdm_count" select="$refdm_count"/>
						<xsl:with-param name="chap_count" select="$chap_count"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="build-chapter-toc-rows">
		<xsl:param name="position"/>
		<xsl:param name="refdm_count"/>
		<xsl:param name="chap_count"/>
		<xsl:param name="volume"/>
		<xsl:choose>
			<xsl:when test="following-sibling::*[$position][self::dmodule]">
				<xsl:for-each select="following-sibling::*[$position]">
					<fo:table-row>
						<fo:table-cell padding-before=".1in">
							<fo:block xsl:use-attribute-sets="normal-text">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
									<xsl:value-of select="$volume"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-before=".1in">
							<fo:block xsl:use-attribute-sets="normal-text">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
									<xsl:value-of select="concat($chap_count,'.',$refdm_count,'.',$position)"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-before=".1in">
							<fo:block xsl:use-attribute-sets="normal-text">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
									<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="following-sibling::*[$position + 1][self::dmodule]">
					<xsl:call-template name="build-chapter-toc-rows">
						<xsl:with-param name="position" select="$position + 1"/>
						<xsl:with-param name="refdm_count" select="$refdm_count"/>
						<xsl:with-param name="chap_count" select="$chap_count"/>
						<xsl:with-param name="volume" select="$volume"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="build-mid-chapter-bookmarks">
		<xsl:param name="position"/>
		<xsl:param name="dmCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="volumeCount"/>
		<xsl:choose>
			<xsl:when test="following-sibling::*[$position][self::dmodule]">
				<fo:bookmark internal-destination="{generate-id(following-sibling::*[$position])}" starting-state="hide">
					<fo:bookmark-title>
						<xsl:value-of select="concat('Chapter ',$chapCount,'.',$dmCount,'.',$position,' - ',following-sibling::*[$position]/descendant::techname/text(),' - ',following-sibling::*[$position]/descendant::infoname/text())"/>
					</fo:bookmark-title>
				</fo:bookmark>
				<xsl:if test="following-sibling::*[$position + 1][self::dmodule]">
					<xsl:call-template name="build-mid-chapter-bookmarks">
						<xsl:with-param name="position" select="$position + 1"/>
						<xsl:with-param name="dmCount" select="$dmCount"/>
						<xsl:with-param name="chapCount" select="$chapCount"/>
						<xsl:with-param name="volumeCount" select="$volumeCount"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="pm"><!--
		<xsl:call-template name="doc_title"/>
		<xsl:call-template name="highlights"/>-->
		<xsl:apply-templates select="content"/>
	</xsl:template>
	
	<xsl:template name="doc_title">
		<fo:page-sequence master-reference="Main" force-page-count="no-force">
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-family="helvetica" font-size="10pt" id="{'doc_title'}">
					<fo:marker marker-class-name="volChap">
						<xsl:value-of select="'Cover'"/>
					</fo:marker>
					<xsl:call-template name="create_doc_title"/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template name="create_doc_title">

                                <fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" font-size="14pt" text-align="center" padding-after="1in">

                                                <xsl:variable name="volCount">
													<xsl:number count="pmentry" from="content"/>
												</xsl:variable>
                                                OPERATION AND MAINTENANCE MANUAL

                                                <fo:block padding-after=".2in"/>

                                                Technical Manual

                                                <fo:block padding-after=".2in"/>

                                                LCS-5

                                                <fo:block padding-after=".2in"/>
												
												Main Propulsion Gas Turbine Module (MPGTM)
												
												<fo:block padding-after=".2in"/>

                                                <xsl:value-of select="'Volume 2 - Procedure'"/>

                                                <fo:block padding-after=".2in"/>
<!--
                                                <xsl:variable name="date">

                                                                <xsl:call-template name="getMonth">

                                                                                <xsl:with-param name="month" select="descendant::issdate/@month"/>

                                                                </xsl:call-template>

                                                </xsl:variable>
-->
                                </fo:block>

                                <fo:block xsl:use-attribute-sets="normal-text" text-align="justify">

                                                MPGTM O &amp; M Manuals

                                                <fo:block padding-after=".1in"/>

                                                Publication Date: 15 February, 2017

                                                <fo:block padding-after="3pt"/>

                                                Manual Number: S9234-DZ-MMC-A10

                                                <fo:block padding-after="3pt"/>

                                                Revision Number: Rev 4

                                                <fo:block padding-after="3pt"/>

                                                Copy Release Date: 03 March, 2017

                                                <fo:block padding-after=".1in"/>

                                                DISTRIBUTION STATEMENT C

                                                <fo:block padding-after="3pt"/>

                                                Distribution authorized to U. S. Government Agencies and their contractors only due to the proprietary nature of the data contained herein. Other requests for this documentation shall be referred to NAVSEA Code SEA 02425.

                                                <fo:block padding-after="3pt"/>

                                                COMMERCIAL RIGHTS DATA

                                                <fo:block padding-after="3pt"/>

                                                The Government's rights to use the data contained in this document are licensed data subject to use, modification, reproduction, release, performance, display, or disclosure restrictions per DFARS 252.227-7015.

                                                <fo:block padding-after="3pt"/>

                                                EXPORT CONTROL

                                                <fo:block padding-after="3pt"/>

                                                This document may contain information subject to the International Traffic in Arms Regulation (ITAR) or the Export Administration Regulation (EAR) of 1979. This information may not be exported, released, or disclosed to foreign nationals without first complying with the export license requirements of the International Traffic in Arms Regulation (ITAR) and/or the Export Administration Regulation (EAR). A violation of the ITAR or EAR may be subject to a penalty of up to 10 years imprisonment and a fine of $100,000 under U.S.C. 2778 or Section 2410 of the Export Administration Act of 1979. Include this notice with any reproduction portion of this document.

                                                <fo:block padding-after=".1in"/>

                                </fo:block>

                </xsl:template>

	
	<xsl:template name="getMonth">
		<xsl:param name="month"/>
		<xsl:choose>
			<xsl:when test="$month = '1'">
				<xsl:value-of select="'January'"/>
			</xsl:when>
			<xsl:when test="$month = '2'">
				<xsl:value-of select="'Febuary'"/>
			</xsl:when>
			<xsl:when test="$month = '3'">
				<xsl:value-of select="'March'"/>
			</xsl:when>
			<xsl:when test="$month = '4'">
				<xsl:value-of select="'April'"/>
			</xsl:when>
			<xsl:when test="$month = '5'">
				<xsl:value-of select="'May'"/>
			</xsl:when>
			<xsl:when test="$month = '6'">
				<xsl:value-of select="'June'"/>
			</xsl:when>
			<xsl:when test="$month = '7'">
				<xsl:value-of select="'July'"/>
			</xsl:when>
			<xsl:when test="$month = '8'">
				<xsl:value-of select="'August'"/>
			</xsl:when>
			<xsl:when test="$month = '9'">
				<xsl:value-of select="'September'"/>
			</xsl:when>
			<xsl:when test="$month = '10'">
				<xsl:value-of select="'October'"/>
			</xsl:when>
			<xsl:when test="$month = '11'">
				<xsl:value-of select="'November'"/>
			</xsl:when>
			<xsl:when test="$month = '12'">
				<xsl:value-of select="'December'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="refdm[parent::pmentry]">
	</xsl:template>
	
	<xsl:template match="content"><!--
		<xsl:call-template name="main_toc"/>-->
		<xsl:apply-templates select="pmentry[./title/text() = 'Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Operation (Volume 2 of 6)']"/>
	</xsl:template>
	
	<xsl:template match="pmentry[parent::content]">
		<xsl:choose>
			<xsl:when test="child::pmentry">
				<xsl:apply-templates select="pmentry|dmodule|refdm"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="dmodule"/>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:template>
	
	<xsl:template match="refdm[descendant::incode/text() = '001']">
		<xsl:call-template name="doc_title"/>
		<xsl:call-template name="highlights"/>
	</xsl:template>
	
	<xsl:template name="highlights">
		<fo:page-sequence master-reference="Main"  force-page-count="no-force" initial-page-number="1">
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">	
				<xsl:variable name="volCount">
						<xsl:number count="pmentry[parent::content]" from="pm"/>
				</xsl:variable>
				<fo:marker marker-class-name="volChap">
					Highlights
				</fo:marker>
				<fo:block font-family="helvetica" font-size="10pt" id="{'highlights'}">
					<xsl:call-template name="highlights-page"/>	
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	
<xsl:template name="highlights-page">

                                <fo:table>

                                                <fo:table-column>

                                                                <xsl:attribute name="column-width">1in</xsl:attribute>

                                                                <xsl:attribute name="column-number">1</xsl:attribute>

                                                </fo:table-column>

                                                <fo:table-column>

                                                                <xsl:attribute name="column-width">1in</xsl:attribute>

                                                                <xsl:attribute name="column-number">2</xsl:attribute>

                                                </fo:table-column>

                                                <fo:table-column>

                                                                <xsl:attribute name="column-width">4.98in</xsl:attribute>

                                                                <xsl:attribute name="column-number">3</xsl:attribute>

                                                </fo:table-column>

                                                <fo:table-header>

                                                                <fo:table-row>

                                                                                <fo:table-cell number-columns-spanned="3" padding-before="3pt" padding-after="3pt">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" text-align="center">

                                                                                                                <xsl:value-of select="'Highlights'"/>

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before="3pt" padding-after="3pt">

                                                                                                <xsl:attribute name="border-before-style">solid</xsl:attribute>

                                                                                                <xsl:attribute name="border-before-width">1pt</xsl:attribute>

                                                                                                <xsl:attribute name="border-after-style">solid</xsl:attribute>

                                                                                                <xsl:attribute name="border-after-width">1pt</xsl:attribute>

                                                                                                <fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">

                                                                                                                <xsl:value-of select="'Volume'"/>

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before="3pt" padding-after="3pt">

                                                                                                <xsl:attribute name="border-before-style">solid</xsl:attribute>

                                                                                                <xsl:attribute name="border-before-width">1pt</xsl:attribute>

                                                                                                <xsl:attribute name="border-after-style">solid</xsl:attribute>

                                                                                                <xsl:attribute name="border-after-width">1pt</xsl:attribute>

                                                                                                <fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">

                                                                                                                <xsl:value-of select="'Chapter'"/>

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before="3pt" padding-after="3pt">

                                                                                                <xsl:attribute name="border-before-style">solid</xsl:attribute>

                                                                                                <xsl:attribute name="border-before-width">1pt</xsl:attribute>

                                                                                                <xsl:attribute name="border-after-style">solid</xsl:attribute>

                                                                                                <xsl:attribute name="border-after-width">1pt</xsl:attribute>

                                                                                                <fo:block xsl:use-attribute-sets="normal-text" font-weight="bold">

                                                                                                                <xsl:value-of select="'Reason for change'"/>

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                </fo:table-header>

                                                <fo:table-body>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                <xsl:value-of select="'1 through 7'"/>

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Rev 1 - 30Apr12

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1 through 6                               

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Extensive Revision Rev 2. 15Sep14

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Comment Incorporation. Rev 3 - 01June15

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Non technical change. Global comment incorporation. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.5.4

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Revised Figure 1. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>
																
																<fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.5.4

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Revised Figure 1. Rev 4. 03Mar17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.4.3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Moved data module from chapter 1.7. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2.0.1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated table 3. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2.0.2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Deleted duplicate tables. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2.13.1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated consumables. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Non technical changes. Global comment incorporation. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Added paragraph 2 to general warnings and cautions and related safety data. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.0.1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated figures 1 and 2. Updated tables 8, 25, and 45. Added technames and infonames to chapter references. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.0.2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Added definition of AIRTD. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2.0.1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated figure 3. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2.0.2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated paragraph 2.5 and 3.7. Replaced figure 2. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2.0.5

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated paragraph 3, 3.1, 3.7, and 19. Updated table 4. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2.0.6

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Moved data module from volume 3. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                4.0.1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated table 4. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                4.0.3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated note in paragraph 3.1. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                5.0.4

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Added new paragraph 2. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                6.0.2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated paragraph 2.7. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>                                               

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                7.0.3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Procedure completely revised. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Non technical changes. Global comment incorporation. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                General data procedure completely revised. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>
																
																<fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                General data figures added. Rev 4. 03Mar17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.5.2

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Added note to paragraph 1. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.5.3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Added note to paragraph 1. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                1.8.1

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Updated consumables. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                                <fo:table-row>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                3
                                                                                                                3

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                5.4.7

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                                <fo:table-cell padding-before=".1in">

                                                                                                <fo:block xsl:use-attribute-sets="normal-text">

                                                                                                                Added new procedure. Rev 4. 15Feb17

                                                                                                </fo:block>

                                                                                </fo:table-cell>

                                                                </fo:table-row>

                                                </fo:table-body>

                                </fo:table>

                </xsl:template>

	
	<xsl:template match="refdm[descendant::incode/text() = '009'][parent::pmentry[parent::content]]">
		<fo:page-sequence master-reference="Main">
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">	
				<xsl:variable name="volCount">
						<xsl:number count="pmentry[parent::content]" from="pm"/>
				</xsl:variable>
				<fo:marker marker-class-name="volChap">
					<xsl:value-of select="concat('Volume ',$volCount,' - ','TOC')"/>
				</fo:marker>
				<fo:block font-family="helvetica" font-size="10pt" id="{generate-id(.)}">
					<xsl:call-template name="volume_toc"/>	
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	
	<!--
	<xsl:template match="refdm[descendant::incode/text() = '002'][parent::pmentry[parent::content]]">
		<fo:page-sequence master-reference="Main" >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">	
				<xsl:variable name="volCount">
						<xsl:number count="pmentry[parent::content]" from="pm"/>
					</xsl:variable>
					<fo:marker marker-class-name="volChap">
						<xsl:value-of select="concat('Volume ',$volCount,' - ','List of effective data modudules')"/>
					</fo:marker>
				<fo:block font-family="helvetica" font-size="10pt" id="{generate-id(.)}">
					<xsl:call-template name="loedm"/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	-->
	<xsl:template match="refdm[descendant::incode/text() = '00A'][parent::pmentry[parent::content]]">
		<fo:page-sequence master-reference="Main" >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">	
				<xsl:variable name="volCount">
						<xsl:number count="pmentry[parent::content]" from="pm"/>
				</xsl:variable>
				<fo:marker marker-class-name="volChap">
					<xsl:value-of select="concat('Volume ',$volCount,' - ','List of illustrations')"/>
				</fo:marker>
				<fo:block font-family="helvetica" font-size="10pt" id="{generate-id(.)}">
					<xsl:call-template name="chap_list_of_figures"/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template name="chap_list_of_figures">
			<fo:block padding-after=".15in">
				<xsl:variable name="volume">
					<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
				</xsl:variable>
				<xsl:attribute name="id">loi</xsl:attribute>
				<fo:table>
					<fo:table-column>
							<xsl:attribute name="column-number">1</xsl:attribute>
							<xsl:attribute name="column-width">3.15in</xsl:attribute>
					</fo:table-column>
						<fo:table-column>
							<xsl:attribute name="column-number">2</xsl:attribute>
							<xsl:attribute name="column-width">3.8in</xsl:attribute>
						</fo:table-column>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell padding-after=".1in" number-columns-spanned="2">
								<fo:block xsl:use-attribute-sets="bold-titles" text-align="center" font-style="italic" font-size="14pt">							
									List of illustrations<xsl:value-of select="concat(' - Volume ',$volume)"/>
									
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Figure title
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Data module
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:for-each select="ancestor::pmentry/descendant::figure">
							<fo:table-row>
								<fo:table-cell padding-before=".1in">
									<fo:block xsl:use-attribute-sets="normal-text">
										<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
											<xsl:value-of select="./title/text()"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before=".1in">
									<fo:block xsl:use-attribute-sets="normal-text">
										<xsl:variable name="modelic" select="ancestor::dmodule/descendant::dmc[1]/descendant::modelic/text()"/>
										<xsl:variable name="sdc" select="ancestor::dmodule/descendant::dmc[1]/descendant::sdc/text()"/>
										<xsl:variable name="chapnum" select="ancestor::dmodule/descendant::dmc[1]/descendant::chapnum/text()"/>
										<xsl:variable name="section" select="ancestor::dmodule/descendant::dmc[1]/descendant::section/text()"/>
										<xsl:variable name="subsect" select="ancestor::dmodule/descendant::dmc[1]/descendant::subsect/text()"/>
										<xsl:variable name="subject" select="ancestor::dmodule/descendant::dmc[1]/descendant::subject/text()"/>
										<xsl:variable name="discode" select="ancestor::dmodule/descendant::dmc[1]/descendant::discode/text()"/>
										<xsl:variable name="discodev" select="ancestor::dmodule/descendant::dmc[1]/descendant::discodev/text()"/>
										<xsl:variable name="incode" select="ancestor::dmodule/descendant::dmc[1]/descendant::incode/text()"/>
										<xsl:variable name="incodev" select="ancestor::dmodule/descendant::dmc[1]/descendant::incodev/text()"/>
										<xsl:variable name="itemloc" select="ancestor::dmodule/descendant::dmc[1]/descendant::itemloc/text()"/>
										<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
											<xsl:value-of select="concat('DMC-',$modelic,'-',$sdc,'-',$chapnum,'-',$section,$subsect,'-',$subject,'-',$discode,$discodev,'-',$incode,$incodev,'-',$itemloc)"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>							
							</fo:table-row>
						</xsl:for-each>	
					</fo:table-body>
				</fo:table>
			</fo:block>
	</xsl:template>
	
	<xsl:template name="loedm">
			<fo:block padding-after=".15in">
				<xsl:attribute name="id">loedm</xsl:attribute>
				<xsl:variable name="volume">
					<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
				</xsl:variable>
				<fo:table>
					<fo:table-column>
							<xsl:attribute name="column-number">1</xsl:attribute>
							<xsl:attribute name="column-width">3in</xsl:attribute>
					</fo:table-column>
					<fo:table-column>
						<xsl:attribute name="column-number">2</xsl:attribute>
						<xsl:attribute name="column-width">3in</xsl:attribute>
					</fo:table-column>
					<fo:table-column>
						<xsl:attribute name="column-number">3</xsl:attribute>
						<xsl:attribute name="column-width">1in</xsl:attribute>
					</fo:table-column>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell padding-after=".1in" number-columns-spanned="3">
								<fo:block xsl:use-attribute-sets="bold-titles" text-align="center" font-style="italic" font-size="14pt">							
									List of effective data modules<xsl:value-of select="concat(' Volume ',$volume)"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Data Module
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Title
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Date
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:for-each select="../descendant::dmodule">
							<fo:table-row>
								<fo:table-cell padding-before=".1in">
									<fo:block xsl:use-attribute-sets="normal-text">
										<xsl:variable name="modelic" select="descendant::modelic/text()"/>
										<xsl:variable name="sdc" select="descendant::sdc/text()"/>
										<xsl:variable name="chapnum" select="descendant::chapnum/text()"/>
										<xsl:variable name="section" select="descendant::section/text()"/>
										<xsl:variable name="subsect" select="descendant::subsect/text()"/>
										<xsl:variable name="subject" select="descendant::subject/text()"/>
										<xsl:variable name="discode" select="descendant::discode/text()"/>
										<xsl:variable name="discodev" select="descendant::discodev/text()"/>
										<xsl:variable name="incode" select="descendant::incode/text()"/>
										<xsl:variable name="incodev" select="descendant::incodev/text()"/>
										<xsl:variable name="itemloc" select="descendant::itemloc/text()"/>
										<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
											<xsl:value-of select="concat('DMC-',$modelic,'-',$sdc,'-',$chapnum,'-',$section,$subsect,' - ',$subject,'-',$discode,$discodev,'-',$incode,$incodev,'-',$itemloc)"/>
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before=".1in">
									<fo:block xsl:use-attribute-sets="normal-text">
										<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-before=".1in" text-align="center">
									<fo:block xsl:use-attribute-sets="normal-text">
										<xsl:value-of select="'2014-09-15'"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>	
					</fo:table-body>
				</fo:table>
			</fo:block>
	</xsl:template>
	
	
	<xsl:template name="main_toc">
		<fo:page-sequence master-reference="Main" >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-family="helvetica" font-size="10pt" id="{'doc_toc'}">
					<fo:marker marker-class-name="volChap">
						TOC
					</fo:marker>
					<fo:table>
						<fo:table-column>
							<xsl:attribute name="column-number">1</xsl:attribute>
							<xsl:attribute name="column-width">.8in</xsl:attribute>
						</fo:table-column>
						<fo:table-column>
							<xsl:attribute name="column-number">2</xsl:attribute>
							<xsl:attribute name="column-width">6.18in</xsl:attribute>
						</fo:table-column>
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell padding-after=".1in" number-columns-spanned="2">
									<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" font-size="11pt">							
										Table of Contents
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row padding-after="3pt">
								<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
									<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
										Volume
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
									<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
										Title
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="descendant::pmentry[parent::content]">
								<xsl:variable name="volCount">
									<xsl:number count="pmentry[parent::content]" from="pm"/>
								</xsl:variable>
								<fo:table-row>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
											<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
												<xsl:value-of select="$volCount"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text">
											<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
												<xsl:value-of select="./title/text()"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!--
								<xsl:choose>
									<xsl:when test="./pmentry">
										<xsl:for-each select="./pmentry">
											<xsl:variable name="chapCount">
												<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]"/>
											</xsl:variable>
											<fo:table-row>
											<fo:table-cell padding-before=".1in">
												<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
													<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
														<xsl:value-of select="$volCount"/>
													</fo:basic-link>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell padding-before=".1in">
												<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
													<xsl:variable name="dmodCount">
														<xsl:number count="dmodule" from="pmentry"/>
													</xsl:variable>
													<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
														<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]"/>
													</fo:basic-link>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell padding-before=".1in">
												<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
													<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
														<xsl:value-of select="title/text()"/>
													</fo:basic-link>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
											<xsl:for-each select="./dmodule">
												<fo:table-row>
													<fo:table-cell padding-before=".1in">
														<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry) and not(
														ancestor::pmentry[parent::content]/following-sibling::pmentry)">
															<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
															<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
														</xsl:if>
														<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
															<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
																<xsl:value-of select="$volCount"/>
															</fo:basic-link>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell padding-before=".1in">
														<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry) and not(
														ancestor::pmentry[parent::content]/following-sibling::pmentry)">
															<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
															<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
														</xsl:if>
														<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
															<xsl:variable name="dmodCount">
																<xsl:number count="dmodule" from="pmentry"/>
															</xsl:variable>
															<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
																<xsl:variable name="dmCount">
																	<xsl:number count="dmodule" from="pmentry[parent::pmentry]"/>
																</xsl:variable>
																<xsl:value-of select="concat($chapCount,'.',$dmCount)"/>
															</fo:basic-link>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell padding-before=".1in">
														<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry) and not(
														ancestor::pmentry[parent::content]/following-sibling::pmentry)">
															<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
															<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
														</xsl:if>
														<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
															<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
																<xsl:value-of select="descendant::techname/text()"/>
															</fo:basic-link>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<fo:table-row>
											<fo:table-cell padding-before=".1in">
												<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
													<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
														<xsl:value-of select="$volCount"/>
													</fo:basic-link>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell padding-before=".1in">
												<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
													<xsl:variable name="dmodCount">
														<xsl:number count="dmodule" from="pmentry"/>
													</xsl:variable>
													<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
														1
													</fo:basic-link>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell padding-before=".1in">
												<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
													<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
														<xsl:value-of select="title/text()"/>
													</fo:basic-link>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<xsl:for-each select="./dmodule">
												<fo:table-row>
													<fo:table-cell padding-before=".1in">
														<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry)">
															<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
															<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
														</xsl:if>
														<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
															<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
																<xsl:value-of select="$volCount"/>
															</fo:basic-link>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell padding-before=".1in">
														<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry)">
															<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
															<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
														</xsl:if>
														<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
															<xsl:variable name="dmodCount">
																<xsl:number count="dmodule" from="pmentry"/>
															</xsl:variable>
															<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
																<xsl:variable name="dmCount">
																	<xsl:number count="dmodule" from="pmentry[parent::pmentry]"/>
																</xsl:variable>
																<xsl:value-of select="concat('1','.',$dmCount)"/>
															</fo:basic-link>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell padding-before=".1in">
														<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry)">
															<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
															<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
														</xsl:if>
														<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
															<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
																<xsl:value-of select="descendant::techname/text()"/>
															</fo:basic-link>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>-->
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template name="volume2FrontMatterToc">
		<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		</xsl:for-each>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="'{$id}'" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<xsl:variable name="id">
						<xsl:for-each select="ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']">
							<xsl:value-of select="generate-id(.)"/>
						</xsl:for-each>
					</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<xsl:variable name="id">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']">
							<xsl:value-of select="generate-id(.)"/>
						</xsl:for-each>
					</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template name="volume1FrontMatterToc">
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">			
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell padding-before=".1in">
			<fo:block xsl:use-attribute-sets="normal-text">
				<fo:basic-link internal-destination="'loedm'" color="blue">
					-
				</fo:basic-link>
			</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
			<fo:block xsl:use-attribute-sets="normal-text">
				<fo:basic-link internal-destination="'loedm'" color="blue">
					<xsl:value-of select="concat(ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '002']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '002']/descendant::infoname/text())"/>
				</fo:basic-link>
			</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		</xsl:for-each>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="'{$id}'" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="../dmodule[descendant::incode[1]/text() = '044'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							-
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							<xsl:value-of select="concat(descendant::techname[1]/text(),' - ',descendant::infoname[1]/text())"/>
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>	
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template name="volume3FrontMatterToc">
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							-
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::infoname/text())"/>
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="'{$id}'" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<xsl:variable name="id">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']">
							<xsl:value-of select="generate-id(.)"/>
						</xsl:for-each>
					</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	
	
	<xsl:template name="volume4FrontMatterToc">
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '018']">
					<xsl:value-of select="'introduction'"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '018']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '018']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							-
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::infoname/text())"/>
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="'{$id}'" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '007']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="../dmodule[descendant::incode[1]/text() = '044'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							-
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							<xsl:value-of select="concat(descendant::techname[1]/text(),' - ',descendant::infoname[1]/text())"/>
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>	
		<fo:table-row>
			<xsl:variable name="id">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']">
							<xsl:value-of select="generate-id(.)"/>
						</xsl:for-each>
					</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template name="volume5FrontMatterToc">
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '018']">
					<xsl:value-of select="'introduction'"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '018']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '018']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							-
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '005']/descendant::infoname/text())"/>
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/refdm[descendant::incode/text() = '00A']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="../dmodule[descendant::incode[1]/text() = '044'][parent::pmentry[parent::content]][1]">
			<fo:table-row>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							-
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-before=".1in">
					<fo:block xsl:use-attribute-sets="normal-text">
						<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
							<xsl:value-of select="concat(descendant::techname[1]/text(),' - ',descendant::infoname[1]/text())"/>
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>	
		<fo:table-row>
			<xsl:variable name="id">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']">
							<xsl:value-of select="generate-id(.)"/>
						</xsl:for-each>
					</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					
					<fo:basic-link color="blue">
						<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '012']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<xsl:variable name="id">
				<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:for-each>
			</xsl:variable>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						-
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before=".1in">
				<fo:block xsl:use-attribute-sets="normal-text">
					<fo:basic-link internal-destination="{$id}" color="blue">
						<xsl:value-of select="concat(ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']/descendant::techname/text(),' - ',ancestor::pmentry[parent::content]/dmodule[descendant::incode/text() = '010']/descendant::infoname/text())"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template name="volume_toc">
		<fo:block padding-after=".15in" id="{'maintoc'}">
				<xsl:variable name="volume">
					<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
				</xsl:variable>
				<fo:table>
					<fo:table-column>
							<xsl:attribute name="column-number">1</xsl:attribute>
							<xsl:attribute name="column-width">.8in</xsl:attribute>
					</fo:table-column>
						<fo:table-column>
							<xsl:attribute name="column-number">2</xsl:attribute>
							<xsl:attribute name="column-width">6.18in</xsl:attribute>
						</fo:table-column>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell padding-after=".1in" number-columns-spanned="2">
								<fo:block xsl:use-attribute-sets="bold-titles" text-align="center" font-style="italic" font-size="14pt">							
									Table of contents - Volume<xsl:value-of select="concat(' ',$volume)"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row padding-after="3pt">
							<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Chapter
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
								<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
									Title
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:choose>
							<xsl:when test="ancestor::pmentry/pmentry">
								<xsl:choose>
									<xsl:when test="ancestor::pmentry[parent::content]/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Operation and  Maintenance - Description (Volume 1 of 6)'">
										<xsl:call-template name="volume1FrontMatterToc"/>
									</xsl:when>
									<xsl:when test="ancestor::pmentry[parent::content]/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Operation (Volume 2 of 6)'">
										<xsl:call-template name="volume2FrontMatterToc"/>
									</xsl:when>
									<xsl:when test="ancestor::pmentry[parent::content]/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Maintenance (Volume 3 of 6)'">
										<xsl:call-template name="volume3FrontMatterToc"/>
									</xsl:when>
									<xsl:when test="ancestor::pmentry[parent::content]/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Troubleshooting (Volume 4 of 6)'">
										<xsl:call-template name="volume4FrontMatterToc"/>
									</xsl:when>
									<xsl:when test="ancestor::pmentry[parent::content]/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance -  IPD (Volume 5 of 6)'">
										<xsl:call-template name="volume5FrontMatterToc"/>
									</xsl:when>
								</xsl:choose>																			
								<xsl:for-each select="ancestor::pmentry/pmentry">
									<xsl:variable name="chap_count">
										<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]"/>
									</xsl:variable>
									<xsl:choose>
									<xsl:when test="child::refdm">
										<xsl:for-each select="descendant::refdm[descendant::incode/text() = 009]">
											<xsl:variable name="refdm_count">
												<xsl:number count="refdm[descendant::incode = 009]" from="pmentry[parent::pmentry]">
												</xsl:number>
											</xsl:variable>
											<fo:table-row>
												<fo:table-cell padding-before=".1in">
													<fo:block xsl:use-attribute-sets="normal-text">
														<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
															<xsl:value-of select="concat($chap_count,'.',$refdm_count - 1)"/>
														</fo:basic-link>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell padding-before=".1in">
													<fo:block xsl:use-attribute-sets="normal-text">
														<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
															<xsl:value-of select="descendant::techname/text()"/>
														</fo:basic-link>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											<!--
								<xsl:if test="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '007']">
									<fo:bookmark internal-destination="'los'" starting-state="hide">
										<xsl:variable name="id">
											<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '007']">
												<xsl:value-of select="generate-id(.)"/>
											</xsl:for-each>
										</xsl:variable>
										<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
										<fo:bookmark-title>List of symbols</fo:bookmark-title>
									</fo:bookmark>
								</xsl:if>
								<xsl:if test="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
								<fo:bookmark starting-state="hide">
									<xsl:variable name="id">
										<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
											<xsl:value-of select="generate-id(.)"/>
										</xsl:for-each>
									</xsl:variable>
									<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
									<fo:bookmark-title>List of abbreviations</fo:bookmark-title>
								</fo:bookmark>
							</xsl:if>
							<xsl:if test="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '005']">
								<fo:bookmark internal-destination="'loi'" starting-state="hide">
									<fo:bookmark-title>List of illustrations</fo:bookmark-title>
								</fo:bookmark>
							</xsl:if>
							<xsl:if test="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '012']">
								<fo:bookmark internal-destination="'warning/caution'" starting-state="hide">
									<xsl:variable name="id">
										<xsl:for-each select="descendant::dmodule[descendant::dmc[1]/descendant::incode/text() = '012']">
											<xsl:value-of select="generate-id(.)"/>
										</xsl:for-each>
									</xsl:variable>
									<xsl:attribute name="internal-destination"><xsl:value-of select="$id"/></xsl:attribute>
									<fo:bookmark-title>General warnings and cautions and related safety data</fo:bookmark-title>
								</fo:bookmark>
											</xsl:if>-->
											<xsl:call-template name="build-mid-chapter-toc-rows">
												<xsl:with-param name="position" select="1"/>
												<xsl:with-param name="refdm_count" select="$refdm_count - 1"/>
												<xsl:with-param name="chap_count" select="$chap_count"/>
											</xsl:call-template>
										</xsl:for-each>
										</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="./dmodule">
											<xsl:variable name="dmCount">
												<xsl:number count="dmodule" format="1" from="pmentry"/>
											</xsl:variable>
											<fo:table-row>
												<fo:table-cell padding-before=".1in">
													<fo:block xsl:use-attribute-sets="normal-text">
														<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
															<xsl:value-of select="concat($chap_count,'.',$dmCount)"/>
														</fo:basic-link>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell padding-before=".1in">
													<fo:block xsl:use-attribute-sets="normal-text">
														<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
															<xsl:value-of select="descendant::techname/text()"/>
														</fo:basic-link>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose><!--
										<xsl:for-each select="./dmodule">
											<fo:table-row>
												<fo:table-cell padding-before=".1in">
													<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry)">
														<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
														<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
													</xsl:if>
													<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
														<xsl:variable name="chapCount">
															<xsl:for-each select="parent::pmentry">
																<xsl:variable name="count">
																	<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="any"/>
																</xsl:variable>
																<xsl:value-of select="$count"/>
															</xsl:for-each>
														</xsl:variable>
														<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
															<xsl:variable name="dmodCount">
																<xsl:number count="dmodule" from="pmentry"/>
															</xsl:variable>	
															<xsl:value-of select="concat($chapCount,'.',$dmodCount)"/>
														</fo:basic-link>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell padding-before=".1in">
													<xsl:if test="not(following-sibling::dmodule) and not(parent::pmentry/following-sibling::pmentry)">
														<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
														<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
													</xsl:if>
													<fo:block xsl:use-attribute-sets="normal-text">
														<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
															<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
														</fo:basic-link>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:for-each>-->
									</xsl:for-each>
									
							</xsl:when>
							<xsl:otherwise>
								<fo:table-row>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
												1
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text">
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
												<xsl:value-of select="parent::pmentry/title/text()"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="parent::pmentry/dmodule">
									<fo:table-row>
										<fo:table-cell padding-before=".1in">
											<xsl:if test="not(following-sibling::dmodule)">
												<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
												<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
											</xsl:if>
											<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
												<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
													<xsl:variable name="dmodCount">
														<xsl:number count="dmodule" from="pmentry"/>
													</xsl:variable>	
													<xsl:value-of select="concat('1','.',$dmodCount)"/>
												</fo:basic-link>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-before=".1in">
											<xsl:if test="not(following-sibling::dmodule)">
												<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
												<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
											</xsl:if>
											<fo:block xsl:use-attribute-sets="normal-text">
												<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
													<xsl:value-of select="descendant::techname/text()"/>
												</fo:basic-link>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>						
					</fo:table-body>
				</fo:table>
			</fo:block>
	</xsl:template>
	
	<xsl:template match="title[parent::pmentry[parent::content]]|title[parent::pmentry[parent::pmentry]]">
		<fo:block padding-after=".5in" text-align="center" font-size="18pt" xsl:use-attribute-sets="normal-text" font-weight="bold" break-after="page">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="title[parent::pmentry[parent::pmentry]]">
		<fo:block padding-after=".5in" text-align="center" font-size="18pt" xsl:use-attribute-sets="normal-text" font-weight="bold">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="pmentry[parent::pmentry]">
		<fo:page-sequence master-reference="Main"  >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" font-size="18pt" id="{generate-id(.)}" padding-after=".15in" text-align="center">
					<!--count volume-->
					<xsl:variable name="volume">
						<xsl:for-each select="ancestor::pmentry[parent::content]">
							<xsl:variable name="count">
								<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
							</xsl:variable>
							<xsl:value-of select="$count"/>
						</xsl:for-each>
					</xsl:variable>
					<!--count chapter-->
					<xsl:variable name="chap">
						<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="single"/>
					</xsl:variable>
					<fo:marker marker-class-name="volChap">
						<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ',$chap)"/>
					</fo:marker>						
					<xsl:for-each select="parent::pmentry">
						<fo:block padding-after=".15in">
							<xsl:value-of select="'Volume '"/><xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
						</fo:block>				
					</xsl:for-each>
				</fo:block>
					<fo:block >
						<xsl:variable name="chap">
							<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="single"/>
						</xsl:variable>
						<fo:block xsl:use-attribute-sets="normal-text" font-size="18pt" font-weight="bold" padding-after=".15in" text-align="center">
							<xsl:value-of select="./title/text()"/>
							<fo:block padding-after=".1in"/>
							<xsl:value-of select="concat('Chapter ',$chap)"/>
						</fo:block>
						<xsl:call-template name="create_chapter_toc"/>
					</fo:block>
				</fo:flow>
		</fo:page-sequence>
		<xsl:apply-templates select="dmodule|placeholder|refdm"/>
	</xsl:template>
	
		<xsl:template name="middle-of-chapter-toc">
		<fo:block padding-after=".15in">
			<xsl:variable name="volume">
				<xsl:for-each select="parent::pmentry">
					<xsl:variable name="count">
						<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
					</xsl:variable>
					<xsl:value-of select="$count"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="chapter_count">
				<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::contant]" level="single"/>
			</xsl:variable>
			<xsl:variable name="refdm_count">
				<xsl:number count="refdm[descendant::incode/text() = 009]" from="pmentry[parent::pmentry]" level="single"/>
			</xsl:variable>
			<fo:table>
				<fo:table-column>
					<xsl:attribute name="column-number">1</xsl:attribute>
					<xsl:attribute name="column-width">.8in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">2</xsl:attribute>
					<xsl:attribute name="column-width">.8in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">3</xsl:attribute>
					<xsl:attribute name="column-width">5.38in</xsl:attribute>
				</fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell padding-after=".1in" number-columns-spanned="3">
							<fo:block xsl:use-attribute-sets="bold-titles" text-align="center" font-style="italic" font-size="14pt">
								Table of contents
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row padding-after="3pt">
						<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
								Volume
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
								Chapter
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
								Title
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:call-template name="build-mid-chapter-toc">
						<xsl:with-param name="position" select="1"/>
						<xsl:with-param name="volume" select="$volume"/>
						<xsl:with-param name="chapter" select="$chapter_count"/>
						<xsl:with-param name="refdm_count" select="$refdm_count"/>
					</xsl:call-template>				
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
		<xsl:template name="build-mid-chapter-toc">
		<xsl:param name="position"/>
		<xsl:param name="volume"/>
		<xsl:param name="chapter"/>
		<xsl:param name="refdm_count"/>
		<xsl:choose>
			<xsl:when test="following-sibling::*[$position][self::dmodule]">
				<fo:table-row>
					<fo:table-cell padding-before=".1in">
						<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
							<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
								<xsl:value-of select="$volume"/>
							</fo:basic-link>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-before=".1in">
						<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
							<xsl:variable name="dmodCount">
								<xsl:for-each select="following-sibling::*[$position][self::dmodule]">
									<xsl:number count="dmodule" from="pmentry"/>
								</xsl:for-each>							
							</xsl:variable>
							<xsl:for-each select="following-sibling::*[$position][self::dmodule]">
								<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
									<xsl:value-of select="concat($chapter,'.',$refdm_count - 1,'.',$position)"/>
								</fo:basic-link>
							</xsl:for-each>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-before=".1in">
						<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
							<xsl:for-each select="following-sibling::*[$position][self::dmodule]">
							<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
								<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
							</fo:basic-link>
							</xsl:for-each>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:if test="following-sibling::*[$position + 1][self::dmodule]">
					<xsl:call-template name="build-mid-chapter-toc">
						<xsl:with-param name="position" select="$position + 1"/>
						<xsl:with-param name="volume" select="$volume"/>
						<xsl:with-param name="chapter" select="$chapter"/>
						<xsl:with-param name="refdm_count" select="$refdm_count"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<fo:table-row>
					<fo:table-cell padding-before=".1in">
						<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
							None
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	
	<xsl:template match="refdm[descendant::incode/text() = 009][parent::pmentry[parent::pmentry]]">
		<fo:page-sequence master-reference="Main" >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">	
				<xsl:variable name="volCount">
					<xsl:number count="pmentry[parent::content]" from="pm"/>
				</xsl:variable>
				<xsl:variable name="refdmCount">
					<xsl:number count="refdm[descendant::incode/text() = 009]" from="pmentry[parent::pmentry]"/>
				</xsl:variable>
				<xsl:variable name="chapCount">
					<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]"/>
				</xsl:variable>
				<fo:marker marker-class-name="volChap">
					<xsl:value-of select="concat('Volume ',$volCount,' - ','Chapter ',$chapCount,'.',$refdmCount - 1)"/>
				</fo:marker>
				<fo:block font-family="helvetica" font-size="10pt" id="{generate-id(.)}">
					<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" font-size="18pt" text-align="center" padding-after=".1in">
						<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
					</fo:block>
					<xsl:choose>
						<xsl:when test="(following-sibling::*[1]/descendant::incode/text() = 009) or (not(following-sibling::*[1][self::refdm]) and not(following-sibling::*[1][self::dmodule]))">
							<fo:block padding-before=".15in" padding-after=".15in" text-align="center" font-size="18pt" xsl:use-attribute-sets="normal-text" font-weight="bold">
								No Planned Maintenance Required For This Sub-System
							</fo:block>
						</xsl:when>
						<xsl:when test="not(following-sibling::*[1]/descendant::incode/text() = 009)">
							<xsl:call-template name="middle-of-chapter-toc"/>
						</xsl:when>
					</xsl:choose>
					
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	
	
	<!--
	<xsl:template match="refdm[descendant::incode/text() = '009'][parent::pmentry[parent::pmentry]][position() = 1]">
		<fo:page-sequence master-reference="Main"  >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold" font-size="18pt" id="{generate-id(.)}" padding-after=".15in" text-align="center">
						<xsl:variable name="volume">
							<xsl:for-each select="ancestor::pmentry[parent::content]">
								<xsl:variable name="count">
									<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
								</xsl:variable>
								<xsl:value-of select="$count"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="chap">
							<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="single"/>
						</xsl:variable>
						Current volume and chapter
						<fo:marker marker-class-name="volChap">
							<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ',$chap)"/>
						</fo:marker>

						<xsl:for-each select="parent::pmentry">
							<fo:block padding-after=".15in">
								<xsl:value-of select="'Volume '"/><xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
							</fo:block>				
						</xsl:for-each>
						<xsl:value-of select="'Chapter '"/><xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="any"/>
					</fo:block>
				<xsl:apply-templates select="title"/>
					<fo:block >
						<xsl:variable name="chap">
							<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="single"/>
						</xsl:variable>
						<fo:block xsl:use-attribute-sets="normal-text" font-size="18pt" font-weight="bold" padding-after=".15in" text-align="center">
							<xsl:value-of select="descendant::techname/text()"/>
							<fo:block padding-after=".1in"/>
							<xsl:value-of select="concat('Chapter ',$chap)"/>
						</fo:block>
						<xsl:call-template name="create_chapter_toc"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</xsl:template>-->
	
	<xsl:template name="create_chapter_toc">
		<fo:block padding-after=".15in">
			<xsl:variable name="volume">
				<xsl:for-each select="parent::pmentry">
					<xsl:variable name="count">
						<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
					</xsl:variable>
					<xsl:value-of select="$count"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="chapter_count">
				<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="single"/>
			</xsl:variable>
			<xsl:attribute name="id"><xsl:value-of select="concat('chap',$volume,$chapter_count)"/></xsl:attribute>
			<fo:table>
				<fo:table-column>
					<xsl:attribute name="column-number">1</xsl:attribute>
					<xsl:attribute name="column-width">.8in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">2</xsl:attribute>
					<xsl:attribute name="column-width">.8in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">3</xsl:attribute>
					<xsl:attribute name="column-width">5.38in</xsl:attribute>
				</fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell padding-after=".1in" number-columns-spanned="3">
							<fo:block xsl:use-attribute-sets="bold-titles" text-align="center" font-style="italic" font-size="14pt">
								Table of contents
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row padding-after="3pt">
						<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
								Volume
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
								Chapter
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-after="3pt" padding-before="3pt" xsl:use-attribute-sets="top-bottom-borders">
							<fo:block xsl:use-attribute-sets="bold-normal-text" text-align="center">
								Title
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:choose>
						<xsl:when test="child::refdm">
							<xsl:for-each select="./refdm[descendant::incode/text() = 009]">
								<xsl:variable name="refdmCount">
									<xsl:number count="refdm[descendant::incode/text() = 009]" from="pmentry[parent::pmentry]"/>
								</xsl:variable>
								<fo:table-row>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text">
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
												<xsl:value-of select="$volume"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text">
											<xsl:variable name="dmodCount">
												<xsl:number count="dmodule" from="pmentry"/>
											</xsl:variable>
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
												<xsl:value-of select="concat($chapter_count,'.',$refdmCount - 1)"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
												<xsl:value-of select="concat(descendant::techname/text(),'.',descendant::infocode/text())"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>							
								</fo:table-row>
								<xsl:call-template name="build-chapter-toc-rows">
									<xsl:with-param name="position" select="1"/>
									<xsl:with-param name="refdm_count" select="$refdmCount - 1"/>
									<xsl:with-param name="chap_count" select="$chapter_count"/>
									<xsl:with-param name="volume" select="$volume"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="dmodule">
								<xsl:variable name="dmCount">
									<xsl:number count="dmodule" from="pmentry[parent::pmentry]"/>
								</xsl:variable>
								<fo:table-row>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text">
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
												<xsl:value-of select="$volume"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text">
											<xsl:variable name="dmodCount">
												<xsl:number count="dmodule" from="pmentry"/>
											</xsl:variable>
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
												<xsl:value-of select="concat($chapter_count,'.',$dmCount)"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-before=".1in">
										<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
											<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
												<xsl:value-of select="concat(descendant::techname/text(),'.',descendant::infocode/text())"/>
											</fo:basic-link>
										</fo:block>
									</fo:table-cell>							
								</fo:table-row>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					
					
					<!--
					<xsl:for-each select="parent::pmentry/descendant::dmodule">
						<fo:table-row>
							<fo:table-cell padding-after=".1in">
								<xsl:call-template name="check_if_first"/>
								<xsl:call-template name="check_if_last"/>
								<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<fo:basic-link color="blue" internal-destination="{generate-id(.)}">	
										<xsl:value-of select="$volume"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after=".1in">
								<xsl:call-template name="check_if_first"/>
								<xsl:call-template name="check_if_last"/>
								<fo:block xsl:use-attribute-sets="normal-text" text-align="center">
									<xsl:variable name="dmodCount">
										<xsl:number count="dmodule" from="pmentry"/>
									</xsl:variable>
									<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
										<xsl:value-of select="concat($chapter_count,'.',$dmodCount)"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-after=".1in">
								<xsl:call-template name="check_if_first"/>
								<xsl:call-template name="check_if_last"/>
								<fo:block xsl:use-attribute-sets="normal-text" text-align="left">
									<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
										<xsl:value-of select="concat(descendant::techname/text(),' - ',descendant::infoname/text())"/>
									</fo:basic-link>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>-->
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<!--Checks to see if the current element is the first-->
	<xsl:template name="check_if_first">
		<xsl:if test="not(preceding-sibling::dmodule) and not(following-sibling::pmentry)">
			<xsl:attribute name="padding-before">3pt</xsl:attribute>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="check_if_last">
		<xsl:if test="not(following-sibling::dmodule) and not(following-sibling::pmentry)">
			<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
			<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>