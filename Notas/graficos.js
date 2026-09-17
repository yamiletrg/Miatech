/**
 * Panel de Progresión de Volumen para ExtJS 6.5
 * Gráfico de líneas que muestra la tendencia de solicitudes por agente
 */

Ext.define('MyApp.view.charts.VolumeProgressionPanel', {
    extend: 'Ext.panel.Panel',
    xtype: 'volumeprogressionpanel',
    
    requires: [
        'Ext.chart.CartesianChart',
        'Ext.chart.series.Line',
        'Ext.chart.axis.Numeric',
        'Ext.chart.axis.Category',
        'Ext.chart.interactions.ItemHighlight'
    ],
    
    title: 'Progresión de Volumen',
    iconCls: 'fa fa-line-chart',
    layout: 'fit',
    
    bodyPadding: 10,
    
    items: [{
        xtype: 'cartesian',
        reference: 'volumeChart',
        
        // Store con los datos
        store: {
            fields: [
                'auasi',
                'total',
                'orden',
                'prom_min',
                'eficiencia'
            ],
            data: [
                { orden: 1, auasi: 'MAGALIT', total: 141, prom_min: 4.00, eficiencia: 67.4 },
                { orden: 2, auasi: 'KARENCT', total: 121, prom_min: 5.00, eficiencia: 38.0 },
                { orden: 3, auasi: 'LRAMOST', total: 107, prom_min: 6.00, eficiencia: 55.1 },
                { orden: 4, auasi: 'JTARDILLOT', total: 101, prom_min: 6.00, eficiencia: 54.5 },
                { orden: 5, auasi: 'ROCIOST', total: 98, prom_min: 6.00, eficiencia: 36.7 },
                { orden: 6, auasi: 'ABRINGAST', total: 59, prom_min: 8.00, eficiencia: 47.5 }
            ]
        },
        
        // Colores y tema
        colors: [
            '#3b82f6', // Azul para línea principal
            '#8b5cf6'  // Púrpura para área
        ],
        
        // Interacciones
        interactions: [{
            type: 'itemhighlight'
        }, {
            type: 'panzoom',
            zoomOnPanGesture: false
        }],
        
        // Sprites (efectos visuales)
        sprites: [{
            type: 'text',
            text: 'Solicitudes Procesadas',
            fontSize: 14,
            x: 70,
            y: 20,
            fill: '#666'
        }],
        
        // Ejes
        axes: [{
            type: 'numeric',
            position: 'left',
            title: {
                text: 'Total de Solicitudes',
                fontSize: 14
            },
            fields: ['total'],
            minimum: 0,
            grid: {
                odd: {
                    fill: '#f5f5f5'
                }
            },
            label: {
                color: '#333',
                fontSize: 12
            }
        }, {
            type: 'category',
            position: 'bottom',
            title: {
                text: 'Agente',
                fontSize: 14
            },
            fields: ['auasi'],
            label: {
                color: '#333',
                fontSize: 11,
                rotate: {
                    degrees: -45
                }
            }
        }],
        
        // Series de datos
        series: [{
            type: 'line',
            xField: 'auasi',
            yField: 'total',
            style: {
                stroke: '#3b82f6',
                lineWidth: 3
            },
            marker: {
                type: 'circle',
                radius: 6,
                fill: '#3b82f6',
                stroke: '#ffffff',
                strokeWidth: 2
            },
            highlight: {
                size: 8,
                radius: 8
            },
            tooltip: {
                trackMouse: true,
                renderer: function (tooltip, record, item) {
                    tooltip.setHtml(
                        '<div style="padding: 8px;">' +
                        '<strong>' + record.get('auasi') + '</strong><br/>' +
                        'Total: <strong>' + record.get('total') + '</strong> solicitudes<br/>' +
                        'Promedio: <strong>' + record.get('prom_min') + '</strong> min<br/>' +
                        'Eficiencia: <strong>' + record.get('eficiencia') + '%</strong>' +
                        '</div>'
                    );
                }
            }
        }]
    }],
    
    // Barra de herramientas superior
    tbar: [{
        text: 'Actualizar',
        iconCls: 'fa fa-refresh',
        handler: 'onRefreshChart'
    }, {
        text: 'Exportar PNG',
        iconCls: 'fa fa-download',
        handler: 'onDownloadChart'
    }, '->', {
        xtype: 'tbtext',
        html: '<i class="fa fa-info-circle"></i> Haga clic en los puntos para más detalles'
    }],
    
    // Barra inferior con estadísticas
    bbar: [{
        xtype: 'component',
        reference: 'statsBar',
        style: {
            padding: '5px',
            fontSize: '12px',
            color: '#666'
        },
        html: '<strong>Total General:</strong> 627 solicitudes | ' +
              '<strong>Promedio:</strong> 5.83 min | ' +
              '<strong>Mayor Volumen:</strong> MAGALIT (141)'
    }]
});

// ============================================
// CONTROLADOR
// ============================================

