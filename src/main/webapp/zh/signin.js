
      $(".card0").click(function () {
        // $("#popout").css({ display: block });


        $("#coverlayer").show();
        $("#popout0").show();
        centerize_popout0();
      });
      $(".card1").click(function () {
          // $("#popout").css({ display: block });


          $("#coverlayer").show();
          $("#popout1").show();
          centerize_popout1();
      });
      $(".card2").click(function () {
          // $("#popout").css({ display: block });


          $("#coverlayer").show();
          $("#popout2").show();
          centerize_popout2();
      });

      $("a.guanbi0").click(function () {
        $("#coverlayer").hide();

      });
      $("a.guanbi1").click(function () {
          $("#coverlayer").hide();

      });
      $("a.guanbi2").click(function () {
          $("#coverlayer").hide();

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







    
