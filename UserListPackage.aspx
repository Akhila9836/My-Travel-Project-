<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserListPackage.aspx.cs" Inherits="UserListPackage" %>

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




          
        
           <%-- <FooterStyle BackColor="White" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#7DA846" Font-Bold="True" Font-Size="Large" ForeColor="White"
                HorizontalAlign="Center" VerticalAlign="Middle" />
           
            <ItemStyle BackColor="White" ForeColor="Black" BorderWidth="1px" Width="300px" HorizontalAlign="Center" Font-Names="Arial" Font-Size="12pt"/>
           
                <asp:Image ID="imgEmp" runat="server" Width="300px" Height="200px" ImageUrl='<%# Bind("mimg") %>' style="padding-left:30px"/>
                 <br />
                  <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblCName" runat="server" Text='<%# Bind("title") %>' Font-Italic="False" Font-Bold="True" Font-Size="X-Large" ForeColor="#CC0066" Font-Names="Monotype Corsiva"></asp:Label>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Owner:" Font-Names="Georgia" Font-Size="Large" ForeColor="#CC0000"></asp:Label>
                <asp:Label ID="lblName" runat="server" Text='<%# Bind("luname") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Black"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Location:" Font-Names="Georgia" Font-Size="Large" ForeColor="#CC0000"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text=' <%# Bind("location") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Black"></asp:Label>
                <br />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Text="Area(Sqft):" Font-Names="Georgia" Font-Size="Large" ForeColor="#CC0000"></asp:Label>
                <asp:Label ID="lblCity" runat="server" Text=' <%# Bind("area") %>' Font-Names="Georgia" Font-Size="Large" ForeColor="Black"></asp:Label>
                <br />
                 <br />
               &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Rs." Font-Names="Georgia" Font-Size="Large" ForeColor="#CC0000"></asp:Label>
                <asp:Label ID="lblCountry" runat="server" Font-Bold="True" Text='<%# Bind("price") %>' Font-Names="Comic Sans MS" Font-Size="Large" ForeColor="#CC0000"></asp:Label>
                <br />   
                <br />   
                   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<a href='UserBuyProduct.aspx?cart_id=<%# Eval("hcode") %>'style="background-color: #f44336; color: white; padding: 10px 25px; text-align: center; text-decoration: none; display: inline-block;">View Details</a>
              
                <br />
                 <br />
                  <br />
           
          
         <div style="Width:141px; text-align:center;padding-left: 50px;">
       
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" ForeColor="Red">Next</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" ForeColor="Red">Previous</asp:LinkButton>

         </div>--%>
</asp:Content>

