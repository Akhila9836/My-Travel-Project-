<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserRateTrip.aspx.cs" Inherits="UserRateTrip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="text-center mb-3 pb-3">
    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;"></h6>
    <h1>Rate Trip</h1>
</div>
     
        <div style="text-align:left;padding-left: 100px; margin-left:-100px;" class="style2"  >
         &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label9" runat="server" Text="Get Reference Code :" Font-Bold="True" Font-Size = "Small"></asp:Label><br />
   &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;  <asp:DropDownList ID="DropDownList7" 
            runat="server" Width="200px" Height="30px" AutoPostBack="True" 
        onselectedindexchanged="DropDownList7_SelectedIndexChanged" ></asp:DropDownList>&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
        </div>
        <div style="Width:100%;float:right;text-align:left;margin-left:40px; font-weight: 700;">
       
             <asp:Label ID="Label1" runat="server" Text="Package Name:" Font-Bold="True"  Font-Size = "Small"></asp:Label>
               &nbsp; &nbsp; <asp:Label ID="lblCName" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label>
                <br />
                  <br />   
                <asp:Label ID="Label2" runat="server" Text="Agency Name:" Font-Bold="True"  
                Font-Size = "Small"></asp:Label>
               &nbsp; &nbsp; <asp:Label ID="lblName" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label>
                   
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Location:" Font-Bold="True"  
                Font-Size = "Small" ForeColor="Black"></asp:Label> 
                &nbsp; &nbsp; <asp:Label ID="lblCity" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label>  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="Label21" runat="server" Text="No of Days:" Font-Bold="True"  
                     Font-Size = "Small"></asp:Label> 
                     &nbsp; &nbsp; <asp:Label ID="Label22" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label>&nbsp; &nbsp; <asp:Label ID="Label23" runat="server" Text="Days" Font-Bold="True" ForeColor="Black" Font-Size = "Small"></asp:Label> &nbsp; <asp:Label ID="Label24" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label>&nbsp; &nbsp; <asp:Label ID="Label25" runat="server" Text="Nights" Font-Bold="True" ForeColor="Black" Font-Size = "Small"></asp:Label>&nbsp; &nbsp;&nbsp; &nbsp;  
                <br />
<br />   
                 <asp:Label ID="Label5" runat="server" Text="No of Person:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> &nbsp; &nbsp;<asp:TextBox ID="TextBox5" runat="server" Width="50px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;<asp:Label ID="Label19" runat="server" Text="Trip Date:" Font-Bold="True" 
Font-Size = "Small"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox12" runat="server" Width="100px" Height="30px" ></asp:TextBox>  
                            
                 <asp:Label ID="Label27" runat="server" Text="Total Payment:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> <asp:TextBox ID="TextBox2" runat="server" Width="100px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
                 <br />   
                            
                 <asp:Label ID="Label31" runat="server" Text="Rate Tour:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br /> <asp:DropDownList ID="DropDownList3" 
         runat="server" Width="200px" Height="30px" AutoPostBack="True" 
         onselectedindexchanged="DropDownList3_SelectedIndexChanged" >
 </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<br />
<br />   
                 <asp:Label ID="Label29" runat="server" Text="Comments :" Font-Bold="True" 
                Font-Size = "Small"></asp:Label>&nbsp; &nbsp;&nbsp; &nbsp;<br /> <asp:TextBox ID="TextBox3" runat="server" Width="530px" Height="100px" TextMode="MultiLine" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br /> 
<br />     
                                         
            <asp:Button 
             ID="Button1" runat="server" Height="40px" Text="Submit" class="btn  btn-primary"   onclick="Button1_Click"  
    Width="200px"/>

                                         &nbsp; &nbsp;&nbsp;  

   <br /> 
<br />    
                                                     &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;

                                                     &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  

   <br /> 
<br />     
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br /> 
         <br /> 
   
        </div>
        <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Blue" 
            Font-Size = "Medium"></asp:Label>
    

</asp:Content>

