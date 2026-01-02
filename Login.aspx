<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Traveller</title>
<!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 11]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="admin/assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="admin/assets/css/style.css">
</head>
<body>
    <div class="auth-wrapper">
	<div class="auth-content text-center">
		<img src="admin/assets/images/logo.png" alt="" class="img-fluid mb-4">
		<div class="card borderless">
			<div class="row align-items-center ">
				<div class="col-md-12">
					<div class="card-body">
						 <form id="form1" runat="server">
						<h4 class="mb-3 f-w-400">Signin</h4>
						<hr>
						<div class="form-group mb-3">
							<asp:TextBox ID="TextBox1" runat="server"  Width="300px" Height="40px"  placeholder="Username" ></asp:TextBox> 
						</div>
						<div class="form-group mb-4">
							<asp:TextBox ID="TextBox2" runat="server"  Width="300px" Height="40px"  placeholder="Password" TextMode="Password" ></asp:TextBox> 
						</div>
						
						    <asp:Button ID="Button1" runat="server"  Text="Sign In" onclick="Button1_Click"  Width="300px" class="btn btn-primary btn-block mb-4"/>
						<hr>
						<%--<p class="mb-2 text-muted">Forgot password? <a href="auth-reset-password.html" class="f-w-400">Reset</a></p>--%>
						<p class="mb-0 text-muted">Don’t have an account? <a href="UserRegistration.aspx" class="f-w-400">Signup</a></p>
					  </form>
							 
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signin ] end -->

<!-- Required Js -->
<script src="admin/assets/js/vendor-all.min.js"></script>
<script src="admin/assets/js/plugins/bootstrap.min.js"></script>

<script src="admin/assets/js/pcoded.min.js"></script>


   
        <div>
        </div>
  
</body>
</html>
