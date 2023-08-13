<%@page errorPage="../error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Posts</title>
</head>
<body style="background: url(../img/adminBg.jpg); background-size: cover;">
	<!-- navbar -->
	<%@include file="./basic/navbar1.jsp"%>
	
	<nav class="navbar navbar-light bg-dark">
		<div class="container-fluid">
			<span class="navbar-brand mb-0 h1 text-light">Total Posts=</span>
			<button class="btn btn-success me-md-2" type="button" data-bs-toggle="modal" data-bs-target="#addNewPostModal">Add New Post</button>
		</div>
	</nav>
	<div class="container-fluid bg-light bg-opacity-10">
		<div class="row">
			<div class="col-2 p-3">
				<div class="list-group" id="list-tab" role="tablist">
					<a onclick="getPosts(0)"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home" aria-current="true"><i
						class="fa fa-bars" aria-hidden="true"> Categories </i></a>
					
					<a onclick="getPosts()"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"
						href="#list-profile" role="tab"> 
					</a>
				
				</div>
			</div>
			<div class="col-10 p-2">
				<div class="container mt-2" id="post_container">
					<div class="d-flex align-items-center" id="loader">
						<strong>Loading...</strong><br>
						<div class="spinner-border text-success" role="status"
							aria-hidden="true"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div><%@include file="./basic/footer.jsp"%></div>
</body>
</html>
<script>
	$(document).ready(function(e) {
	$("#addPostDataForm").on("submit",
	function(event) {
	event.preventDefault();
	console.log("submitted the form data")
	let form = new FormData(this);
	$.ajax({
	url : "../AddPost",
	type : 'POST',
	data : form,
	success : function(data,textStatus,jqXHR) {
	console.log(data);
	if (data.trim() == 'done') {
	swal(
	"Good job!",
	"Post Saved Successfully",
	"success");
		}
	},
	error : function(jqXHR,
	textStatus,
	errorThrow) {
	swal(
	"Error!",
	"Something went Wrong Try Again",
	"error");
	},
	processData : false,
	contentType : false
	})
  })
})
</script>
<!-- Modal  #addNewPostModal-->
<div class="modal fade" id="addNewPostModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header bg-info bg-opacity-15">
				<h5 class="modal-title text-dark text-b" id="exampleModalLabel">Add New Post</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body bg-info bg-opacity-10">
				<form id="addPostDataForm" action="../AddPost" method="post" enctype="multipart/form-data">
					<div class="container">
						<div class="row">
							<div class="col-4 bg-dark">
								<img src="../img/newPosts.jpg" class="img-thumbnail" style="width: 15rem; height: 15rem;">
							</div>
							<div class="col-8">
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">Select
										Category</label>
									<div class="col">
										<select class="form-control text-dark" name="catId">
											<option selected disabled>---choose any---</option>
											
										</select>
									</div>
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">Add
										Title</label> <input type="text" class="form-control" id="inputEmail3"
										name="pTitle">
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">Add
										Content</label> <input type="text" class="form-control"
										id="inputEmail3" name="pContent">
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">Code
										If Any</label>
									<textarea class="form-control" id="message-text" name="pCode"></textarea>
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">Description</label>
									<textarea class="form-control" type="text"
										id="exampleFormControlTextarea1" name="pDescription" rows="5"></textarea>
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">Add
										Picture</label> <input type="file" name="pPic" class="btn btn-dark">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer bg-info bg-opacity-15">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" id="submit" class="btn btn-success">Do
							Post</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	function getPosts(cId)
	{
		$.ajax({
			url:"../load_post.jsp",
			data:{catId:cId},
			method:"Post",
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
				$("#loader").hide();
				$("#post_container").html(data);
			}
		})
	}
	$(document).ready(function(e){
		getPosts()
	})
</script>