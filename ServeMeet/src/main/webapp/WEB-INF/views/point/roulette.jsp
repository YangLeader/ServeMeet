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
        <title>행운의 룰렛</title>
		<c:import url="../common/header.jsp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Winwheel.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
        <style>
        .frame{
        	background-color : white;
        	margin-left : 300px;
        	margin-right : 300px;
        }
         #canvas{
         	position : relative;
         	z-index :1;
         	margin-top: 100px;
         }
         .button{
         	position : relative;
         	width : 100px;
         	height : 100px;
         	z-index : 2;
         	padding : auto;
         	bottom : 265px;
         	
         }
         #startBtn{
         	width : 80px;
         	height : 80px;
         }
        </style>	
    </head>
    <body>
        <div align="center" class = "frame">
        	<br>
        	<br>
            <h1>행운의 룰렛</h1>
            <br>
            <p>최대 500포인특 획득!</p>
            <br />
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                   <%--  <td>
                        <div class="power_controls">
                            <br />
                            <br />
                            <table class="power" cellpadding="10" cellspacing="0" style="visibility:hidden">
                                <tr>
                                    <th align="center">회전 속도</th>
                                </tr>
                                <tr>
                                    <td width="78" align="center" id="pw3" onClick="powerSelected(3);">강</td>
                                </tr>
                                <tr>
                                    <td align="center" id="pw2" onClick="powerSelected(2);">중</td>
                                </tr>
                                <tr>
                                    <td align="center" id="pw1" onClick="powerSelected(1);">약</td>
                                </tr>
                            </table>
                            <br />
                            <img id="spin_button" src="${pageContext.request.contextPath}/resources/images/spin_off.png" alt="Spin" onClick="startSpin();" />
                            <br /><br />
                            &nbsp;&nbsp;<a href="#" onClick="resetWheel(); return false;">다시하기</a><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(reset)
                        </div>
                    </td> --%>
                    <td width="451" height="584" class="the_wheel" align="center" valign="center">
                        <canvas id="canvas" width="434" height="434">
                            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                        </canvas>
                        <div class="button" >
                        <img id="startBtn" src="${pageContext.request.contextPath}/resources/images/start.png" onClick="startSpin();">
                    	</div>
                    </td>
                </tr>
            </table>
            <br>
        </div>
    <c:import url="../common/footer.jsp"/>
        <script>
            // Create new wheel object specifying the parameters at creation time.
            var theWheel = new Winwheel({
                'numSegments'  : 10,     // Specify number of segments.
                'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
                'textFontSize' : 28,    // Set font size as desired.
                'segments'     :        // Define segments including colour and text.
                [
                   {'fillStyle' : '#eae56f', 'text' : '꽝','data' : 'fail'},
                   {'fillStyle' : '#00BFFF', 'text' : '1포인트','data' : '1'},
                   {'fillStyle' : '#7de6ef', 'text' : '100포인트','data' : '100'},
                   {'fillStyle' : '#e7706f', 'text' : '꽝','data' : 'fail'},
                   {'fillStyle' : '#FAAC58', 'text' : '50포인트','data' : '50'},
                   {'fillStyle' : '#eae56f', 'text' : '꽝','data' : 'fail'},
                   {'fillStyle' : '#F5A9D0', 'text' : '1포인트','data' : '1'},
                   {'fillStyle' : '#89f26e', 'text' : '꽝','data' : 'fail'},
                   {'fillStyle' : '#7de6ef', 'text' : '10포인트','data' : '10'},
                   {'fillStyle' : '#e7706f', 'text' : '500포인트','data' : '500'}
                ],
                'animation' :           // Specify the animation to use.
                {
                    'type'     : 'spinToStop',
                    'duration' : 5,     // Duration in seconds.
                    'spins'    : 10,     // Number of complete spins.
                    'callbackFinished' : alertPrize
                }
            });

            // Vars used by the code in this page to do power controls.
            var wheelPower    = 0;
            var wheelSpinning = false;

            // -------------------------------------------------------
            // Function to handle the onClick on the power buttons.
            // -------------------------------------------------------
            function powerSelected(powerLevel)
            {
                // Ensure that power can't be changed while wheel is spinning.
                if (wheelSpinning == false)
                {
                    // Reset all to grey incase this is not the first time the user has selected the power.
                    document.getElementById('pw1').className = "";
                    document.getElementById('pw2').className = "";
                    document.getElementById('pw3').className = "";

                    // Now light up all cells below-and-including the one selected by changing the class.
                    if (powerLevel >= 1)
                    {
                        document.getElementById('pw1').className = "pw1";
                    }

                    if (powerLevel >= 2)
                    {
                        document.getElementById('pw2').className = "pw2";
                    }

                    if (powerLevel >= 3)
                    {
                        document.getElementById('pw3').className = "pw3";
                    }

                    // Set wheelPower var used when spin button is clicked.
                    wheelPower = powerLevel;

                    // Light up the spin button by changing it's source image and adding a clickable class to it.
                    document.getElementById('spin_button').src = "${pageContext.request.contextPath}/resources/images/spin_on.png";
                    document.getElementById('spin_button').className = "clickable";
                }
            }

            // -------------------------------------------------------
            // Click handler for spin button.
            // -------------------------------------------------------
            function startSpin()
            {
                // 회전판이 돌고있는 중에는 클릭할 수 없음
                if (wheelSpinning == false)
                {
                	$.ajax({
                		url : "${pageContext.request.contextPath}/point/getCount.do",
                		data : {pContent : "룰렛 포인트 차감"},
                		success : function(data){
                			console.log("count : " +data )
                			if(data>=3){
                				alert("룰렛은 하루에 3번만 참여하실 수 있습니다.");
                			}else{
                				if (confirm("10포인트가 차감됩니다. 구매하시겠습니까?") == true){    //확인
                          			 $.ajax({
                          					url : "${pageContext.request.contextPath}/point/getPoint.do",
                          					success : function(point){
                          						console.log("point : "+point);
                          						if(point < 10){
                          							 alert("포인트가 모자랍니다.");
                          							 location.reload(true);
                          						 }else{
                          						
                          						 $.ajax({
                          								url : "${pageContext.request.contextPath}/point/updatePoint.do",
                          								data : {increasePoint : -10,
                          										pContent : "룰렛 포인트 차감"
                          										},
                          								success : function(){
                          								// Based on the power level selected adjust the number of spins for the wheel, the more times is has
                                  		                    // to rotate with the duration of the animation the quicker the wheel spins.
                                  		                	 if (wheelPower == 1)
                                  		                     {
                                  		                         theWheel.animation.spins = 3;
                                  		                     }
                                  		                     else if (wheelPower == 2)
                                  		                     {
                                  		                         theWheel.animation.spins = 8;
                                  		                     }
                                  		                     else if (wheelPower == 3)
                                  		                     {
                                  		                         theWheel.animation.spins = 15;
                                  		                     }

                                  		                     // Disable the spin button so can't click again while wheel is spinning.
                                  		                     document.getElementById('spin_button').src       = "${pageContext.request.contextPath}/resources/images/spin_off.png";
                                  		                     document.getElementById('spin_button').className = "";

                                  		                     // Begin the spin animation by calling startAnimation on the wheel object.
                                  		                     theWheel.startAnimation();

                                  		                     // Set to true so that power can't be changed and spin button re-enabled during
                                  		                     // the current animation. The user will have to reset before spinning again.
                                  		                     wheelSpinning = true;
                          									
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
                		}, error : function(jqxhr, textStatus, errorThrown){
      		                console.log("포인트 얻기ajax 처리 실패");
      		                //에러로그
      		                console.log(jqxhr);
      		                console.log(textStatus);
      		                console.log(errorThrown);
      		            }
                	})
                	
                    /* // Based on the power level selected adjust the number of spins for the wheel, the more times is has
                    // to rotate with the duration of the animation the quicker the wheel spins.
                	 if (wheelPower == 1)
                     {
                         theWheel.animation.spins = 3;
                     }
                     else if (wheelPower == 2)
                     {
                         theWheel.animation.spins = 8;
                     }
                     else if (wheelPower == 3)
                     {
                         theWheel.animation.spins = 15;
                     }

                     // Disable the spin button so can't click again while wheel is spinning.
                     document.getElementById('spin_button').src       = "${pageContext.request.contextPath}/resources/images/spin_off.png";
                     document.getElementById('spin_button').className = "";

                     // Begin the spin animation by calling startAnimation on the wheel object.
                     theWheel.startAnimation();

                     // Set to true so that power can't be changed and spin button re-enabled during
                     // the current animation. The user will have to reset before spinning again.
                     wheelSpinning = true; */
                }
            }

            // -------------------------------------------------------
            // Function for reset button.
            // -------------------------------------------------------
            function resetWheel()
            {
                theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
                theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
                theWheel.draw();                // Call draw to render changes to the wheel.

                document.getElementById('pw1').className = "";  // Remove all colours from the power level indicators.
                document.getElementById('pw2').className = "";
                document.getElementById('pw3').className = "";

                wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
            }

            // -------------------------------------------------------
            // Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
            // note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
            // -------------------------------------------------------
            function alertPrize(indicatedSegment)
            {
                // Do basic alert of the segment text. You would probably want to do something more interesting with this information.
                
                if(indicatedSegment.data=="fail"){
                	alert("아쉽지만 포인트를 획득하지 못했습니다.");
                	resetWheel(); return false;
                }else {
                	alert("축하합니다!" + indicatedSegment.data + "포인트에 당첨되었습니다!");
                	$.ajax({
    					url : "${pageContext.request.contextPath}/point/updatePoint.do",
    					data : {increasePoint : indicatedSegment.data,
    							pContent : "룰렛 포인트 획득"
    							},
    					success : function(){
    						
    		            }, error : function(jqxhr, textStatus, errorThrown){
    		                console.log("ajax 처리 실패");
    		                //에러로그
    		                console.log(jqxhr);
    		                console.log(textStatus);
    		                console.log(errorThrown);
    		            }
    				});
                	resetWheel(); return false;
                }
            }
        </script>
        
    </body>
</html>