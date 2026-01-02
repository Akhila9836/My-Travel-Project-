<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgentRegistration.aspx.cs" Inherits="AgentRegistration" %>

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
		<img src="assets/images/logo.png" alt="" class="img-fluid mb-4">
		<div class="card borderless">
			<div class="row align-items-center text-center">
				<div class="col-md-12">
					<div class="card-body">
						 <form id="form2" runat="server">
						<h4 class="f-w-400">Agent Registration</h4>
						<hr>
						<div class="form-group mb-3">
							<asp:TextBox ID="TextBox1" runat="server"  Width="300px" Height="40px"  placeholder="Username" ></asp:TextBox> 
							<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                 ErrorMessage="*" ForeColor="#FF5050" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>--%>
						</div>
						<div class="form-group mb-3">
							<asp:TextBox ID="TextBox2" runat="server" Width="300px" Height="40px"  placeholder="Owner Name" ></asp:TextBox> 
							<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                 ErrorMessage="*" ForeColor="#FF5050" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>--%>
						</div>
							 				<div class="form-group mb-3">
					<asp:TextBox ID="TextBox7" runat="server" Width="300px" Height="40px"  placeholder="Company Name" ></asp:TextBox> 
					<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
ErrorMessage="*" ForeColor="#FF5050" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>--%>
				</div>
						<div class="form-group mb-4">
							<asp:TextBox ID="TextBox3" runat="server"  Width="300px" Height="40px"  placeholder="Password" TextMode="Password" ></asp:TextBox> 
						</div>
						<div class="form-group mb-4">
				      <asp:TextBox ID="TextBox4" runat="server"  Width="300px" Height="40px"  placeholder=" Confirm Password" TextMode="Password" ></asp:TextBox> 
							<asp:CompareValidator ID="CompareValidator1" runat="server" 
                 ControlToCompare="TextBox3" ControlToValidate="TextBox4" ErrorMessage="*" 
                 ForeColor="Red"></asp:CompareValidator>
					   </div> 
							 		<div class="form-group mb-4">
						<asp:TextBox ID="TextBox5" runat="server"  Width="300px" Height="40px"  placeholder=" Email Address" ></asp:TextBox> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
           ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red" 
           ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
						 </div> 
							 		<div class="form-group mb-4">
						<asp:TextBox ID="TextBox6" runat="server"  Width="300px" Height="40px"  placeholder=" Contact"  MaxLength="10" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" ></asp:TextBox> 
										             <asp:RequiredFieldValidator 
    ID="rfvContact" 
    runat="server" 
    ControlToValidate="TextBox6"
    ErrorMessage="Contact number is required" 
    CssClass="text-danger" 
    Display="Dynamic" />

<!-- Regex validator for valid 10-digit number starting with 6-9 -->
<asp:RegularExpressionValidator 
    ID="revContact" 
    runat="server" 
    ControlToValidate="TextBox6"
    ErrorMessage="Enter a valid 10-digit mobile number" 
    CssClass="text-danger" 
    Display="Dynamic"
    ValidationExpression="^[6-9][0-9]{9}$" />
						 </div> 
							 		
							 		<div class="form-group mb-4">
							<asp:TextBox ID="TextBox8" runat="server" Width="300px" Height="40px"  placeholder="Starting Date" TextMode="Date" ></asp:TextBox> 
							 </div> 
							 		<div class="form-group mb-4">
							<asp:TextBox ID="TextBox9" runat="server" Width="300px" Height="40px"  placeholder="Licence No"  ></asp:TextBox> 
							 </div> 
							 			 		<div class="form-group mb-4">
									<asp:TextBox ID="TextBox11" runat="server" Width="300px" Height="40px"  placeholder="Location"  ></asp:TextBox> 
									 </div>
							 			 											<div class="form-group mb-4">
							<asp:TextBox ID="TextBox10" runat="server"  Width="300px" Height="100px"  placeholder="Address" TextMode="MultiLine" ></asp:TextBox> 
							 </div> 
							          <asp:Button ID="Button3" runat="server"  Text="Sign Up" onclick="Button1_Click"  Width="300px" class="btn btn-primary btn-block mb-4"/>
						
						<hr>
							 <asp:Label ID="Label11" runat="server" Visible="False"></asp:Label>
						<p class="mb-2">Already have an account? <a href="Login.aspx" class="f-w-400">Signin</a></p>
					
						</form>	 
							 </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signup ] end -->

<!-- Required Js -->
<script src="admin/assets/js/vendor-all.min.js"></script>
<script src="admin/assets/js/plugins/bootstrap.min.js"></script>

<script src="admin/assets/js/pcoded.min.js"></script>


    
</body>
</html>
