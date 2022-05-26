<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="刘宣兑">
    <title>Rating View</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="../css/styleA.css">

</head>
<body>

<!-- header section starts  -->

<jsp:include page="navigationBar.jsp"></jsp:include>

<!-- header section ends -->

<!-- 图表 start -->
<body>

<div>
    <div class="divs" id="left" style="width:30%;float:left;">
        <form class="forms" action="../Echart4" method="post">
            <h1 class="h">Year Top</h1><br>
            <h2 class="h">Year: </h2><input class="inputs" type="number" name="year" value="2000"/><br>
            <h2 class="h">Limit: </h2><input class="inputs" type="number" name="limit" value="10">
            <br><input type="submit" value="run" onclick="gc()"><br><br><br>
            <ul>
                <li>Year: The year you want to query</li>
                <li>Limit :The number of movies displayed</li>
            </ul>
        </form>
    </div>
    <div class="divs" id="right" style="width:70%;float:left;">
        <div id="main" style="width: 100%;">
            <img src="../image/background3.jpg" style="width: 100%">
        </div>
    </div>
</div>

<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>

<script type="text/javascript">

    var dom = document.getElementById('main');
    let query = window.location.search.substring(1);
    let pair = query.split("=");
    if (pair[1] === 'success') {

        let acc = JSON.parse(JSON.stringify(${data4}));
        let list = acc.rows;

        let x = []
        let y = []
        let min_rate = 5.0

        for (let item of list) {
            if (min_rate > item.v) min_rate = item.v
            x.push(item.k)
            y.push(item.v)
        }
        x.reverse()
        y.reverse()

        console.log(x)
        console.log(y)

        let myChart = echarts.init(dom, null, {
            width: 800,
            height: 500
        });

        let option = {
            title: {
                text: 'The' + '${year}' + 'Movie Rankings'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        show: true
                    }
                }
            },
            legend: {},
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: true,
                min: min_rate - 0.5
            },
            yAxis: {
                type: 'category',
                data: x
            },
            series: [
                {
                    name: 'rate',
                    type: 'bar',
                    showBackground: true,
                    itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 1, 1, 0, [
                            {offset: 0, color: '#57BEFA'},
                            {offset: 0.5, color: '#44D3E3'},
                            {offset: 1, color: '#4CFDDE'}
                        ])
                    },
                    data: y
                }
            ]
        };

        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }

    } else if (pair[1] === 'error') {
        alert("error")
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
