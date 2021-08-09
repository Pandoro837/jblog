<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</head>
<body>
	<div id="center-content">
		
		<!--메인 해더 자리 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>

		<div>		
			<form id="joinForm" method="post" action="${pageContext.request.contextPath}/user/join">
				<table>
			      	<colgroup>
						<col style="width: 100px;">
						<col style="width: 170px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td><label for="txtId">아이디</label></td>
		      			<td><input id="txtId" type="text" name="id"></td>
		      			<td><button id="btnIdCheck" type="button">아이디체크</button></td>
		      		</tr>
		      		<tr>
		      			<td id="tdMsg" colspan="2">사용할 수 있는 아이디 입니다.</td>
		      		</tr> 
		      		<tr>
		      			<td><label for="txtPassword">패스워드</label> </td>
		      			<td><input id="txtPassword" type="password" name="password"  value=""></td>   
		      			<td></td>  			
		      		</tr> 
		      		<tr>
		      			<td><label for="txtUserName">이름</label> </td>
		      			<td><input id="txtUserName" type="text" name="userName"  value=""></td>   
		      			<td></td>  			
		      		</tr>  
		      		<tr>
		      			<td><span>약관동의</span> </td>
		      			<td colspan="3">
		      				<input id="chkAgree" type="checkbox" name="agree" value="y">
		      				<label for="chkAgree">서비스 약관에 동의합니다.</label>
		      			</td>   
		      		</tr>   		
		      	</table>
	      		<div id="btnArea">
					<button id="btnJoin" class="btn" type="submit" >회원가입</button>
				</div>
	      		
			</form>
			
		</div>
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
		
	</div>

</body>

<script type="text/javascript">
	$( document ).ready(function(){
		$("#tdMsg").hide();
	})
	
	$("#btnIdCheck").on("click", function(){
		console.log("id 중복체크 클릭")
		
		var id = $("#txtId").val();
		console.log(id);
		
		var check = { id : id };
		
		$.ajax({
	        //요청 코드
	        url: "${pageContext.request.contextPath}/user/idCheck",				//데이터를 받을 주소를 입력
	        type: "post",				//get, post 데이터를 보낼 때, 방식을 설정
	        //contentType: "application/json",
	        data: check,				//보내는 데이터의 형식, 객체를 생성하여 집어넣어도 된다
	        
	        //데이터를 받는 코드
	        dataType: "json",			//데이터를 받는 형식, 일반적인 java코드를 이해하지 못하기 때문에 json으로 번역하여 받는다
	        success: function(idCheck) {
	            // TODO : 결과로 받은 resultData로 작업 !
	            console.log(idCheck);
	        	
	        	if(idCheck == true) {
	        		$("#tdMsg").show();
	        	} else if (idCheck == false) {
	        		alert("다른 아이디로 가입해 주세요.");
	        	}
	        	
	        	//중복 체크 이후, 다시 아이디를 수정하려고 할 때 메세지 삭제
	        	$("#txtId").on("click",function(){
	        		$("#tdMsg").hide();
	        		idCheck = false;
	        		console.log(idCheck);
	        	});
	        	
	        	
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            // 에러 로그는 아래처럼 확인해볼 수 있다. 
	            alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
	        }
		});
		
	});
</script>
	
</html>