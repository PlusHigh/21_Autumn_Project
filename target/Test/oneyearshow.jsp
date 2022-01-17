<%--
  Created by IntelliJ IDEA.
  User: z'x
  Date: 2021/12/21
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>第一届各国参赛占比</title>
    <script src="lib/echarts.min.js"></script>
</head>
<body>
<h1 style="text-align: center">第一届各国参赛占比</h1>




<div class="d-flex justify-content-center">
    <div id="echarts" style="width: 1800px;height: 800px"></div>
</div>









<script>
    <%
      String[] xDataArr =(String[]) request.getAttribute("xDataArr");
      String[] yDataArr =(String[]) request.getAttribute("yDataArr");
    %>
    var mCharts = echarts.init(document.getElementById("echarts"));
    var xDataArr=[];
    var yDataArr = [];
    var pieData = [
    <%
    for(int i = 0; i < xDataArr.length-1; i++) {
    %>
        {
            name: '<%=xDataArr[i]%>',
            value: <%=yDataArr[i]%>
        },
    <%
    }
    %>
        {
            name: '<%=xDataArr[xDataArr.length-1]%>',
            value: <%=yDataArr[xDataArr.length-1]%>
        }
    ]

    var option = {
        series: [
            {
                type: 'pie',
                data: pieData,
                label: { // 饼图文字的显示
                    show: true, // 显示文字
                    //formatter: 'hehe' // 决定文字显示的内容
                    formatter: function(arg){
                        // console.log(arg)
                        return arg.name + '参赛' + arg.value + '人\n' + arg.percent + '%'
                    }
                },
                // radius: 20 // 饼图的半径
                // radius: '20%' // 百分比参照的是宽度和高度中较小的那一部分的一半来进行百分比设置
                // radius: ['50%', '75%'] // 第0个元素代表的是內圆的半径 第1个元素外圆的半径
                roseType: 'radius', // 南丁格尔图 饼图的每一个区域的半径是不同的
                // selectedMode: 'single' // 选中的效果,能够将选中的区域偏离圆点一小段距离
                selectedMode: 'multiple',
                selectedOffset: 30
            }
        ]
    };
    mCharts.setOption(option);
</script>
</body>
</html>
