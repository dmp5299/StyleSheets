<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:psmi="http://www.CraneSoftwrights.com/resources/psmi"
		xmlns:ext="http://some.namespace.com">

	<xsl:import href="tables.xsl"/>

	<xsl:import href="ipc.xsl"/>

	<xsl:import href="attribute-sets.xsl"/>

	<xsl:output indent="yes"/>
	
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:page-sequence-master master-name="Main">       
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" odd-or-even="even" master-reference="Main.Even.Blank"/>
						<fo:conditional-page-master-reference master-reference="Main.Odd" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference master-reference="Main.Even" odd-or-even="even" page-position="any"/>      
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
			</fo:layout-master-set><!--
			<fo:bookmark-tree>
				<xsl:for-each select="descendant::pmEntry[count(ancestor::pmEntry)=0]">
					<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
						<fo:bookmark-title>
							<xsl:value-of select="pmEntryTitle"/>
						</fo:bookmark-title>
						<xsl:for-each select="./pmEntry">
							<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
								<fo:bookmark-title>
									<xsl:value-of select="pmEntryTitle"/>
								</fo:bookmark-title>
								<xsl:for-each select="./dmodule[not(descendant::infoName='Change record or highlights')]">
									<xsl:choose>
										<xsl:otherwise>
											<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
												<fo:bookmark-title>
													<xsl:value-of select="descendant::infoName"/>
													<xsl:value-of select="' '"/>
													<xsl:choose>
														<xsl:when test="descendant::infoName='Table of contents' or descendant::infoName='List of support equipment' or descendant::infoName='List of supplies'">
															<xsl:value-of select="ancestor::pm/descendant::pmTitle"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="descendant::techName"/>
														</xsl:otherwise>
													</xsl:choose>
												</fo:bookmark-title>
											</fo:bookmark>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								<xsl:for-each select="./pmEntry">
									<xsl:for-each select="./dmodule">
										<xsl:choose>
											<xsl:otherwise>
												<fo:bookmark internal-destination="{generate-id(.)}" starting-state="hide">
													<fo:bookmark-title>
														<xsl:value-of select="descendant::infoName"/>
														<xsl:value-of select="' '"/>
														<xsl:value-of select="descendant::techName"/>
													</fo:bookmark-title>
												</fo:bookmark>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
									<fo:bookmark internal-destination="{generate-id(.)}">
										<fo:bookmark-title>
											<xsl:value-of select="pmEntryTitle"/>
										</fo:bookmark-title>
									</fo:bookmark>
								</xsl:for-each>
							</fo:bookmark>
						</xsl:for-each>
					</fo:bookmark>
				</xsl:for-each>
			</fo:bookmark-tree>-->
			<xsl:call-template name="dmodules"/>
		</fo:root>
	</xsl:template>

	<xsl:template name="dmodules">
		<xsl:apply-templates select="dmodule"/>
	</xsl:template>

	<xsl:template match="dmaddres">       
		<fo:block ><!--
			<xsl:if test="/descendant::ipc">
				<xsl:attribute name="break-after">page</xsl:attribute>
			</xsl:if>-->
			<xsl:apply-templates select="dmtitle"/>      
		</fo:block>    
	</xsl:template>

	<xsl:template match="idstatus" priority="0">       
		<fo:block space-after="15pt">
			<xsl:apply-templates select="dmaddres"/>       
		</fo:block>   
	</xsl:template>

	<xsl:template match="dmtitle[parent::dmaddres]" priority="0">       
		<fo:block xsl:use-attribute-sets="normal-text" font-size="14pt" font-weight="bold" role="dmtitle" padding-before="5pt" text-align="center">
			<xsl:apply-templates select="techname"/>
			<xsl:text> - </xsl:text>
			<xsl:apply-templates select="infoname"/>     
		</fo:block>    
	</xsl:template>

	<xsl:template match="subpara1|subpara2|subpara3|subpara4|subpara5">
		<fo:block xsl:use-attribute-sets="normal-text">
			<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="toc">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block> 			<xsl:if test="descendant::descript">
			</xsl:if><xsl:attribute name="id"><xsl:value-of select="concat('toc',$volCount,$chapCount,$dmCount)"/></xsl:attribute><fo:table
					xsl:use-attribute-sets="normal-text" padding-top="15pt"
					space-after=".15in"> 				<fo:table-column> 					<xsl:attribute
							name="column-number">1</xsl:attribute> 					<xsl:attribute
							name="column-width">6.55in</xsl:attribute> 				</fo:table-column> 				<fo:table-column
						> 					<xsl:attribute name="column-number">2</xsl:attribute> 					<xsl:attribute
							name="column-width">.31in</xsl:attribute> 				</fo:table-column> 				<fo:table-header
						> 					<fo:table-row> 						<fo:table-cell number-columns-spanned="2"
								padding-after=".1in" xsl:use-attribute-sets="normal-text"> 							<fo:block font-size="14pt"
									font-weight="bold" text-align-last="justify">Table of contents 								<fo:leader
										leader-alignment="reference-area"></fo:leader> 								<fo:inline
										font-size="10pt" font-weight="normal">Page</fo:inline> 							</fo:block
								> 						</fo:table-cell> 					</fo:table-row> 				</fo:table-header
					> 				<fo:table-body> 					<xsl:if test="descendant::descript">
						<xsl:call-template name="descriptTOC">
							<xsl:with-param name="type" select="'descript'"/>
							<xsl:with-param name="volCount" select="$volCount"/>
							<xsl:with-param name="chapCount" select="$chapCount"/>
							<xsl:with-param name="dmCount" select="$dmCount"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="descendant::proced">
						<xsl:call-template name="procedTOC">
							<xsl:with-param name="type" select="'proced'"/>
							<xsl:with-param name="volCount" select="$volCount"/>
							<xsl:with-param name="chapCount" select="$chapCount"/>
							<xsl:with-param name="dmCount" select="$dmCount"/>
						</xsl:call-template>	
					</xsl:if></fo:table-body> 			</fo:table> 		</fo:block> 	
	</xsl:template>

	<xsl:template match="safety">
		<xsl:if test="not(child::nosafety)">
			<fo:block xsl:use-attribute-sets="bold-titles" text-align="left" padding-after=".15in" keep-with-next.within-page="always">
				Safety conditions
			</fo:block>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="supequip">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<xsl:if test="not(child::nosupeq)">
			<fo:block>
				<xsl:attribute name="id"><xsl:value-of select="concat('supequip',$volCount,$chapCount,$dmCount)"/></xsl:attribute>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="supplies">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<xsl:if test="not(child::nosupply)">
			<fo:block>
				<xsl:attribute name="id"><xsl:value-of select="concat('supplies',$volCount,$chapCount,$dmCount)"/></xsl:attribute>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="spares">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<xsl:if test="not(child::nospares)">
			<fo:block padding-after=".1in">
				<xsl:attribute name="id">
					<xsl:value-of select="concat('spares',$volCount,$chapCount,$dmCount)"/>
				</xsl:attribute>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="sparesli">
		<fo:table>
			<fo:table-column>
				<xsl:attribute name="column-number">1</xsl:attribute>
				<xsl:attribute name="column-width">2.3in</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-number">2</xsl:attribute>
				<xsl:attribute name="column-width">2.38in</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-number">3</xsl:attribute>
				<xsl:attribute name="column-width">.75in</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-number">4</xsl:attribute>
				<xsl:attribute name="column-width">1.53in</xsl:attribute>
			</fo:table-column>
			<fo:table-header>
				<fo:table-row>
					<fo:table-cell padding-after=".15in" number-columns-spanned="4">
						<fo:block xsl:use-attribute-sets="bold-titles" text-align="left">
							Spares
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell number-columns-spanned="4">
						<fo:block xsl:use-attribute-sets="normal-text" text-align="center" font-style="italic">
							<xsl:variable name="count">
								<xsl:number count="reqconds|supeqli|reqpers|spares|supplyli" level="any" format="1" from="dmodule"/>
							</xsl:variable>
							Table <xsl:value-of select="$count+1"/> Spares
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row padding-after="3pt">
					<fo:table-cell padding-after="3pt" padding-left="3pt" padding-before="3pt">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<xsl:attribute name="border-top-style">solid</xsl:attribute>
						<xsl:attribute name="border-top-width">1pt</xsl:attribute>
						<fo:block xsl:use-attribute-sets="bold-normal-text">
							Nomenclature
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-left="3pt">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<xsl:attribute name="border-top-style">solid</xsl:attribute>
						<xsl:attribute name="border-top-width">1pt</xsl:attribute>
						<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
							Identification No.
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-left="3pt">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<xsl:attribute name="border-top-style">solid</xsl:attribute>
						<xsl:attribute name="border-top-width">1pt</xsl:attribute>
						<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
							Qty
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-left="3pt">
						<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
						<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
						<xsl:attribute name="border-top-style">solid</xsl:attribute>
						<xsl:attribute name="border-top-width">1pt</xsl:attribute>
						<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
							Remarks
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<xsl:for-each select="descendant::spare">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>

	<xsl:template match="supequi">
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-left="3pt" padding-after="3pt">
				<xsl:if test="not(preceding-sibling::supequi)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supequi)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block id="{generate-id(.)}">
					<xsl:apply-templates select="nomen"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::supequi)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supequi)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>
					<xsl:value-of select="concat('NSN: ',./nsn/@nsn)"/>
					<xsl:apply-templates select="identno"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::supequi)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supequi)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>
					<xsl:apply-templates select="qty"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::supequi)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supequi)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>

				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

	<xsl:template match="supeqli">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block padding-after=".15in">
			<fo:table>
				<fo:table-column>
					<xsl:attribute name="column-number">1</xsl:attribute>
					<xsl:attribute name="column-width">2.3in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">2</xsl:attribute>
					<xsl:attribute name="column-width">2.38in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">3</xsl:attribute>
					<xsl:attribute name="column-width">.75in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">4</xsl:attribute>
					<xsl:attribute name="column-width">1.53in</xsl:attribute>
				</fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell padding-after=".15in" number-columns-spanned="4">
							<fo:block xsl:use-attribute-sets="bold-titles" text-align="left">
								Support equipment
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="4">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center" font-style="italic">
								<xsl:variable name="count">
									<xsl:number count="reqconds[not(child::noconds)]|supeqli|reqpers|supplyli|spares[not(child::nospares)]" level="any" format="1" from="dmodule"/>
								</xsl:variable>
								Table <xsl:value-of select="$count+1"/> Support equipment
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row padding-after="3pt">
						<fo:table-cell padding-after="3pt" padding-left="3pt" padding-before="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								Nomenclature
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Identification No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Qty
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Remarks
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="descendant::supequi">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="closereqs">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<xsl:if test="not(descendant::noconds)">
		<xsl:call-template name="create_marker"/>
		<xsl:apply-templates>
			<xsl:with-param name="volCount" select="$volCount"/>
			<xsl:with-param name="chapCount" select="$chapCount"/>
			<xsl:with-param name="dmCount" select="$dmCount"/>
		</xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="create_marker">
		<fo:block>
			<xsl:variable name="dmCount2">
				<xsl:for-each select="ancestor::dmodule">
					<xsl:variable name="count">
						<xsl:number count="dmodule" from="pmentry[parent::pmentry]" level="any"/>
					</xsl:variable>
					<xsl:value-of select="$count"/>								
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="chapCount">
				<xsl:for-each select="ancestor::pmentry[parent::pmentry]">
					<xsl:variable name="count">
						<xsl:number count="pmentry[parent::pmentry]" from="pmentry" level="single"/>
					</xsl:variable>
					<xsl:value-of select="$count"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="volume">
				<xsl:for-each select="ancestor::pmentry[parent::content]">
					<xsl:variable name="count">
						<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
					</xsl:variable>
					<xsl:value-of select="$count"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="dmCount">
				<xsl:choose>
				<xsl:when test="ancestor::pmentry/refdm">
					<xsl:call-template name="find_landscape_refdm">
						<xsl:with-param name="position" select="1"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:number count="dmodule" from="pmentry"/>
				</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>						
			<xsl:variable name="refTitle">
				<xsl:call-template name="count_landscape_refdm">
					<xsl:with-param name="position" select="1"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="refdmCount">
				<xsl:if test="ancestor::pmentry/refdm">
					<xsl:for-each select="ancestor::pmentry/refdm[descendant::techname/text() = $refTitle]">
						<xsl:variable name="count">
							<xsl:number count="refdm" from="pmentry[parent::pmentry]" level="single"/>
						</xsl:variable>
						<xsl:value-of select="$count"/>
					</xsl:for-each>
				</xsl:if>
			</xsl:variable>
			<fo:marker marker-class-name="volChap">
				<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ',$chapCount,'.',$refdmCount - 1,'.',$dmCount)"/>
			</fo:marker>	
		</fo:block>
	</xsl:template>

	<xsl:template match="reqconds">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<xsl:if test="not(child::noconds)">
			<fo:block padding-after=".15in">
				<xsl:choose>
					<xsl:when test="parent::prelreqs">
						<xsl:attribute name="id">
							<xsl:value-of select="concat('reqconds',$volCount,$chapCount,$dmCount)"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::closereqs">
						<xsl:attribute name="id">
							<xsl:value-of select="concat('closreqs',$volCount,$chapCount,$dmCount)"/>
						</xsl:attribute>
					</xsl:when>
				</xsl:choose>				
				<fo:table>
					<fo:table-column>
						<xsl:attribute name="column-number">1</xsl:attribute>
						<xsl:attribute name="column-width">3.98in</xsl:attribute>
					</fo:table-column>
					<fo:table-column>
						<xsl:attribute name="column-number">2</xsl:attribute>
						<xsl:attribute name="column-width">2.98in</xsl:attribute>
					</fo:table-column>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell padding-after=".15in" number-columns-spanned="2">
								<fo:block xsl:use-attribute-sets="bold-titles" text-align="left">
									<xsl:choose>
										<xsl:when test="parent::prelreqs">
											Required Conditions
										</xsl:when>
										<xsl:otherwise>
											Closing Requirements
										</xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">
								<fo:block xsl:use-attribute-sets="normal-text" text-align="center" font-style="italic">
									<xsl:variable name="count">
										<xsl:number count="reqconds|supeqli|reqpers|spares[not(child::nospares)]|supplyli|table" level="any" format="1" from="dmodule"/>
									</xsl:variable>
									Table <xsl:value-of select="$count+1"/> Required Conditions
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row padding-after="3pt">
							<fo:table-cell padding-after="3pt" padding-left="3pt" padding-before="3pt">
								<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
								<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								<xsl:attribute name="border-top-style">solid</xsl:attribute>
								<xsl:attribute name="border-top-width">1pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="bold-normal-text">
									Condition
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="3pt">
								<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
								<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								<xsl:attribute name="border-top-style">solid</xsl:attribute>
								<xsl:attribute name="border-top-width">1pt</xsl:attribute>
								<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
									Data Module/Technical Publication
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:for-each select="descendant::reqcond">
							<fo:table-row>
								<fo:table-cell xsl:use-attribute-sets="normal-text" padding-left="3pt" padding-after="3pt">
									<xsl:if test="ancestor::reqcondm[position()=1]">
										<xsl:attribute name="padding-before">3pt</xsl:attribute>
									</xsl:if>
									<xsl:if test="not(ancestor::reqcondm/following-sibling::reqcondm)">
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									</xsl:if>
									<fo:block>
										<xsl:apply-templates/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
									<xsl:if test="ancestor::reqcondm[position()=1]">
										<xsl:attribute name="padding-before">3pt</xsl:attribute>
									</xsl:if>
									<xsl:if test="not(ancestor::reqcondm/following-sibling::reqcondm)">
										<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
										<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
									</xsl:if>
									<fo:block>
										<xsl:choose>
											<xsl:when test="following-sibling::*[1][self::refdm]">
												<xsl:apply-templates select="following-sibling::*[1]"/>
											</xsl:when>
											<xsl:otherwise>
												Not Applicable
											</xsl:otherwise>
										</xsl:choose>									
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="refdm">
		<xsl:apply-templates select="avee"/>
	</xsl:template>
	
	<xsl:template match="avee">		
		<xsl:choose>
			<xsl:when test="../following-sibling::text() or ../preceding-sibling::text()">
				<fo:inline xsl:use-attribute-sets="normal-text">
					<xsl:call-template name="get_avee_title">
						<xsl:with-param name="type" select="'title2'"/>
					</xsl:call-template>
				</fo:inline>
			</xsl:when>
			<xsl:otherwise>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:call-template name="get_avee_title">
						<xsl:with-param name="type" select="'title2'"/>
					</xsl:call-template>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:template>
	
	<xsl:template match="avee[ancestor::refs]">
		<fo:table-row>
			<fo:table-cell>
				<xsl:if test="not(parent::refdm/preceding-sibling::refdm)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="padding-after">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:call-template name="get_avee_title">
						<xsl:with-param name="type" select="'title'"/>
					</xsl:call-template>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:if test="not(parent::refdm/preceding-sibling::refdm)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="padding-after">3pt</xsl:attribute>
				<fo:block xsl:use-attribute-sets="normal-text">
					<xsl:call-template name="get_avee_title">
						<xsl:with-param name="type" select="'names'"/>
					</xsl:call-template>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template name="checkForReferenceInVolume">
		<xsl:param name="dmCount"/>		
		<xsl:param name="dmoduleTotal"/>
		<xsl:param name="position"/>
		<xsl:param name="title"/>
		
		<xsl:variable name="modelic1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::modelic[1]/text()"/>
		<xsl:variable name="sdc1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::sdc[1]/text()"/>
		<xsl:variable name="chapnum1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::chapnum[1]/text()"/>
		<xsl:variable name="section1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::section[1]/text()"/>
		<xsl:variable name="subsect1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::subsect[1]/text()"/>
		<xsl:variable name="subject1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::subject[1]/text()"/>
		<xsl:variable name="discode1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::discode[1]/text()"/>
		<xsl:variable name="discodev1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::discodev[1]/text()"/>
		<xsl:variable name="incode1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::incode[1]/text()"/>
		<xsl:variable name="incodev1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::incodev[1]/text()"/>
		<xsl:variable name="itemloc1" select="ancestor::pmentry[parent::content]/descendant::dmodule[$position]/descendant::itemloc[1]/text()"/>
		<xsl:variable name="dmodule2" select="concat($modelic1,$sdc1,$chapnum1,$section1,$subsect1,$subject1,$discode1,$discodev1,$incode1,$incodev1,$itemloc1)"/>		
		<xsl:choose>
			<xsl:when test="$position &gt; $dmCount">
				<xsl:value-of select="'false'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$dmodule2=$dmoduleTotal">
						<xsl:value-of select="'true'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="checkForReferenceInVolume">
							<xsl:with-param name="dmCount" select="$dmCount"/>
							<xsl:with-param name="dmoduleTotal" select="$dmoduleTotal"/>
							<xsl:with-param name="position" select="$position + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="getOutsideReference">
		<xsl:param name="dmCount"/>		
		<xsl:param name="dmoduleTotal"/>
		<xsl:param name="position"/>
		<xsl:param name="title"/>
		
		<xsl:variable name="modelic1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::modelic[1]/text()"/>
		<xsl:variable name="sdc1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::sdc[1]/text()"/>
		<xsl:variable name="chapnum1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::chapnum[1]/text()"/>
		<xsl:variable name="section1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::section[1]/text()"/>
		<xsl:variable name="subsect1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::subsect[1]/text()"/>
		<xsl:variable name="subject1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::subject[1]/text()"/>
		<xsl:variable name="discode1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::discode[1]/text()"/>
		<xsl:variable name="discodev1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::discodev[1]/text()"/>
		<xsl:variable name="incode1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::incode[1]/text()"/>
		<xsl:variable name="incodev1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::incodev[1]/text()"/>
		<xsl:variable name="itemloc1" select="ancestor::content/pmentry[not(./title/text()=$title)]/descendant::dmodule[$position]/descendant::itemloc[1]/text()"/>
		<xsl:variable name="dmodule2" select="concat($modelic1,$sdc1,$chapnum1,$section1,$subsect1,$subject1,$discode1,$discodev1,$incode1,$incodev1,$itemloc1)"/>		
		<xsl:choose>
			<xsl:when test="$position &gt; $dmCount">
				<xsl:value-of select="'false'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$dmodule2=$dmoduleTotal">
						<xsl:value-of select="'true'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="checkForReferenceInVolume">
							<xsl:with-param name="dmCount" select="$dmCount"/>
							<xsl:with-param name="dmoduleTotal" select="$dmoduleTotal"/>
							<xsl:with-param name="position" select="$position + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="get_avee_title">
		<xsl:param name="type"/>
		<xsl:variable name="modelic" select="modelic/text()"/>
		<xsl:variable name="sdc" select="sdc/text()"/>
		<xsl:variable name="chapnum" select="chapnum/text()"/>
		<xsl:variable name="section" select="section/text()"/>
		<xsl:variable name="subsect" select="subsect/text()"/>
		<xsl:variable name="subject" select="subject/text()"/>
		<xsl:variable name="discode" select="discode/text()"/>
		<xsl:variable name="discodev" select="discodev/text()"/>
		<xsl:variable name="incode" select="incode/text()"/>
		<xsl:variable name="incodev" select="incodev/text()"/>
		<xsl:variable name="itemloc" select="itemloc/text()"/>
		<xsl:variable name="dmodule" select="concat($modelic,$sdc,$chapnum,$section,$subsect,$subject,$discode,$discodev,$incode,$incodev,$itemloc)"/>
		<xsl:variable name="dmoduleCount" select="count(ancestor::pmentry[parent::content]/descendant::dmodule)"/>
		<xsl:choose>
			<xsl:when test="$incode = '044' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Operation and  Maintenance - Description (Volume 1 of 6)'">
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 1 - Manual deficiency report'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Manual deficiency report'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '044' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Operation (Volume 2 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 2 - Manual deficiency report'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Manual deficiency report'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '044' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Maintenance (Volume 3 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 3 - Manual deficiency report'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Manual deficiency report'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '044' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance - Troubleshooting (Volume 4 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 4 - Manual deficiency report'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Manual deficiency report'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '044' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance -  IPD (Volume 5 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 5 - Manual deficiency report'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Manual deficiency report'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '044' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance - VENDOR MANUALS (Volume 6 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='044']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 6 - Manual deficiency report'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Manual deficiency report'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '012' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Operation and  Maintenance - Description (Volume 1 of 6)'">
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 1 - General warnings and cautions and related safety data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General warnings and cautions and related safety data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '012' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Operation (Volume 2 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 2 - General warnings and cautions and related safety data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General warnings and cautions and related safety data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '012' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Maintenance (Volume 3 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 3 - General warnings and cautions and related safety data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General warnings and cautions and related safety data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '012' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance - Troubleshooting (Volume 4 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 4 - General warnings and cautions and related safety data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General warnings and cautions and related safety data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '012' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance -  IPD (Volume 5 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 5 - General warnings and cautions and related safety data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General warnings and cautions and related safety data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '012' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance - VENDOR MANUALS (Volume 6 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='012']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 6 - General warnings and cautions and related safety data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General warnings and cautions and related safety data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			
			<xsl:when test="$incode = '010' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Operation and  Maintenance - Description (Volume 1 of 6)'">
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 1 - General data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'Volume 1 - General data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '010' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Operation (Volume 2 of 6)'">
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 2 - General data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '010' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) -  Operation and  Maintenance - Maintenance (Volume 3 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 3 - General data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '010' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance - Troubleshooting (Volume 4 of 6)'">
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 4 - General data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '010' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance -  IPD (Volume 5 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 5 - General data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$incode = '010' and ancestor::pmentry/title/text()='Main Propulsion Gas Turbine Module (MPGTM) - Organizational and Intermediate Maintenance - VENDOR MANUALS (Volume 6 of 6)'">				
				<xsl:choose>
					<xsl:when test="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
						<xsl:for-each select="ancestor::pmentry[parent::content]/dmodule[descendant::incode[1]='010']">
							<xsl:choose>
								<xsl:when test="$type='title' or $type='title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue"> 
									<xsl:value-of select="'Volume 6 - General data'"/>
								</fo:basic-link>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
								</xsl:otherwise>
							</xsl:choose>	
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'General data'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="ancestor::content/descendant::dmodule">
					<xsl:variable name="modelic1" select="descendant::dmc/avee/modelic/text()"/>
					<xsl:variable name="sdc1" select="descendant::dmc/avee/sdc/text()"/>
					<xsl:variable name="chapnum1" select="descendant::dmc/avee/chapnum/text()"/>
					<xsl:variable name="section1" select="descendant::dmc/avee/section/text()"/>
					<xsl:variable name="subsect1" select="descendant::dmc/avee/subsect/text()"/>
					<xsl:variable name="subject1" select="descendant::dmc/avee/subject/text()"/>
					<xsl:variable name="discode1" select="descendant::dmc/avee/discode/text()"/>
					<xsl:variable name="discodev1" select="descendant::dmc/avee/discodev/text()"/>
					<xsl:variable name="incode1" select="descendant::dmc/avee/incode/text()"/>
					<xsl:variable name="incodev1" select="descendant::dmc/avee/incodev/text()"/>
					<xsl:variable name="itemloc1" select="descendant::dmc/avee/itemloc/text()"/>
					<xsl:variable name="dmodule2" select="concat($modelic1,$sdc1,$chapnum1,$section1,$subsect1,$subject1,$discode1,$discodev1,$incode1,$incodev1,$itemloc1)"/>
					<xsl:if test="$dmodule2 = $dmodule">
						<xsl:variable name="dmCount">
						<xsl:choose>
							<xsl:when test="../refdm">
								<xsl:call-template name="find_refdm">
									<xsl:with-param name="position" select="1"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="dmodule" from="pmentry"/>
							</xsl:otherwise>
						</xsl:choose>
						</xsl:variable>						
						<xsl:variable name="refTitle">
							<xsl:call-template name="count_refdm">
								<xsl:with-param name="position" select="1"/>
							</xsl:call-template> 
						</xsl:variable>
						<xsl:variable name="refdmCount">
							<xsl:if test="../refdm">
								<xsl:for-each select="../refdm[descendant::techname/text() = $refTitle]">
									<xsl:variable name="count">
										<xsl:number count="refdm" from="pmentry[parent::pmentry]" level="single"/>
									</xsl:variable>
									<xsl:value-of select="$count"/>
								</xsl:for-each>
							</xsl:if>
						</xsl:variable>
						<xsl:variable name="chapCount">
							<xsl:for-each select="ancestor::pmentry[parent::pmentry]">
								<xsl:variable name="count">
									<xsl:number count="pmentry[parent::pmentry]" from="pmentry[parent::content]" level="single"/>
								</xsl:variable>
								<xsl:value-of select="$count"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="volume">
							<xsl:for-each select="ancestor::pmentry[parent::content]">
								<xsl:variable name="count">
									<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
								</xsl:variable>
								<xsl:value-of select="$count"/>
							</xsl:for-each>
						</xsl:variable>				
						<xsl:choose>
							<xsl:when test="$type = 'title' or $type = 'title2'">
								<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
									<xsl:choose>
										<xsl:when test="ancestor::pmentry[parent::pmentry]">
											<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ',$chapCount,'.',$refdmCount - 1,'.',$dmCount,' - ',descendant::techname,' - ',descendant::infoname)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat('Volume ',$volume,' - ')"/>
											<xsl:value-of select="descendant::infoname"/>									
										</xsl:otherwise>
									</xsl:choose>							
								</fo:basic-link>
								<xsl:if test="$type = 'title'">
									<fo:block padding-after="3pt"/>
								</xsl:if>						
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(descendant::techname,' - ',descendant::infoname)"/>
							</xsl:otherwise>
						</xsl:choose>		
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:template>

	<xsl:template match="supplyli">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block padding-after=".15in">
			<fo:table>
				<fo:table-column>
					<xsl:attribute name="column-number">1</xsl:attribute>
					<xsl:attribute name="column-width">2.3in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">2</xsl:attribute>
					<xsl:attribute name="column-width">2.38in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">3</xsl:attribute>
					<xsl:attribute name="column-width">.75in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">4</xsl:attribute>
					<xsl:attribute name="column-width">1.53in</xsl:attribute>
				</fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell padding-after=".15in" number-columns-spanned="4">
							<fo:block xsl:use-attribute-sets="bold-titles" text-align="left">
								Consumables, materials and expendables
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="4">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center" font-style="italic">
								<xsl:variable name="count">
									<xsl:number count="reqconds|supeqli|reqpers|spares|supplyli" level="any" format="1" from="dmodule"/>
								</xsl:variable>
								Table <xsl:value-of select="$count+1"/> Consumables, materials and expendables
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row padding-after="3pt">
						<fo:table-cell padding-after="3pt" padding-left="3pt" padding-before="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								Nomenclature
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Identification No.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Qty
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Remarks
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="descendant::supply">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>	

	<xsl:template match="warning">
		
		<fo:block padding-after=".1in">
			<xsl:if test="not(ancestor::safety)">
				<xsl:attribute name="start-indent">.7in</xsl:attribute>
			</xsl:if>
			<xsl:if test="not(preceding-sibling::warning)">
				<fo:block xsl:use-attribute-sets="bold-normal-text" keep-with-next.within-page="always" font-size="14pt" text-decoration="underline" padding-after=".1in" text-align="center">
					<xsl:choose>
						<xsl:when test="count(../warning) &gt; 1">
							WARNINGS
						</xsl:when>
						<xsl:otherwise>
							WARNING
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="preceding-sibling::warning or following-sibling::warning">
					<fo:list-block provisional-distance-between-starts=".25in"> 							
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()"> 									
								<fo:block xsl:use-attribute-sets="normal-text">•</fo:block> 								
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()"> 									
								<fo:block xsl:use-attribute-sets="bold-normal-text"> 										
									<xsl:apply-templates/> 									
								</fo:block> 								
							</fo:list-item-body> 							
						</fo:list-item> 						
					</fo:list-block>
				</xsl:when>
				<xsl:otherwise>
					<fo:block xsl:use-attribute-sets="bold-normal-text"> 										
						<xsl:apply-templates/> 									
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>		
		</fo:block>
	</xsl:template>

	<xsl:template match="note">
		<fo:block padding-after="5pt">
			<fo:block xsl:use-attribute-sets="bold-normal-text" font-size="10pt" text-align="center" keep-with-next.within-page="always">
				<xsl:if test="parent::entry">
					<xsl:attribute name="start-indent">0</xsl:attribute>
				</xsl:if>
				Note
				<xsl:if test="following-sibling::*[1][self::note] or preceding-sibling::*[1][self::note]">
					<xsl:variable name="count">
						<xsl:number count="note[following-sibling::*[1][self::note] or preceding-sibling::*[1][self::note]]" level="single" format="1"/>
					</xsl:variable>
					<xsl:value-of select="concat(' ',$count)"/>
				</xsl:if>
			</fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="caution">
		<xsl:if test="not(preceding-sibling::caution)">
			<fo:block xsl:use-attribute-sets="bold-normal-text" keep-with-next.within-page="always" font-size="14pt" text-align="center">
				<xsl:choose>
					<xsl:when test="count(../caution) &gt; 1">
						CAUTIONS
					</xsl:when>
					<xsl:otherwise>
						CAUTION
					</xsl:otherwise>
				</xsl:choose>					
			</fo:block>
		</xsl:if>
		<fo:block>
			<xsl:if test="not(ancestor::safety)">
				<xsl:attribute name="start-indent">.7in</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="preceding-sibling::caution or following-sibling::caution">
					<fo:list-block provisional-distance-between-starts=".25in" padding-after=".15in"> 							
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()"> 									
								<fo:block xsl:use-attribute-sets="normal-text">•</fo:block> 								
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()"> 									
								<fo:block xsl:use-attribute-sets="bold-normal-text"> 										
									<xsl:apply-templates/> 									
								</fo:block> 								
							</fo:list-item-body> 							
						</fo:list-item> 						
					</fo:list-block>
				</xsl:when>
				<xsl:otherwise>
					<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after=".15in"> 										
						<xsl:apply-templates/> 									
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>

	<xsl:template match="spare">
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-left="3pt" padding-after="3pt">
				<xsl:if test="not(preceding-sibling::spare)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::spare)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block id="{generate-id(.)}">
					<xsl:apply-templates select="nomen"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::spare)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::spare)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>
					<xsl:apply-templates select="identno"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::spare)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::spare)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>
					<xsl:apply-templates select="qty"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::spare)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::spare)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>

				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="identno">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="pnr">
		<fo:block padding-before="3pt">
		<xsl:value-of select="concat('Pt. No.: ',./text())"/></fo:block>
	</xsl:template>

	<xsl:template match="mfc">
		<fo:block padding-before="3pt">
		<xsl:value-of select="concat('NSCM: ',./text())"/></fo:block>
	</xsl:template>

	<xsl:template match="supply">
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-left="3pt" padding-after="3pt">
				<xsl:if test="not(preceding-sibling::supply)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supply)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block id="{generate-id(.)}">
					<xsl:apply-templates select="nomen"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::supply)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supply)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>
					<xsl:value-of select="concat('NSN: ',./nsn/@nsn)"/>
					<xsl:apply-templates select="identno"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::supply)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supply)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>
					<xsl:apply-templates select="qty"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
				<xsl:if test="not(preceding-sibling::supply)">
					<xsl:attribute name="padding-before">3pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="not(following-sibling::supply)">
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
				</xsl:if>
				<fo:block>

				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

	<xsl:template match="reqcond">
		<xsl:if test="not(noconds)">
			<fo:block id="{generate-id(.)}">
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="reqpers">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block padding-after=".15in">
			<xsl:attribute name="id">
				<xsl:value-of select="concat('reqpers',$volCount,$chapCount,$dmCount)"/>
			</xsl:attribute>
			<fo:table>
				<fo:table-column>
					<xsl:attribute name="column-number">1</xsl:attribute>
					<xsl:attribute name="column-width">1.34in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">2</xsl:attribute>
					<xsl:attribute name="column-width">1.2in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">3</xsl:attribute>
					<xsl:attribute name="column-width">1.2in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">4</xsl:attribute>
					<xsl:attribute name="column-width">1.7in</xsl:attribute>
				</fo:table-column>
				<fo:table-column>
					<xsl:attribute name="column-number">5</xsl:attribute>
					<xsl:attribute name="column-width">1.55in</xsl:attribute>
				</fo:table-column>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell padding-after=".15in" number-columns-spanned="5">
							<fo:block xsl:use-attribute-sets="bold-titles" text-align="left">
								Required Personel
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="5">
							<fo:block xsl:use-attribute-sets="normal-text" text-align="center" font-style="italic">
								<xsl:variable name="count">
									<xsl:number
			count="table|reqconds[not(child::noconds)]|supequip[not(child::nosupeq)]|supplies[not(child::nosupply)]|spares[not(child::nospares)]|reqpers[child::person]" format="1" from="dmodule" level="any"/>
								</xsl:variable>
								Table <xsl:value-of select="$count+1"/> Required Personnel
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row padding-after="3pt">
						<fo:table-cell padding-after="3pt" padding-left="3pt" padding-before="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text">
								Person
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Category/Trade
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Skill Level
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Trade Code
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-left="3pt">
							<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
							<xsl:attribute name="border-top-style">solid</xsl:attribute>
							<xsl:attribute name="border-top-width">1pt</xsl:attribute>
							<fo:block xsl:use-attribute-sets="bold-normal-text" padding-after="3pt" padding-before="3pt">
								Estimated Time
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="descendant::person">
						<fo:table-row>
							<fo:table-cell xsl:use-attribute-sets="normal-text" padding-left="3pt" padding-after="3pt">
								<xsl:if test="not(preceding-sibling::person)">
									<xsl:attribute name="padding-before">3pt</xsl:attribute>
								</xsl:if>
								<xsl:if test="not(following-sibling::person)">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								</xsl:if>
								<fo:block>
									<xsl:value-of select="concat('Man ',@man)"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
								<xsl:if test="not(preceding-sibling::person)">
									<xsl:attribute name="padding-before">3pt</xsl:attribute>
								</xsl:if>
								<xsl:if test="not(following-sibling::person)">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								</xsl:if>
								<fo:block>
									<xsl:value-of select="following-sibling::*[1][self::perscat]/@category"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
								<xsl:if test="not(preceding-sibling::person)">
									<xsl:attribute name="padding-before">3pt</xsl:attribute>
								</xsl:if>
								<xsl:if test="not(following-sibling::person)">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								</xsl:if>
								<fo:block>
									<xsl:variable name="skill"><xsl:value-of select="following-sibling::*[2][self::perskill]/@skill"/></xsl:variable>
									<xsl:choose>
										<xsl:when test="$skill = 'SK01'">
											<xsl:value-of select="'Basic'"/>
										</xsl:when>
										<xsl:when test="$skill = 'SK02'">
											<xsl:value-of select="'Intermediate'"/>
										</xsl:when>
										<xsl:when test="$skill = 'SK03'">
											<xsl:value-of select="'Advanced'"/>
										</xsl:when>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
								<xsl:if test="not(preceding-sibling::person)">
									<xsl:attribute name="padding-before">3pt</xsl:attribute>
								</xsl:if>
								<xsl:if test="not(following-sibling::person)">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								</xsl:if>
								<fo:block>
									<xsl:apply-templates select="following-sibling::*[3][self::trade]"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt" padding-left="3pt">
								<xsl:if test="not(preceding-sibling::person)">
									<xsl:attribute name="padding-before">3pt</xsl:attribute>
								</xsl:if>
								<xsl:if test="not(following-sibling::person)">
									<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
									<xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
								</xsl:if>
								<fo:block>
									<xsl:apply-templates select="following-sibling::*[4][self::esttime]"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

	<xsl:template match="person|perscat|perskill|trade|esttime">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="prelreqs">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('prelreqs',$volCount,$chapCount,$dmCount)"/>
			</xsl:attribute>
			<fo:block padding-after=".15in" xsl:use-attribute-sets="normal-text" font-style="italic" font-weight="bold" font-size="14pt" text-align="center">
				Preliminary Requirements
			</fo:block>
			<xsl:apply-templates>
				<xsl:with-param name="volCount" select="$volCount"/>
				<xsl:with-param name="chapCount" select="$chapCount"/>
				<xsl:with-param name="dmCount" select="$dmCount"/>
			</xsl:apply-templates>
		</fo:block>
	</xsl:template>

	<xsl:template match="proced">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block keep-with-next.within-page="always">
			<xsl:attribute name="id">
				<xsl:value-of select="concat('proced',$volCount,$chapCount,$dmCount)"/>
			</xsl:attribute>
			<fo:block keep-with-next.within-page="always" xsl:use-attribute-sets="normal-text" font-size="14pt" font-weight="bold" padding-after=".15in" text-align="center">Procedure</fo:block>
		</fo:block>
		<xsl:apply-templates>
			<xsl:with-param name="volCount" select="$volCount"/>
			<xsl:with-param name="chapCount" select="$chapCount"/>
			<xsl:with-param name="dmCount" select="$dmCount"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="mainfunc">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="descriptTOC">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="normal-text" start-indent=".78in" padding-after="3pt" >
				<fo:block text-align-last="justify" color="blue">
					<fo:basic-link>
						<xsl:attribute name="internal-destination">
							<xsl:value-of select="concat('descript',$volCount,$chapCount,$dmCount)"/>
						</xsl:attribute>
						<xsl:value-of select="'Description'"/>
					</fo:basic-link>
					<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt">
				<fo:block color="blue">
					<fo:basic-link>
						<xsl:attribute name="internal-destination">
							<xsl:value-of select="concat('descript',$volCount,$chapCount,$dmCount)"/>
						</xsl:attribute>
						<fo:page-number-citation>
							<xsl:attribute name="ref-id">
								<xsl:value-of select="concat('descript',$volCount,$chapCount,$dmCount)"/>
							</xsl:attribute>
						</fo:page-number-citation>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="descendant::para0">
			<fo:table-row> 			
				<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" start-indent=".78in"> 				
					<fo:block text-align-last="justify" color="blue"> 					
						<fo:basic-link internal-destination="{generate-id(.)}"> 						
							<fo:list-block provisional-distance-between-starts=".4in" start-indent="0" text-indent="0">		
								<fo:list-item>
									<fo:list-item-label end-indent="label-end()"> 									
										<fo:block text-align="right" color="blue"> 
											<fo:basic-link internal-destination="{generate-id(.)}">
												<xsl:number count="para0" level="any" format="1" from="dmodule"/>
											</fo:basic-link> 									
										</fo:block> 								
									</fo:list-item-label>						
									<fo:list-item-body start-indent="body-start()"> 	
										<fo:block color="blue"> 										
											<fo:basic-link internal-destination="{generate-id(.)}"> 	
												<xsl:choose>
													<xsl:when test="child::title">
														<xsl:value-of select="./title/text()"/> 
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="'No title'"/> 
													</xsl:otherwise>
												</xsl:choose>

												<fo:leader leader-alignment="reference-area" leader-pattern="dots"/> 								
											</fo:basic-link> 									
										</fo:block> 								
									</fo:list-item-body> 						
								</fo:list-item> 						
							</fo:list-block> 					
						</fo:basic-link> 				
					</fo:block> 			
				</fo:table-cell> 			
				<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" display-align="after"> 				
					<fo:block color="blue"> 				
						<fo:basic-link internal-destination="{generate-id(.)}"> 						
							<fo:page-number-citation ref-id="{generate-id(.)}"/> 					
						</fo:basic-link> 				
					</fo:block> 			
				</fo:table-cell> 		
			</fo:table-row>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="procedTOC">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<xsl:for-each select="ancestor::dmodule/descendant::techname[1]">
			<fo:table-row>
				<fo:table-cell xsl:use-attribute-sets="normal-text" start-indent=".78in" padding-after="3pt" >
					<fo:block text-align-last="justify" color="blue">
						<fo:basic-link internal-destination="{generate-id(.)}">
							<xsl:value-of select="./text()"/>
						</fo:basic-link>
						<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt">
					<fo:block color="blue">
						<fo:basic-link internal-destination="{generate-id(.)}">
							<fo:page-number-citation ref-id="{generate-id(.)}"/> 
						</fo:basic-link>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="normal-text" start-indent=".78in" padding-after="3pt" >
				<fo:block text-align-last="justify" color="blue">
					<xsl:variable name="id" select="concat('ref',$volCount,$chapCount,$dmCount)"/>
					<fo:basic-link>
						<xsl:attribute name="internal-destination">
							<xsl:value-of select="$id"/>
						</xsl:attribute>
						<xsl:value-of select="'References'"/>
						<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt">
				<fo:block color="blue">
					<xsl:variable name="id" select="concat('ref',$volCount,$chapCount,$dmCount)"/>
					<fo:basic-link internal-destination="{$id}">
						<fo:page-number-citation ref-id="{$id}"/> 
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="normal-text" start-indent=".78in" padding-after="3pt" >
				<fo:block text-align-last="justify" color="blue">
					<xsl:variable name="id" select="concat('prelreqs',$volCount,$chapCount,$dmCount)"/>
					<fo:basic-link internal-destination="{$id}">
						<xsl:value-of select="'Preliminary requirements'"/>
						<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt">
				<fo:block color="blue">
					<xsl:variable name="id" select="concat('prelreqs',$volCount,$chapCount,$dmCount)"/>
					<fo:basic-link internal-destination="{$id}">
						<fo:page-number-citation ref-id="{$id}"/> 
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="normal-text" start-indent=".78in" padding-after="3pt" >
				<fo:block text-align-last="justify" color="blue">
					<xsl:variable name="id2" select="concat('proced',$volCount,$chapCount,$dmCount)"/>
					<fo:basic-link>
						<xsl:attribute name="internal-destination">
							<xsl:value-of select="$id2"/>
						</xsl:attribute>
						<xsl:value-of select="'Procedure'"/>
						<fo:leader leader-alignment="reference-area" leader-pattern="dots"/>
					</fo:basic-link>

				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="normal-text" padding-after="3pt">
				<fo:block color="blue">
					<xsl:variable name="id2" select="concat('proced',$volCount,$chapCount,$dmCount)"/>
					<fo:basic-link internal-destination="{$id2}">
						<fo:page-number-citation ref-id="{$id2}"/> 
					</fo:basic-link>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

	<xsl:template match="descript">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block>
			<xsl:attribute name="id">
				<xsl:value-of select="concat('descript',$volCount,$chapCount,$dmCount)"/>
			</xsl:attribute>
			<fo:block font-size="14pt" font-family="sans-serif" font-style="italic" font-weight="bold" padding-after=".15in" text-align="center"
					keep-with-next.within-page="always">
				Description
					</fo:block>  
		</fo:block>    
		<xsl:apply-templates/>  
	</xsl:template>

	<xsl:template match="para">       
		<fo:block role="para" space-before="5pt" start-indent=".7in" text-align="justify" xsl:use-attribute-sets="normal-text">
			<xsl:if test="not(following-sibling::*[1][self::para])">
				<xsl:attribute name="padding-after">5pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>     
		</fo:block>    
	</xsl:template>
	
	<xsl:template match="para[ancestor::entry]">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="item/para">
		<fo:block xsl:use-attribute-sets="normal-text">
			<xsl:apply-templates/>     
		</fo:block>   
	</xsl:template>

	<xsl:template match="warning/para|caution/para" priority="0">       
		<fo:block role="para" space-before="5pt" text-align="justify">     
			<xsl:apply-templates/>       
		</fo:block>    
	</xsl:template>
	
	<xsl:template match="placeholder">
				<fo:page-sequence master-reference="Main" >
			<fo:flow flow-name="xsl-region-body">
				<fo:block padding-before="1in" text-align="center" font-size="18pt" xsl:use-attribute-sets="normal-text" font-weight="bold">
					<xsl:apply-templates/>
				</fo:block>
				<fo:block padding-before=".15in" id="{generate-id(.)}" padding-after=".15in" text-align="center" font-size="18pt" xsl:use-attribute-sets="normal-text" font-weight="bold">
					Chapter Reserved for Future Development
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template match="dmodule">
		<fo:page-sequence master-reference="Main">
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<xsl:variable name="dmCount2">
					<xsl:number count="dmodule" from="pmentry[parent::pmentry]" level="any"/>
				</xsl:variable>
				<xsl:variable name="chapCount">
					<xsl:for-each select="ancestor::pmentry[parent::pmentry]">
						<xsl:variable name="count">
							<xsl:number count="pmentry[parent::pmentry]" from="pmentry" level="single"/>
						</xsl:variable>
						<xsl:value-of select="$count"/>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="volume">
					<xsl:for-each select="ancestor::pmentry[parent::content]">
						<xsl:variable name="count">
							<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
						</xsl:variable>
						<xsl:value-of select="$count"/>
					</xsl:for-each>
				</xsl:variable>
				<fo:block padding-before=".1in" id="{generate-id(.)}" padding-after=".15in" text-align="center" font-size="18pt" xsl:use-attribute-sets="normal-text" font-weight="bold">
					<xsl:variable name="dmCount">
						<xsl:choose>
							<xsl:when test="../refdm">
								<xsl:call-template name="find_refdm">
									<xsl:with-param name="position" select="1"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="dmodule" from="pmentry"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>						
					<xsl:variable name="refTitle">
						<xsl:if test="../refdm">
						<xsl:call-template name="count_refdm">
							<xsl:with-param name="position" select="1"/>
						</xsl:call-template> 
						</xsl:if>
					</xsl:variable>
					<xsl:variable name="refdmCount">
						<xsl:if test="../refdm">
							<xsl:for-each select="../refdm[descendant::techname/text() = $refTitle]">
								<xsl:variable name="count">
									<xsl:number count="refdm" from="pmentry[parent::pmentry]" level="single"/>
								</xsl:variable>
								<xsl:value-of select="$count"/>
							</xsl:for-each>
						</xsl:if>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="not(../refdm) and parent::pmentry[parent::pmentry]">
							<fo:marker marker-class-name="volChap">
								<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ',$chapCount,'.',$dmCount)"/>
							</fo:marker>							
						</xsl:when>
						<xsl:when test="parent::pmentry[parent::pmentry]">
							<fo:marker marker-class-name="volChap">
								<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ',$chapCount,'.',$refdmCount - 1,'.',$dmCount)"/>
							</fo:marker>							
						</xsl:when>						
						<xsl:otherwise>
							<fo:marker marker-class-name="volChap">
								<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ','1','.',$dmCount)"/>
							</fo:marker>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:for-each select="ancestor::pmentry[parent::content]">
						<fo:block padding-after=".15in">
							<xsl:value-of select="'Volume '"/><xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
						</fo:block>				
					</xsl:for-each>
					<xsl:choose>
						<xsl:when test="not(../refdm) and parent::pmentry[parent::pmentry]">
							<xsl:for-each select="ancestor::pmentry[parent::pmentry]">
								<fo:block padding-after=".15in">
									<xsl:value-of select="concat('Chapter ',$chapCount,'.',$dmCount)"/>
								</fo:block>				
							</xsl:for-each>						
						</xsl:when>
						<xsl:when test="parent::pmentry[parent::pmentry] and ../refdm">
							<xsl:for-each select="ancestor::pmentry[parent::pmentry]">
								<fo:block padding-after=".15in">
									<xsl:value-of select="concat('Chapter ',$chapCount,'.',$refdmCount - 1,'.',$dmCount)"/>
								</fo:block>				
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('Chapter ','1','.',$dmCount)"/>
						</xsl:otherwise>
				</xsl:choose>
				</fo:block>     
				<xsl:apply-templates select="idstatus"/>
				<xsl:if test="not(descendant::ipc)">
					<xsl:call-template name="toc">
						<xsl:with-param name="volCount" select="$volume"/>
						<xsl:with-param name="chapCount" select="$chapCount"/>
						<xsl:with-param name="dmCount" select="$dmCount2"/>
					</xsl:call-template>
					<xsl:call-template name="lot">
						<xsl:with-param name="volCount" select="$volume"/>
						<xsl:with-param name="chapCount" select="$chapCount"/>
						<xsl:with-param name="dmCount" select="$dmCount2"/>
					</xsl:call-template>
					<xsl:call-template name="lof"/>
				</xsl:if>
				<xsl:call-template name="createReferences">
					<xsl:with-param name="volCount" select="$volume"/>
					<xsl:with-param name="chapCount" select="$chapCount"/>
					<xsl:with-param name="dmCount" select="$dmCount2"/>
				</xsl:call-template>
				<xsl:choose>
					<xsl:when test="descendant::descript">
						<xsl:apply-templates select="descendant::descript">
							<xsl:with-param name="volCount" select="$volume"/>
							<xsl:with-param name="chapCount" select="$chapCount"/>
							<xsl:with-param name="dmCount" select="$dmCount2"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:when test="descendant::ipc">
						<xsl:apply-templates select="descendant::ipc">
							<xsl:with-param name="volCount" select="$volume"/>
							<xsl:with-param name="chapCount" select="$chapCount"/>
							<xsl:with-param name="dmCount" select="$dmCount2"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="descendant::proced">
							<xsl:with-param name="volCount" select="$volume"/>
							<xsl:with-param name="chapCount" select="$chapCount"/>
							<xsl:with-param name="dmCount" select="$dmCount2"/>
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template name="find_refdm">
		<xsl:param name="position"/>
		<xsl:choose>
			<xsl:when test="not(preceding-sibling::*[$position][self::refdm])">
				<xsl:call-template name="find_refdm">
					<xsl:with-param name="position" select="$position + 1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$position"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="count_refdm">
		<xsl:param name="position"/>
		<xsl:choose>
			<xsl:when test="not(preceding-sibling::*[$position][self::refdm])">
				<xsl:call-template name="count_refdm">
					<xsl:with-param name="position" select="$position + 1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>			
				<xsl:value-of select="preceding-sibling::*[$position]/descendant::techname/text()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="foldout">
		<xsl:if test="child::figure|child::table">
			<psmi:page-sequence master-reference="Landscape">
				<xsl:call-template name="front-static-content"/>
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates/>
				</fo:flow>
			</psmi:page-sequence>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="dmodule[parent::pmentry[parent::content]]">
		<fo:page-sequence master-reference="Main" >
			<xsl:call-template name="front-static-content"/>
			<fo:flow flow-name="xsl-region-body">
				<!--count top level data modules-->
				<xsl:variable name="dmCount2">
					<xsl:number count="dmodule" from="pmentry[parent::content]" level="single"/>
				</xsl:variable>
				<!--count second level pmentries-->
				<xsl:variable name="chapCount">
					<xsl:for-each select="ancestor::pmentry[parent::pmentry]">
						<xsl:variable name="count">
							<xsl:number count="pmentry[parent::pmentry]" from="pmentry" level="single"/>
						</xsl:variable>
						<xsl:value-of select="$count"/>
					</xsl:for-each>
				</xsl:variable>
				<!--count first level pmentries-->
				<xsl:variable name="volume">
					<xsl:for-each select="ancestor::pmentry[parent::content]">
						<xsl:variable name="count">
							<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
						</xsl:variable>
						<xsl:value-of select="$count"/>
					</xsl:for-each>
				</xsl:variable>
				<fo:block padding-before=".1in" id="{generate-id(.)}" padding-after=".15in" text-align="center" font-size="18pt" xsl:use-attribute-sets="normal-text" font-weight="bold">
					<!--check for front matter modules-->
					<xsl:if test="descendant::dmc[1]/descendant::incode/text() = '018'">
						<xsl:attribute name="id">introduction</xsl:attribute>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="descendant::dmc[1]/descendant::incode/text()='005'">
							<fo:marker marker-class-name="volChapFm">
								<xsl:value-of select="concat('Volume ',$volume,' List of abbreviations')"/>
							</fo:marker>
						</xsl:when>
						<xsl:when test="descendant::dmc[1]/descendant::incode/text()='007'">
							<fo:marker marker-class-name="volChapFm">
								<xsl:value-of select="concat('Volume ',$volume,' List of symbols')"/>
							</fo:marker>
						</xsl:when>
						<xsl:when test="descendant::dmc[1]/descendant::incode/text()='012'">
							<fo:marker marker-class-name="volChapFm">
								<xsl:value-of select="concat('Volume ',$volume,' General warnings and cautions and related safety data')"/>
							</fo:marker>
						</xsl:when>
						<xsl:when test="descendant::dmc[1]/descendant::incode/text()='010'">
							<fo:marker marker-class-name="volChapFm">
								<xsl:value-of select="concat('Volume ',$volume,' General data')"/>
							</fo:marker>
						</xsl:when>
						<xsl:when test="descendant::dmc[1]/descendant::incode/text()='044'">
							<fo:marker marker-class-name="volChapFm">
								<xsl:value-of select="concat('Volume ',$volume,' Manual deficiency report')"/>
							</fo:marker>
						</xsl:when>
					</xsl:choose>
					<xsl:for-each select="ancestor::pmentry[parent::content]">
						<fo:block padding-after=".15in">
							<xsl:value-of select="'Volume '"/><xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
						</fo:block>				
					</xsl:for-each>				
				</fo:block>
				<fo:block font-family="helvetica" font-size="10pt">            
					<xsl:apply-templates select="idstatus"/>
					<xsl:if test="not(descendant::ipc)">
						<xsl:call-template name="toc">
							<xsl:with-param name="volCount" select="$volume"/>
							<xsl:with-param name="chapCount" select="$chapCount"/>
							<xsl:with-param name="dmCount" select="$dmCount2"/>
						</xsl:call-template>
						<xsl:call-template name="lot">
							<xsl:with-param name="volCount" select="$volume"/>
							<xsl:with-param name="chapCount" select="$chapCount"/>
							<xsl:with-param name="dmCount" select="$dmCount2"/>
						</xsl:call-template>
						<xsl:call-template name="lof"/>
					</xsl:if>
					<xsl:call-template name="createReferences">
						<xsl:with-param name="volCount" select="$volume"/>
						<xsl:with-param name="chapCount" select="$chapCount"/>
						<xsl:with-param name="dmCount" select="$dmCount2"/>
					</xsl:call-template>
					<xsl:choose>
						<xsl:when test="descendant::descript">
							<xsl:apply-templates select="descendant::descript">
								<xsl:with-param name="volCount" select="$volume"/>
								<xsl:with-param name="chapCount" select="$chapCount"/>
								<xsl:with-param name="dmCount" select="$dmCount2"/>
							</xsl:apply-templates>
						</xsl:when>
						<xsl:when test="descendant::ipc">
							<xsl:apply-templates select="descendant::ipc">
								<xsl:with-param name="volCount" select="$volume"/>
								<xsl:with-param name="chapCount" select="$chapCount"/>
								<xsl:with-param name="dmCount" select="$dmCount2"/>
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="descendant::proced">
								<xsl:with-param name="volCount" select="$volume"/>
								<xsl:with-param name="chapCount" select="$chapCount"/>
								<xsl:with-param name="dmCount" select="$dmCount2"/>
							</xsl:apply-templates>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>

	<xsl:template name="front-static-content">
		<fo:static-content flow-name="Main.Odd.Header">
			<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" text-align="center">
				<xsl:choose>
					<xsl:when test="/descendant::security/@class='01'"> 						
						Unclassified
					</xsl:when>
					<xsl:otherwise> 						
						Classified 					
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block>
				<fo:table>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell >
								<fo:block>
									<fo:external-graphic src="C:/inetpub/wwwroot/Projects/Rolls Royce/logo.jpg" content-height=".44in" margin="none"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>	
				<fo:leader leader-length="100%" leader-pattern="rule" padding-top="0" margin-top="0"/>	
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="Main.Odd.Footer">
			<fo:block font-family="sans-serif" font-size="11pt" padding-before=".2in">
				<xsl:variable name="marker">
					<fo:retrieve-marker retrieve-class-name="volChap" retrieve-position="first-starting-within-page"/>
				</xsl:variable>
				<fo:leader leader-length="100%" leader-pattern="rule"/>
				<fo:block space-after=".25in" space-before="5pt" text-align-last="justify">
					Effectivity: All
					<fo:leader leader-alignment="reference-area"/>
					<xsl:choose>
						<xsl:when test="self::pmentry">
						</xsl:when>
						<xsl:when test="descendant::avee/section">
							<fo:inline font-weight="bold">								
								<xsl:value-of select="concat(descendant::modelic/text(),'-',descendant::sdc,'-',descendant::chapnum,'-',descendant::section,descendant::subsect,'-',descendant::subject,'-',descendant::discode,descendant::discodev,'-',descendant::incode,descendant::incodev,'-',descendant::itemloc)"/>
							</fo:inline>
						</xsl:when>
						<xsl:otherwise>
							<fo:inline font-weight="bold">
								<xsl:value-of select="concat(descendant::modelic/text(),'-',descendant::sdc,'-',descendant::chapnum,'-',descendant::subsect,'-',descendant::subject,'-',descendant::discode,descendant::discodev,'-',descendant::incode,descendant::incodev,'-',descendant::itemloc)"/>
							</fo:inline>
						</xsl:otherwise>
					</xsl:choose>					
				</fo:block>
				<fo:block font-weight="bold" text-align="right" padding-after="5pt">
					<xsl:choose>
						<xsl:when test="descendant::dmc[1]/descendant::incode/text()='005' or descendant::dmc[1]/descendant::incode/text()='007' or descendant::dmc[1]/descendant::incode/text()='012' or
						descendant::dmc[1]/descendant::incode/text()='010' or descendant::dmc[1]/descendant::incode/text()='044'">
							<fo:retrieve-marker retrieve-class-name="volChapFm" retrieve-position="first-starting-within-page"/>
						</xsl:when>
						<xsl:otherwise>
							<fo:retrieve-marker retrieve-class-name="volChap" retrieve-position="first-starting-within-page"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
				<fo:block font-weight="bold" text-align-last="justify">
					<fo:leader leader-length="2.75in"/>
					<xsl:choose>
						<xsl:when test="/descendant::security/@class='01'"> 						
							Unclassified
						</xsl:when>
						<xsl:otherwise> 						
							Classified 					
						</xsl:otherwise>
					</xsl:choose>
					<fo:leader leader-alignment="reference-area"/>
					<xsl:value-of select="concat('2017','-','02','-','15')"/>
					<fo:leader leader-length=".48in"/>
					<xsl:text>Page </xsl:text>
					<fo:page-number/>
				</fo:block>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="Main.Even.Header">
			<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" text-align="center">
				<xsl:choose>
					<xsl:when test="/descendant::security/@class='01'"> 						
						Unclassified
					</xsl:when>
					<xsl:otherwise> 						
						Classified 					
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block>
				<fo:table>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell >
								<fo:block text-align="right">
									<fo:external-graphic src="C:/inetpub/wwwroot/Projects/Rolls Royce/logo.jpg" content-height=".44in" margin="none"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>	
