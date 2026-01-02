<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMasterPage.master" AutoEventWireup="true" CodeFile="AgentApproveBooking.aspx.cs" Inherits="AgentApproveBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
                <style type="text/css">
    .style1
    {
        margin-left: 0px;
    }
    .style2
    {
        width: 1300px;
        margin-left: 0px;
    }

    body
    {
        font-family: Arial;
        font-size: 10pt;
    }
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=60);
        opacity: 0.6;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        width: 500px;
        border: 3px solid #0DA9D0;
        padding: 0;
    }
    .modalPopup .header
    {
        background-color: #2FBDF1;
        height: 30px;
        color: White;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
    .modalPopup .body
    {
        min-height: 50px;
        padding:5px;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                 <br />
 <br />
     
        <div style="text-align:left;padding-left: 100px; margin-left:-100px;" class="style2"  >
         &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label9" runat="server" Text="Get Reference Code :" Font-Bold="True" Font-Size = "Small"></asp:Label><br />
   &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;  <asp:DropDownList ID="DropDownList7" 
            runat="server" Width="200px" Height="30px" AutoPostBack="True" 
        onselectedindexchanged="DropDownList7_SelectedIndexChanged" ></asp:DropDownList>&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
        <div style="Width:40%;float:left;text-align:left;">
     <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="White"
            BorderStyle="None" BorderWidth="0px" CellPadding="3" CellSpacing="2"
            Font-Names="Verdana" Font-Size="Small" GridLines="Both" 
            Width="300px" CssClass="style1">
            <FooterStyle BackColor="White" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#7DA846" Font-Bold="True" Font-Size="Large" ForeColor="White"
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderTemplate>
            
                </HeaderTemplate>
            <ItemStyle BackColor="White" ForeColor="Black" BorderWidth="0px" Width="200px"/>
            <ItemTemplate>
                <asp:Image ID="imgEmp" runat="server" Width="300px" Height="120px" ImageUrl='<%# ResolveUrl(Eval("mimg").ToString()) %>' alt="" data-zoom-image='<%# ResolveUrl(Eval("mimg").ToString()) %>' style="padding-left:40px"/>&nbsp;&nbsp;&nbsp; &nbsp;
                 <asp:Image ID="Image1" runat="server" Width="300px" Height="120px" ImageUrl='<%# ResolveUrl(Eval("simg1").ToString()) %>' alt="" data-zoom-image='<%# ResolveUrl(Eval("simg1").ToString()) %>' style="padding-left:40px"/>&nbsp;&nbsp;&nbsp; &nbsp;
                  <asp:Image ID="Image2" runat="server" Width="300px" Height="120px" ImageUrl='<%# ResolveUrl(Eval("simg2").ToString()) %>' alt="" data-zoom-image='<%# ResolveUrl(Eval("simg2").ToString()) %>' style="padding-left:40px"/>&nbsp;&nbsp;&nbsp; &nbsp;
                   <asp:Image ID="Image3" runat="server" Width="300px" Height="120px" ImageUrl='<%# ResolveUrl(Eval("simg3").ToString()) %>' alt="" data-zoom-image='<%# ResolveUrl(Eval("simg3").ToString()) %>' style="padding-left:40px"/><br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.rawgit.com/elevateweb/elevatezoom/master/jquery.elevateZoom-3.0.8.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("[id*=DataList1] img").elevateZoom({
            cursor: 'pointer',
            imageCrossfade: true,
            loadingIcon: 'loading.gif'
        });
    });