Ext.define('MyApp.view.charts.VolumeProgressionController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.volumeprogression',
    
    /**
     * Actualiza los datos del gráfico
     */
    onRefreshChart: function() {
        var chart = this.lookup('volumeChart');
        var store = chart.getStore();
        
        // Simular actualización de datos
        Ext.Msg.wait('Actualizando datos...', 'Cargando');
        
        Ext.defer(function() {
            store.loadData([
                { orden: 1, auasi: 'MAGALIT', total: 145, prom_min: 3.8, eficiencia: 68.2 },
                { orden: 2, auasi: 'KARENCT', total: 125, prom_min: 4.9, eficiencia: 39.0 },
                { orden: 3, auasi: 'LRAMOST', total: 110, prom_min: 5.8, eficiencia: 56.0 },
                { orden: 4, auasi: 'JTARDILLOT', total: 105, prom_min: 5.9, eficiencia: 55.0 },
                { orden: 5, auasi: 'ROCIOST', total: 102, prom_min: 5.8, eficiencia: 38.0 },
                { orden: 6, auasi: 'ABRINGAST', total: 63, prom_min: 7.8, eficiencia: 48.5 }
            ]);
            
            Ext.Msg.hide();
            Ext.toast({
                html: 'Datos actualizados correctamente',
                title: 'Éxito',
                align: 'tr',
                iconCls: 'fa fa-check-circle'
            });
        }, 1500);
    },
    
    /**
     * Descarga el gráfico como imagen PNG
     */
    onDownloadChart: function() {
        var chart = this.lookup('volumeChart');
        
        if (chart) {
            chart.download({
                filename: 'progresion_volumen_' + Ext.Date.format(new Date(), 'Y-m-d_His'),
                format: 'png'
            });
            
            Ext.toast({
                html: 'Descargando gráfico...',
                title: 'Exportar',
                align: 'tr',
                iconCls: 'fa fa-download'
            });
        }
    }
});

// ============================================
// EJEMPLO DE USO EN UNA VENTANA
// ============================================

Ext.define('MyApp.view.VolumeWindow', {
    extend: 'Ext.window.Window',
    xtype: 'volumewindow',
    
    title: 'Dashboard - Progresión de Volumen',
    iconCls: 'fa fa-bar-chart',
    
    width: 800,
    height: 500,
    
    layout: 'fit',
    modal: true,
    
    items: [{
        xtype: 'volumeprogressionpanel',
        controller: 'volumeprogression'
    }],
    
    buttons: [{
        text: 'Cerrar',
        iconCls: 'fa fa-times',
        handler: function(btn) {
            btn.up('window').close();
        }
    }]
});

// ============================================
// INICIALIZACIÓN Y APERTURA
// ============================================

/**
 * Para abrir la ventana con el gráfico:
 * 
 * Ext.create('MyApp.view.VolumeWindow').show();
 */

// ============================================
// VARIANTE: PANEL PARA DASHBOARD
// ============================================

Ext.define('MyApp.view.dashboard.VolumeProgressionCard', {
    extend: 'Ext.panel.Panel',
    xtype: 'volumecard',
    
    title: '<i class="fa fa-line-chart"></i> Progresión de Volumen',
    
    width: 500,
    height: 350,
    
    layout: 'fit',
    
    bodyPadding: 5,
    
    tools: [{
        type: 'refresh',
        tooltip: 'Actualizar datos',
        callback: function(panel) {
            panel.down('cartesian').getStore().reload();
        }
    }, {
        type: 'maximize',
        tooltip: 'Maximizar',
        callback: function(panel) {
            Ext.create('MyApp.view.VolumeWindow').show();
        }
    }],
    
    items: [{
        xtype: 'cartesian',
        
        store: {
            fields: ['auasi', 'total', 'prom_min'],
            data: [
                { auasi: 'MAGALIT', total: 141, prom_min: 4.00 },
                { auasi: 'KARENCT', total: 121, prom_min: 5.00 },
                { auasi: 'LRAMOST', total: 107, prom_min: 6.00 },
                { auasi: 'JTARDILLOT', total: 101, prom_min: 6.00 },
                { auasi: 'ROCIOST', total: 98, prom_min: 6.00 },
                { auasi: 'ABRINGAST', total: 59, prom_min: 8.00 }
            ]
        },
        
        theme: 'blue',
        
        interactions: ['itemhighlight'],
        
        axes: [{
            type: 'numeric',
            position: 'left',
            fields: ['total'],
            grid: true,
            minimum: 0
        }, {
            type: 'category',
            position: 'bottom',
            fields: ['auasi'],
            label: {
                rotate: {
                    degrees: -45
                }
            }
        }],
        
        series: [{
            type: 'line',
            xField: 'auasi',
            yField: 'total',
            style: {
                stroke: '#3b82f6',
                lineWidth: 3
            },
            marker: {
                radius: 5,
                fill: '#3b82f6'
            },
            tooltip: {
                trackMouse: true,
                renderer: function(tooltip, record) {
                    tooltip.setHtml(
                        '<b>' + record.get('auasi') + '</b><br/>' +
                        'Total: ' + record.get('total') + '<br/>' +
                        'Promedio: ' + record.get('prom_min') + ' min'
                    );
                }
            }
        }]
    }]
});

// ============================================
// EJEMPLO DE INTEGRACIÓN EN DASHBOARD
// ============================================

/**
 * Uso en un dashboard principal:
 * 
 * {
 *     xtype: 'panel',
 *     title: 'Dashboard de Productividad',
 *     layout: {
 *         type: 'hbox',
 *         align: 'stretch'
 *     },
 *     items: [{
 *         xtype: 'volumecard',
 *         flex: 1,
 *         margin: '0 10 0 0'
 *     }, {
 *         xtype: 'otrocard',
 *         flex: 1
 *     }]
 * }
 */