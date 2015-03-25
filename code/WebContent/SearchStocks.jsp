<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<div class="navbar navbar-default">
		<a class="home" href="Home.jsp">Stock Virtual Machine</a> <a
			class="backtoPortfolio" href="Portfolio.jsp"> Back To Portfolio </a>
		<a class="backtoPortfolio" href="Logout.jsp"> Logout </a>
	</div>
	<%
		String userVirtualBal = "";
		String username = session.getAttribute("theName").toString();
		Connection c1 = null;
		Statement stmt1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName("org.postgresql.Driver");
			c1 = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/SVM", "postgres",
					"cs422");
			System.out
					.println("Database successfully - User Login  Redirecting to Portfolio");
			stmt1 = c1.createStatement();
			rs1 = stmt1
					.executeQuery("select virtualbalance from public.\"Login\" where username='"
							+ username + "';");
			if (rs1.next()) {
				userVirtualBal = rs1.getString(1);
				System.out.println("Virtual Balance: $" + rs1.getString(1));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (c1 != null) {
				try {
					rs1.close();
					stmt1.close();
					c1.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	%>
	<center>
		<h1>Search Stocks</h1>
		<h3>
			Virtual Balance: $
			<%=userVirtualBal%>
		</h3>
		<form ACTION="PurchaseStocks" method="post">
			<div id="move_right">
				<h4>
					Select a Company: <select id="StockSymbol" name="StockSymbol">
						<%
							Connection c = null;
							Statement stmt = null;
							ResultSet rs = null;
							try {
								String userId = session.getAttribute("theName").toString();
								System.out.println("*** username: " + userId);
								Class.forName("org.postgresql.Driver");
								c = DriverManager.getConnection(
										"jdbc:postgresql://localhost:5432/SVM", "postgres",
										"cs422");
								System.out.println("Opened Database successfully");
								stmt = c.createStatement();
								String query = "select s.cname,s.symbol from public.\"Stock\" s";
								rs = stmt.executeQuery(query);
								while (rs.next()) {
						%>
						<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
						<%
							}
							} catch (Exception ex) {
								ex.printStackTrace();
							} finally {
								if (c != null) {
									try {
										rs.close();
										stmt.close();
										c.close();
									} catch (Exception ex) {
										ex.printStackTrace();
									}
								}
							}
						%>
					</select>
				</h4>

				<input id="Buy" class="btn btn-success" type="submit"
					value="SEARCH"> <br> <img src="images/Buy.jpg"
					height="200" width="200" HSPACE=10>
			</div>
		</form>
		<%
			String errorMsg = "";
			if (session.getAttribute("stockError") != null) {
				errorMsg = session.getAttribute("stockError").toString();
		%>
		<div align="center">
			<label style="color: red;"><font size="5"><%=errorMsg%></font></label>
		</div>
		<%
			}
		%>
	</center>
	<div id="footer" class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>