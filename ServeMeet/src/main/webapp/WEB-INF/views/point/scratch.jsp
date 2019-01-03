<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스크래치 복권</title>
	<c:import url="../common/header.jsp"/>
	<style>
		body {
		}
		
		.scratch_container {
		  border: 3px solid skyblue;
		  position: relative;
		  width: 456px;
		  height: 256px;
		  margin: 0 auto;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none; 
		  -o-user-select: none;
		  user-select: none;
		  background-color : white;
		}
		.ready_container{
		border: 3px solid skyblue;
		  position: relative;
		  width: 456px;
		  height: 256px;
		  margin: 0 auto;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none; 
		  -o-user-select: none;
		  user-select: none;
		  background-color : white;
		}
		
		.canvas {
		  position: absolute;
		  top: 0;
		}
		
		.form {
		  padding: 20px;
		}
		
		.failDiv{
		padding : 20px;
		width :450;
		height: 250;
		}
		
		.successDiv{
		
		width :450;
		height: 250;
		
		}
		
		.frame{
        	background-color : white;
        	margin-left : 300px;
        	margin-right : 300px;
        }
	</style>
</head>
<body>

<div class="frame" >
<div  align="center" >
<br><br>
<br><br>
<h1>스크래치 복권</h1>
<br>
<h3>최대 1000포인트 증정!</h3>
</div>
<br>
<div align="center">
<button class="btn-lg btn-default" id="scratchBtn" onclick="buyScratch()">복권 구매하기</button>
<br><br>
<div class="ready_container" id="ready-container" style="display:">
	<img src="${pageContext.request.contextPath}/resources/images/Lucky_Scratch.jpeg">
</div>
</div>

<div class="scratch_container" id="js-container" style="display:none">
  <canvas class="canvas" id="js-canvas" width="456" height="256"></canvas>
  <form class="form-fail" style="display: none;" >
  	<div class="failDiv" align = "center" >
  	<br><br>
  	<h1>꽝!</h1>
  	<br>
    <h3>다음 기회에...</h3>
  	</div>
  </form>
  <form class="form-success100" style="display: none;">
  	<div class="successDiv1000" align = "center">
  	<br><br>
  	<h1>당첨!</h1>
  	<h2>축하합니다~~!</h2>
    <h3>100포인트에 당첨되셨습니다.</h3>
  	</div>

  </form>
  <form class="form-success1000" style="display: none;">
  	<div class="successDiv1000" align = "center">
  	<br><br>
  	<h1>당첨!</h1>
  	<h2>축하합니다~~!</h2>
    <h3>1000포인트에 당첨되셨습니다.</h3>
  	</div>

  </form>
    
</div>
    <br><br>
    <br><br>
    <br><br>
</div>
<c:import url="../common/footer.jsp"/>

