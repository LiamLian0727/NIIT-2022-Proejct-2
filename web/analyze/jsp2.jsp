<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="author" content="郑欣然">
    <title>ECharts</title>

    <link rel="stylesheet" href="../css/styleA.css">
</head>
<body>
<!-- 为 ECharts 准备一个定义了宽高的 DOM -->
<jsp:include page="navigationBar.jsp"></jsp:include>

<div>
    <div class="divs" id="left" style="width:30%;float:left;">
        <form class="forms" action="../Echart2" method="post">
            <h1 class="h">Len</h1><br>
            <h2 class="h">Rate:</h2><input class="inputs" type="number" step="0.1" name="rate" value="3.0">
            <h2 class="h">Len:</h2><input class="inputs" type="number" name="len" value="10">
            <h2 class="h">Limit:</h2><input class="inputs" type="number" name="limit" value="10"/><br>
            <br><input type="submit" value="run" onclick="gc()"><br><br><br>
            <ul>
                <li>Rate: The Min of the Limit</li>
                <li>Len: The Length of the Movie Name</li>
                <li>Limit: Number for show</li>
            </ul>
        </form>
    </div>
    <div class="divs" id="right" style="width:70%;float:left;">
        <div id="main" style="width: 100%;">
            <img src="../image/background1.jpg" style="width: 100%">
        </div>
    </div>
</div>

<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>

<script type="text/javascript">
    var dom = document.getElementById('main');
    // 基于准备好的dom，初始化echarts实例
    let query = window.location.search.substring(1);
    let pair = query.split("=");
    if (pair[1] === 'success') {

        let acc = JSON.parse(JSON.stringify(${data2}));
        console.log(acc)

        let list = acc.rows;
        let category = [];
        let lineData = [];
        let barData = [];

        let split;
        for (let item of list) {
            category.push(item.k)
            split = item.v.split("$")
            barData.push(split[0])
            lineData.push(split[1])
        }
        console.log(category)
        console.log(lineData)
        console.log(barData)
        let myChart = echarts.init(dom, null, {
            width: 900,
            height: 540
        });
        // Generate data


        option = {
            backgroundColor: '#0f375f',
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                },
                formatter: '<b><i>{b}</i></b><br>length: {c0}<br>rate: {c1}'
            },
            legend: {
                data: ['line', 'bar'],
                textStyle: {
                    color: '#ccc'
                }
            },
            xAxis: {
                data: category,
                axisLine: {
                    lineStyle: {
                        color: '#ccc'
                    }
                }
            },
            yAxis: {
                splitLine: {show: false},
                axisLine: {
                    lineStyle: {
                        color: '#ccc'
                    }
                }
            },
            series: [
                {
                    name: 'line',
                    type: 'line',
                    smooth: true,
                    showAllSymbol: true,
                    symbol: 'emptyCircle',
                    symbolSize: 15,
                    data: lineData
                },
                {
                    name: 'bar',
                    type: 'bar',
                    barWidth: 10,
                    itemStyle: {
                        borderRadius: 5,
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            {offset: 0, color: '#14c8d4'},
                            {offset: 1, color: '#43eec6'}
                        ])
                    },
                    data: barData
                },
                {
                    name: 'line',
                    type: 'bar',
                    barGap: '-100%',
                    barWidth: 10,
                    itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            {offset: 0, color: 'rgba(20,200,212,0.5)'},
                            {offset: 0.2, color: 'rgba(20,200,212,0.2)'},
                            {offset: 1, color: 'rgba(20,200,212,0)'}
                        ])
                    },
                    z: -12,
                    data: lineData
                },
                {
                    name: 'dotted',
                    type: 'pictorialBar',
                    symbol: 'rect',
                    itemStyle: {
                        color: '#0f375f'
                    },
                    symbolRepeat: true,
                    symbolSize: [12, 4],
                    symbolMargin: 1,
                    z: -10,
                    data: lineData
                }
            ]
        };

        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }

    } else if (pair[1] === 'error') {
        alert('error');
    }

    function gc() {
        let myChart = echarts.init(dom, null, {
            width: 800,
            height: 500
        });
        let option = {
            graphic: {
                elements: [
                    {
                        type: 'text',
                        left: 'center',
                        top: 'center',
                        style: {
                            text: 'Analyzing the Movie',
                            fontSize: 80,
                            fontWeight: 'bold',
                            lineDash: [0, 200],
                            lineDashOffset: 0,
                            fill: 'transparent',
                            stroke: '#000',
                            lineWidth: 1
                        },
                        keyframeAnimation: {
                            duration: 3000,
                            loop: true,
                            keyframes: [
                                {
                                    percent: 0.7,
                                    style: {
                                        fill: 'transparent',
                                        lineDashOffset: 200,
                                        lineDash: [200, 0]
                                    }
                                },
                                {
                                    // Stop for a while.
                                    percent: 0.8,
                                    style: {
                                        fill: 'transparent'
                                    }
                                },
                                {
                                    percent: 1,
                                    style: {
                                        fill: 'black'
                                    }
                                }
                            ]
                        }
                    }
                ]
            }
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    }

</script>
</body>
</html>
