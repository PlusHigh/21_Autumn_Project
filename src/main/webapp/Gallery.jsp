<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />

    <style>
      .jumbotron,
      .navbar,
      .navigation {
        background-color: #f6f6f6;
      }

      .navbar-brand {
        clip-path: circle(36%);
        /* 终于找到了一个可以合理剪裁图片的方式 */
        /* 相对于object-fit:cover来说显示的效果更好 */
        max-width: 50px;
        max-height: 50px;
        min-width: 25px;
        min-height: 25px;
      }

      div.popout0 {
          width: 1000px;
          height: auto;
          background-color: #fbfbfd;
          position: fixed;
          z-index: 100;
          display: none;

      }


      div.popout1 {
          width: 1000px;
          height: auto;
          background-color: #fbfbfd;
          position: fixed;
          z-index: 100;
          display: none;

      }
      div.popout2 {
          width: 1000px;
          height: auto;
          background-color: #fbfbfd;
          position: fixed;
          z-index: 100;
          display: none;

      }


    </style>
    <title>507自救小组</title>
    <link rel="stylesheet" href="zh/card.css" />
    <link rel="stylesheet" href="zh/rotation.css" />
    <link rel="stylesheet" href="zh/signin.css" />
      <script src="lib/echarts.min.js"></script>
  </head>

  <body>
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-sm navbar-light fixed-top">
<%--      <a class="navbar-brand login" href="#">--%>
<%--        <img class="img-rounded" src="images/SpaceStation.jpg" alt="" />--%>
<%--      </a>--%>
      <button
        class="navbar-toggler d-lg-none"
        type="button"
        data-toggle="collapse"
        data-target="#collapsibleNavId"
        aria-controls="collapsibleNavId"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="collapsibleNavId">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="dropdownId"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
              >Gallery</a
            >
            <div class="dropdown-menu" aria-labelledby="dropdownId">
              <a class="dropdown-item" href="srs1">夏季奥运会参赛运动员的男女比</a>
              <a class="dropdown-item" href="srs2">冬季奥运会参赛运动员的男女比</a>
              <a class="dropdown-item" href="mls">1896年夏季奥运会各国获得奖牌数量</a>
              <a class="dropdown-item" href="tgns">各国获得金牌总数</a>
              <a class="dropdown-item" href="eys">历年各国参赛人数</a>
              <a class="dropdown-item" href="oys">第一届奥运会各国参赛占比</a>
              <a class="dropdown-item" href="eyhs">历年各国参赛占比</a>
              <a class="dropdown-item" href="tss">NBA各球队总得分数</a>
              <a class="dropdown-item" href="tps">三分命中率</a>
              <a class="dropdown-item" href="tpss">赛季三分命中数</a>
              <a class="dropdown-item" href="ps">三分占比</a>
            </div>
          </li>
        </ul>
      </div>
    </nav>

    <!-- 文字轮播效果 -->
    <div class="jumbotron">
      <div class="container">
        <h2 style="font-weight: bold">
         赛事数据分析
          <div class="mask">
            <span data-show id="keyi"><a href="eys">Olympic Candidates</a></span>
            <span><a href="tgns">GoldMedal Gain</a></span>
            <span><a href="tss">NBA's Stuff.</a></span>
          </div>
        </h2>
      </div>
    </div>

    <!-- 主体部分 -->
    <div class="container">
      <div class="row justify-content-around">

       <a class="card0">
        <div class="card mb-5">
          <div class="image">
            <img src="zh/images/olymipic3.jpg" alt="" />
          </div>
          <div class="content d-flex justify-content-center align-items-center">
              <h4>各国获得金牌总数</h4>
           <div class="description">

            </div>
          </div>
        </div>
        </a>

          <a class="card0">
        <div class="card mb-5 card1">
          <div class="image">
            <img src="zh/images/olymipic1.jpg" alt="" />
          </div>
          <div class="content d-flex justify-content-center align-items-center">
            <h4>历年各国参赛人数</h4>
           <div class="description"></div>
          </div>
        </div>
          </a>

          <a class="card0">
        <div class="card mb-5 card2">
          <div class="image">
            <img src="zh/images/braves.jpeg" alt="" />
          </div>
          <div class="content d-flex justify-content-center align-items-center">
            <h4>球队总得分</h4>
            <div class="description"></div>
          </div>
        </div>
          </a>

      </div>
    </div>



    <!-- 遮盖登录框 -->
    <main>


      <div class="coverlayer" id="coverlayer"></div>


      <div class="shadow  popout0" id="popout0" style="width: 1000px;height: 800px;display:none">

        <div class="d-flex justify-content-end">
          <a class="guanbi0 justify-content-end">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="32"
              height="32"
              fill="currentColor"
              class="bi bi-x"
              viewBox="0 0 16 16"
            >
              <path
                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
              />
            </svg>
            <!-- <button type="button" class="display:none;"></button> -->
          </a>
        </div>
    <div id="totalgoldshow" style="width: 1000px;height:800px;"></div>
   </div>



        <div class="shadow  popout1" id="popout1" style="width: 1000px;height: 800px;display:none">

            <div class="d-flex justify-content-end">
                <a class="guanbi1 justify-content-end">
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="32"
                            height="32"
                            fill="currentColor"
                            class="bi bi-x"
                            viewBox="0 0 16 16"
                    >
                        <path
                                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
                        />
                    </svg>
                    <!-- <button type="button" class="display:none;"></button> -->
                </a>
            </div>

            <div id="eachyearshow" style="width: 1000px;height:800px;"></div>



        </div>


        <div class="shadow  popout2" id="popout2" style="width: 1000px;height: 800px;display:none">

            <div class="d-flex justify-content-end">
                <a class="guanbi2 justify-content-end">
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="32"
                            height="32"
                            fill="currentColor"
                            class="bi bi-x"
                            viewBox="0 0 16 16"
                    >
                        <path
                                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
                        />
                    </svg>
                    <!-- <button type="button" class="display:none;"></button> -->
                </a>
            </div>

            <div id="totalscoreshow" style="width: 1000px;height:800px;"></div>



        </div>


    </main>



    <script>

        <%
            String[] country =(String[]) request.getAttribute("country");
            int[] medaltotal =(int[]) request.getAttribute("goldNum");
            System.out.println(country[country.length-1]);
        %>
        var mCharts = echarts.init(document.getElementById("totalgoldshow")) // 初始化echarts实例对象
        var xDataArr = [] // 准备x轴数据
        var yDataArr = [] // 为x轴每一个元素指明数据
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

    <script>
        <%
          String[] xDataArr1 =(String[]) request.getAttribute("xDataArr1");
          String[] yDataArr1 =(String[]) request.getAttribute("yDataArr1");
        %>
        var mCharts1 = echarts.init(document.getElementById("eachyearshow"));
        var xDataArr1=[];
        var yDataArr1 = [];
        <%
        for(int i = 0; i < xDataArr1.length; i++) {
        %>
        xDataArr1[<%=i%>]='<%=xDataArr1[i]%>';
        yDataArr1[<%=i%>]='<%=yDataArr1[i]%>';
        <%
        }
        %>


        var option1 = {
            xAxis: {
                type: 'category',
                data: xDataArr1
            },
            yAxis: {
                type: 'value',
            },
            series: [
                {
                    type: 'line',
                    data: yDataArr1,
                    areaStyle: {}
                }
            ]
        };
        mCharts1.setOption(option1);
        // 监听window窗口大小变化的事件
        window.onresize = function(){
            // console.log('window.onresize...')
            // 调用echarts实例对象的resize方法
            mCharts1.resize()
        }
        // window.onresize = mCharts.resize
    </script>

    <script>
        <%
          String[] xDataArr2 =(String[]) request.getAttribute("xDataArr2");
          String[] yDataArr2 =(String[]) request.getAttribute("yDataArr2");
        %>
        var mCharts = echarts.init(document.getElementById("totalscoreshow"));
        var xDataArr2=[];
        var yDataArr2 = [];
        <%
        for(int i = 0; i < xDataArr2.length; i++) {
        %>
        xDataArr2[<%=i%>]='<%=xDataArr2[i]%>';
        yDataArr2[<%=i%>]='<%=yDataArr2[i]%>';
        <%
        }
        %>


        var option2 = {
            xAxis: {
                type: 'category',
                data: xDataArr
            },
            yAxis: {
                type: 'value',
            },
            series: [
                {
                    type: 'bar',
                    data: yDataArr, // 堆叠图的设置
                    areaStyle: {},
                    label: {
                        show: true,
                        position: 'top'
                    }
                }
            ]
        };
        mCharts.setOption(option2);
    </script>


    <!-- 注册页面的实现 -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
    <script src="zh/rotation.js"></script>

    <script >

        $(".card0").click(function () {
            // $("#popout").css({ display: block });

            $("#popout0").show();
            $("#coverlayer").show();
            centerize_popout0();
        });
        $(".card1").click(function () {
            // $("#popout").css({ display: block });

            $("#popout1").show();
            $("#coverlayer").show();
            centerize_popout1();
        });
        $(".card2").click(function () {
            // $("#popout").css({ display: block });

            $("#popout2").show();
            $("#coverlayer").show();
            centerize_popout2();
        });

        $("a.guanbi0").click(function () {
            $("#coverlayer").hide();
            $("#popout0").hide();

        });
        $("a.guanbi1").click(function () {
            $("#coverlayer").hide();
            $("#popout1").hide();
        });
        $("a.guanbi2").click(function () {
            $("#coverlayer").hide();
            $("#popout2").hide();

        });

        $(window).resize(function () {
            centerize_popout0();
            centerize_popout1();
            centerize_popout2();
        });



        function centerize_popout0() {
            var _top = ($(window).height() - $("#popout0").height()) / 2;
            var _left = ($(window).width() - $("#popout0").width()) / 2;

            $("#popout0").css({ top: _top, left: _left });
        }
        function centerize_popout1() {
            var _top = ($(window).height() - $("#popout1").height()) / 2;
            var _left = ($(window).width() - $("#popout1").width()) / 2;

            $("#popout1").css({ top: _top, left: _left });
        }


        function centerize_popout2() {
            var _top = ($(window).height() - $("#popout2").height()) / 2;
            var _left = ($(window).width() - $("#popout2").width()) / 2;

            $("#popout2").css({ top: _top, left: _left });
        }



    </script>


  </body>
</html>
