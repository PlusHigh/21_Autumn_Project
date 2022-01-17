<%--
  Created by IntelliJ IDEA.
  User: z'x
  Date: 2021/12/22
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>金牌总数</title>
    <script src="lib/echarts.min.js"></script>
</head>
<body>
<h1 style="text-align: center">各国获得金牌总数(仅统计奖牌数300以上的)</h1>
<div id="totalgoldshow" style="width: 1800px;height:800px"></div>
<script>
    //1. ECharts最基本的代码结构
    //2. x轴数据:['张三', '李四', '王五', '闰土', '小明', '茅台', '二妞', '大强']
    //3. y轴数据:[88, 92, 63, 77, 94, 80, 72, 86]
    //4. 将type的值设置为bar
    <%
        String[] country =(String[]) request.getAttribute("country");
        int[] medaltotal =(int[]) request.getAttribute("goldNum");
        System.out.println(country[country.length-1]);
    %>
    var mCharts = echarts.init(document.getElementById("totalgoldshow")) // 初始化echarts实例对象
    var xDataArr = ['张三', '李四', '王五', '闰土', '小明', '茅台', '二妞', '大强'] // 准备x轴数据
    var yDataArr = [88, 92, 63, 77, 94, 80, 72, 86] // 为x轴每一个元素指明数据
    <%
        for(int i = 0; i < country.length; i++) {
    %>
    xDataArr[<%=i%>]='<%=country[i]%>';
    yDataArr[<%=i%>]=<%=medaltotal[i]%>
    <%
       }
    %>
    var option = {
        xAxis: {
            type: 'value'
        },
        yAxis: {
            type: 'category',
            data: xDataArr
        },
        series: [
            {
                name: '语文',
                type: 'bar',
                markPoint: { // 标记点
                    data: [
                        {
                            type: 'max', name: '最大值'
                        },{
                            type: 'min', name: '最小值'
                        }
                    ]
                },
                markLine: { // 标记线
                    data: [
                        {
                            type: 'average', name: '平均值'
                        }
                    ]
                },
                label: { // 柱状图上的文字设置
                    show: true, // 是否显示
                    rotate: 60, // 旋转角度
                    position: 'top' // 显示位置
                },
                barWidth: '30%', // 柱的宽度
                data: yDataArr
            }
        ]
    }
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
