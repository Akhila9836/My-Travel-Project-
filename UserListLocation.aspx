<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserListLocation.aspx.cs" Inherits="UserListLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="Width:1300px;text-align:center; margin-left: -80px; ">

            				 		
       
            <!-- Packages Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Packages</h6>
                <h1>Perfect Tour Packages</h1>
            </div>
           

                        				 		<div class="form-group mb-4"> 
                                                     <asp:Label ID="Label5" runat="server" Text="Location:" Font-Bold="True" Font-Names="Arial" Font-Size="Large"></asp:Label>&nbsp;&nbsp; <asp:DropDownList ID="DropDownList6" runat="server" Width="300px" Height="40px" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged" AutoPostBack="True"  ></asp:DropDownList>
<br />
			 </div> 
            <div class="row">

                
                <div class="col-lg-4 col-md-6 mb-4">
                                <asp:DataList ID="DataList1" runat="server"  GridLines="Both" RepeatColumns="3" RepeatDirection="Horizontal"
Width="1200px" onselectedindexchanged="DataList1_SelectedIndexChanged">
                 <HeaderTemplate>
 
 </HeaderTemplate>
                 <ItemTemplate>
                    <div class="package-item bg-white mb-2">
                       
                        <asp:Image ID="imgEmp" runat="server"  Width="400px" Height="300px"  ImageUrl='<%# Bind("mimg") %>'/>
                        <div class="p-4">
                            <div class="d-flex justify-content-between mb-3">
                                <small class="m-0"><i class="fa fa-map-marker-alt text-primary mr-2"></i><asp:Label ID="lblName" runat="server" Text='<%# Bind("location") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Black"></asp:Label></small>
                                <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i><asp:Label ID="Label1" runat="server" Text='<%# Bind("ndays") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Black"></asp:Label> days</small>
                                <small class="m-0"><i class="fa fa-user text-primary mr-2"></i>1 Person</small>
                            </div>
                            <a class="h5 text-decoration-none" href=""><asp:Label ID="Label2" runat="server" Text='<%# Bind("pname") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Green"></asp:Label></a>
                            <div class="border-top mt-4 pt-4">
                                <div class="d-flex justify-content-between">
                                    <h6 class="m-0"><i class="fa fa-star text-primary mr-2"></i><asp:Label ID="Label4" runat="server" Text='<%# Bind("auname") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Black"></asp:Label></h6> <a href='UserBookProduct.aspx?cart_id=<%# Eval("pid") %>'style="background-color: #7ab730; color: white; padding: 10px 25px; text-align: center; text-decoration: none; display: inline-block;">Book Now</a>
                                    <h5 class="m-0">Rs <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Black"></asp:Label>/-</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                         </ItemTemplate>
  
</asp:DataList>
                </div>
   

            </div>
        </div>
    </div>




          
        
          
</asp:Content>

