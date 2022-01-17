<%--
  Created by IntelliJ IDEA.
  User: z'x
  Date: 2021/12/22
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>奖牌总数饼图（单年）</title>
    <script src="lib/echarts.min.js"></script>
</head>
<body>
<h1 style="text-align: center">1896年夏季奥运会各国获得奖牌数量</h1>
<div style="width: 1800px;height:900px"></div>
<script>
    //1. ECharts最基本的代码结构
    //2. 准备数据[{name:???, value:??? },{}]
    //   淘宝: 11231  京东: 22673  唯品会: 6123  1号店: 8989   聚美优品: 6700
    //3. 将type的值设置为pie
    <%
        String[] country =(String[]) request.getAttribute("country");
        int[] medaltotal =(int[]) request.getAttribute("medaltotal");
        System.out.println(country[country.length-1]);
    %>
    var mCharts = echarts.init(document.querySelector("div"));
    // pieData就是需要设置给饼图的数据, 数组,数组中包含一个又一个的对象, 每一个对象中, 需要有name和value
    var pieData = [
    <%
        for(int i = 0; i < country.length-1; i++) {
    %>
        {
            name: '<%=country[i]%>',
            value: <%=medaltotal[i]%>
        },
    <%
       }
    %>
        {
            name: '<%=country[country.length-1]%>',
            value: <%=medaltotal[country.length-1]%>
        }
    ]
    var option = {
        series: [
            {
                type: 'pie',
                data: pieData
            }
        ]
    }
    mCharts.setOption(option)
</script>
</body>
</html>
