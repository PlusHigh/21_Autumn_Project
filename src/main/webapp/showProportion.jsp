<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/12/22
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>三分占比堆叠柱状图</title>
    <script src="lib/echarts.min.js"></script>
</head>
<body>
    <h1>三分占比堆叠柱状图</h1>
    <div style="width:1700px;height: 800px"></div>
    <script>

        <%
          String[] xDataArr =(String[]) request.getAttribute("xDataArr");
          String[] yDataArr =(String[]) request.getAttribute("yDataArr");
        %>
        var mCharts = echarts.init(document.querySelector("div"));
        var xDataArr = [];
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
                type: 'value'
            },
            series: [
                {
                    type: 'bar',
                    data: yDataArr, // 堆叠图的设置
                    areaStyle: {},
                    barCategoryGap: "50%",
                    stack:xDataArr,
                    label:{
                        show:true,
                        position:'top'
                    }
                },
                {
                    type: 'bar',
                    data: yDataArr, // 堆叠图的设置
                    areaStyle: {},
                    barCategoryGap: "50%",
                    stack:xDataArr,
                    label:{
                        show:true,
                        position:'top'
                    }
                }
            ]
        };
        mCharts.setOption(option);
    </script>

</body>
</html>
