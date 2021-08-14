<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</head>

<body>
	<div id="wrap">

		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content">

			<ul id="admin-menu" class="clearfix">
				<li class="tabbtn"><a href="${pageContext.request.contextPath }/${blogInfo.id}/admin/basic">기본설정</a></li>
				<li class="tabbtn selected"><a href="${pageContext.request.contextPath }/${blogInfo.id}/admin/category">카테고리</a></li>
				<li class="tabbtn"><a href="${pageContext.request.contextPath }/${blogInfo.id}/admin/writeForm">글작성</a></li>
			</ul>
			<!-- admin-menu -->

			<div id="admin-content">

				<table id="admin-cate-list">
					<colgroup>
						<col style="width: 50px;">
						<col style="width: 200px;">
						<col style="width: 100px;">
						<col>
						<col style="width: 50px;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리명</th>
							<th>포스트 수</th>
							<th>설명</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="cateList">
						<!-- 리스트 영역 -->

						<!-- 리스트 영역 -->
					</tbody>
				</table>

				<table id="admin-cate-add">
					<colgroup>
						<col style="width: 100px;">
						<col style="">
					</colgroup>
					<tr>
						<td class="t">카테고리명</td>
						<td><input type="text" name="name" value=""></td>
					</tr>
					<tr>
						<td class="t">설명</td>
						<td><input type="text" name="desc"></td>
					</tr>
				</table>

				<div id="btnArea">
					<button id="btnAddCate" class="btn_l" type="submit">카테고리추가</button>
				</div>

			</div>
			<!-- //admin-content -->
		</div>
		<!-- //content -->

		<!-- 개인블로그 푸터 -->
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>

	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">
	//카테고리 호출 - ajax 방식
	$(document).ready(function(){

		var id = "${blogInfo.id}";
		
		$.ajax({
			//요청 코드
			url : "${pageContext.request.contextPath}/${blogInfo.id}/admin/category/getList", //데이터를 받을 주소를 입력
			type : "post", //get, post 데이터를 보낼 때, 방식을 설정
			contentType : "application/json",
			data : JSON.stringify(id), //보내는 데이터의 형식, 객체를 생성하여 집어넣어도 된다

			//데이터를 받는 코드
			dataType : "json", //데이터를 받는 형식, 일반적인 java코드를 이해하지 못하기 때문에 json으로 번역하여 받는다

			// 받아온 cateVo로 이하의 내용 처리
			success : function(adminCateList) {
				for(var num = 0; num < adminCateList.length; num++){
					render(adminCateList[num], "list");
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				// 에러 로그는 아래처럼 확인해볼 수 있다. 
				alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
			}
		});
		
	});
	
	//카테고리 추가 - ajax 방식
	$("#btnAddCate").on("click", function() {
		event.preventDefault();

		//CateVo 생성
		var CateVo = {
			id : "${blogInfo.id}",
			cateName : $("[name=name]").val(),
			description : $("[name=desc]").val()
		}

		//ajax 요청
		$.ajax({
			//요청 코드
			url : "${pageContext.request.contextPath}/${blogInfo.id}/admin/category/add", //데이터를 받을 주소를 입력
			type : "post", //get, post 데이터를 보낼 때, 방식을 설정
			contentType : "application/json",
			data : JSON.stringify(CateVo), //보내는 데이터의 형식, 객체를 생성하여 집어넣어도 된다

			//데이터를 받는 코드
			dataType : "json", //데이터를 받는 형식, 일반적인 java코드를 이해하지 못하기 때문에 json으로 번역하여 받는다

			// 받아온 cateVo로 이하의 내용 처리
			success : function(cateVo) {
				render(cateVo, "add");
				$("[name=name]").val("");
				$("[name=desc]").val("");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				// 에러 로그는 아래처럼 확인해볼 수 있다. 
				alert("업로드 에러\ncode : " + jqXHR.status + "\nerror message : " + jqXHR.responseText);
			}
		});

	})

	//카테고리 삭제 - ajax 방식
	$("#cateList").on("click", ".btnCateDel", function() {
		//삭제할 카테고리 넘버 획득
		var cateNo = $(this).data("no");
		
		//count 값을 dataset에 넣지 않는 이유 : 가변형 값은 되도록이면 지정하여 넣지 않는다
		//외부에서 삭제 가능한 게시판일 경우, count등 유동적인 값은 외부 요인으로 변경될 요지가 있다
		
		//ajax 요청
		$.ajax({
			//요청 코드
			url : "${pageContext.request.contextPath}/${blogInfo.id}/admin/category/delete", //데이터를 받을 주소를 입력
			type : "post", //get, post 데이터를 보낼 때, 방식을 설정
			contentType : "application/json",
			data : JSON.stringify(cateNo), //보내는 데이터의 형식, 객체를 생성하여 집어넣어도 된다

			//데이터를 받는 코드
			dataType : "json", //데이터를 받는 형식, 일반적인 java코드를 이해하지 못하기 때문에 json으로 번역하여 받는다

			// 받아온 결과로 이하의 내용 처리
			success : function(success) {

				if (success === true) {
					$("#t-" + cateNo).remove();
				} else if(success === false) {
					alert("해당 카테고리에 포스트가 남아있어 삭제할 수 없습니다.")
				}

			},
			error : function(jqXHR, textStatus, errorThrown) {
				// 에러 로그는 아래처럼 확인해볼 수 있다. 
				alert("업로드 에러\ncode : " + jqXHR.status	+ "\nerror message : " + jqXHR.responseText);
			}
		});
	
	
	});

	//카테고리 렌더링용 함수
	function render(cateVo, type) {
		var str = "";
		str += '<tr id="t-'+ cateVo.cateNo +'">';
		str += '	<td>' + cateVo.cateNo + '</td>';
		str += '	<td>' + cateVo.cateName + '</td>';
		str += '	<td>' + cateVo.count + '</td>';
		str += '	<td>' + cateVo.description + '</td>';
		str += '	<td class="text-center">';
		str += '		<img class="btnCateDel" data-no="'+ cateVo.cateNo +'" src="${pageContext.request.contextPath}/assets/images/delete.jpg">';
		str += '	</td>';
		str += '</tr>';

		if(type === "list") {
			$("#cateList").append(str);
		} else if (type === "add") {
			$("#cateList").prepend(str);
		}
		
	}
</script>

</html>