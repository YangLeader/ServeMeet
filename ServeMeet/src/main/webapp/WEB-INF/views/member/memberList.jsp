<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/adminMember.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board_style.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
	<div class="section">
	        <!-- <div class="all_logout"><a href="javascript:;" class="btn_model" onclick="logoutAll();"><span class="btn6">전체 로그아웃</span></a></div> -->
			<table border="1" class="tbl_row">
			<col width="10%"><col width="15%"><col width="15%"><col width="20%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
				<thead>
					<tr>
						<th scope="col" class="ti-info"> 회원번호 </th>
						<th scope="col" class="ti-user"> 아이디</th>
						<th scope="col" class="ti-face-smile"> 닉네임</th>
						<th scope="col" class="ti-email"> 이메일</th>
						<th scope="col" class="ti-money"> 포인트</th>
						<th scope="col" class="ti-na"> 상태</th>
						<th scope="col" class="ti-calendar"> 가입일</th>
						<th scope="col" class="ti-face-sad"> 회원정지</th>
					</tr>
				</thead>
				<tbody>
	        		<c:forEach items="${list}" var="m" >
					<tr>
						<td>${m.userNo}</td>
						<td>${m.userId}</td>
						<td>${m.userName}</td>
						<td>${m.email}</td>
						<td>${m.point}</td>		
						<td>
							<c:set var = "stat" value="${m.userStatus}"/>
							<c:if test="${stat eq 'Y'}">
							 가입
							</c:if>
							<c:set var = "stat" value="${m.userStatus}"/>
							<c:if test="${stat eq 'N'}">
							 탈퇴
							</c:if>
						</td>
						<td>
							<c:set var = "time" value = "${m.entryDate}" />
							<fmt:formatDate pattern = "yyyy-MM-dd" value = "${time}" />
						</td>
						<td>
							<c:set var = "stat" value="${m.userStatus}"/>
							<c:if test="${stat eq 'Y'}">
							 <button name="blind" id="${m.userNo}" onclick="deleteM(${m.userNo});" class="btn btn-info btn-sm ti-lock">탈퇴</button>
							</c:if>
							<c:if test="${stat eq 'N'}">
							 <button name="reset" id="${m.userNo}" onclick="returnM(${m.userNo});" class="btn btn-info btn-sm ti-unlock">복구</button>
							</c:if>
							
						</td>
					</tr>
					</c:forEach>
	        	</tbody> 
	    	</table>
	    	
	    	<div class="pager">
				<c:out value="${pageBar}" escapeXml="false"/>
			</div> 
		</div>
		
		
<script>
		

		function deleteM(userNo){
			
			console.log(userNo);
			
			swal({
				  title: "정말로 탈퇴 처리 하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				  closeOnClickOutside: false
				}).then((willDelete) => {
					if(willDelete){
						$.ajax({
				            url  : "${pageContext.request.contextPath}/member/memberDelete.do",
				            data : {userNo : userNo},
				            success : function(data){
				            	swal("회원탈퇴가 완료되었습니다.");
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});

						location.reload(true);
					}else {
					    return false;
					 }
				});
			
		}
		
		function returnM(userNo){
			
			console.log(userNo);
			
			swal({
				  title: "정말로 복구 하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				  closeOnClickOutside: false
				}).then((willDelete) => {
					if(willDelete){
						$.ajax({
				            url  : "${pageContext.request.contextPath}/member/memberReturn.do",
				            data : {userNo : userNo},
				            success : function(data){
				            	swal("회원복구가 완료되었습니다.");
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});

						location.reload(true);
					}else {
					    return false;
					 }
				});
			
		}

</script> 