<fo:leader leader-length="100%" leader-pattern="rule" padding-top="0" margin-top="0"/>					
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="Main.Even.Footer">
			<fo:block font-family="sans-serif" font-size="11pt" padding-before=".2in">
				<fo:leader leader-length="100%" leader-pattern="rule"/>
				<fo:block space-after=".25in" space-before="5pt" text-align-last="justify">
					<xsl:choose>
						<xsl:when test="self::pmentry">
						</xsl:when>
						<xsl:when test="descendant::avee/section">
							<fo:inline font-weight="bold">								
								<xsl:value-of select="concat(descendant::modelic/text(),'-',descendant::sdc,'-',descendant::chapnum,'-',descendant::section,descendant::subsect,'-',descendant::subject,'-',descendant::discode,descendant::discodev,'-',descendant::incode,descendant::incodev,'-',descendant::itemloc)"/>
							</fo:inline>
						</xsl:when>
						<xsl:otherwise>
							<fo:inline font-weight="bold">
								<xsl:value-of select="concat(descendant::modelic/text(),'-',descendant::sdc,'-',descendant::chapnum,'-',descendant::subsect,'-',descendant::subject,'-',descendant::discode,descendant::discodev,'-',descendant::incode,descendant::incodev,'-',descendant::itemloc)"/>
							</fo:inline>
						</xsl:otherwise>
					</xsl:choose>
					
					<fo:leader leader-alignment="reference-area"/>
					Effectivity: All
				</fo:block>
				<fo:block font-weight="bold" text-align="left" padding-after="5pt">
					<xsl:choose>
						<xsl:when test="descendant::dmc[1]/descendant::incode/text()='005' or descendant::dmc[1]/descendant::incode/text()='007' or descendant::dmc[1]/descendant::incode/text()='012' or
						descendant::dmc[1]/descendant::incode/text()='010' or descendant::dmc[1]/descendant::incode/text()='044'">
							<fo:retrieve-marker retrieve-class-name="volChapFm" retrieve-position="first-starting-within-page"/>
						</xsl:when>
						<xsl:otherwise>
							<fo:retrieve-marker retrieve-class-name="volChap" retrieve-position="first-starting-within-page"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
				<fo:block font-weight="bold" text-align-last="justify">
					<xsl:value-of select="'Page '"/><fo:page-number/>
					<fo:leader leader-length=".48in"/>
					<xsl:value-of select="concat('2017','-','02','-','15')"/>		
					<fo:leader leader-length="1.3in"/>
					<xsl:choose>
						<xsl:when test="/descendant::security/@class='01'"> 						
							Unclassified
						</xsl:when>
						<xsl:otherwise>
							Classified
						</xsl:otherwise>
					</xsl:choose>
					<fo:leader leader-alignment="reference-area"/>
				</fo:block>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="Main.Even.Blank.Header">
			<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" text-align="center">
				<xsl:choose>
					<xsl:when test="/descendant::security/@class='01'"> 						
						Unclassified
					</xsl:when>
					<xsl:otherwise> 						
						Classified 					
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block>
				<fo:table>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell >
								<fo:block border-bottom-style="solid" border-bottom-width="1pt" text-align="right">
									<fo:external-graphic src="C:/inetpub/wwwroot/Projects/Rolls Royce/logo.jpg" content-height=".44in" margin="none"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>	<fo:leader leader-length="100%" leader-pattern="rule" padding-top="0" margin-top="0"/>			
			</fo:block>
			<fo:block padding-before="4.4in" xsl:use-attribute-sets="bold-normal-text" text-align="center" font-weight="bold">
				Intentionally Blank
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-after-landscape">
			<fo:block font-family="sans-serif" font-size="11pt" padding-before=".2in">
				<fo:leader leader-length="100%" leader-pattern="rule"/>
				<fo:block space-after=".25in" space-before="5pt" text-align-last="justify">
					<xsl:choose>
						<xsl:when test="self::pmentry">
						</xsl:when>
						<xsl:when test="descendant::avee/section">
							<fo:inline font-weight="bold">								
								<xsl:value-of select="concat(ancestor::dmodule/descendant::modelic/text(),'-',ancestor::dmodule/descendant::sdc,'-',ancestor::dmodule/descendant::chapnum,'-',ancestor::dmodule/descendant::section,ancestor::dmodule/
								descendant::subsect,'-',ancestor::dmodule/descendant::subject,'-',ancestor::dmodule/descendant::discode,ancestor::dmodule/descendant::discodev,'-',ancestor::dmodule/descendant::incode,
								ancestor::dmodule/descendant::incodev,'-',ancestor::dmodule/descendant::itemloc)"/>
							</fo:inline>
						</xsl:when>
						<xsl:otherwise>
							<fo:inline font-weight="bold">
								<xsl:value-of select="concat(ancestor::dmodule/descendant::modelic/text(),'-',ancestor::dmodule/descendant::sdc,'-',
								ancestor::dmodule/descendant::chapnum,'-',ancestor::dmodule/descendant::section,ancestor::dmodule/descendant::subsect,'-',ancestor::dmodule/descendant::subject,'-',ancestor::dmodule/descendant::discode,ancestor::dmodule/descendant::discodev,
								'-',ancestor::dmodule/descendant::incode,ancestor::dmodule/descendant::incodev,'-',ancestor::dmodule/descendant::itemloc)"/>
							</fo:inline>
						</xsl:otherwise>
					</xsl:choose>
					
					<fo:leader leader-alignment="reference-area"/>
					Effectivity: All
				</fo:block>
				<fo:block font-weight="bold" text-align="left" padding-after="5pt">
					<fo:retrieve-marker retrieve-class-name="volChap" retrieve-position="first-starting-within-page"/>
				</fo:block>
				<fo:block font-weight="bold" text-align-last="justify">
					<xsl:value-of select="'Page '"/><fo:page-number/>
					<fo:leader leader-length=".48in"/>
					<xsl:value-of select="concat('2017','-','02','-','15')"/>			
					<fo:leader leader-length="4in"/>
					<xsl:choose>
						<xsl:when test="/descendant::security/@class='01'"> 						
							Unclassified
						</xsl:when>
						<xsl:otherwise>
							Classified
						</xsl:otherwise>
					</xsl:choose>
					<fo:leader leader-alignment="reference-area"/>
				</fo:block>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-before-landscape">
			<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" text-align="center">
				<xsl:choose>
					<xsl:when test="/descendant::security/@class='01'"> 						
						Unclassified
					</xsl:when>
					<xsl:otherwise> 						
						Classified 					
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block>
				<fo:table>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell >
								<fo:block border-bottom-style="solid" border-bottom-width="1pt" text-align="right">
									<fo:external-graphic src="C:/inetpub/wwwroot/Projects/Rolls Royce/logo.jpg" content-height=".44in" margin="none"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>			
			</fo:block>
		</fo:static-content>
	</xsl:template>

	<xsl:template name="buildTOC">
		<xsl:param name="type"/>
		<xsl:if test="$type='descript'">
			<xsl:for-each
					select="descendant::content/descript">
				<fo:table-row>
					<fo:table-cell
							display-align="after" font-family="arial" font-size="10pt"
							padding-after="3pt" start-indent=".78in">
						<fo:block
								text-align-last="justify" color="blue">
							<fo:basic-link
									internal-destination="{generate-id(.)}">
								<xsl:value-of
										select="'DESCRIPTION'"/>
								<fo:leader
										leader-alignment="reference-area" leader-pattern="dots">
								</fo:leader
									>
							</fo:basic-link>
						</fo:block>
					</fo:table-cell
						>
					<fo:table-cell display-align="after" font-family="helvetica"
							font-size="10pt" padding-after="3pt">
						<fo:block text-align="right" color="blue"
								>
							<fo:basic-link internal-destination="{generate-id(.)}">
								<fo:page-number-citation
										ref-id="{generate-id(.)}">
								</fo:page-number-citation>
							</fo:basic-link
								>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each
				>
		</xsl:if>
		<xsl:if test="$type='proced'">
			<xsl:for-each
					select="descendant::content/proced">
				<fo:table-row>
					<fo:table-cell
							display-align="after" font-family="arial" font-size="10pt"
							padding-after="3pt" start-indent=".78in">
						<fo:block
								text-align-last="justify" >
							<fo:basic-link
									internal-destination="{generate-id(.)}" color="blue">
								<xsl:value-of
										select="'PROCEDURE'"/>
								<fo:leader
										leader-alignment="reference-area" leader-pattern="dots">
								</fo:leader
									>
							</fo:basic-link>
						</fo:block>
					</fo:table-cell
						>
					<fo:table-cell display-align="after" font-family="helvetica"
							font-size="10pt" padding-after="3pt">
						<fo:block text-align="right"
								color="blue">
							<fo:basic-link internal-destination="{generate-id(.)}" color="blue">
								<fo:page-number-citation
										ref-id="{generate-id(.)}">
								</fo:page-number-citation>
							</fo:basic-link
								>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each
				>
		</xsl:if>
		<xsl:for-each select="descendant::para0">
			<fo:table-row
					>
				<fo:table-cell display-align="after" font-family="helvetica"
						font-size="10pt" padding-after="3pt" start-indent=".78in">
					<fo:block
							text-align-last="justify">
						<fo:basic-link
								internal-destination="{generate-id(.)}">
							<fo:list-block
									provisional-distance-between-starts=".4in" start-indent="0"
									text-indent="0">
								<!-- list item -->
								<fo:list-item
										>
									<!-- insert a bullet -->
									<fo:list-item-label
											end-indent="label-end()">
										<fo:block>
											<fo:basic-link
													internal-destination="{generate-id(.)}">
												<xsl:number
														count="para0" format="1" from="descript[1]" level="any"/>
											</fo:basic-link
												>
										</fo:block>
									</fo:list-item-label>
									<!-- list text -->
									<fo:list-item-body start-indent="body-start()">
										<fo:block
												>
											<fo:basic-link internal-destination="{generate-id(.)}"
													>
												<xsl:value-of select="./title/text()"/>
												<fo:leader
														leader-alignment="reference-area" leader-pattern="dots">
												</fo:leader
													>
											</fo:basic-link>
										</fo:block>
									</fo:list-item-body
										>
								</fo:list-item>
							</fo:list-block>
						</fo:basic-link
							>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell
						display-align="after" font-family="helvetica" font-size="10pt"
						padding-after="3pt">
					<fo:block text-align="right">
						<fo:basic-link
								internal-destination="{generate-id(.)}">
							<fo:page-number-citation
									ref-id="{generate-id(.)}">
							</fo:page-number-citation>
						</fo:basic-link
							>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<xsl:for-each select="./subpara1">
				<fo:table-row>
					<fo:table-cell
							display-align="after" font-family="helvetica" font-size="10pt"
							padding-after="3pt" start-indent=".78in">
						<fo:block
								text-align-last="justify">
							<fo:basic-link
									internal-destination="{generate-id(.)}">
								<fo:list-block
										provisional-distance-between-starts=".4in" start-indent="0"
										text-indent="0">
									<!-- list item -->
									<fo:list-item
											>
										<!-- insert a bullet -->
										<fo:list-item-label
												end-indent="label-end()">
											<fo:block>
												<fo:basic-link
														internal-destination="{generate-id(.)}">
													<xsl:number
															count="subpara1" format="1.1" from="para0" level="multiple"/>
												</fo:basic-link
													>
											</fo:block>
										</fo:list-item-label>
										<!-- list text -->
										<fo:list-item-body start-indent="body-start()">
											<fo:block
													>
												<fo:basic-link internal-destination="{generate-id(.)}"
														>
													<xsl:value-of select="./title/text()"/>
													<fo:leader
															leader-alignment="reference-area" leader-pattern="dots">
													</fo:leader
														>
												</fo:basic-link>
											</fo:block>
										</fo:list-item-body
											>
									</fo:list-item>
								</fo:list-block>
							</fo:basic-link
								>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell
							display-align="after" font-family="helvetica" font-size="10pt"
							padding-after="3pt">
						<fo:block text-align="right">
							<fo:basic-link
									internal-destination="{generate-id(.)}">
								<fo:page-number-citation
										ref-id="{generate-id(.)}">
								</fo:page-number-citation>
							</fo:basic-link
								>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each
				>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="lot">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<xsl:if test="(count(descendant::table) &gt; 0) or descendant::proced">
			<fo:table xsl:use-attribute-sets="normal-text" font-size="14pt" space-after=".15in">
				<fo:table-column>
					<xsl:attribute name="column-number">1</xsl:attribute>
					<xsl:attribute name="column-width">6.55in</xsl:attribute>
				</fo:table-column>
				<fo:table-column
						>
					<xsl:attribute name="column-number">2</xsl:attribute>
					<xsl:attribute
							name="column-width">.31in</xsl:attribute>
				</fo:table-column>
				<fo:table-header
						>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2"
								padding-after=".1in" xsl:use-attribute-sets="normal-text">
							<fo:block font-size="14pt"
									font-weight="bold" text-align-last="justify">List of tables								<fo:leader
										leader-alignment="reference-area">
								</fo:leader>
								<fo:inline
										font-size="10pt" font-weight="normal">Page</fo:inline>
							</fo:block
								>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header
					>
				<fo:table-body>
					<xsl:call-template name="getTables">
						<xsl:with-param name="volCount" select="$volCount"/>
						<xsl:with-param name="chapCount" select="$chapCount"/>
						<xsl:with-param name="dmCount" select="$dmCount"/>
					</xsl:call-template>
				</fo:table-body>
			</fo:table>
		</xsl:if>
	</xsl:template
		>

	<xsl:template name="createReferences">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
		<fo:block
				font-family="sans-serif" font-size="14pt" font-style="italic"
				font-weight="bold" keep-with-next.within-page="always"
				space-after=".15in" text-align="center"> 			References 		
		</fo:block
			>
		<fo:block space-after=".15in">

			<xsl:variable name="id">
				<xsl:value-of select="concat('ref',$volCount,$chapCount,$dmCount)"/>
			</xsl:variable>
			<xsl:attribute name="id">
				<xsl:value-of select="$id"/>
			</xsl:attribute>
			<fo:table
					border-bottom-style="solid" border-bottom-width="1pt">
				<fo:table-column
						column-number="1" column-width="2.39in">
				</fo:table-column>
				<fo:table-column
						column-number="2" column-width="4.48in">
				</fo:table-column>
				<fo:table-header
						>
					<fo:table-row>
						<fo:table-cell font-family="sans-serif"
								font-size="10pt" font-style="italic" number-columns-spanned="2"
								text-align="center" space-after="2pt">
							<xsl:attribute
									name="padding-top">3pt</xsl:attribute>
							<xsl:attribute
									name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute
									name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute
									name="border-bottom-width">1pt</xsl:attribute>
							<fo:block>	
								Table 1 								<fo:leader leader-length=".06in">
								</fo:leader
									>
								<xsl:value-of select="'References'"/>
							</fo:block
								>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row padding-after="3pt">
						<fo:table-cell font-family="sans-serif">
							<xsl:attribute name="padding-top">3pt</xsl:attribute>
							<xsl:attribute
									name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute
									name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute
									name="border-bottom-width">1pt</xsl:attribute>
							<fo:block
									font-family="sans-serif" font-size="10pt" font-weight="bold"> 									Data
								module/Technical publication 							</fo:block>
						</fo:table-cell
							>
						<fo:table-cell font-family="sans-serif">
							<xsl:attribute name="padding-top">3pt</xsl:attribute
								>
							<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
							<xsl:attribute
									name="border-bottom-style">solid</xsl:attribute>
							<xsl:attribute
									name="border-bottom-width">1pt</xsl:attribute>
							<fo:block
									font-family="sans-serif" font-size="10pt" font-weight="bold">Title
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:choose>
						<xsl:when test="descendant::content/refs">
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
	
	<xsl:template match="refs[child::reftp]">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="reftp">
		<fo:table-row padding-after="3pt">
			<fo:table-cell font-family="sans-serif">
				<xsl:attribute name="padding-top"
						>3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom"
						>3pt</xsl:attribute>
				<fo:block id="{generate-id(.)}">
					<xsl:value-of select="pubcode/text()"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell font-family="sans-serif">
				<xsl:attribute name="padding-top"
						>3pt</xsl:attribute>
				<xsl:attribute name="padding-bottom"
						>3pt</xsl:attribute>
				<fo:block>
					<xsl:value-of select="pubtitle/text()"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="refs">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="getTables">
		<xsl:param name="volCount"/>
		<xsl:param name="chapCount"/>
		<xsl:param name="dmCount"/>
			<fo:table-row> 			<fo:table-cell
						font-family="sans-serif" font-size="10pt" padding-after="3pt"
						start-indent=".78in"> 				<fo:block text-align-last="justify" color="blue">
						<xsl:variable name="id">
							<xsl:value-of select="concat('ref',$volCount,$chapCount,$dmCount)"/>
						</xsl:variable>
						<fo:basic-link
								internal-destination="{$id}"> 						<fo:list-block
									provisional-distance-between-starts=".4in" start-indent="0"
									text-indent="0"> 							<!-- list item --> 							<fo:list-item> 								<!-- insert a bullet -->
									<fo:list-item-label end-indent="label-end()"> 									<fo:block
												text-align="right"> 										<fo:basic-link
													internal-destination="{$id}">1</fo:basic-link> 									</fo:block
											> 								</fo:list-item-label> 								<!-- list text --> 								<fo:list-item-body
											start-indent="body-start()"> 									<fo:block> 										<fo:basic-link
													internal-destination="{$id}"> 											<xsl:value-of
														select="'References'"/> 											<fo:leader
														leader-alignment="reference-area" leader-pattern="dots"></fo:leader
													> 										</fo:basic-link> 									</fo:block> 								</fo:list-item-body
										> 							</fo:list-item> 						</fo:list-block> 					</fo:basic-link
							> 				</fo:block> 			</fo:table-cell> 			<fo:table-cell
						font-family="sans-serif" font-size="10pt" padding-after="3pt"> 				<fo:block color="blue"
							>
						<xsl:variable name="id">
							<xsl:value-of select="concat('ref',$volCount,$chapCount,$dmCount)"/>
						</xsl:variable>
						<fo:basic-link internal-destination="{$id}"
								> 						<fo:page-number-citation ref-id="{$id}"></fo:page-number-citation
								>  					</fo:basic-link> 				</fo:block> 			</fo:table-cell> 		</fo:table-row
				>
		<xsl:if test="descendant::prelreqs/reqconds/descendant::reqcond">
			<xsl:for-each select="descendant::prelreqs/reqconds">
				<fo:table-row> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" start-indent=".78in"> 				
						<fo:block text-align-last="justify" color="blue">
							<xsl:variable name="id" select="concat('reqconds',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:list-block provisional-distance-between-starts=".4in" start-indent="0" text-indent="0">		
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()"> 									
											<fo:block text-align="right"> 
												<xsl:variable name="count">
													<xsl:number count="reqconds[not(child::noconds)]|supeqli|reqpers|supplyli|spares[not(child::nospares)]" level="any" format="1" from="dmodule"/>
												</xsl:variable>
												<fo:basic-link internal-destination="{'reqconds'}">
													<xsl:value-of select="$count+1"/>
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-label>						
										<fo:list-item-body start-indent="body-start()"> 	
											<fo:block> 										
												<fo:basic-link internal-destination="{$id}"> 										
													<xsl:value-of select="'Required Conditions'"/> 											
													<fo:leader leader-alignment="reference-area" leader-pattern="dots"/> 								
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-body> 						
									</fo:list-item> 						
								</fo:list-block> 					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt"> 				
						<fo:block color="blue"> 				
							<xsl:variable name="id" select="concat('reqconds',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:page-number-citation ref-id="{$id}"></fo:page-number-citation>  					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 		
				</fo:table-row>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="descendant::prelreqs/reqpers/person">
			<xsl:for-each select="descendant::prelreqs/reqpers">
				<fo:table-row> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" start-indent=".78in"> 				
						<fo:block text-align-last="justify" color="blue">
							<xsl:variable name="id" select="concat('reqpers',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:list-block provisional-distance-between-starts=".4in" start-indent="0" text-indent="0">		
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()"> 									
											<fo:block text-align="right"> 
												<xsl:variable name="count">
													<xsl:number count="reqconds[not(child::noconds)]|supeqli|reqpers|supplyli|spares[not(child::nospares)]" level="any" format="1" from="dmodule"/>
												</xsl:variable>
												<fo:basic-link internal-destination="{$id}">
													<xsl:value-of select="$count+1"/>
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-label>						
										<fo:list-item-body start-indent="body-start()"> 	
											<fo:block> 										
												<fo:basic-link internal-destination="{$id}"> 										
													<xsl:value-of select="'Required Personnel'"/> 											
													<fo:leader leader-alignment="reference-area" leader-pattern="dots"/> 								
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-body> 						
									</fo:list-item> 						
								</fo:list-block> 					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt"> 				
						<fo:block color="blue">
							<xsl:variable name="id" select="concat('reqpers',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:page-number-citation ref-id="{$id}"></fo:page-number-citation>  					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 		
				</fo:table-row>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="descendant::prelreqs/supequip/supeqli">
			<xsl:for-each select="descendant::prelreqs/supequip/supeqli">
				<fo:table-row> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" start-indent=".78in"> 				
						<fo:block text-align-last="justify" color="blue"> 	
							<xsl:variable name="id" select="concat('supequip',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:list-block provisional-distance-between-starts=".4in" start-indent="0" text-indent="0">		
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()"> 									
											<fo:block text-align="right"> 
												<xsl:variable name="count">
													<xsl:number count="reqconds[not(child::noconds)]|supeqli|reqpers|supplyli|spares[not(child::nospares)]" level="any" format="1" from="dmodule"/>
												</xsl:variable>
												<fo:basic-link internal-destination="{$id}">
													<xsl:value-of select="$count+1"/>
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-label>						
										<fo:list-item-body start-indent="body-start()"> 	
											<fo:block> 										
												<fo:basic-link internal-destination="{$id}"> 										
													<xsl:value-of select="'Support Equipment'"/> 											
													<fo:leader leader-alignment="reference-area" leader-pattern="dots"/> 								
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-body> 						
									</fo:list-item> 						
								</fo:list-block> 					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt"> 				
						<fo:block color="blue"> 				
							<xsl:variable name="id" select="concat('supequip',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="$id"> 						
								<fo:page-number-citation ref-id="{$id}"></fo:page-number-citation>  					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 		
				</fo:table-row>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="descendant::prelreqs/supplies/supplyli">
			<xsl:for-each select="descendant::prelreqs/supplies/supplyli">
				<fo:table-row> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" start-indent=".78in"> 				
						<fo:block text-align-last="justify" color="blue"> 
							<xsl:variable name="id" select="concat('supplies',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:list-block provisional-distance-between-starts=".4in" start-indent="0" text-indent="0">		
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()"> 									
											<fo:block text-align="right"> 
												<xsl:variable name="count">
													<xsl:number count="reqconds[not(child::noconds)]|supeqli|reqpers|supplyli|spares[not(child::nospares)]" level="any" format="1" from="dmodule"/>
												</xsl:variable>
												<fo:basic-link internal-destination="{$id}">
													<xsl:value-of select="$count+1"/>
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-label>						
										<fo:list-item-body start-indent="body-start()"> 	
											<fo:block> 										
												<fo:basic-link internal-destination="{$id}"> 										
													<xsl:value-of select="'Supplies'"/> 											
													<fo:leader leader-alignment="reference-area" leader-pattern="dots"/> 								
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-body> 						
									</fo:list-item> 						
								</fo:list-block> 					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt"> 				
						<fo:block color="blue">
							<xsl:variable name="id" select="concat('supplies',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:page-number-citation ref-id="{$id}"></fo:page-number-citation>  					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 		
				</fo:table-row>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="descendant::prelreqs/spares/sparesli">
			<xsl:for-each select="descendant::prelreqs/spares/sparesli">
				<fo:table-row> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" start-indent=".78in"> 				
						<fo:block text-align-last="justify" color="blue"> 
							<xsl:variable name="id" select="concat('spares',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:list-block provisional-distance-between-starts=".4in" start-indent="0" text-indent="0">		
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()"> 									
											<fo:block text-align="right"> 
												<xsl:variable name="count">
													<xsl:number count="reqconds[not(child::noconds)]|supeqli|reqpers|supplyli|spares[not(child::nospares)]" level="any" format="1" from="dmodule"/>
												</xsl:variable>
												<fo:basic-link internal-destination="{'spares'}">
													<xsl:value-of select="$count+1"/>
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-label>						
										<fo:list-item-body start-indent="body-start()"> 	
											<fo:block> 										
												<fo:basic-link internal-destination="{$id}"> 										
													<xsl:value-of select="'Spares'"/> 											
													<fo:leader leader-alignment="reference-area" leader-pattern="dots"/> 								
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-body> 						
									</fo:list-item> 						
								</fo:list-block> 					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt"> 				
						<fo:block color="blue"> 
							<xsl:variable name="id" select="concat('spares',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:page-number-citation ref-id="{$id}"></fo:page-number-citation>  					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 		
				</fo:table-row>
			</xsl:for-each>
		</xsl:if>		
		<xsl:for-each select="descendant::table"> 			<fo:table-row><fo:table-cell
						display-align="after" font-family="sans-serif" font-size="10pt"
						padding-after="3pt" start-indent=".78in"> 					<fo:block
							text-align-last="justify" color="blue"> 						<fo:basic-link
								internal-destination="{generate-id(.)}"> 							<fo:list-block
									provisional-distance-between-starts=".4in" start-indent="0"
									text-indent="0"> 								<!-- list item --> 								<fo:list-item
										> 									<!-- insert a bullet --> 									<fo:list-item-label
											end-indent="label-end()"> 										<fo:block> 											<fo:basic-link internal-destination="{generate-id(.)}">
												<xsl:variable name="count">
													<xsl:number
															count="table|reqconds[not(child::noconds)]|supequip[not(child::nosupeq)]|supplies[not(child::nosupply)]|spares[not(child::nospares)]|reqpers[child::person]" format="1" from="dmodule" level="any"/>
												</xsl:variable>
												<xsl:value-of select="$count+1"/>
											</fo:basic-link
												> 										</fo:block> 									</fo:list-item-label> 									<!-- list text -->
									<fo:list-item-body start-indent="body-start()"> 										<fo:block
												> 											<fo:basic-link internal-destination="{generate-id(.)}"
													>
												<xsl:choose>
													<xsl:when test="./title">
														<xsl:value-of select="./title/text()"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>No Title</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<fo:leader
														leader-alignment="reference-area" leader-pattern="dots"></fo:leader
													> 											</fo:basic-link> 										</fo:block> 									</fo:list-item-body
										> 								</fo:list-item> 							</fo:list-block> 						</fo:basic-link
							> 					</fo:block> 				</fo:table-cell><fo:table-cell
						display-align="after" font-family="sans-serif" font-size="10pt"
						padding-after="3pt"> 					<fo:block color="blue"> 						<fo:basic-link
								internal-destination="{generate-id(.)}">							<fo:page-number-citation
									ref-id="{generate-id(.)}"></fo:page-number-citation>  						</fo:basic-link
							> 					</fo:block> 				</fo:table-cell> 			</fo:table-row> 		</xsl:for-each>
		<xsl:if test="descendant::closereqs/reqconds/reqcondm">
			<xsl:for-each select="descendant::closereqs/reqconds">
				<fo:table-row> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt" start-indent=".78in"> 				
						<fo:block text-align-last="justify" color="blue"> 
							<xsl:variable name="id" select="concat('closreqs',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:list-block provisional-distance-between-starts=".4in" start-indent="0" text-indent="0">		
									<fo:list-item>
										<fo:list-item-label end-indent="label-end()"> 									
											<fo:block text-align="right"> 
												<xsl:variable name="count">
													<xsl:number
															count="table|reqconds[not(child::noconds)]|supequip[not(child::nosupeq)]|supplies[not(child::nosupply)]|spares[not(child::nospares)]|reqpers[child::person]" format="1" from="dmodule" level="any"/>
												</xsl:variable>
												<fo:basic-link internal-destination="{$id}">
													<xsl:value-of select="$count+1"/>
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-label>						
										<fo:list-item-body start-indent="body-start()"> 	
											<fo:block> 										
												<fo:basic-link internal-destination="{$id}"> 										
													<xsl:value-of select="'Closing Requirements'"/> 											
													<fo:leader leader-alignment="reference-area" leader-pattern="dots"/> 								
												</fo:basic-link> 									
											</fo:block> 								
										</fo:list-item-body> 						
									</fo:list-item> 						
								</fo:list-block> 					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 			
					<fo:table-cell font-family="sans-serif" font-size="10pt" padding-after="3pt"> 				
						<fo:block color="blue">
							<xsl:variable name="id" select="concat('closreqs',$volCount,$chapCount,$dmCount)"/>
							<fo:basic-link internal-destination="{$id}"> 						
								<fo:page-number-citation ref-id="{$id}"></fo:page-number-citation>  					
							</fo:basic-link> 				
						</fo:block> 			
					</fo:table-cell> 		
				</fo:table-row>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template name="lof">
		<xsl:if test="count(descendant::figure) &gt; 0">
			<fo:table xsl:use-attribute-sets="normal-text" space-after=".15in">
				<fo:table-column
						>
					<xsl:attribute name="column-number">1</xsl:attribute>
					<xsl:attribute
							name="column-width">6.55in</xsl:attribute>
				</fo:table-column>
				<fo:table-column
						>
					<xsl:attribute name="column-number">2</xsl:attribute>
					<xsl:attribute
							name="column-width">.31in</xsl:attribute>
				</fo:table-column>
				<fo:table-header
						>
					<fo:table-row padding-after="3pt">
						<fo:table-cell number-columns-spanned="2"
								padding-after=".1in">
							<fo:block font-size="14pt"
									font-weight="bold" text-align-last="justify">List of figures								<fo:leader
										leader-alignment="reference-area">
								</fo:leader>
								<fo:inline
										font-size="10pt" font-weight="normal">Page</fo:inline>
							</fo:block
								>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header
					>
				<fo:table-body>
					<xsl:call-template name="getFigures">
					</xsl:call-template>
				</fo:table-body>
			</fo:table>
		</xsl:if>
	</xsl:template
		>

	<xsl:template name="getFigures">
		<xsl:for-each select="descendant::figure"
				>
			<fo:table-row>
				<fo:table-cell display-align="after"
						font-family="sans-serif" font-size="10pt" padding-after="3pt"
						start-indent=".78in">
					<fo:block text-align-last="justify" color="blue">
						<fo:basic-link
								internal-destination="{generate-id(.)}">
							<fo:list-block
									provisional-distance-between-starts=".5in" start-indent="0"
									text-indent="0">
								<!-- list item -->
								<fo:list-item
										>
									<!-- insert a bullet -->
									<fo:list-item-label
											end-indent="label-end()">
										<fo:block>
											<fo:basic-link
													internal-destination="{generate-id(.)}">
												<xsl:number
														count="figure" format="1" from="dmodule" level="any"/>
											</fo:basic-link
												>
										</fo:block>
									</fo:list-item-label>
									<!-- list text -->
									<fo:list-item-body start-indent="body-start()">
										<fo:block
												>
											<fo:basic-link internal-destination="{generate-id(.)}"
													>
												<xsl:value-of select="./title/text()"/>
												<fo:leader
														leader-alignment="reference-area" leader-pattern="dots">
												</fo:leader
													>
											</fo:basic-link>
										</fo:block>
									</fo:list-item-body
										>
								</fo:list-item>
							</fo:list-block>
						</fo:basic-link
							>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell
						display-align="after" font-family="sans-serif" font-size="10pt"
						padding-after="3pt">
					<fo:block color="blue">
						<fo:basic-link
								internal-destination="{generate-id(.)}">
							<fo:page-number-citation
									ref-id="{generate-id(.)}">
							</fo:page-number-citation>
						</fo:basic-link
							>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each
			>
	</xsl:template>

	<xsl:template match="step1|step2|step3|step4|step5">
		<fo:block >
			<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="para0">       
		<fo:block
				id="{generate-id(.)}" role="para0"><!--Process this element's content-->       </fo:block>    
		<xsl:apply-templates>
			</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="seqlist">
		<fo:block padding-after="5pt">
			<xsl:if test="preceding-sibling::node()[1][self::text()]">
				<xsl:attribute name="padding-before">5pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="seqlist/item">
		<xsl:variable name="count">
			<xsl:number count="item" format="1." from="seqlist"/> 	
		</xsl:variable>
		<fo:list-block provisional-distance-between-starts=".2in">
			<xsl:attribute name="provisional-distance-between-starts">.4in</xsl:attribute>
			<fo:list-item>								
				<fo:list-item-label end-indent="label-end()"> 									
					<fo:block xsl:use-attribute-sets="normal-text"> 										
						<xsl:number count="item" format="1." from="seqlist"/> 									
					</fo:block> 								
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
					<fo:block xsl:use-attribute-sets="normal-text"> 										
						<xsl:apply-templates/> 									
					</fo:block> 								
				</fo:list-item-body> 							
			</fo:list-item> 						
		</fo:list-block> 
	</xsl:template>

	<xsl:template match="randlist">
		<fo:block padding-after="5pt">
			<xsl:if test="preceding-sibling::node()[1][self::text()]">
				<xsl:attribute name="padding-before">5pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="randlist/item">
		<fo:list-block provisional-distance-between-starts=".2in">
			<fo:list-item>								
				<fo:list-item-label end-indent="label-end()"> 									
					<fo:block xsl:use-attribute-sets="normal-text"> 										
						- 									
					</fo:block> 								
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
					<fo:block xsl:use-attribute-sets="normal-text"> 										
						<xsl:apply-templates/> 									
					</fo:block> 								
				</fo:list-item-body> 							
			</fo:list-item> 						
		</fo:list-block> 
	</xsl:template>