</script>
</div>
    <div style="float:left;text-align:left; margin-left:-180px;">
     <%--<div style="Width:50%;float:left;text-align:left;">--%>
    <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="Fuchsia"
            BorderStyle="None" BorderWidth="0px" CellPadding="3" CellSpacing="2"
            Font-Names="Verdana" Font-Size="Small" GridLines="Both" 
            Width="300px">
            <FooterStyle BackColor="White" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#7DA846" Font-Bold="True" Font-Size="Large" ForeColor="White"
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderTemplate>
            
                </HeaderTemplate>
            <ItemStyle BackColor="White" ForeColor="Black" BorderWidth="0px" Width="200px"/>
            <ItemTemplate>
                <asp:Image ID="imgEmp" runat="server" Width="800px" Height="540px" ImageUrl='<%# Bind("mimg") %>' style="padding-left:40px"/>&nbsp;&nbsp;&nbsp; &nbsp;
                
                <br />
            </ItemTemplate>
        </asp:DataList>
        </div>
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
                     &nbsp; &nbsp; <asp:Label ID="Label22" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label>&nbsp; &nbsp; <asp:Label ID="Label23" runat="server" Text="Days" Font-Bold="True" ForeColor="Black" Font-Size = "Small"></asp:Label> &nbsp; <asp:Label ID="Label24" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label>&nbsp; &nbsp; <asp:Label ID="Label25" runat="server" Text="Nights" Font-Bold="True" ForeColor="Black" Font-Size = "Small"></asp:Label>&nbsp; &nbsp;&nbsp; &nbsp; <asp:Label ID="Label20" runat="server" Text="Package Price: Rs " Font-Bold="True"  
                Font-Size = "Small"></asp:Label> 
                 <asp:Label ID="Label26" runat="server" Font-Bold="False" ForeColor="Black" Font-Size = "Small"></asp:Label> 
                <br />
                 <br />   
                                             <asp:Label ID="Label4" runat="server" Text="Highlights:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> <br /> <asp:TextBox ID="TextBox1" runat="server" Width="900px" Height="70px" TextMode="MultiLine" ></asp:TextBox> 

                               <br />
<br />   
                 <asp:Label ID="Label33" runat="server" Text="About Package:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> <br /> <asp:TextBox ID="TextBox6" runat="server" Width="900px" Height="100px" TextMode="MultiLine" ></asp:TextBox> 

                               <br />
<br />   
                        
                 <asp:Label ID="Label34" runat="server" Text="Inclusion:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> <br /> <asp:TextBox ID="TextBox7" runat="server" Width="900px" Height="200px" TextMode="MultiLine" ></asp:TextBox> 

                               <br />
<br />   
                        
                 <asp:Label ID="Label35" runat="server" Text="Exclusion:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> <br /> <asp:TextBox ID="TextBox8" runat="server" Width="900px" Height="200px" TextMode="MultiLine" ></asp:TextBox> 

                               <br />
<br />   
                 <asp:Label ID="Label5" runat="server" Text="No of Person:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> &nbsp; &nbsp;<asp:TextBox ID="TextBox5" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label19" runat="server" Text="Total Price:" Font-Bold="True" 
Font-Size = "Small"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox12" runat="server" Width="200px" Height="30px" ></asp:TextBox>  
                            <br />
                 <br />   
                 <asp:Label ID="Label27" runat="server" Text="Accomadation:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> <asp:TextBox ID="TextBox2" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label28" runat="server" Text="Tour Date:" Font-Bold="True" 
Font-Size = "Small"></asp:Label>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox13" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
                 <br />   
                            
                 <asp:Label ID="Label31" runat="server" Text="Food Type:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> &nbsp; &nbsp;&nbsp; &nbsp; <asp:TextBox ID="TextBox4" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label32" runat="server" Text="Booking Date:" Font-Bold="True" 
Font-Size = "Small"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox14" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp; &nbsp;&nbsp; &nbsp;<br />
<br />   
                 <asp:Label ID="Label29" runat="server" Text="Travel :" Font-Bold="True" 
                Font-Size = "Small"></asp:Label>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <asp:TextBox ID="TextBox3" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label30" runat="server" Text="Reference Code:" Font-Bold="True" 
Font-Size = "Small"></asp:Label>&nbsp;<asp:TextBox ID="TextBox15" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br /> 
<br />     
                                         <asp:Label ID="Label7" runat="server" Text="Paid Amount :" Font-Bold="True" 
                Font-Size = "Small"></asp:Label>&nbsp;   <asp:TextBox ID="TextBox10" runat="server" Width="200px" Height="30px" TextMode="Number" ></asp:TextBox> &nbsp;&nbsp;&nbsp;

                                         <asp:Label ID="Label36" runat="server" Text="Balance Amount" Font-Bold="True" 
                Font-Size = "Small"></asp:Label>&nbsp; &nbsp;&nbsp; <asp:TextBox ID="TextBox16" runat="server" Width="200px" Height="30px" ></asp:TextBox> 

   <br /> 
<br />    
                                                     <asp:Label ID="Label8" runat="server" Text="Paid Date:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox11" runat="server" Width="200px" Height="30px" ></asp:TextBox> &nbsp;&nbsp;&nbsp;

                                                     &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  

   <br /> 
<br />     
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br /> 
         <br /> 
   
        </div>
        <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Blue" 
            Font-Size = "Medium"></asp:Label>
    
</asp:Content>

