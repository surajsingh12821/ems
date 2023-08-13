
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Various Subjects </title>
</head>
<body>
<!-- navbar--------------------------------------------------------------------->
	<!-- navbar -->
	<%@include file="./basic/navbar1.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<!--body----------------------------------------------------------------->
	<div class="container-fluid">
		<div class="row">
			<div class="col-2 mt-4">
				<div class="list-group list-group-light" id="list-tab" role="tablist">
					<a onclick="getSubjectName()"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-secondary active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home" aria-current="true" aria-hidden="true"> <h5><i class="fa-sharp fa-solid fa-layer-group"></i>  Subjects </i></h5>  </a>
					<%
						SubjectDao subjectDao=new SubjectDao(MySqlConnection.getConnection());
						Set<String> names=subjectDao.getOnly_SubjectNameById();
					for (String sub : names) {
					%>
					<a onclick="getSubjectName('<%=sub %>')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-secondary"
						id="list-profile-list" data-bs-toggle="list" href="#list-profile"
						role="tab" aria-controls="list-profile"> <h6><i
						class="fa fa-bars" >  <%=sub%></i></h6>
					</a>
					<%
					}
					%>
				</div>
			</div>
			<div class="col-10 bg-secondary mt-4 mb-2 bg-opacity-10">
				
						<div class="text-center" id="loader">
								<div class="spinner-border text-dark" role="status">
									<span class="visually-hidden">Loading...</span>
								</div>
						</div>
						
						<div class="container-fluid" id="class_container">
					
						</div>
						<div class="container-fluid" id="classDetail_container">
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<!-------------------------------------------------------------------------------------->
		<%@include file="./basic/footer.jsp"%>
</body>
</html>
<script>
	function getSubjectName(sName)
	{
		$.ajax({
			url:"load_classBySub.jsp",
			data:{name:sName},
			method:"Post",
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
				$("#loader").hide();
				$("#default_container").hide();
			
				$("#class_container").html(data);
			}
		})
	}
	$(document).ready(function(e){
		getSubjectName()
	})
</script>