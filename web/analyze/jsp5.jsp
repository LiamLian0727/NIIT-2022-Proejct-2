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
        <form class="forms" action="../Echart5" method="post">
            <h1 class="h">Prime</h1><br>
            <h1 class="hhh" text-align:justify>
                <br>Click to see the distribution of prime numbers and composite numbers in the dataset
            </h1><br>
            <br><input type="submit" value="run" onclick="gc()"><br><br><br>
            <ul>
                <li>Tips: Analysis of the prime</li>
            </ul>
        </form>
    </div>
    <div class="divs" id="right" style="width:70%;float:left;">
        <div id="main" style="width: 100%;">
            <img src="../image/background4.jpg" style="width: 100%">
        </div>
    </div>
</div>


<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
<script type="text/javascript">

    var dom = document.getElementById('main');

    let query = window.location.search.substring(1);
    let pair = query.split("=");
    if (pair[1] === 'success') {
        let myChart = echarts.init(dom, null, {
            width: 800,
            height: 500
        });
        let option = {
            color: ['#f1afad', '#96cdf3', '#93e6f1', '#ff865b', '#91c7ae', '#749f83', '#ca8622', '#bda29a', '#6e7074', '#546570', '#c4ccd3'],
            tooltip: {
                trigger: 'item'
            },
            legend: {
                top: '5%',
                left: 'center'
            },
            series: [
                {
                    name: 'Access From',
                    type: 'pie',
                    radius: ['40%', '70%'],
                    avoidLabelOverlap: false,
                    itemStyle: {
                        borderRadius: 10,
                        borderColor: '#fff',
                        borderWidth: 2
                    },
                    label: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        label: {
                            show: true,
                            fontSize: '40',
                            fontWeight: 'bold'
                        }
                    },
                    labelLine: {
                        show: false
                    },
                    data: [
                        {value: "${prime}", name: 'PrimeNumber'},
                        {value: "${composite}", name: 'CompositeNumber'},

                    ]
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

