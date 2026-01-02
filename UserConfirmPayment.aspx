<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserConfirmPayment.aspx.cs" Inherits="UserConfirmPayment" %>

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
     .receipt-panel 
     {
        border: 1px solid #333;
        padding: 20px;
        width: 400px;
        background-color: #f9f9f9;
        font-family: Arial;
     }
 </style>

    <script type="text/javascript">
        function validateCardNumber(txt) {
            var value = txt.value.trim();
            if (!/^\d{13,19}$/.test(value) || !luhnCheck(value)) {
                alert("Invalid card number.");
                txt.focus();
            }
        }

        function validateExpiry(txt) {
            var value = txt.value.trim();
            if (!/^(0[1-9]|1[0-2])\/(\d{2}|\d{4})$/.test(value)) {
                alert("Invalid expiry date format. Use MM/YY or MM/YYYY.");
                txt.focus();
            }
        }

        function validateCardHolder(txt) {
            var value = txt.value.trim();
            if (!/^[A-Za-z ]+$/.test(value)) {
                alert("Card holder name should contain only letters and spaces.");
                txt.focus();
            }
        }

        function validateCVV(txt) {
            var value = txt.value.trim();
            if (!/^\d{3}$/.test(value)) {
                alert("Invalid CVV. Must be exactly 3 digits.");
                txt.focus();
            }
        }

        function luhnCheck(cardNumber) {
            let sum = 0;
            let shouldDouble = false;
            for (let i = cardNumber.length - 1; i >= 0; i--) {
                let digit = parseInt(cardNumber.charAt(i));
                if (shouldDouble) {
                    digit *= 2;
                    if (digit > 9) digit -= 9;
                }
                sum += digit;
                shouldDouble = !shouldDouble;
            }
            return (sum % 10) === 0;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="text-center mb-3 pb-3">
    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;"></h6>
    <h1>Book Trip</h1>
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
                             <asp:Label ID="Label10" runat="server" Text="Tour Plan:" Font-Bold="True" 
                Font-Size = "Small"></asp:Label> <br /> <asp:TextBox ID="TextBox18" runat="server" Width="900px" Height="200px" TextMode="MultiLine" ></asp:TextBox> 

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
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<asp:Button 
             ID="Button1" runat="server" Height="40px" Text="Confirm Booking" class="btn  btn-primary"   onclick="Button1_Click"  
    Width="200px"/>
   
            <br /> 
         <br /> 
                           <div>
    <asp:Label ID="LabelPaymentMethod" runat="server" Text="Select Payment Method:" Font-Bold="True" Font-Size="Small"></asp:Label>
    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged" RepeatDirection="Horizontal">
        <asp:ListItem Text="Card" Value="Card" Selected="True" />
        <asp:ListItem Text="UPI" Value="UPI" />
    </asp:RadioButtonList>
    <br />

    <!-- Card Payment Panel -->
    <asp:Panel ID="pnlCardPayment" runat="server" Visible="true">
        <asp:Label ID="Label6" runat="server" Text="Advance Payment Amount :" Font-Bold="True" Font-Size="Small"></asp:Label>
        <asp:TextBox ID="TextBox9" runat="server" Width="200px" Height="30px" Enabled="False"></asp:TextBox>
        <br /><br />

        <asp:Label ID="Label7" runat="server" Text="Credit/Debit Card No :" Font-Bold="True" Font-Size="Small"></asp:Label>
        <asp:TextBox ID="TextBox10" runat="server" Width="200px" Height="30px" TextMode="Number" onblur="validateCardNumber(this)"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;

        <asp:Label ID="Label36" runat="server" Text="Valid Up To" Font-Bold="True" Font-Size="Small"></asp:Label>
        <asp:TextBox ID="TextBox16" runat="server" Width="200px" Height="30px"  onblur="validateExpiry(this)"></asp:TextBox>
        <br /><br />

        <asp:Label ID="Label8" runat="server" Text="Card Holder Name :" Font-Bold="True" Font-Size="Small"></asp:Label>
        <asp:TextBox ID="TextBox11" runat="server" Width="200px" Height="30px" onblur="validateCardHolder(this)"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;

        <asp:Label ID="Label37" runat="server" Text="CVV :" Font-Bold="True" Font-Size="Small"></asp:Label>
        <asp:TextBox ID="TextBox17" runat="server" Width="200px" Height="30px" TextMode="Number" MaxLength="3" onblur="validateCVV(this)"></asp:TextBox>
        <br /><br />
    </asp:Panel>

    <!-- UPI Payment Panel -->
    <asp:Panel ID="pnlUPIPayment" runat="server" Visible="false">
        <asp:Label ID="LabelUPIAmount" runat="server" Text="Advance Payment Amount :" Font-Bold="True" Font-Size="Small"></asp:Label>
        <asp:TextBox ID="txtUPIAmount" runat="server" Width="200px" Height="30px" Enabled="False"></asp:TextBox>
        <br /><br />

        <asp:Label ID="LabelUPIID" runat="server" Text="Enter UPI ID (e.g., user@upi) :" Font-Bold="True" Font-Size="Small"></asp:Label>
        <asp:TextBox ID="txtUPIID" runat="server" Width="200px" Height="30px" Enabled="False">sstravel@oksbi</asp:TextBox>
        <br /><br />
    </asp:Panel>

    <asp:Button ID="Button2" runat="server" Height="40px" Text="Make Payment" CssClass="btn btn-primary" OnClick="Button2_Click" Width="200px" />
    <br /><br />
</div>
        </div>
        <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Blue" 
            Font-Size = "Medium"></asp:Label>
    
    <asp:Panel ID="pnlReceipt" runat="server" Visible="false" CssClass="receipt-panel">
    <h3>Payment Receipt</h3>
    <asp:Label ID="lblReceiptDate" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="lblReceiptMethod" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="lblReceiptAmount" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="lblReceiptDetails" runat="server" Text=""></asp:Label><br />
    <br />
    <asp:Button ID="btnPrint" runat="server" Text="Print Receipt" OnClientClick="window.print(); return false;" CssClass="btn btn-success" />
</asp:Panel>
</asp:Content>

