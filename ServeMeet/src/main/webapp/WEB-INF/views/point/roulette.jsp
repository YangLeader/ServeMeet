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
        	margin-left : 15%;
        	margin-right : 15%;
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
         .msgBox{
         	width : 70%;
         	height : 190px;
         	border-radius:10px;
         	border : 1px solid #265a88;
         	padding :10px;
         	text-align : left;
         	background-color : #E0ECF8;
         }
        </style>	
    </head>
    <body>
        <div align="center" class = "frame">
        	<br>
        	<br>
            <h1>행운의 룰렛</h1>
            <br>
            <p>하루 세번, 최대 <b>500</b>포인트 획득!</p>
            <br />
            <table cellpadding="0" cellspacing="0" border="0">
            	<tr>
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
            <div class ="msgBox">
            	<h3><b>&nbsp;꼭 확인하세요!</b></h3>
            	<ul>
            		<li>1일 3회 참여 가능합니다.</li>
            		<li>참여시 10포인트가 차감됩니다.</li>
            		<li>당첨 여부는 즉시 확인하실 수 있습니다.</li>
            		<li>당첨 포인트는 실시간으로 적립됩니다.</li>
            		<li>포인트 적립은 마이페이지에서 확인하실 수 있습니다.</li>
            	</ul>
            </div>
            <br>
        </div>
    <c:import url="../common/footer.jsp"/>
        <script>
            // Create new wheel object specifying the parameters at creation time.
            var theWheel = new Winwheel({
                'numSegments'  : 6,     // Specify number of segments.
                'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
                'textFontSize' : 28,    // Set font size as desired.
                'segments'     :        // Define segments including colour and text.
                [
                   {'fillStyle' : '#E6E6E6', 'text' : '꽝','data' : 'fail'},
                   {'fillStyle' : '#afc0f1', 'text' : '1p','data' : '1'},
                   {'fillStyle' : '#E6E6E6', 'text' : '100p','data' : '100'},
                   {'fillStyle' : '#afc0f1', 'text' : '50p','data' : '50'},
                   {'fillStyle' : '#E6E6E6', 'text' : '10p','data' : '10'},
                   {'fillStyle' : '#afc0f1', 'text' : '★★\n500p','data' : '500'}
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
            var wheelSpinning = false;

           

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

                				swal("룰렛은 하루에 3번만 참여하실 수 있습니다.","내일 또 참여해주세요");
                			}else{
                				swal({
                					  title: "10포인트가 차감됩니다.",
                					  text: "그래도 계속하시겠습니까?",
                					  icon: "warning",
                					  buttons: true,
                					  dangerMode: true,
                					}).then((willDelete) => {
                						  if (willDelete) {
                							  $.ajax({
                                					url : "${pageContext.request.contextPath}/point/getPoint.do",
                                					success : function(point){
                                						console.log("point : "+point);
                                						if(point < 10){
                                							 swal("포인트가 모자랍니다.");
                                							 location.reload(true);
                                						 }else{
                                						
                                						 $.ajax({
                                								url : "${pageContext.request.contextPath}/point/updatePoint.do",
                                								data : {increasePoint : -10,
                                										pContent : "룰렛 포인트 차감"
                                										},
                                								success : function(){
                                								//확률 조작 코드
                                									var rand = Math.random();
                                									let stopAt = 0;
                                									
                                									if(rand>0.6){
                                										stopAt = (1 + Math.floor((Math.random() * 59)))
                                									}else if(rand>0.3&&rand<=0.6){
                                										stopAt = (61 + Math.floor((Math.random() * 59)))
                                									}else if(rand>0.1&&rand<=0.3){
                                										stopAt = (241 + Math.floor((Math.random() * 59)))
                                									}else if(rand>0.05&&rand<=0.1){
                                										stopAt = (181 + Math.floor((Math.random() * 59)))
                                									}else if(rand>0.01&&rand<=0.05){
                                										stopAt = (121 + Math.floor((Math.random() * 59)))
                                									}else{
                                										stopAt = (300 + Math.floor((Math.random() * 59)))
                                									}
       															 
       															
      														 
      														     // 휠이 돌아가기전에 멈추는 각 지정
      														     theWheel.animation.stopAngle = stopAt;
                                        		                     // Begin the spin animation by calling startAnimation on the wheel object.
                                        		                     theWheel.startAnimation();

                                        		                     // 휠이 돌아가는동안은 시작버튼 누를 수 없음
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
                							  } else {
                							    return false;
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
                	})
                	
                }
            }
            
            function controlRandom(){
            	
            }

            // -------------------------------------------------------
            // 리셋함수
            // -------------------------------------------------------
            function resetWheel()
            {
                theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
                theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
                theWheel.draw();                // Call draw to render changes to the wheel.


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
                	swal("아쉽지만 포인트를 획득하지 못했습니다.");
                	resetWheel(); return false;
                }else {
                	swal("축하합니다!" + indicatedSegment.data + "포인트에 당첨되었습니다!");
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