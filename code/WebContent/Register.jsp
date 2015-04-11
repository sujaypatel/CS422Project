<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
</head>
<body id="register">
	<div class="navbar navbar-default">
		<span class="welcome"><a class="title" href="Home.jsp">Stock
				Virtual Machine</a></span>
		<ul class="nav navbar-nav">
			<li><a id="registernav" href="Register.jsp"> SIGN UP</a></li>
			<li><a id="loginnav" href="Login.jsp"> LOGIN</a></li>
			<li><a id="helpnav" href="Help.jsp"> HELP</a></li>
			<li><a id="aboutnav" href="AboutUs.jsp"><span> ABOUT
						US </span></a></li>
		</ul>
	</div>
	<%!String errorString = "";%>
	<%
		Object errorCode = session.getAttribute("reg_error");
		if (errorCode != null) {
			String sErrorCode = errorCode.toString();
			int iError = Integer.parseInt(sErrorCode);
			switch (iError) {
			case 1:
				errorString = "Username already exists. Please choose another one";
				break;
			case 2:
				errorString = "Password Mismatch. Check again";
				break;

			}
		}
	%>
	<center>
		<h3 style="color: red;"><%=errorString%></h3>
	</center>
	<div>
		<form action="RegisterServlet" method="post">
			<center>
				<h1>Create an Account</h1>
				<br>
				<div class="Input_Icons">
					<h4>
						<input type="text" name="firstname" placeholder="First Name"
							required="required">
					</h4>
					<h4>
						<input type="text" name="lastname" placeholder="Last Name"
							required="required">
					</h4>
					<h4>
						<i class="fa fa-user"></i> <input type="text" name="username"
							placeholder="Username" required="required">
					</h4>
					<h4>
						<i class="fa fa-lock"></i> <input type="password" name="password"
							placeholder="Password" required="required">
					</h4>
					<h4>
						<input type="password" name="confirmPassword"
							placeholder="Confirm Password" required="required">
					</h4>
					<h4>
						<input name="email" placeholder="Email Address"
							required="required">
					</h4>
					<h4>
						<select name="secret" required="required">
							<option value="What is your pet name">What is your pet's
								name</option>
							<option value="What is the color of your first car">What
								is the color of your first car</option>
							<option value="What is your mother maiden name">What is
								your mother's maiden name</option>
							<option value="What is your favorite grad subject">What
								is your favorite grad subject</option>
							<option value="What is your crush name">What is your
								crush's name</option>
						</select>
					</h4>
					<h4>
						<input type="text" name="answer" placeholder="Answer"
							required="required">
					</h4>
				</div>
				<input type="submit" class="btn btn-success" value="REGISTER">
			</center>
		</form>
	</div>
	<br>
	<div class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>