<script>
var isFail = false;
var isWin = false;
var is1000Win = false;
var image = new Image();
(function() {
	  
	  'use strict';
	  
	  var isDrawing, lastPoint;
	  var container    = document.getElementById('js-container'),
	      canvas       = document.getElementById('js-canvas'),
	      canvasWidth  = canvas.width,
	      canvasHeight = canvas.height,
	      ctx          = canvas.getContext('2d'),
	      brush        = new Image();
	      
	  // base64 Workaround because Same-Origin-Policy
	  image.src = "${pageContext.request.contextPath}/resources/images/Lucky_Scratch.jpeg"
	  image.onload = function() {
	    ctx.drawImage(image, 0, 0);
	    // Show the form when Image is loaded.
	   var rand = Math.random(); 
	    if(rand >0.08){
	    	document.querySelectorAll('.form-fail')[0].style.display = '';
	    	isFail = true;
	    }else if(rand>0.001 && rand <=0.08){
	    document.querySelectorAll('.form-success100')[0].style.display = '';
	    isWin = true;
	    }else{
	    document.querySelectorAll('.form-success1000')[0].style.display = '';
	    is1000Win = true;
	    }
	  };
	  brush.src = 'data:image/png;base64,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';
	  
	  canvas.addEventListener('mousedown', handleMouseDown, false);
	  canvas.addEventListener('touchstart', handleMouseDown, false);
	  canvas.addEventListener('mousemove', handleMouseMove, false);
	  canvas.addEventListener('touchmove', handleMouseMove, false);
	  canvas.addEventListener('mouseup', handleMouseUp, false);
	  canvas.addEventListener('touchend', handleMouseUp, false);
	  
	  function distanceBetween(point1, point2) {
	    return Math.sqrt(Math.pow(point2.x - point1.x, 2) + Math.pow(point2.y - point1.y, 2));
	  }
	  
	  function angleBetween(point1, point2) {
	    return Math.atan2( point2.x - point1.x, point2.y - point1.y );
	  }
	  
	  // Only test every `stride` pixel. `stride`x faster,
	  // but might lead to inaccuracy
	  function getFilledInPixels(stride) {
	    if (!stride || stride < 1) { stride = 1; }
	    
	    var pixels   = ctx.getImageData(0, 0, canvasWidth, canvasHeight),
	        pdata    = pixels.data,
	        l        = pdata.length,
	        total    = (l / stride),
	        count    = 0;
	    
	    // Iterate over all pixels
	    for(var i = count = 0; i < l; i += stride) {
	      if (parseInt(pdata[i]) === 0) {
	        count++;
	      }
	    }
	    
	    return Math.round((count / total) * 100);
	  }
	  
	  function getMouse(e, canvas) {
	    var offsetX = 0, offsetY = 0, mx, my;

	    if (canvas.offsetParent !== undefined) {
	      do {
	        offsetX += canvas.offsetLeft;
	        offsetY += canvas.offsetTop;
	      } while ((canvas = canvas.offsetParent));
	    }

	    mx = (e.pageX || e.touches[0].clientX) - offsetX;
	    my = (e.pageY || e.touches[0].clientY) - offsetY;

	    return {x: mx, y: my};
	  }
	  
	  function handlePercentage(filledInPixels) {
	    filledInPixels = filledInPixels || 0;
	    console.log(filledInPixels + '%');
	    if (filledInPixels > 50) {
	      canvas.parentNode.removeChild(canvas);
	      
	      if(isFail == true){
	    	  alert("아쉽지만 당첨되지 않으셨습니다.");  
	    	  location.reload(true);
	      }else if(isWin == true) {
	    	  alert("축하합니다! 100포인트에 당첨되었습니다!");
	    	  $.ajax({
					url : "${pageContext.request.contextPath}/point/updatePoint.do",
					data : {increasePoint : 100,
							pContent : "스크래치 포인트 획득"
							},
					success : function(){
						
						$("#js-container").attr("style","display:");
					     $("#ready-container").attr("style","display:none")
						
		            }, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		                //에러로그
		                console.log(jqxhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            }
				});
	    	  location.reload(true);
	    	  
	      }else if(is1000Win == true){
	    	  alert("축하합니다! 1000포인트에 당첨되었습니다!");
	    	  $.ajax({
					url : "${pageContext.request.contextPath}/point/updatePoint.do",
					data : {increasePoint : 1000,
							pContent : "스크래치 포인트 획득"
							},
					success : function(){
						
						$("#js-container").attr("style","display:");
					     $("#ready-container").attr("style","display:none")
						
		            }, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		                //에러로그
		                console.log(jqxhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            }
				});
	    	  location.reload(true);
	      }
	      
	    }
	  }
	  
	  function handleMouseDown(e) {
	    isDrawing = true;
	    lastPoint = getMouse(e, canvas);
	  }

	  function handleMouseMove(e) {
	    if (!isDrawing) { return; }
	    
	    e.preventDefault();

	    var currentPoint = getMouse(e, canvas),
	        dist = distanceBetween(lastPoint, currentPoint),
	        angle = angleBetween(lastPoint, currentPoint),
	        x, y;
	    
	    for (var i = 0; i < dist; i++) {
	      x = lastPoint.x + (Math.sin(angle) * i) - 25;
	      y = lastPoint.y + (Math.cos(angle) * i) - 25;
	      ctx.globalCompositeOperation = 'destination-out';
	      ctx.drawImage(brush, x, y);
	    }
	    
	    lastPoint = currentPoint;
	    handlePercentage(getFilledInPixels(32));
	  }

	  function handleMouseUp(e) {
	    isDrawing = false;
	  }
	  
	})();
	
	function buyScratch(){
		
		 if (confirm("10포인트가 차감됩니다. 구매하시겠습니까?") == true){    //확인
			 $.ajax({
					url : "${pageContext.request.contextPath}/point/getPoint.do",
					point : {},
					success : function(point){
						console.log("point : "+point);
						if(point <10){
							 alert("포인트가 모자랍니다.");
							 location.reload(true);
						 }else{
							 $("#scratchBtn").attr("style","display:none");
						 $.ajax({
								url : "${pageContext.request.contextPath}/point/updatePoint.do",
								data : {increasePoint : -10,
										pContent : "스크래치 포인트 차감"
										},
								success : function(){
									 $("#ready-container").attr("style","display:none");
										$("#js-container").attr("style","display:");

									
					            }, error : function(jqxhr, textStatus, errorThrown){
					                console.log("차감 ajax 처리 실패");
					                //에러로그
					                console.log(jqxhr);
					                console.log(textStatus);
					                console.log(errorThrown);
					            }
							});
						 
							 
						 }

						
		            }, error : function(jqxhr, textStatus, errorThrown){
		                console.log("포인트 얻기ajax 처리 실패");
		                //에러로그
		                console.log(jqxhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            }
				});
			 

		 }else{   //취소

		     return false;

		 }
		
	}
</script>
</body>
</html>