<xsl:template match="step1/para|step2/para|step3/para">
		<fo:block padding-after=".1in" xsl:use-attribute-sets="normal-text">
			<xsl:choose>
				<xsl:when test="not(preceding-sibling::para) and not(preceding-sibling::title)">
					<fo:list-block
							provisional-distance-between-starts=".7in"> 							<!-- list item -->
						<fo:list-item> 								<!-- insert a bullet --> 								<fo:list-item-label
									end-indent="label-end()"> 									<fo:block xsl:use-attribute-sets="normal-text"> 										
										<xsl:choose>
									<xsl:when test="parent::step1">
										<xsl:number count="step1" format="1" from="content"/>
									</xsl:when>
									<xsl:when test="parent::step2">
										<xsl:number count="step1|step2" format="1.1" from="content" level="multiple"/>
									</xsl:when>
									<xsl:when test="parent::step3">
										<xsl:number count="step1|step2|step3" format="1.1.1" from="content" level="multiple"/>
									</xsl:when>
								</xsl:choose> 									</fo:block> 								</fo:list-item-label
								> 								<!-- list text --> 								<fo:list-item-body
									start-indent="body-start()"> 									<fo:block xsl:use-attribute-sets="normal-text"> 										<xsl:apply-templates/> 									</fo:block> 								</fo:list-item-body
								> 							</fo:list-item> 						</fo:list-block>
				</xsl:when>
				<xsl:otherwise>
					<fo:block start-indent=".7in">
						<xsl:apply-templates/>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>

	<xsl:template match="step1/title|step2/title|step3/title">
		<fo:block keep-with-next.within-page="always" padding-after=".1in"><!--Process this element's content--><fo:list-block
					provisional-distance-between-starts=".7in"> 							<!-- list item -->
				<fo:list-item> 								<!-- insert a bullet --> 								<fo:list-item-label
							end-indent="label-end()"> 									<fo:block xsl:use-attribute-sets="normal-text" font-size="12pt" font-weight="bold"> 										
								<xsl:choose>
									<xsl:when test="parent::step1">
										<xsl:number count="step1" format="1" from="content"/>
									</xsl:when>
									<xsl:when test="parent::step2">
										<xsl:number count="step1|step2" format="1.1" from="content" level="multiple"/>
									</xsl:when>
									<xsl:when test="parent::step3">
										<xsl:number count="step1|step2|step2" format="1.1.1" from="content" level="multiple"/>
									</xsl:when>
								</xsl:choose>
								 									</fo:block> 			</fo:list-item-label> 								<!-- list text --> 								<fo:list-item-body
							start-indent="body-start()"> 									<fo:block xsl:use-attribute-sets="normal-text" font-size="12pt" font-weight="bold"> 										<xsl:apply-templates>
							</xsl:apply-templates> 									</fo:block> 								</fo:list-item-body
						> 							</fo:list-item> 						</fo:list-block>       </fo:block>
	</xsl:template>



	<xsl:template match="subpara1/title|subpara2/title|subpara3/title">
		<fo:block keep-with-next.within-page="always"><!--Process this element's content-->
			<xsl:if test="not(following-sibling::*[1][self::para])">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".7in"> 							<!-- list item -->
				<fo:list-item> 								<!-- insert a bullet --> 								
					<fo:list-item-label end-indent="label-end()"> 									
						<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold"> 	
							<xsl:choose>
								<xsl:when test="parent::subpara1">
									<xsl:number count="subpara1|para0" format="1.1" level="multiple"/> 	
								</xsl:when>
								<xsl:when test="parent::subpara2">
									<xsl:number count="subpara1|para0|subpara2" format="1.1.1" level="multiple"/> 	
								</xsl:when>
								<xsl:when test="parent::subpara3">
									<xsl:number count="subpara1|para0|subpara2|subpara3" format="1.1.1.1" level="multiple"/> 	
								</xsl:when>
							</xsl:choose>															
						</fo:block>
						</fo:list-item-label> 								<!-- list text --> 							
					<fo:list-item-body start-indent="body-start()"> 									
						<fo:block xsl:use-attribute-sets="normal-text" font-weight="bold"> 										
							<xsl:apply-templates/> 									
						</fo:block> 								
					</fo:list-item-body> 							
				</fo:list-item> 						
			</fo:list-block>       
		</fo:block>
	</xsl:template>
	
	<xsl:template match="subpara3/para[not(preceding-sibling::title) and not(preceding-sibling::para)]">
		<fo:block keep-with-next.within-page="always"><!--Process this element's content-->
			<xsl:if test="not(following-sibling::*[1][self::para])">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".7in"> 							<!-- list item -->
				<fo:list-item> 								<!-- insert a bullet --> 								
					<fo:list-item-label end-indent="label-end()"> 									
						<fo:block xsl:use-attribute-sets="normal-text"> 	
									<xsl:number count="subpara1|para0|subpara2|subpara3" format="1.1.1.1" level="multiple"/>																
						</fo:block>
					</fo:list-item-label> 								<!-- list text --> 							
					<fo:list-item-body start-indent="body-start()"> 									
						<fo:block xsl:use-attribute-sets="normal-text"> 										
							<xsl:apply-templates/> 									
						</fo:block> 								
					</fo:list-item-body> 							
				</fo:list-item> 						
			</fo:list-block>       
		</fo:block>
	</xsl:template>
	
	<xsl:template match="subpara4/para[not(preceding-sibling::title) and not(preceding-sibling::para)]">
		<fo:block keep-with-next.within-page="always"><!--Process this element's content-->
			<xsl:if test="not(following-sibling::*[1][self::para])">
				<xsl:attribute name="padding-after">.1in</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts=".7in"> 							<!-- list item -->
				<fo:list-item> 								<!-- insert a bullet --> 								
					<fo:list-item-label end-indent="label-end()"> 									
						<fo:block xsl:use-attribute-sets="normal-text"> 	
									<xsl:number count="subpara1|para0|subpara2|subpara3|subpara4" format="1.1.1.1.1" level="multiple"/>																
						</fo:block>
					</fo:list-item-label> 								<!-- list text --> 							
					<fo:list-item-body start-indent="body-start()"> 									
						<fo:block xsl:use-attribute-sets="normal-text"> 										
							<xsl:apply-templates/> 									
						</fo:block> 								
					</fo:list-item-body> 							
				</fo:list-item> 						
			</fo:list-block>       
		</fo:block>
	</xsl:template>



	<xsl:template match="para0/title">
		<fo:block  padding-after="5pt">
		<xsl:if test="not(following-sibling::*[1][self::figure])">
			<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
		</xsl:if>
		<!--Process this element's content--><fo:list-block
					provisional-distance-between-starts=".7in"> 							<!-- list item -->
				<fo:list-item> 								<!-- insert a bullet --> 								<fo:list-item-label
							end-indent="label-end()"> 									<fo:block xsl:use-attribute-sets="normal-text" font-size="12pt" font-weight="bold"> 										<xsl:number count="para0"
									format="1" from="content"/> 									</fo:block> 								</fo:list-item-label
						> 								<!-- list text --> 								<fo:list-item-body
							start-indent="body-start()"> 									<fo:block xsl:use-attribute-sets="normal-text" font-size="12pt" font-weight="bold"> 										<xsl:apply-templates>
							</xsl:apply-templates> 									</fo:block> 								</fo:list-item-body
						> 							</fo:list-item> 						</fo:list-block>       </fo:block>
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

