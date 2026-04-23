<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Inventario del Laboratorio de Hardware</title>
                <style>
                    body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #f4f7f6; color: #333; margin: 40px; }
                    h2 { color: #2c3e50; text-align: center; }
                    table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
                    th { background-color: #34495e; color: white; padding: 12px; text-align: left; }
                    td { padding: 10px; border-bottom: 1px solid #ddd; }
                    tr:hover { background-color: #f1f1f1; }
                    .status-alert { color: #e74c3c; font-weight: bold; }
                    .footer { margin-top: 20px; font-weight: bold; background: #ecf0f1; padding: 15px; border-radius: 5px; }
                    ul { padding-left: 20px; margin: 0; font-size: 0.9em; }
                </style>
            </head>
            <body>
                <h2>Inventario de Equipamiento Técnico</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Categoría</th>
                        <th>Marca</th>
                        <th>Estado</th>
                        <th>Especificaciones</th>
                    </tr>
                    <xsl:for-each select="laboratorio/dispositivo">
                        <tr>
                            <td><xsl:value-of select="id"/></td>
                            <td><strong><xsl:value-of select="nombre"/></strong></td>
                            <td><xsl:value-of select="categoria"/></td>
                            <td><xsl:value-of select="marca"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="estado = 'Mantenimiento'">
                                        <span class="status-alert"><xsl:value-of select="estado"/></span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="estado"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="especificaciones/especificacion">
                                        <li>
                                            <xsl:value-of select="@clave"/>: <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <div class="footer">
                    Total de dispositivos registrados: <xsl:value-of select="count(laboratorio/dispositivo)"/>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>