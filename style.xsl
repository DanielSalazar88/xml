<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="categoryFilter" select="''" />

    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html>
            <head>
                <!-- Enlace al archivo CSS de Bootstrap -->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
                
                <!-- Script de JavaScript para aplicar el filtro -->
                <script src="functions.js">
            
                </script>
            </head>
            <body>
                <div class="container mt-4" id="container">
                    <!-- Contenido generado por XSLT -->
                    <div id="output">
                        <h2 class="text-center">Elementos</h2>

                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>NOMBRE</th>
                                        <th>VALOR</th>
                                        <th>CATEGORIA</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="/items/item[not($categoryFilter) or contains(@category, $categoryFilter)]">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="name"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="value"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="category"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>

                        <div class="mt-4">
                            <p class="font-weight-bold">
                                Valor Total: 
                                <xsl:value-of select="sum(/items/item[not($categoryFilter) or contains(@category, $categoryFilter)]/value)"/>
                            </p>
                            <p class="font-weight-bold">
                                Porcentaje del Total: 
                                <xsl:value-of select="
                                    format-number(
                                        (sum(/items/item[not($categoryFilter) or contains(@category, $categoryFilter)]/value) 
                                        div 
                                        sum(/items/item/value)) * 100, 
                                        '0.00'
                                    )
                                "/>
                                %
                            </p>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
