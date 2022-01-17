<%--
  Created by IntelliJ IDEA.
  User: z'x
  Date: 2021/12/21
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>历年参赛人数</title>
    <script src="lib/echarts.min.js"></script>
</head>
<body>
<h1 style="text-align: center">历年参赛人数</h1>
<div style="width: 1800px;height: 800px"></div>
<script>
    <%
      String[] xDataArr =(String[]) request.getAttribute("xDataArr");
      String[] yDataArr =(String[]) request.getAttribute("yDataArr");
    %>
    var mCharts = echarts.init(document.querySelector("div"));
    var xDataArr=[];
    var yDataArr = [];
    <%
    for(int i = 0; i < xDataArr.length; i++) {
    %>
    xDataArr[<%=i%>]='<%=xDataArr[i]%>';
    yDataArr[<%=i%>]='<%=yDataArr[i]%>';
    <%
    }
    %>
    var option = {

        xAxis: {
            type: 'category',
            data: xDataArr
        },
        yAxis: {
            type: 'value',
        },
        series: [
            {
                type: 'line',
                data: yDataArr,
                areaStyle: {}
            },
        ]
    };
    mCharts.setOption(option);
    // 监听window窗口大小变化的事件
    window.onresize = function(){
        // console.log('window.onresize...')
        // 调用echarts实例对象的resize方法
        mCharts.resize()
    }
    // window.onresize = mCharts.resize
</script>
</body>
</html>

