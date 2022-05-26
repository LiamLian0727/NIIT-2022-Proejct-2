<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="连仕杰">
    <title>Director View</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="../css/styleA.css">

</head>
<body>

<!-- header section starts  -->
<!-- @author 袁蕾-->

<jsp:include page="navigationBar.jsp"></jsp:include>

<!-- header section ends -->
<div>
    <div class="divs" id="left" style="width:30%;float:left;">
        <form class="forms" action="../Echart1" method="post">
            <h1 class="h">Rank</h1><br>
            <h2 class="h">typeKey: </h2><br>
            <h2 class="h">From:</h2><input class="inputs" type="number" name="from" value="1"/><br>
            <h2 class="h">To:</h2><input class="inputs" type="number" name="to" value="10">
            <br><input type="submit" value="run" onclick="gc()"><br><br><br>
            <ul>
                <li>From: The beginning of the rating ranking</li>
                <li>To : The ending of the rating ranking</li>
            </ul>
        </form>
    </div>
    <div class="divs" id="right" style="width:70%;float:left;">
        <div id="main" style="width: 100%;">
            <img src="../image/background4.jpg" style="width: 100%">
        </div>
    </div>
</div>


<!-- 图表 start -->
<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
<script type="text/javascript">
    var dom = document.getElementById('main');
    let query = window.location.search.substring(1);
    let pair = query.split("=");
    if (pair[1] === 'success') {

        console.log("6")
        let acc = JSON.parse(JSON.stringify(${data1}));
        let list = acc.rows;
        console.log(list)

        let data = [['score', 'amount', 'product']], split, min_year = 3000
        for (let item of list) {
            split = item.v.split("$")
            if (min_year > split[1]) min_year = split[1]
            data.push([split[0], split[1], item.k])
        }
        console.log(data)
        min_year = min_year - 5
        console.log(min_year)

        let myChart = echarts.init(dom, null, {
            width: 900,
            height: 550
        });
        let option = null;

        option = {

            tooltip: {
                trigger: 'item'
            },
            dataset: {
                source: data
            },
            grid: {containLabel: true},
            xAxis: {name: 'amount', min: min_year},
            yAxis: {type: 'category'},
            visualMap: {
                orient: 'horizontal',
                precision: 1,
                left: 'center',
                min: 0.0,
                max: 5.0,
                text: ['to 5', 'Rate From 1'],
                dimension: 0,
                inRange: {
                    color: ['#05FFA8', '#07F2E9', '#00BBF7']
                }
            },
            series: [
                {
                    type: 'bar',
                    encode: {
                        // Map the "amount" column to X axis.
                        x: 'amount',
                        // Map the "product" column to Y axis
                        y: 'product'
                    }
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

