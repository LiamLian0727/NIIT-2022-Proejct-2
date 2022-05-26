<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="袁蕾">
    <title>Country View</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="../css/styleA.css">

</head>
<body>

<!-- header section starts  -->
<!-- @author 袁蕾-->

<jsp:include page="navigationBar.jsp"></jsp:include>

<!-- header section ends -->

<!-- 图表 start -->
<div>
    <div class="divs" id="left" style="width:30%;float:left;">
        <form class="forms" action="../Echart3" method="post">
            <h1 class="h">Count</h1><br>
            <h2 class="h">Length:</h2><input class="inputs" type="number" name="len" value="10">
            <h2 class="h">From:</h2><input class="inputs" type="number" name="from" value="1914">
            <h2 class="h">To:</h2><input class="inputs" type="number" name="to" value="2014">
            <br><input type="submit" value="run" onclick="gc()"><br><br><br>
            <ul>
                <li>Length: The Length of the Movie's name</li>
                <li>From: Start year of the Query</li>
                <li>To: End year of the Query</li>
            </ul>
        </form>
    </div>
    <div class="divs" id="right" style="width:70%;float:left;">
        <div id="main" style="width: 100%;">
            <img src="../image/background2.jpg" style="width: 100%">
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

        let acc = JSON.parse(JSON.stringify(${data3}));
        let list = acc.rows;

        let date = [];
        let data = [];

        for (let item of list) {
            date.push(item.k)
            data.push(item.v)
        }

        console.log(list)
        console.log(date)
        console.log(data)

        let myChart = echarts.init(dom, null, {
            width: 800,
            height: 500
        });

        let option = {
            tooltip: {
                trigger: 'axis',
                position: function (pt) {
                    return [pt[0], '10%'];
                }
            },
            title: {
                left: 'center',
                text: 'Number of Movies Per Year'
            },
            toolbox: {
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    restore: {},
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: date
            },
            yAxis: {
                type: 'value',
                boundaryGap: [0, '100%']
            },
            dataZoom: [
                {
                    type: 'inside',
                    start: 0,
                    end: 50
                },
                {
                    start: 0,
                    end: 10
                }
            ],
            series: [
                {
                    name: 'Count',
                    type: 'line',
                    symbol: 'none',
                    sampling: 'lttb',
                    itemStyle: {
                        color: 'rgb(255, 70, 131)'
                    },
                    areaStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            {
                                offset: 0,
                                color: 'rgb(255, 158, 68)'
                            },
                            {
                                offset: 1,
                                color: 'rgb(255, 70, 131)'
                            }
                        ])
                    },
                    data: data
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
