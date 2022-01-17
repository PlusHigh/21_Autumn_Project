<%--
  Created by IntelliJ IDEA.
  User: z'x
  Date: 2021/12/21
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>折线图demo</title>
  <script src="lib/echarts.min.js"></script>
</head>
<body>
<h1 style="text-align: center">奥运会参赛运动员的男女比</h1>
<div style="width: 1800px;height: 800px"></div>
<script>
  <%
    String[] xDataArr =(String[]) request.getAttribute("xDataArr");
    double[] yDataArr =(double[]) request.getAttribute("yDataArr");
    double[] yDataArr2 =(double[]) request.getAttribute("yDataArr2");
  %>
  var mCharts = echarts.init(document.querySelector("div"));
  var xDataArr=[];
  var yDataArr = [];
  var yDataArr2 = [];
  <%
  for(int i = 0; i < xDataArr.length; i++) {
  %>
          xDataArr[<%=i%>]='<%=xDataArr[i]%>';
          yDataArr[<%=i%>]='<%=yDataArr[i]%>';
          yDataArr2[<%=i%>]='<%=yDataArr2[i]%>';
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
        data: yDataArr, // 堆叠图的设置
        areaStyle: {}
      },
      {
        type: 'line',
        data: yDataArr2, // 堆叠图的设置
        areaStyle: {}
      }
    ]
  };
  mCharts.setOption(option);

</script>
</body>
</html>
