<%@page import="Entity.Notice"%>
<%@page import="Dao.NoticeDao"%>
<%@page import="Entity.Holiday"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.HolidayDao"%>

<%@page import="java.sql.*"%>
<%@page errorPage="error.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery</title>
<%@include file="./basic/basic.jsp"%>
</head>
<body>
	<!-- navbar--------------------------------------------------------------------->
	<%@include file="./basic/navbar.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<!--  BODY -->
	<div class="container-fluid ">

	<br>
		<!-- form -->
		<div class="row">
			<div class="col-3">
				<div class="list-group" id="list-tab" role="tablist">
					<a
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-primary active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home"><h5>New UpDates</h5></a> <a
						class="list-group-item list-group-item-action"
						id="list-profile-list" data-bs-toggle="list" href="#list-profile"
						role="tab" aria-controls="list-profile"><h5>Notice</h5></a> <a
						class="list-group-item list-group-item-action"
						id="list-messages-list" data-bs-toggle="list"
						href="#list-messages" role="tab" aria-controls="list-messages"><h5>Exam
							Dates</h5></a> <a class="list-group-item list-group-item-action"
						id="list-settings-list" data-bs-toggle="list"
						href="#list-settings" role="tab" aria-controls="list-settings"><h5>Holidays</h5></a>
				</div>
			</div>
			<div class="col-9">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-home"
						role="tabpanel" aria-labelledby="list-home-list">
						<h3 class="text-dark text-center">New Updates</h3>
						<hr>
						<div class="row">

							<div class="col-10 bg-dark">
								<div class="pb-2"></div>
							</div>
						</div>

					</div>
					<div class="tab-pane fade" id="list-profile" role="tabpanel"
						aria-labelledby="list-profile-list">
						<h3 class="text-dark text-center">Notices</h3>
						<hr>
						<div class="row">
							<%
							NoticeDao noticeDao = new NoticeDao(MySqlConnection.getConnection());
							List<Notice> list = noticeDao.get_All_Notices();
							for (Notice n : list) {
							%>

							<div class="col-3 p-2 bg-dark">
								<div class="card border-success mb-3" style="max-width: 18rem;">
									<div class="card-header bg-transparent border-success"><%=n.getTitle()%></div>
									<div class="card-body text-success">
										<h5 class="card-title"><%=n.getSubject()%></h5>
										<p class="card-text"><%=n.getMessage()%></p>
									</div>
									<div class="card-footer bg-transparent border-success"><%=n.getDate() + "  Time:" + n.getTime()%></div>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
					<div class="tab-pane fade" id="list-messages" role="tabpanel"
						aria-labelledby="list-messages-list">

						<h3 class="text-dark text-center">Exam Updates</h3>
						<hr>
						<div class="row">

							<div class="col-10 bg-dark"></div>
						</div>

					</div>
					<div class="tab-pane fade" id="list-settings" role="tabpanel"
						aria-labelledby="list-settings-list">

						<h3 class="text-dark text-center">Holiday List</h3>
						<hr>
						<div class="row">

							<div class="col-sm-8 bg-dark  fs-6">
								<div class="pb-2">
									<table class="table text-light">
										<thead>
											<tr>
												<th scope="col">S.No</th>
												<th scope="col">Holidays</th>
												<th scope="col">Date</th>
											</tr>
										</thead>
										<tbody>
											<%
											HolidayDao holidayDao = new HolidayDao(MySqlConnection.getConnection());
											List<Holiday> list1 = holidayDao.get_All_Holiday();
											for (Holiday holiday : list1) {
											%>
											<tr>
												<th scope="row"><%=holiday.getId()%></th>
												<td><%=holiday.getName()%></td>
												<td><%=holiday.getDate()%></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>


								</div>


							</div>
							<div class="col-4 ">
								<div class="card " style="width: 17rem;">
									<img src="img/holiday.png" class="card-img-top" alt="...">
									<img src="img/wksn.png" class="card-img-top" alt="..."> <img
										src="img/10468649.jpg" class="card-img-top" alt="..."> <img
										src="img/dwli.jpg" class="card-img-top" alt="...">

								</div>


							</div>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- footer -------------------------------------------------------------------->
	<div>
		<%@include file="./basic/footer.jsp"%>
	</div>
	<!-- footer ends---------------------------------------------------------------->
</body>
</html>