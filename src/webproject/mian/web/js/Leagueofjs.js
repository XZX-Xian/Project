$(function () {
    //头部背景
    $("#v1").css({
        "position": "absolute",
        "right":"0",
        "bottom": "0",
        "min-width": "100%",
        "min-height": "100%",
        "width": "100%",
        "height": "100%",
        "z-index": "-9999",
        "object-fit":"fill" //超级重要的属性
    });
    $("#bodys").css({
        "width": "100%",
        "height": "100%",

    });

    //头部导航栏
    $(".herd1").css({
       "margin-top":"-8",
        "margin-right":"84%",
        "margin-left":"-55px",
    });
    $("#herd >li").css({
        "padding-top":"20px",
    });

    $(".herd2").css({
        "position":"absolute",
        "left":"21%",
        "top":"23px",
        "color":"#ffffff",
    });
    $(".herd3").css({
        "position":"absolute",
        "left":"40%",
        "top":"23px",
        "color":"#ffffff",

    });
    $(".herd4").css({
        "position":"absolute",
        "left":"59%",
        "top":"23px",
        "color":"#ffffff",
    });

    $(".herd5").css({
        "position":"absolute",
        "right":"0%",
        "color":"#ffffff",

    });

    $("#bodys #herd").css({
        "width":"98.4%",
        "height":"80px",
        "background":"rgba(53, 59, 72,0.55)",
        "margin-top":"-8px",
        "margin-left":"-8px",
    });
    $("#herd li").css({
        "list-style-type":"none",
        "display":"inline-block",
        "font-size":"19px",
        "width":"291px",
        "height":"60px",
        "top":"0px",
    });
    $("body").css({
        "text-align":"center",
        "background-image":"\\subject\\hero-l10-bg.mp4"

    });

    $("#model").css({
        "width":"100%",
        "height":"100%",
        "border":"1px #d1d8e0 solid",
        "background":"#ffffff"
    });

//主题五英雄悬浮事件
  $("#model1 img").hover(function () {
        $(this).attr("src","\\model\\nuoshous.png");
    },function () {
        $(this).attr("src","\\model\\nuoshou.png");
    });
     $("#model2 img").hover(function () {
       $(this).attr("src","\\model\\langrens.png");
   },function () {
       $(this).attr("src","\\model\\langren.png");
   });
   $("#model3 img").hover(function () {
       $(this).attr("src","\\model\\yasuos.png");
   },function () {
       $(this).attr("src","\\model\\yasuo.png");
   });
   $("#model4 img").hover(function () {
       $(this).attr("src","\\model\\bulongs.png");
   },function () {
       $(this).attr("src","\\model\\bulong.png");
   });
   $("#model5 img").hover(function () {
       $(this).attr("src","\\model\\jinkess.png");
   },function () {
       $(this).attr("src","\\model\\jinkes.png");
   })







});
