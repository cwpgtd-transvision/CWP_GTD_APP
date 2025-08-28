$(document).ready(function () {
    Highcharts.chart("Linecontainer1", {
        chart: { type: "line" },
        title: { text: "Sample Stock Market Data" },
        subtitle: { text: "Source: Sample Data" },
        xAxis: {
            categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]
        },
        yAxis: {
            title: { text: "Stock Price (USD)" }
        },
        tooltip: {
            shared: true,
            valueSuffix: " USD"
        },
        series: [
            { name: "Company A", data: [120, 130, 125, 140, 150, 145, 160] },
            { name: "Company B", data: [100, 110, 105, 115, 120, 130, 135] },
            { name: "Company C", data: [90, 95, 100, 105, 110, 120, 125] }
        ],
        exporting: { enabled: true },
        exportData: { enabled: true, showTable: true },
        credits: { enabled: false }
    });

    Highcharts.chart("splinecontainer1", {
        chart: { type: "spline" },
        title: { text: "Sample Stock Market Data - Spline Chart" },
        subtitle: { text: "Source: Sample Data" },
        xAxis: {
            categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]
        },
        yAxis: {
            title: { text: "Stock Price (USD)" }
        },
        tooltip: {
            shared: true,
            valueSuffix: " USD"
        },
        series: [
            { name: "Company A", data: [120, 130, 125, 140, 150, 145, 160] },
            { name: "Company B", data: [100, 110, 105, 115, 120, 130, 135] },
            { name: "Company C", data: [90, 95, 100, 105, 110, 120, 125] }
        ],
        exporting: { enabled: true },
        exportData: { enabled: true, showTable: true },
        credits: { enabled: false }
    });


    Highcharts.chart('areacontainer', {
        chart: {
            type: 'area',
            backgroundColor: 'rgba(255, 255, 255, 0.0)' // Transparent background for the chart area
        },
        title: {
            text: 'Stock Price Comparison for Companies A, B, and C (January 2025)'
        },
        xAxis: {
            categories: [
                '01-01-2025', '02-01-2025', '03-01-2025', '04-01-2025', '05-01-2025',
                '06-01-2025', '07-01-2025', '08-01-2025', '09-01-2025', '10-01-2025',
                '11-01-2025', '12-01-2025', '13-01-2025', '14-01-2025', '15-01-2025',
                '16-01-2025', '17-01-2025', '18-01-2025', '19-01-2025', '20-01-2025',
                '21-01-2025', '22-01-2025', '23-01-2025', '24-01-2025', '25-01-2025',
                '26-01-2025', '27-01-2025', '28-01-2025', '29-01-2025', '30-01-2025',
                '31-01-2025'
            ]
        },
        yAxis: {
            title: {
                text: 'Stock Price (USD)'
            }
        },
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false,
            //backgroundColor: 'rgba(255, 255, 255, 0.8)',
            borderWidth: 0
        },
        series: [{
            name: 'Company A',
            data: [100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150, 152, 154, 156, 158, 160],
            //fillColor: 'rgba(255, 99, 71, 0.5)' // Tomato with 50% transparency
        }, {
            name: 'Company B',
            data: [90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150],
            //fillColor: 'rgba(60, 179, 113, 0.5)' // Medium Sea Green with 50% transparency
        }, {
            name: 'Company C',
            data: [80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140],
            //fillColor: 'rgba(30, 144, 255, 0.5)' // Dodger Blue with 50% transparency
        }]
    });


    // area 2

    Highcharts.chart('areacontainer1', {
        chart: {
            type: 'area'
        },
        title: {
            text: 'Percentage Stacked Area Chart for January 2025'
        },
        xAxis: {
            categories: [
                '01-01-2025', '02-01-2025', '03-01-2025', '04-01-2025', '05-01-2025',
                '06-01-2025', '07-01-2025', '08-01-2025', '09-01-2025', '10-01-2025',
                '11-01-2025', '12-01-2025', '13-01-2025', '14-01-2025', '15-01-2025',
                '16-01-2025', '17-01-2025', '18-01-2025', '19-01-2025', '20-01-2025',
                '21-01-2025', '22-01-2025', '23-01-2025', '24-01-2025', '25-01-2025',
                '26-01-2025', '27-01-2025', '28-01-2025', '29-01-2025', '30-01-2025',
                '31-01-2025'
            ],
            title: {
                text: 'Dates in January 2025'
            }
        },
        yAxis: {
            title: {
                text: 'Percentage'
            },
            max: 100
        },
        tooltip: {
            shared: true,
            valueSuffix: '%'
        },
        plotOptions: {
            area: {
                stacking: 'percent',
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: [{
            name: 'Company A',
            data: [30, 32, 31, 30, 29, 31, 30, 32, 31, 30, 29, 30, 31, 32, 30, 29, 30, 31, 30, 29, 30, 31, 32, 31, 30, 29, 30, 31, 32, 30, 29, 30],
            color: '#FF5733' // Red-Orange
        }, {
            name: 'Company B',
            data: [40, 39, 40, 41, 40, 39, 40, 39, 40, 41, 40, 39, 40, 41, 40, 39, 40, 41, 40, 39, 40, 41, 40, 39, 40, 41, 40, 39, 40, 41, 40, 39],
            color: '#33FF57' // Green
        }, {
            name: 'Company C',
            data: [30, 29, 29, 29, 31, 30, 30, 29, 29, 29, 31, 30, 29, 30, 29, 31, 30, 30, 31, 30, 30, 29, 29, 30, 31, 30, 30, 29, 28, 29, 30, 31],
            color: '#3357FF' // Blue
        }]
    });

    Highcharts.chart('linecontainerZoomInOut', {
        chart: {
            type: 'line',
            zoomType: 'x'
        },
        title: {
            text: 'Stock Price Comparison for Companies A, B, and C (January 2025)'
        },
        xAxis: {
            type: 'datetime',
            title: {
                text: 'Date'
            },
            dateTimeLabelFormats: {
                day: '%e %b'
            }
        },
        yAxis: {
            title: {
                text: 'Stock Price (USD)'
            }
        },
        series: [{
            name: 'Company A',
            data: [
                [Date.UTC(2025, 0, 1), 150],
                [Date.UTC(2025, 0, 2), 155],
                [Date.UTC(2025, 0, 3), 160],
                [Date.UTC(2025, 0, 4), 158],
                [Date.UTC(2025, 0, 5), 162],
                [Date.UTC(2025, 0, 6), 165],
                [Date.UTC(2025, 0, 7), 170],
                [Date.UTC(2025, 0, 8), 172],
                [Date.UTC(2025, 0, 9), 175],
                [Date.UTC(2025, 0, 10), 180]
            ]
        }, {
            name: 'Company B',
            data: [
                [Date.UTC(2025, 0, 1), 200],
                [Date.UTC(2025, 0, 2), 195],
                [Date.UTC(2025, 0, 3), 198],
                [Date.UTC(2025, 0, 4), 202],
                [Date.UTC(2025, 0, 5), 205],
                [Date.UTC(2025, 0, 6), 210],
                [Date.UTC(2025, 0, 7), 215],
                [Date.UTC(2025, 0, 8), 220],
                [Date.UTC(2025, 0, 9), 225],
                [Date.UTC(2025, 0, 10), 230]
            ]
        }, {
            name: 'Company C',
            data: [
                [Date.UTC(2025, 0, 1), 100],
                [Date.UTC(2025, 0, 2), 102],
                [Date.UTC(2025, 0, 3), 105],
                [Date.UTC(2025, 0, 4), 107],
                [Date.UTC(2025, 0, 5), 110],
                [Date.UTC(2025, 0, 6), 112],
                [Date.UTC(2025, 0, 7), 115],
                [Date.UTC(2025, 0, 8), 118],
                [Date.UTC(2025, 0, 9), 120],
                [Date.UTC(2025, 0, 10), 125]
            ]
        }]
    });
    Highcharts.chart('areacontainerZoomInOut', {
        chart: {
            type: 'area',
            zoomType: 'x'
        },
        title: {
            text: 'Stock Price Comparison for Companies A, B, and C (January 2025)'
        },
        xAxis: {
            type: 'datetime',
            title: {
                text: 'Date'
            },
            dateTimeLabelFormats: {
                day: '%e %b'
            }
        },
        yAxis: {
            title: {
                text: 'Stock Price (USD)'
            }
        },
        plotOptions: {
            area: {
                fillOpacity: 0.6
            }
        },
        series: [{
            name: 'Company A',
            //color: '#FF6F61', // Coral color
            data: [
                [Date.UTC(2025, 0, 1), 150],
                [Date.UTC(2025, 0, 2), 155],
                [Date.UTC(2025, 0, 3), 160],
                [Date.UTC(2025, 0, 4), 158],
                [Date.UTC(2025, 0, 5), 162],
                [Date.UTC(2025, 0, 6), 165],
                [Date.UTC(2025, 0, 7), 170],
                [Date.UTC(2025, 0, 8), 172],
                [Date.UTC(2025, 0, 9), 175],
                [Date.UTC(2025, 0, 10), 180]
            ]
        }, {
            name: 'Company B',
            //color: '#6FA3EF', // Sky blue color
            data: [
                [Date.UTC(2025, 0, 1), 200],
                [Date.UTC(2025, 0, 2), 195],
                [Date.UTC(2025, 0, 3), 198],
                [Date.UTC(2025, 0, 4), 202],
                [Date.UTC(2025, 0, 5), 205],
                [Date.UTC(2025, 0, 6), 210],
                [Date.UTC(2025, 0, 7), 215],
                [Date.UTC(2025, 0, 8), 220],
                [Date.UTC(2025, 0, 9), 225],
                [Date.UTC(2025, 0, 10), 230]
            ]
        }, {
            name: 'Company C',
            //color: '#FFD700', // Gold color
            data: [
                [Date.UTC(2025, 0, 1), 100],
                [Date.UTC(2025, 0, 2), 102],
                [Date.UTC(2025, 0, 3), 105],
                [Date.UTC(2025, 0, 4), 107],
                [Date.UTC(2025, 0, 5), 110],
                [Date.UTC(2025, 0, 6), 112],
                [Date.UTC(2025, 0, 7), 115],
                [Date.UTC(2025, 0, 8), 118],
                [Date.UTC(2025, 0, 9), 120],
                [Date.UTC(2025, 0, 10), 125]
            ]
        }]
    });


    Highcharts.chart('BarGraphcontainer', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Stock Price Comparison for Companies A, B, and C (January 2025)'
        },
        xAxis: {
            categories: ['Company A', 'Company B', 'Company C'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Stock Price (USD)',
                align: 'high'
            }
        },
        tooltip: {
            valueSuffix: ' USD'
        },
        series: [{
            name: 'Stock Price',
            data: [180, 230, 125] // Sample data for each company
        }]
    });

    Highcharts.chart('StackedBarGraphcontainer', {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Stacked Stock Price Comparison for Companies A, B, and C (January 2025)'
        },
        xAxis: {
            categories: ['Company A', 'Company B', 'Company C'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Stock Price (USD)',
                align: 'high'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.defaultOptions.title.style && Highcharts.defaultOptions.title.style.color) || 'gray'
                }
            }
        },
        tooltip: {
            formatter: function () {
                return this.series.name + ': ' + this.y + ' USD';
            }
        },
        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },
        series: [{
            name: 'Stock Price A',
            data: [50, 70, 30] // Sample data for each company
        }, {
            name: 'Stock Price B',
            data: [80, 60, 40] // Sample data for each company
        }, {
            name: 'Stock Price C',
            data: [30, 40, 20] // Sample data for each company
        }]
    });

    // coloumn charts
    Highcharts.chart('ColumnGraphcontainer', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Sales Figures for Products in 2025'
        },
        xAxis: {
            categories: ['Product A', 'Product B', 'Product C', 'Product D'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Sales (units)',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' units'
        },
        series: [{
            name: 'Sales',
            data: [1600, 2100, 1900, 2400] // Made-up data for demonstration
        }]
    });

    Highcharts.chart('ColumnComparisionGraphcontainer', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Sales Comparison of Companies in 2025'
        },
        xAxis: {
            categories: ['Q1', 'Q2', 'Q3', 'Q4'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Sales (units)',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' units'
        },
        series: [{
            name: 'Company A',
            data: [3000, 3200, 3500, 4000] // Made-up data for demonstration
        }, {
            name: 'Company B',
            data: [2800, 3100, 3300, 3900] // Made-up data for demonstration
        }, {
            name: 'Company C',
            data: [2500, 2900, 3000, 3700] // Made-up data for demonstration
        }]
    });


    Highcharts.chart('3dcolumncontainer', {
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 30,
                depth: 250,
                viewDistance: 5,
                frame: {
                    back: { size: 1, color: 'rgba(255, 255, 255, 0.1)' },
                    front: { size: 1, color: 'rgba(255, 255, 255, 0.1)' },
                    right: { size: 1, color: 'rgba(255, 255, 255, 0.1)' },
                    left: { size: 1, color: 'rgba(255, 255, 255, 0.1)' },
                    top: { size: 1, color: 'rgba(255, 255, 255, 0.1)' },
                    bottom: { size: 1, color: 'rgba(255, 255, 255, 0.1)' }
                }
            }
        },
        title: {
            text: '3D Sales Comparison of Fruits'
        },
        xAxis: {
            categories: ['Apples', 'Bananas', 'Cherries', 'Dates', 'Elderberries'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Sales (units)',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' units'
        },
        series: [{
            name: 'Apples',
            data: [1200], // Made-up data for demonstration
            color: '#FF0000' // Red
        }, {
            name: 'Bananas',
            data: [1500], // Made-up data for demonstration
            color: '#FFFF00' // Yellow
        }, {
            name: 'Cherries',
            data: [800], // Made-up data for demonstration
            color: '#FF007F' // Pink
        }, {
            name: 'Dates',
            data: [600], // Made-up data for demonstration
            color: '#8B4513' // Brown
        }, {
            name: 'Elderberries',
            data: [900], // Made-up data for demonstration
            color: '#4B0082' // Indigo
        }]
    });



    Highcharts.chart('3dcolumnComarisioncontainer', {
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 30,
                depth: 250,
                viewDistance: 25,
                frame: {
                    back: {
                        color: 'rgba(255, 255, 255, 0.1)',
                        size: 1,
                        solidity: 100
                    },
                    front: {
                        color: 'rgba(255, 255, 255, 0.1)',
                        size: 1,
                        solidity: 100
                    },
                    right: {
                        color: 'rgba(255, 255, 255, 0.1)',
                        size: 1,
                        solidity: 100
                    },
                    left: {
                        color: 'rgba(255, 255, 255, 0.1)',
                        size: 1,
                        solidity: 100
                    },
                    back: {
                        color: 'rgba(0, 0, 0, 0.1)',
                        size: 1,
                        solidity: 100
                    }
                }
            }
        },
        title: {
            text: '3D Column Chart Example'
        },
        xAxis: {
            categories: ['Category A', 'Category B', 'Category C', 'Category D', 'Category E']
        },
        yAxis: {
            title: {
                text: 'Values'
            }
        },
        series: [{
            name: 'Series 1',
            data: [5, 3, 4, 7, 2],
            color: '#FF5733' // Red-Orange
        }, {
            name: 'Series 2',
            data: [2, 2, 3, 2, 1],
            color: '#33FF57' // Green
        }, {
            name: 'Series 3',
            data: [3, 4, 4, 2, 5],
            color: '#3357FF' // Blue
        }, {
            name: 'Series 4',
            data: [3, 3, 2, 5, 4],
            color: '#FFD700' // Gold
        }]
    });


    // column drolldown graph

    Highcharts.chart('columndrolldowngraphcontainer', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Browser market shares. January, 2022'
        },
        subtitle: {
            text: 'Click the columns to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
        },
        accessibility: {
            announceNewData: {
                enabled: true
            }
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Total percent market share'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y:.1f}%'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: ' +
                '<b>{point.y:.2f}%</b> of total<br/>'
        },

        series: [
            {
                name: 'Browsers',
                colorByPoint: true,
                data: [
                    {
                        name: 'Chrome',
                        y: 63.06,
                        drilldown: 'Chrome'
                    },
                    {
                        name: 'Safari',
                        y: 19.84,
                        drilldown: 'Safari'
                    },
                    {
                        name: 'Firefox',
                        y: 4.18,
                        drilldown: 'Firefox'
                    },
                    {
                        name: 'Edge',
                        y: 4.12,
                        drilldown: 'Edge'
                    },
                    {
                        name: 'Opera',
                        y: 2.33,
                        drilldown: 'Opera'
                    },
                    {
                        name: 'Internet Explorer',
                        y: 0.45,
                        drilldown: 'Internet Explorer'
                    },
                    {
                        name: 'Other',
                        y: 1.582,
                        drilldown: null
                    }
                ]
            }
        ],
        drilldown: {
            breadcrumbs: {
                position: {
                    align: 'right'
                }
            },
            series: [
                {
                    name: 'Chrome',
                    id: 'Chrome',
                    data: [
                        [
                            'v65.0',
                            0.1
                        ],
                        [
                            'v64.0',
                            1.3
                        ],
                        [
                            'v63.0',
                            53.02
                        ],
                        [
                            'v62.0',
                            1.4
                        ],
                        [
                            'v61.0',
                            0.88
                        ],
                        [
                            'v60.0',
                            0.56
                        ],
                        [
                            'v59.0',
                            0.45
                        ],
                        [
                            'v58.0',
                            0.49
                        ],
                        [
                            'v57.0',
                            0.32
                        ],
                        [
                            'v56.0',
                            0.29
                        ],
                        [
                            'v55.0',
                            0.79
                        ],
                        [
                            'v54.0',
                            0.18
                        ],
                        [
                            'v51.0',
                            0.13
                        ],
                        [
                            'v49.0',
                            2.16
                        ],
                        [
                            'v48.0',
                            0.13
                        ],
                        [
                            'v47.0',
                            0.11
                        ],
                        [
                            'v43.0',
                            0.17
                        ],
                        [
                            'v29.0',
                            0.26
                        ]
                    ]
                },
                {
                    name: 'Firefox',
                    id: 'Firefox',
                    data: [
                        [
                            'v58.0',
                            1.02
                        ],
                        [
                            'v57.0',
                            7.36
                        ],
                        [
                            'v56.0',
                            0.35
                        ],
                        [
                            'v55.0',
                            0.11
                        ],
                        [
                            'v54.0',
                            0.1
                        ],
                        [
                            'v52.0',
                            0.95
                        ],
                        [
                            'v51.0',
                            0.15
                        ],
                        [
                            'v50.0',
                            0.1
                        ],
                        [
                            'v48.0',
                            0.31
                        ],
                        [
                            'v47.0',
                            0.12
                        ]
                    ]
                },
                {
                    name: 'Internet Explorer',
                    id: 'Internet Explorer',
                    data: [
                        [
                            'v11.0',
                            6.2
                        ],
                        [
                            'v10.0',
                            0.29
                        ],
                        [
                            'v9.0',
                            0.27
                        ],
                        [
                            'v8.0',
                            0.47
                        ]
                    ]
                },
                {
                    name: 'Safari',
                    id: 'Safari',
                    data: [
                        [
                            'v11.0',
                            3.39
                        ],
                        [
                            'v10.1',
                            0.96
                        ],
                        [
                            'v10.0',
                            0.36
                        ],
                        [
                            'v9.1',
                            0.54
                        ],
                        [
                            'v9.0',
                            0.13
                        ],
                        [
                            'v5.1',
                            0.2
                        ]
                    ]
                },
                {
                    name: 'Edge',
                    id: 'Edge',
                    data: [
                        [
                            'v16',
                            2.6
                        ],
                        [
                            'v15',
                            0.92
                        ],
                        [
                            'v14',
                            0.4
                        ],
                        [
                            'v13',
                            0.1
                        ]
                    ]
                },
                {
                    name: 'Opera',
                    id: 'Opera',
                    data: [
                        [
                            'v50.0',
                            0.96
                        ],
                        [
                            'v49.0',
                            0.82
                        ],
                        [
                            'v12.1',
                            0.14
                        ]
                    ]
                }
            ]
        }
    });

    Highcharts.chart('ColumnWithRotatedLablescontainer', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'World\'s largest cities per 2021'
        },
        subtitle: {
            text: 'Source: <a href="https://worldpopulationreview.com/world-cities" target="_blank">World Population Review</a>'
        },
        xAxis: {
            type: 'category',
            labels: {
                autoRotation: [-45, -90],
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Population (millions)'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Population in 2021: <b>{point.y:.1f} millions</b>'
        },
        series: [{
            name: 'Population',
            colors: [
                '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
                '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
                '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
                '#03c69b', '#00f194'
            ],
            colorByPoint: true,
            groupPadding: 0,
            data: [
                ['Tokyo', 37.33],
                ['Delhi', 31.18],
                ['Shanghai', 27.79],
                ['Sao Paulo', 22.23],
                ['Mexico City', 21.91],
                ['Dhaka', 21.74],
                ['Cairo', 21.32],
                ['Beijing', 20.89],
                ['Mumbai', 20.67],
                ['Osaka', 19.11],
                ['Karachi', 16.45],
                ['Chongqing', 16.38],
                ['Istanbul', 15.41],
                ['Buenos Aires', 15.25],
                ['Kolkata', 14.974],
                ['Kinshasa', 14.970],
                ['Lagos', 14.86],
                ['Manila', 14.16],
                ['Tianjin', 13.79],
                ['Guangzhou', 13.64]
            ],
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                inside: true,
                verticalAlign: 'top',
                format: '{point.y:.1f}', // one decimal
                y: 10, // 10 pixels down from the top
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });

    Highcharts.chart('PieChartcontainer', {
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Fruit Consumption (2D Pie Chart)'
        },
        series: [{
            name: 'Fruits',
            data: [
                { name: 'Apples', y: 30 },
                { name: 'Bananas', y: 20 },
                { name: 'Oranges', y: 25 },
                { name: 'Grapes', y: 15 },
                { name: 'Pineapples', y: 10 }
            ],
            showInLegend: true // Ensures the legend is displayed
        }],
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });

    Highcharts.chart('3dPieChartcontainer', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Fruit Consumption (3D Pie Chart)'
        },
        plotOptions: {
            pie: {
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: <b>{point.y}</b>'
                }
            }
        },
        series: [{
            name: 'Fruits',
            data: [
                { name: 'Apples', y: 30 },
                { name: 'Bananas', y: 20 },
                { name: 'Oranges', y: 25 },
                { name: 'Grapes', y: 15 },
                { name: 'Pineapples', y: 10 }
            ],
            showInLegend: true // Ensures the legend is displayed
        }],
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });

    Highcharts.chart('Donutcontainer', {
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Fruit Consumption (2D Donut Chart)'
        },
        plotOptions: {
            pie: {
                innerSize: '50%', // This creates the donut effect
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: <b>{point.y}</b>'
                }
            }
        },
        series: [{
            name: 'Fruits',
            data: [
                { name: 'Apples', y: 30 },
                { name: 'Bananas', y: 20 },
                { name: 'Oranges', y: 25 },
                { name: 'Grapes', y: 15 },
                { name: 'Pineapples', y: 10 }
            ],
            showInLegend: true // Ensures the legend is displayed
        }],
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });



    Highcharts.chart('Donut3dcontainer', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Fruit Consumption (3D Donut Chart)'
        },
        plotOptions: {
            pie: {
                innerSize: '50%', // This creates the donut effect
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: <b>{point.y}</b>'
                }
            }
        },
        series: [{
            name: 'Fruits',
            data: [
                { name: 'Apples', y: 30 },
                { name: 'Bananas', y: 20 },
                { name: 'Oranges', y: 25 },
                { name: 'Grapes', y: 15 },
                { name: 'Pineapples', y: 10 }
            ],
            showInLegend: true // Ensures the legend is displayed
        }],
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });

    Highcharts.chart('DonutDrillDowncontainer', {
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Browser Market Shares (2D Donut Chart)'
        },
        plotOptions: {
            pie: {
                innerSize: '50%', // This creates the donut effect
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: <b>{point.y}</b>'
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Browsers',
            data: [
                {
                    name: 'Chrome',
                    y: 60,
                    drilldown: 'chrome'
                },
                {
                    name: 'Firefox',
                    y: 15,
                    drilldown: 'firefox'
                },
                {
                    name: 'Safari',
                    y: 10,
                    drilldown: 'safari'
                },
                {
                    name: 'Edge',
                    y: 10,
                    drilldown: 'edge'
                },
                {
                    name: 'Others',
                    y: 5
                }
            ]
        }],
        drilldown: {
            series: [
                {
                    id: 'chrome',
                    name: 'Chrome Versions',
                    data: [
                        ['Chrome 90', 30],
                        ['Chrome 89', 20],
                        ['Chrome 88', 10]
                    ]
                },
                {
                    id: 'firefox',
                    name: 'Firefox Versions',
                    data: [
                        ['Firefox 86', 10],
                        ['Firefox 85', 3],
                        ['Firefox 84', 2]
                    ]
                },
                {
                    id: 'safari',
                    name: 'Safari Versions',
                    data: [
                        ['Safari 14', 8],
                        ['Safari 13', 2]
                    ]
                },
                {
                    id: 'edge',
                    name: 'Edge Versions',
                    data: [
                        ['Edge 90', 5],
                        ['Edge 89', 3],
                        ['Edge 88', 2]
                    ]
                }
            ]
        },
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });

    Highcharts.chart('Donut3DDrillDowncontainer', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Browser Market Shares (3D Donut Chart)'
        },
        plotOptions: {
            pie: {
                innerSize: '50%', // This creates the donut effect
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: <b>{point.y}</b>'
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Browsers',
            data: [
                {
                    name: 'Chrome',
                    y: 60,
                    drilldown: 'chrome'
                },
                {
                    name: 'Firefox',
                    y: 15,
                    drilldown: 'firefox'
                },
                {
                    name: 'Safari',
                    y: 10,
                    drilldown: 'safari'
                },
                {
                    name: 'Edge',
                    y: 10,
                    drilldown: 'edge'
                },
                {
                    name: 'Others',
                    y: 5
                }
            ],
            showInLegend: true // Ensures the legend is displayed
        }],
        drilldown: {
            series: [
                {
                    id: 'chrome',
                    name: 'Chrome Versions',
                    data: [
                        ['Chrome 90', 30],
                        ['Chrome 89', 20],
                        ['Chrome 88', 10]
                    ]
                },
                {
                    id: 'firefox',
                    name: 'Firefox Versions',
                    data: [
                        ['Firefox 86', 10],
                        ['Firefox 85', 3],
                        ['Firefox 84', 2]
                    ]
                },
                {
                    id: 'safari',
                    name: 'Safari Versions',
                    data: [
                        ['Safari 14', 8],
                        ['Safari 13', 2]
                    ]
                },
                {
                    id: 'edge',
                    name: 'Edge Versions',
                    data: [
                        ['Edge 90', 5],
                        ['Edge 89', 3],
                        ['Edge 88', 2]
                    ]
                }
            ]
        },
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });

    Highcharts.chart('PieDrillDowncontainer', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Browser Market Shares (3D Pie Chart)'
        },
        plotOptions: {
            pie: {
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: <b>{point.y}</b>'
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Browsers',
            data: [
                {
                    name: 'Chrome',
                    y: 60,
                    drilldown: 'chrome'
                },
                {
                    name: 'Firefox',
                    y: 15,
                    drilldown: 'firefox'
                },
                {
                    name: 'Safari',
                    y: 10,
                    drilldown: 'safari'
                },
                {
                    name: 'Edge',
                    y: 10,
                    drilldown: 'edge'
                },
                {
                    name: 'Others',
                    y: 5
                }
            ],
            showInLegend: true // Ensures the legend is displayed
        }],
        drilldown: {
            series: [
                {
                    id: 'chrome',
                    name: 'Chrome Versions',
                    data: [
                        ['Chrome 90', 30],
                        ['Chrome 89', 20],
                        ['Chrome 88', 10]
                    ]
                },
                {
                    id: 'firefox',
                    name: 'Firefox Versions',
                    data: [
                        ['Firefox 86', 10],
                        ['Firefox 85', 3],
                        ['Firefox 84', 2]
                    ]
                },
                {
                    id: 'safari',
                    name: 'Safari Versions',
                    data: [
                        ['Safari 14', 8],
                        ['Safari 13', 2]
                    ]
                },
                {
                    id: 'edge',
                    name: 'Edge Versions',
                    data: [
                        ['Edge 90', 5],
                        ['Edge 89', 3],
                        ['Edge 88', 2]
                    ]
                }
            ]
        },
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });

    Highcharts.chart('SemiDonut3DDrillDowncontainer', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 0,
                beta: 0
            }
        },
        title: {
            text: 'Browser Market Shares (Semi-Donut Chart)'
        },
        plotOptions: {
            pie: {
                innerSize: '50%', // This creates the donut effect
                startAngle: -90, // Start angle for the semi-donut effect
                endAngle: 90, // End angle for the semi-donut effect
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: <b>{point.y}</b>'
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Browsers',
            data: [
                {
                    name: 'Chrome',
                    y: 60,
                    drilldown: 'chrome'
                },
                {
                    name: 'Firefox',
                    y: 15,
                    drilldown: 'firefox'
                },
                {
                    name: 'Safari',
                    y: 10,
                    drilldown: 'safari'
                },
                {
                    name: 'Edge',
                    y: 10,
                    drilldown: 'edge'
                },
                {
                    name: 'Others',
                    y: 5
                }
            ],
            showInLegend: true // Ensures the legend is displayed
        }],
        drilldown: {
            series: [
                {
                    id: 'chrome',
                    name: 'Chrome Versions',
                    data: [
                        ['Chrome 90', 30],
                        ['Chrome 89', 20],
                        ['Chrome 88', 10]
                    ]
                },
                {
                    id: 'firefox',
                    name: 'Firefox Versions',
                    data: [
                        ['Firefox 86', 10],
                        ['Firefox 85', 3],
                        ['Firefox 84', 2]
                    ]
                },
                {
                    id: 'safari',
                    name: 'Safari Versions',
                    data: [
                        ['Safari 14', 8],
                        ['Safari 13', 2]
                    ]
                },
                {
                    id: 'edge',
                    name: 'Edge Versions',
                    data: [
                        ['Edge 90', 5],
                        ['Edge 89', 3],
                        ['Edge 88', 2]
                    ]
                }
            ]
        },
        legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom',
            floating: false
        }
    });

    Highcharts.chart('Cylindercontainer', {
        chart: {
            type: 'cylinder',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: 'Confirmed COVID-19 Cases for Women in Norway'
        },
        xAxis: {
            categories: ['January', 'February', 'March', 'April', 'May', 'June']
        },
        yAxis: {
            title: {
                text: 'Number of Cases'
            }
        },
        series: [{
            name: 'Confirmed Cases',
            data: [1200, 1500, 1800, 2000, 2200, 2500] // Sample data for confirmed cases
        }],
        legend: {
            align: 'center',
            layout: 'horizontal',
            verticalAlign: 'bottom'
        }
    });

    Highcharts.chart('CylinderComparisioncontainer', {
        chart: {
            type: 'cylinder',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: 'Comparison of Confirmed COVID-19 Cases in Norway (3D Cylinder Chart)'
        },
        xAxis: {
            categories: ['January', 'February', 'March', 'April', 'May', 'June']
        },
        yAxis: {
            title: {
                text: 'Number of Cases'
            }
        },
        series: [{
            name: 'Women',
            data: [1200, 1500, 1800, 2000, 2200, 2500] // Sample data for confirmed cases of women
        }, {
            name: 'Men',
            data: [1000, 1300, 1600, 1900, 2100, 2400] // Sample data for confirmed cases of men
        }],
        legend: {
            align: 'center',
            layout: 'horizontal',
            verticalAlign: 'bottom'
        }
    });

});