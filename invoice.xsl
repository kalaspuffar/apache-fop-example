<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:functx="http://www.functx.com">
        <fo:layout-master-set>
            <fo:simple-page-master master-name="content" 
                page-width="210mm" page-height="297mm" 
                margin-top="10mm" margin-bottom="10mm" 
                margin-left="20mm" margin-right="20mm">

                <fo:region-body />
            </fo:simple-page-master>
        </fo:layout-master-set>
        <fo:page-sequence master-reference="content">
            <fo:flow flow-name="xsl-region-body">
                <fo:table table-layout="fixed" width="100%">
                    <fo:table-column column-width="25mm" />
                    <fo:table-column column-width="70mm" />
                    <fo:table-column column-width="25mm" />
                    <fo:table-column column-width="70mm" />
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell column-number="1">
                                <fo:block><fo:external-graphic src="logo.png" content-width="20mm"/></fo:block>
                            </fo:table-cell>
                            <fo:table-cell column-number="2">
                                <fo:block font-size="16pt" font-family="sans-serif" font-weight="bold">Example Inc.</fo:block>
                            </fo:table-cell>
                            <fo:table-cell column-number="4">
                                <fo:block
                                    font-family="sans-serif" font-size="24pt" 
                                    color="#BBBBBB" text-align="right"
                                    margin-right="18mm">INVOICE</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell column-number="2">
                                <fo:block font-family="sans-serif" font-size="10pt">Mainstreet bl 13 1st floor</fo:block>
                                <fo:block font-family="sans-serif" font-size="10pt">New York, 3453, New York, USA</fo:block>
                                <fo:block font-family="sans-serif" font-size="10pt">1-555-5757, www.example.com</fo:block>
                            </fo:table-cell>
                            <fo:table-cell column-number="4" padding-top="10pt">
                                <fo:table table-layout="fixed" width="100%">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="sans-serif" font-size="10pt">Invoice date:</fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block font-family="sans-serif" font-size="10pt"><xsl:value-of select="root/invoiceHeader/invoiceDate"/></fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="sans-serif" font-size="10pt">Invoice number:</fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block font-family="sans-serif" font-size="10pt"><xsl:value-of select="root/invoiceHeader/invoiceNumber"/></fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>                                    
                                    </fo:table-body>
                                </fo:table>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell column-number="2" padding-top="7mm">
                                <fo:block font-size="10pt" font-family="sans-serif">Ship to:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell column-number="4" padding-top="7mm">
                                <fo:block font-size="10pt" font-family="sans-serif">Bill to:</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>                        
                            <fo:table-cell column-number="2">
                                <xsl:call-template name="billTo" />
                            </fo:table-cell>
                            <fo:table-cell column-number="4">
                                <xsl:choose>
                                    <xsl:when test="root/shipTo/sameAsBilling = 'true'">
                                        <xsl:call-template name="billTo" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="shipTo" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:table-cell>
                        </fo:table-row>                    
                    </fo:table-body>
                </fo:table>

                <fo:block space-before="20pt">
                    <fo:table border="1pt solid black">
                        <fo:table-column column-width="40mm" />
                        <fo:table-column column-width="40mm" />
                        <fo:table-column column-width="25mm" />
                        <fo:table-column column-width="25mm" />
                        <fo:table-column column-width="20mm" />
                        <fo:table-column column-width="25mm" />
                        <fo:table-body>
                            <fo:table-row font-size="12pt" background-color="#EEE" border="1pt solid #888">
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Ship. number</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Sales Rep.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Ship date</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Ship via</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Terms</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Due date</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row font-size="8pt" border="1pt solid #888">
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block><xsl:value-of select="root/shippingData/shipNumber"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block><xsl:value-of select="root/shippingData/salesRep"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block><xsl:value-of select="root/shippingData/shipDate"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block><xsl:value-of select="root/shippingData/shipVia"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block><xsl:value-of select="root/shippingData/terms"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block><xsl:value-of select="root/shippingData/dueDate"/></fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>

                <fo:block space-before="10pt">
                    <fo:table border="1pt solid #888">
                        <fo:table-column column-width="40mm" />
                        <fo:table-column column-width="65mm" />
                        <fo:table-column column-width="20mm" />
                        <fo:table-column column-width="25mm" />
                        <fo:table-column column-width="25mm" />
                        <fo:table-body>
                            <fo:table-row font-size="12pt" background-color="#EEE" border="1pt solid #888">
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Product no.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm">
                                    <fo:block>Description</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm" text-align="right">
                                    <fo:block>Quantity</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm" text-align="right">
                                    <fo:block>Unit price</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="1mm 2mm" text-align="right">
                                    <fo:block>Total</fo:block>
                                </fo:table-cell>
                            </fo:table-row>

                            <xsl:if test="count(root/invoiceRows/productId) > 0">
                                <xsl:for-each select="root/invoiceRows">
                                    <xsl:variable name="background">
                                        <xsl:choose>
                                            <xsl:when test="position() mod 2 = 0">
                                                <xsl:text>#EEE</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>#FFF</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    
                                    <fo:table-row font-size="8pt" background-color="{$background}">
                                        <fo:table-cell padding="1mm 2mm">
                                            <fo:block><xsl:value-of select="productId"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm 2mm">
                                            <fo:block><xsl:value-of select="description"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm 2mm" text-align="right">
                                            <fo:block><xsl:value-of select="format-number(quantity, '#.0')"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm 2mm" text-align="right">
                                            <fo:block><xsl:value-of select="format-number(unitPrice, '#.00')"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm 2mm" text-align="right">
                                            <fo:block><xsl:value-of select="format-number(quantity * unitPrice, '#.00')"/></fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </xsl:if>

                        </fo:table-body>
                    </fo:table>
                </fo:block>

                <fo:block space-before="20pt" page-break-inside="avoid">
                    <fo:table>
                        <fo:table-column column-width="120mm" />
                        <fo:table-column column-width="10mm" />
                        <fo:table-column column-width="45mm" />
                        <fo:table-body>
                            <fo:table-row font-size="6pt" font-weight="bold">
                                <fo:table-cell padding="0mm 2mm">
                                    <fo:block>Notes</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="0mm 2mm" column-number="3">
                                    <fo:block>Sub total</fo:block>
                                </fo:table-cell>
                            </fo:table-row>                            

                            <xsl:apply-templates select="root/invoiceRows[1]"/>

                        </fo:table-body>
                    </fo:table>
                </fo:block>


            </fo:flow>
        </fo:page-sequence>
    </fo:root>
