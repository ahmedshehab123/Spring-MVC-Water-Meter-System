<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gentelella Alela! |</title>

<!-- Bootstrap -->
<link
	href="/WaterMeterMonitoringSystem/resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="/WaterMeterMonitoringSystem/resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="/WaterMeterMonitoringSystem/resources/vendors/nprogress/nprogress.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="/WaterMeterMonitoringSystem/resources/build/css/custom.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/WaterMeterMonitoringSystem/resources/lib/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#userInfo").hide();

		$("#accept").click(
				function() {
					$("#accept").hide();
					var userid = $("#userID").text();
					var firstName = $("#firstName").text();
					var lastName = $("#lastName").text();
					var email = $("#email").text();
					var password = $("#password").text();
					$("#userInfo").show();
					$("#useridentification").hide();
					$.ajax({
						url : "saveuser?userID=" + userid + "&firstName="
								+ firstName + "&lastName=" + lastName
								+ "&email=" + email + "&password=" + password
								+ "",
						success : function(result) {
							$("#userInfo").html(result);
						}
					});
				});

	});
</script>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- page content -->
			<div class="col-md-12">
				<div class="col-middle">
					<div class="text-center">
						<div id="useridentification">
							<h2>Hello this is a request form
								${requestScope.user.firstName } ${requestScope.user.lastName }
								to join to the site</h2>
							and this is his email
							<h2>${requestScope.user.email }</h2>
						</div>
						<div id="userInfo">
							<a id="userID">${requestScope.user.id }</a> <span id="firstName">${requestScope.user.firstName }</span>
							<span id="lastName">${requestScope.user.lastName }</span> <span
								id="email">${requestScope.user.email }</span> <span
								id="password">${requestScope.user.password }</span>
						</div>
						<div id="result">
							<button id="accept"class="btn btn-round btn-default" >Accept</button>

						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="/WaterMeterMonitoringSystem/resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="/WaterMeterMonitoringSystem/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="/WaterMeterMonitoringSystem/resources/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="/WaterMeterMonitoringSystem/resources/vendors/nprogress/nprogress.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="/WaterMeterMonitoringSystem/resources/build/js/custom.min.js"></script>
</body>
</html>