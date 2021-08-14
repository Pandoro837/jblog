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
					<c:if test="${!empty authUser && !empty crtPost}">
						<div id="comment_input">
							<table>
								<tr>
									<td id="commentId">${authUser.userName }</td>
									<td><input id="cmtContent" type="text" name="content" value=""></td>
									<td><button id="commentBtn">저장</button></td>
								</tr>
							</table>
						</div>
					</c:if>	
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
	
	if(${authUser != null}) {
	
		$("#commentBtn").on("click", function(){
			console.log("댓글 버튼 클릭")
			var userNo = "${authUser.userNo}";
			var cmtContent = $("#cmtContent").val();
			
			console.log(userNo);
			console.log(cmtContent);
			
		});
	}
	
</script>

</html>