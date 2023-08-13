<%@page import="java.util.List"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.YearDao"%>
<%@page import="Entity.Year"%>


<div class="row justify-content-around mb-2">
	<hr>
	<h3 class="text-center text-light ">Session Detail</h3>
	<hr>
	<% 
		
			YearDao yearDao=new YearDao(MySqlConnection.getConnection());
			List<Year> list=yearDao.getAll_Year();
			for(Year y:list)
			{%>
	<div class="card mb-3 p-2 mt-2" style="max-width: 545px;">
		<div class="row g-0">
			<div class="col-md-4">
				<img src="../img/session.png" class="img-fluid rounded-start"
					alt="...">
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h5 class="card-title"><%=y.getYear_Name() %></h5>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Session start from: <%=y.getStart_Date() %></li>
						<li class="list-group-item">Session ends at: <%=y.getEnd_Date() %></li>
					</ul>
					<p class="card-text">
						<a onclick="getClasses(<%=y.getId() %>)" type="submit"
							class="btn btn-success">View Details</a> 
							<a 
							type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editYear">Edit</a>
							 <a  type="submit" class="btn btn-danger">Delete</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<%	}
		%>
</div>

