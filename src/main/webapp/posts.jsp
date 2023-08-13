
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Posts</title>
</head>
<body>
<!-- navbar--------------------------------------------------------------------->
	<%@include file="./basic/navbar.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<div class="container-fluid p-1">
		<div class="row">
			<div class="col-2">
				<div class="list-group" id="list-tab" role="tablist">
					<a
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home" aria-current="true"><i
						class="fa fa-bars" aria-hidden="true">  Categories </i></a>
					<%-- <%
					 postdao = new PostDao(ConnectionProvider.getConnection());
					ArrayList<Categories> categories = postdao.getAllCategories();
					for (categories c : categories) {
					%> --%>
					<a
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"
						id="list-profile-list" data-bs-toggle="list" href="#list-profile"
						role="tab" aria-controls="list-profile"> <%=/* c.getcName() */%>
					</a>
					<%-- <%
					}
					%> --%>
				</div>
			</div>
			<div class="col-10">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-home"
						role="tabpanel" aria-labelledby="list-home-list">
						<div class="text-center" id="loader">
								<div class="spinner-border text-success" role="status">
									<span class="visually-hidden">Loading...</span>
								</div>
							</div>
						<div class="container mt-2" id="post_container">
						</div>
					</div>
					<div class="tab-pane fade" id="list-profile" role="tabpanel"
						aria-labelledby="list-profile-list">...</div>
					<div class="tab-pane fade" id="list-messages" role="tabpanel"
						aria-labelledby="list-messages-list">...</div>
					<div class="tab-pane fade" id="list-settings" role="tabpanel"
						aria-labelledby="list-settings-list">...</div>
				</div>
			</div>
		</div>
	</div>
		
	<!-- footer -->
	<div>
		<%@include file="./basic/footer.jsp"%>
	</div>
</body>
</html>
<script>
	$(document).ready(function (e){
		$("#addPostDataForm").on("submit",function(event){
			event.preventDefault();
			console.log("submitted the form data")
			let form=new FormData(this);
			$.ajax({
				url:"addPost",
				type:'POST',
				data:form,
				success:function(data,textStatus,jqXHR){
					console.log(data);
				},
				error:function(jqXHR,textStatus,errorThrow){	
				},
				processData:false,
				contentType:false
			})
		}
	})
</script>