<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">

		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content" class="clearfix">
			<div id="profilecate_area">
				<div id="profile">

					<c:choose>
						<c:when test="${blogInfo.logoFile eq 'spring-logo.jpg'}">
							<img id="proImg" src="${pageContext.request.contextPath}/assets/images/spring-logo.jpg">
						</c:when>
						<c:otherwise>
							<!-- 사용자업로드 이미지 -->
							<img id="proImg" src="${pageContext.request.contextPath}/images/${blogInfo.logoFile}">
						</c:otherwise>
					</c:choose>

					<div id="nick">${blogInfo.userName}(${blogInfo.id })님</div>

				</div>
				<div id="cate">
					<div class="text-left">
						<strong>카테고리</strong>
					</div>
					<ul id="cateList" class="text-left">
						<c:forEach items="${cateList}" var="cateInfo">
							<li><a href="${pageContext.request.contextPath}/${blogInfo.id}?crtCate=${cateInfo.cateNo}">${cateInfo.cateName }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- profilecate_area -->

			<div id="post_area">

				<c:choose>
					<c:when test="${!empty crtPost}">
						<div id="postBox" class="clearfix">
							<div id="postTitle" class="text-left" data-postno="${crtPost.postNo }">
								<strong>${crtPost.postTitle }</strong>
							</div>
							<div id="postDate" class="text-left">
								<strong>${crtPost.regDate }</strong>
							</div>
							<div id="postNick">${crtPost.userName }(${crtPost.id })님</div>
						</div>
						<!-- //postBox -->

						<div id="post">${crtPost.postContent }</div>
						<!-- //post -->
					</c:when>
					<c:otherwise>
						<!-- 글이 없는 경우 -->
						<div id="postBox" class="clearfix">
							<div id="postTitle" class="text-left">
								<strong>등록된 글이 없습니다.</strong>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div id="comment_area">
					<table>
						<c:if test="${!empty authUser && !empty crtPost}">
							<div id="comment_input">
								<tr>
									<td id="commentId">${authUser.userName }</td>
									<td><input id="cmtContent" type="text" name="content" value=""></td>
									<td><button id="commentBtn">저장</button></td>
								</tr>
							</div>
						</c:if>	
					
					<!-- 코멘트 출력 영역 -->
					<div id="commentList">
						
					</div>
					<!-- 코멘트 출력 영역 -->
					</table>
				</div>
				<div id="list">
					<div id="listTitle" class="text-left">
						<strong>카테고리의 글</strong>
					</div>
					<table>
						<colgroup>
							<col style="">
							<col style="width: 20%;">
						</colgroup>
					
						<c:if test="${!empty crtPostList }">
							<c:forEach items="${crtPostList}" var="postList">
								<tr>
									<td class="text-left"><a href="${pageContext.request.contextPath}/${blogInfo.id}?crtCate=${postList.cateNo}&postNo=${postList.postNo}">${postList.postTitle }</a></td>
									<td class="text-right">${postList.regDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<!-- //list -->
			</div>
			<!-- //post_area -->



		</div>
		<!-- //content -->
		<div class=></div>
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>



	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">
	
	//코멘트 리스트 호출
	$(document).ready(function(){
		
		if(${!empty crtPost}) {
			console.log("포스트 호출용 메소드");
			var postNo = $("#postTitle").data("postno");
			console.log(postNo);
			
			//코멘트 리스트를 ajax로 요청
			$.ajax({
				//요청 코드
				url : "${pageContext.request.contextPath}/${blogInfo.id}/cmtList", //데이터를 받을 주소를 입력
				type : "post", //get, post 데이터를 보낼 때, 방식을 설정
				contentType : "application/json",
				data : JSON.stringify(postNo), //보내는 데이터의 형식, 객체를 생성하여 집어넣어도 된다

				//데이터를 받는 코드
				dataType : "json", //데이터를 받는 형식, 일반적인 java코드를 이해하지 못하기 때문에 json으로 번역하여 받는다

				// 받아온 cateVo로 이하의 내용 처리
				success : function(commentList) {
					if(commentList[0] != null) {
						for(var num = 0; num < commentList.length; num++){
							render(commentList[num], "list");
						}
					} else {
						console.log("리스트가 없습니다")
					}
				},
				
				error : function(jqXHR, textStatus, errorThrown) {
					// 에러 로그는 아래처럼 확인해볼 수 있다. 
					alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
				}
			});
			
		}
		
	});
	
	
	//코멘트 작성
	if(${authUser != null}) {
	
		$("#commentBtn").on("click", function(){
			console.log("댓글 버튼 클릭");
			
			console.log("${authUser.userNo}");
			console.log($("#cmtContent").val());
			console.log($("#postTitle").data("postno"));
			
			var CommentVo = {
				userNo : "${authUser.userNo}",
				postNo : $("#postTitle").data("postno"),
				cmtContent : $("#cmtContent").val()
			}
			
			//코멘트 추가를 ajax로 요청
			$.ajax({
				//요청 코드
				url : "${pageContext.request.contextPath}/${blogInfo.id}/addCmt", //데이터를 받을 주소를 입력
				type : "post", //get, post 데이터를 보낼 때, 방식을 설정
				contentType : "application/json",
				data : JSON.stringify(CommentVo), //보내는 데이터의 형식, 객체를 생성하여 집어넣어도 된다

				//데이터를 받는 코드
				dataType : "json", //데이터를 받는 형식, 일반적인 java코드를 이해하지 못하기 때문에 json으로 번역하여 받는다

				// 받아온 cateVo로 이하의 내용 처리
				success : function(addedComment) {
					console.log(addedComment);
				},
				
				error : function(jqXHR, textStatus, errorThrown) {
					// 에러 로그는 아래처럼 확인해볼 수 있다. 
					alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
				}
			});
			
		});
	}
	
	function render(commentVo, type){
		var str='';
		str+='<tr id="t-' + commentVo.cmtNo + '" class="comment">';
		str+='	<td>' + commentVo.userName + '</td>';
		str+='	<td>' + commentVo.cmtContent + '</td>';
		str+='	<td>' + commentVo.regDate + '</td>';
		str+='	<td>';
		str+='		<img class="btnCateDel" data-no="'+ commentVo.cmtNo +'" src="${pageContext.request.contextPath}/assets/images/delete.jpg">'
		str+='	</td>';
		str+='</tr>';
		
		if(type === "list") {
			$("#commentList").append(str);
		} else if(type === "add") {
			$("#commentList").prepend(str);
		}
		
	}
	
</script>

</html>