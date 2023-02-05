<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <fo:layout-master-set>
        <fo:simple-page-master master-name="Invoice">
        <fo:region-body margin="30mm"/>
        </fo:simple-page-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="Invoice">
        <fo:flow flow-name="xsl-region-body">

        <!-- Invoice Header -->
            <fo:block font-size="14pt" font-weight="bold" text-align="center" space-after="20pt">
                Invoice
            </fo:block>
            <fo:block font-size="12pt" font-weight="bold">
                Date: <xsl:value-of select="invoice/invoice-date"/>
            </fo:block>
            <fo:block font-size="12pt" font-weight="bold" space-after="20pt">
                Invoice Number: <xsl:value-of select="invoice/invoice-number"/>
            </fo:block>


            <!-- Customer Information -->
            <fo:block font-size="14pt" space-after="20pt">
                <fo:block font-weight="bold">Customer Information:</fo:block>
                <fo:block>
                    <fo:block font-weight="bold">Name:</fo:block>
                    <fo:block>
                    <xsl:value-of select="invoice/customer/name"/>
                    </fo:block>
                </fo:block>
                <fo:block>
                    <fo:block font-weight="bold">Address:</fo:block>
                    <fo:block>
                    <xsl:value-of select="invoice/customer/address/street"/>
                    </fo:block>
                    <fo:block>
                    <xsl:value-of select="invoice/customer/address/city"/>,
                    <xsl:value-of select="invoice/customer/address/state"/>
                    <xsl:value-of select="invoice/customer/address/zip"/>
                    </fo:block>
                </fo:block>
            </fo:block>

            <!-- Company Information -->
            <fo:block font-size="14pt" space-after="20pt">
                <fo:block font-weight="bold">Company Information:</fo:block>
                <fo:block>
                    <fo:block font-weight="bold">Name:</fo:block>
                    <fo:block>
                    <xsl:value-of select="invoice/company/name"/>
                    </fo:block>
                </fo:block>
                <fo:block>
                    <fo:block font-weight="bold">Address:</fo:block>
                    <fo:block>
                    <xsl:value-of select="invoice/company/address/street"/>
                    </fo:block>
                    <fo:block>
                    <xsl:value-of select="invoice/company/address/city"/>,
                    <xsl:value-of select="invoice/company/address/state"/>
                    <xsl:value-of select="invoice/company/address/zip"/>
                    </fo:block>
                </fo:block>
            </fo:block>


        <!-- Invoice Main Body -->
            <fo:block font-size="12pt" font-weight="bold">
                <fo:table border="1pt solid black">
                    <fo:table-column column-width="50mm"/>
                    <fo:table-column column-width="70mm"/>
                    <fo:table-column column-width="30mm"/>
                    <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block>Item</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block>Description</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block>Amount</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <xsl:for-each select="invoice/items/item">
                        <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                            <fo:block><xsl:value-of select="name"/></fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                            <fo:block><xsl:value-of select="description"/></fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                            <fo:block><xsl:value-of select="amount"/></fo:block>
                        </fo:table-cell>
                        </fo:table-row>
                    </xsl:for-each>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3mm" number-columns-spanned="2">
                        <fo:block>Total</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block><xsl:value-of select="sum(invoice/items/item/amount)"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>


        <!-- Invoice Footer -->
            <fo:block font-size="12pt" font-weight="bold">
                <fo:table border="1pt solid black">
                    <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block>Payment Due</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block><xsl:value-of select="invoice/payment-due-date"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block>Total Amount Due</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3mm">
                        <fo:block><xsl:value-of select="sum(invoice/items/item/amount)"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>

        </fo:flow>
    </fo:page-sequence>
    </fo:root>
</xsl:template>
</xsl:stylesheet>