<xsl:template match="xref">      
		<xsl:variable name="id" select="@xrefid"/>
		<xsl:variable name="type" select="@xidtype"/>
		<xsl:variable name="text-value" select="following-sibling::node()[1][self::text()]"/>
		<xsl:choose>
			<xsl:when test="$type='figure'or $type='FIGURE'">
				<xsl:for-each select="ancestor::dmodule/descendant::figure">
					<xsl:if test="@id=$id"> 					
						<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
							<xsl:variable name="count">
								<xsl:number count="figure" from="dmodule" level="any"/>
							</xsl:variable>
							<xsl:value-of select="concat('Fig ',$count)"/>							
							<xsl:if test="not(substring($text-value,1,1) = '.') and not(substring($text-value,1,1) = ',')
							and not(substring($text-value,1,1) = '?') and not(substring($text-value,1,1) = ')') and not(substring($text-value,1,1) = ' ')">
								<xsl:value-of select="' '"/>
							</xsl:if>
						</fo:basic-link> 				
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$type='para'or $type='PARA'">
				<xsl:for-each select="ancestor::dmodule/descendant::subpara1|ancestor::dmodule/descendant::subpara2|ancestor::dmodule/descendant::subpara3|ancestor::dmodule/descendant::subpara4|ancestor::dmodule/descendant::subpara5">
					<xsl:if test="@id">
						<xsl:if test="@id=$id">
							<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
								<xsl:value-of select="'Para '"/>
								<xsl:choose>
									<xsl:when test="self::subpara1">
										<xsl:number count="subpara1|para0" from="dmodule" format="1.1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::subpara2">
										<xsl:number count="subpara1|subpara2|para0" from="dmodule" format="1.1.1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::subpara3">
										<xsl:number count="subpara1|subpara2|subpara3|para0" from="dmodule" format="1.1.1.1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::subpara4">
										<xsl:number count="subpara1|subpara2|subpara3|subpara4|para0" from="dmodule" format="1.1.1.1.1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::subpara5">
										<xsl:number count="subpara1|subpara2|subpara3|subpara4|subpara5|para0" from="dmodule" format="1.1.1.1.1.1" level="multiple"/>
									</xsl:when>
								</xsl:choose>
							</fo:basic-link>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$type='step'or $type='STEP'">
				<xsl:for-each select="ancestor::dmodule/descendant::step1|ancestor::dmodule/descendant::step2|ancestor::dmodule/descendant::step3|step4|ancestor::dmodule/descendant::step5">
					<xsl:if test="@id">
						<xsl:if test="@id=$id">
							<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
								<xsl:value-of select="'Step '"/>
								<xsl:choose>
									<xsl:when test="self::step1">
										<xsl:number count="step1" from="dmodule" format="1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::step2">
										<xsl:number count="step1|step2" from="dmodule" format="1.1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::step3">
										<xsl:number count="step1|step2|step3" from="dmodule" format="1.1.1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::step4">
										<xsl:number count="step1|step2|step3|step3" from="dmodule" format="1.1.1.1" level="multiple"/>
									</xsl:when>
									<xsl:when test="self::step5">
										<xsl:number count="step1|step2|step3|step4|step5" from="dmodule" format="1.1.1.1.1" level="multiple"/>
									</xsl:when>
								</xsl:choose>
							</fo:basic-link>
						</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$type='OTHER'">
				<xsl:for-each select="ancestor::dmodule/descendant::refs/reftp">
					<xsl:if test="@id=$id"> 					
						<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
							<xsl:value-of select="pubcode/text()"/>							
							<xsl:if test="not(substring($text-value,1,1) = '.') and not(substring($text-value,1,1) = ',') 
							and not(substring($text-value,1,1) = '?') and not(substring($text-value,1,1) = ')') and not(substring($text-value,1,1) = ' ')">
								<xsl:value-of select="' '"/>
							</xsl:if>
						</fo:basic-link> 				
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$type='TABLE' or $type='table'">
				<xsl:for-each select="ancestor::dmodule/descendant::table">
					<xsl:if test="@id=$id"> 					
						<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
							<xsl:variable name="count">
								<xsl:number
							count="table|reqconds[not(child::noconds)]|supequip[not(child::nosupeq)]|supplies[not(child::nosupply)]|spares[not(child::nospares)]|reqpers[child::person]" format="1" from="dmodule" level="any"/>
							</xsl:variable>
							<xsl:value-of select="concat('Table ',$count + 1)"/>							
							<xsl:if test="not(substring($text-value,1,1) = '.') and not(substring($text-value,1,1) = ',') and not(substring($text-value,1,1) = '?') and not(substring($text-value,1,1) = ')') and not(substring($text-value,1,1) = ' ')">
								<xsl:value-of select="' '"/>
							</xsl:if>
						</fo:basic-link> 				
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$type='SUPPLY' or $type='supply'">
				<xsl:for-each select="ancestor::dmodule/descendant::supply">
					<xsl:if test="@id=$id"> 					
						<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
							<xsl:value-of select="./nomen"/>
						</fo:basic-link> 				</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$type='SUPEQUIP'">
				<xsl:for-each select="ancestor::dmodule/descendant::supequi">
					<xsl:if test="@id=$id"> 					
						<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
							<xsl:value-of select="./nomen"/>
						</fo:basic-link> 				
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$type='SPARES'">
				<xsl:for-each select="ancestor::dmodule/descendant::spare">
					<xsl:if test="@id=$id"> 					
						<fo:basic-link color="blue" internal-destination="{generate-id(.)}">
							<xsl:value-of select="./nomen"/>
						</fo:basic-link> 				
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>    
	</xsl:template>

	<xsl:template match="figure">     
		<fo:block id="{generate-id(.)}">
			<xsl:variable name="dmCount2">
							<xsl:for-each select="ancestor::dmodule">
								<xsl:variable name="count">
									<xsl:number count="dmodule" from="pmentry[parent::pmentry]" level="any"/>
								</xsl:variable>
								<xsl:value-of select="$count"/>								
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="chapCount">
							<xsl:for-each select="ancestor::pmentry[parent::pmentry]">
								<xsl:variable name="count">
									<xsl:number count="pmentry[parent::pmentry]" from="pmentry" level="single"/>
								</xsl:variable>
								<xsl:value-of select="$count"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="volume">
							<xsl:for-each select="ancestor::pmentry[parent::content]">
								<xsl:variable name="count">
									<xsl:number count="pmentry[parent::content]" from="pm" level="any"/>
								</xsl:variable>
								<xsl:value-of select="$count"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="dmCount">
							<xsl:choose>
							<xsl:when test="ancestor::pmentry/refdm">
								<xsl:call-template name="find_landscape_refdm">
									<xsl:with-param name="position" select="1"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="dmodule" from="pmentry"/>
							</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>						
						<xsl:variable name="refTitle">
							<xsl:call-template name="count_landscape_refdm">
								<xsl:with-param name="position" select="1"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="refdmCount">
							<xsl:if test="ancestor::pmentry/refdm">
								<xsl:for-each select="ancestor::pmentry/refdm[descendant::techname/text() = $refTitle]">
									<xsl:variable name="count">
										<xsl:number count="refdm" from="pmentry[parent::pmentry]" level="single"/>
									</xsl:variable>
									<xsl:value-of select="$count"/>
								</xsl:for-each>
							</xsl:if>
						</xsl:variable>
						<fo:marker marker-class-name="volChap">
							<xsl:value-of select="concat('Volume ',$volume,' - ','Chapter ',$chapCount,'.',$refdmCount - 1,'.',$dmCount)"/>
						</fo:marker>
			<xsl:apply-templates select="graphic"/>       
		</fo:block>    
	</xsl:template>

<xsl:template match="figure/title">       
		<fo:block xsl:use-attribute-sets="normal-text" font-style="italic" keep-with-previous.within-page="always" role="TITLE" text-align="center">
			Figure <xsl:number count="figure" from="dmodule" level="any"/><fo:leader leader-length=".05in"/>
			<xsl:apply-templates/>      
		</fo:block>    
	</xsl:template>

</xsl:stylesheet>
