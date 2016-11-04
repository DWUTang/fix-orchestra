<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:fixr="http://fixprotocol.io/2016/fixrepository" xmlns:dc="http://purl.org/dc/elements/1.1" exclude-result-prefixes="fn">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:namespace-alias stylesheet-prefix="#default" result-prefix="fixr"/>
	<xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="fixr:repository">
		<xsl:copy>
			<xsl:copy-of select="fixr:metadata"/>
			<xsl:copy-of select="fixr:codeSets"/>
			<xsl:copy-of select="fixr:abbreviations"/>
			<xsl:apply-templates select="fixr:datatypes"/>
			<xsl:copy-of select="fixr:categories"/>
			<xsl:copy-of select="fixr:sections"/>
			<xsl:copy-of select="fixr:fields"/>
			<xsl:copy-of select="fixr:protocol"/>
		</xsl:copy>
    </xsl:template>
    <xsl:template match="fixr:datatypes">
		<xsl:copy>
				<xsl:apply-templates/>
		</xsl:copy>
    </xsl:template>
    <xsl:template match="fixr:datatype">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:copy-of select="fixr:mappedDatatype"/>
			<xsl:choose>
				<xsl:when test="@name='int'">
				<fixr:mappedDatatype standard="ISO11404" base="integer"/>
				</xsl:when>
				<xsl:when test="@name='Length'">
				<fixr:mappedDatatype standard="ISO11404" base="size"/>
				</xsl:when>
				<xsl:when test="@name='TagNum'">
				<fixr:mappedDatatype standard="ISO11404" base="ordinal"/>
				</xsl:when>
				<xsl:when test="@name='SeqNum'">
				<fixr:mappedDatatype standard="ISO11404" base="ordinal"/>
				</xsl:when>
				<xsl:when test="@name='NumInGroup'">
				<fixr:mappedDatatype standard="ISO11404" base="size"/>
				</xsl:when>
				<xsl:when test="@name='DayOfMonth'">
				<fixr:mappedDatatype standard="ISO11404" base="range" parameter="integer" minInclusive="1" maxInclusive="31"/>
				</xsl:when>		
				<xsl:when test="@name='float'">
				<fixr:mappedDatatype standard="ISO11404" base="real"/>
				</xsl:when>
				<xsl:when test="@name='Qty'">
				<fixr:mappedDatatype standard="ISO11404" base="scaled" parameter="radix=10"/>
				</xsl:when>
				<xsl:when test="@name='Price'">
				<fixr:mappedDatatype standard="ISO11404" base="scaled" parameter="radix=10"/>
				</xsl:when>
				<xsl:when test="@name='PriceOffset'">
				<fixr:mappedDatatype standard="ISO11404" base="scaled" parameter="radix=10"/>
				</xsl:when>
				<xsl:when test="@name='Amt'">
				<fixr:mappedDatatype standard="ISO11404" base="scaled" parameter="radix=10"/>
				</xsl:when>
				<xsl:when test="@name='Percentage'">
				<fixr:mappedDatatype standard="ISO11404" base="scaled" parameter="radix=10"/>
				</xsl:when>
				<xsl:when test="@name='char'">
				<fixr:mappedDatatype standard="ISO11404" base="character" parameter="repertoire=US-ASCII"/>
				</xsl:when>
				<xsl:when test="@name='Boolean'">
				<fixr:mappedDatatype standard="ISO11404" base="boolean"/>
				</xsl:when>
				<xsl:when test="@name='String'">
				<fixr:mappedDatatype standard="ISO11404" base="characterstring" parameter="repertoire=US-ASCII"/>
				</xsl:when>
				<xsl:when test="@name='MultipleCharValue'">
				<fixr:mappedDatatype standard="ISO11404" base="set" element="character"/>
				</xsl:when>
				<xsl:when test="@name='MultipleStringValue'">
				<fixr:mappedDatatype standard="ISO11404" base="set" element="characterstring"/>
				</xsl:when>
				<xsl:when test="@name='Country'">
				<fixr:mappedDatatype standard="ISO11404" base="array" element="character" parameter="index-lowerbound=1;index-upperbound=2"/>
				</xsl:when>
				<xsl:when test="@name='Currency'">
				<fixr:mappedDatatype standard="ISO11404" base="array" element="character" parameter="index-lowerbound=1;index-upperbound=3"/>
				</xsl:when>
				<xsl:when test="@name='Exchange'">
				<fixr:mappedDatatype standard="ISO11404" base="array" element="character" parameter="index-lowerbound=1;index-upperbound=4"/>
				</xsl:when>
				<xsl:when test="@name='MonthYear'">
				<fixr:mappedDatatype standard="ISO11404" base="characterstring"/>
				</xsl:when>	
				<xsl:when test="@name='UTCTimestamp'">
				<fixr:mappedDatatype standard="ISO11404" base="time" parameter="time-unit=microsecond"/>
				</xsl:when>			
				<xsl:when test="@name='UTCTimeOnly'">
				<fixr:mappedDatatype standard="ISO11404" base="time" parameter="time-unit=microsecond"/>
				</xsl:when>		
				<xsl:when test="@name='UTCDateOnly'">
				<fixr:mappedDatatype standard="ISO11404" base="time" parameter="time-unit=day"/>
				</xsl:when>	
				<xsl:when test="@name='LocalMktDate'">
				<fixr:mappedDatatype standard="ISO11404" base="time" parameter="time-unit=day"/>
				</xsl:when>	
				<xsl:when test="@name='TZTimeOnly'">
				<fixr:mappedDatatype standard="ISO11404" base="time" parameter="time-unit=microsecond"/>
				</xsl:when>	
				<xsl:when test="@name='TZTimestamp'">
				<fixr:mappedDatatype standard="ISO11404" base="time" parameter="time-unit=microsecond"/>
				</xsl:when>	
				<xsl:when test="@name='data'">
				<fixr:mappedDatatype standard="ISO11404" base="octetstring"/>
				</xsl:when>	
				<xsl:when test="@name='Tenor'">
				<fixr:mappedDatatype standard="ISO11404" base="characterstring"/>
				</xsl:when>	
				<xsl:when test="@name='Reserved100Plus'">
				<fixr:mappedDatatype standard="ISO11404" base="range" parameter="integer" minInclusive="100"/>
				</xsl:when>	
				<xsl:when test="@name='Reserved1000Plus'">
				<fixr:mappedDatatype standard="ISO11404" base="range" parameter="integer" minInclusive="1000"/>
				</xsl:when>	
				<xsl:when test="@name='Reserved4000Plus'">
				<fixr:mappedDatatype standard="ISO11404" base="range" parameter="integer" minInclusive="4000"/>
				</xsl:when>	
				<xsl:when test="@name='XMLData'">
				<fixr:mappedDatatype standard="ISO11404" base="characterstring"/>
				</xsl:when>	
				<xsl:when test="@name='Language'">
				<fixr:mappedDatatype standard="ISO11404" base="array" element="character" parameter="index-lowerbound=1;index-upperbound=2"/>
				</xsl:when>
				<xsl:when test="@name='LocalMktTime'">
				<fixr:mappedDatatype standard="ISO11404" base="time" parameter="time-unit=microsecond"/>
				</xsl:when>				
			</xsl:choose>
		</xsl:copy>
    </xsl:template>
</xsl:stylesheet>