</xsl:template>


  <xsl:template match="invoiceRows">
        <xsl:param name="runningTotal" select="number('0')"/>
        <xsl:choose>
            <xsl:when test="following-sibling::invoiceRows[1]">
                <xsl:apply-templates select="following-sibling::invoiceRows[1]">
                    <xsl:with-param name="runningTotal" select="$runningTotal + quantity * unitPrice"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
            
                <xsl:variable name="total" select="$runningTotal + quantity * unitPrice"/>
                <xsl:variable name="vat" select="$total * 0.2"/>
                <xsl:variable name="subtotal" select="$total * 0.8"/>

                <fo:table-row font-size="8pt" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <fo:table-cell padding="1mm 2mm" border="1pt solid #888" number-rows-spanned="6">
                        <fo:block><xsl:value-of select="/root/notes"/></fo:block>
                    </fo:table-cell>
                    <fo:table-cell font-size="12pt" padding="1mm 2mm" column-number="3" border="1pt solid #888" text-align="right">
                        <fo:block>
                            <xsl:choose>
                                <xsl:when test="productId">
                                    <xsl:value-of select="format-number($subtotal, '#.00')"/> SEK
                                </xsl:when>
                                <xsl:otherwise>
                                    0.00 SEK
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8pt" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <fo:table-cell padding="2mm 1mm 0mm 2mm" column-number="3" font-size="6pt" font-weight="bold">
                        <fo:block>Vat</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="12pt" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <fo:table-cell padding="1mm 2mm" column-number="3" border="1pt solid #888" text-align="right">
                        <fo:block>
                            <xsl:choose>
                                <xsl:when test="productId">
                                    <xsl:value-of select="format-number($vat, '#.00')"/> SEK
                                </xsl:when>
                                <xsl:otherwise>
                                    0.00 SEK
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="8pt" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <fo:table-cell padding="2mm 1mm 0mm 2mm" column-number="3" font-size="6pt" font-weight="bold">
                        <fo:block>Total price</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row font-size="12pt" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <fo:table-cell padding="1mm 2mm" column-number="3" border="1pt solid #888" text-align="right">
                        <fo:block>
                            <xsl:choose>
                                <xsl:when test="productId">
                                    <xsl:value-of select="format-number($total, '#.00')"/> SEK
                                </xsl:when>
                                <xsl:otherwise>
                                    0.00 SEK
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row xmlns:fo="http://www.w3.org/1999/XSL/Format">
                    <fo:table-cell column-number="3">
                        <fo:block></fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>

    <xsl:template name="billTo">
        <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/billTo/name/title"/>
                <xsl:value-of select="' '"/>
                <xsl:value-of select="root/billTo/name/first"/>
                <xsl:value-of select="' '"/>
                <xsl:value-of select="root/billTo/name/last"/>
            </fo:block>
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/billTo/address1"/>
            </fo:block>
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/billTo/zipCode"/>
                <xsl:value-of select="' '"/>
                <xsl:value-of select="root/billTo/city"/>
            </fo:block>
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/billTo/state"/>
                <xsl:value-of select="', '"/>
                <xsl:value-of select="root/billTo/country"/>
            </fo:block>
        </fo:block>
    </xsl:template>
    <xsl:template name="shipTo">
        <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/shipTo/name/title"/>
                <xsl:value-of select="' '"/>
                <xsl:value-of select="root/shipTo/name/first"/>
                <xsl:value-of select="' '"/>
                <xsl:value-of select="root/shipTo/name/last"/>
            </fo:block>
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/shipTo/address1"/>
            </fo:block>
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/shipTo/zipCode"/>
                <xsl:value-of select="' '"/>
                <xsl:value-of select="root/shipTo/city"/>
            </fo:block>
            <fo:block color="#666666" font-size="10pt" font-family="sans-serif">
                <xsl:value-of select="root/shipTo/state"/>
                <xsl:value-of select="', '"/>
                <xsl:value-of select="root/shipTo/country"/>
            </fo:block>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>