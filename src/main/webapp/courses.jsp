<%@page import="Dao.YearDao"%>
<%@page import="Entity.Year"%>
<%@page import="Service.MySqlConnection"%>

<%@page import="java.sql.*"%>
<%@page errorPage="error.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Courses</title>
<%@include file="./basic/basic.jsp"%>
</head>
<body>
	<!-- navbar--------------------------------------------------------------------->
	<%@include file="./basic/navbar.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<div class="container-fluid">
		<div class="row">
			<div class="col-2 mt-4">
				<div class="list-group list-group-light" id="list-tab"
					role="tablist">
					<a 
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-primary active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home" aria-current="true"
						aria-hidden="true">
						<h5>
							<i class="fa-sharp fa-solid fa-layer-group"></i> Courses</i>
						</h5>
					</a>
					<%
					YearDao yearDao = new YearDao(MySqlConnection.getConnection());
					List<Year> list = yearDao.getAll_Year();
					for (Year year : list) {
					%>
					<a onclick="getYear(<%=year.getId()%>)"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-primary"
						id="list-profile-list" data-bs-toggle="list" href="#list-profile"
						role="tab" aria-controls="list-profile">
						<h6>
							<i class="fa fa-bars"> <%=year.getYear_Name()%></i>
						</h6>
					</a>
					<%
					}
					%>
				</div>

			</div>
			<div class="col-10 bg-primary mt-4 mb-2 bg-opacity-10">

				<div class="clearfix" id="loader">
					<div class="spinner-grow text-primary spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-primary spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-primary spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-primary spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-primary spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class='col align-self-center m-5'>
						<h2 class='display-3 text-center '>
							<br>
							<hr>
							Please Select Course Session<br> <i
								class='fas fa-chevron-circle-left'></i><br> <br>
							<hr>
							<br>
						</h2>
					</div>
				</div>
				<div class="container-fluid" id="default_container"></div>
				<div class="container-fluid" id="class_container"></div>
				<div class="container-fluid" id="classDetail_container"></div>
			</div>

		</div>
	</div>
	</div>
	</div>


	<%@include file="./basic/footer.jsp"%>

</body>
</html>
<script>
	function getYear(yId)
	{
		
		$.ajax({
			url:"load_Classes.jsp",
			data:{yearId:yId},
			method:"Post",
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
				$("#loader").hide();
				$("#default_container").hide();
				//$("#classDetail_container").hide();
				$("#class_container").html(data);
			}			
		})
	}
	$(document).ready(function(e){
		getClasses(1)
	})
</script>
<script>
	function getClassDetail(classId)
	{
		$.ajax({
			url:"load_ClassDetail.jsp",
			data:{id:classId},
			method:"Post",
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
				$("#class_container").hide();
				$("#classDetail_container").html(data);
			}
			error:function((jqXHR, textStatus, error)
					{
				
					}
		})
	}
	$(document).ready(function(e){
		getClasses()
	})
</script>
