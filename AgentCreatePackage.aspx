<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMasterPage.master" AutoEventWireup="true" CodeFile="AgentCreatePackage.aspx.cs" Inherits="AgentCreatePackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="Width:1300px;text-align:left;padding-left: 100px;">
    
     <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="BlueViolet" Font-Size = "X-Large"
        Text="New Package Registration"></asp:Label>
         <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;
         <br />
     <br />
     <asp:Label ID="Label7" runat="server" Text="Package ID:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox8" runat="server" 
             Width="400px" Height="40px" Enabled="False"></asp:TextBox> &nbsp;&nbsp;&nbsp;<br /> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
     <asp:Label ID="Label1" runat="server" Text="Package Name:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" 
         Width="400px" Height="40px"></asp:TextBox>
         <br />
         <br />
     
     <asp:Label ID="Label2" runat="server" Text="No of Days:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="TextBox6" runat="server" Width="400px" Height="40px" ></asp:TextBox>
         <br />
     <br />
     <asp:Label ID="Label13" runat="server" Text="Price:" 
         Font-Names="Arial" Font-Size="Medium"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox10" runat="server" Width="400px" Height="40px" ></asp:TextBox>
         <br />
     <br />
    
       <asp:Label ID="Label12" runat="server" Text="Description :" 
         Font-Names="Arial" Font-Size="Medium"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox9" 
             runat="server" Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox>
    <br />
     <br />
      <asp:Label ID="Label15" runat="server" Text="Total Days:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox12" runat="server" Width="400px" Height="40px" ></asp:TextBox>
         <br />
     <br />
      <asp:Label ID="Label20" runat="server" Text="Total Night:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox13" runat="server" Width="400px" Height="40px" >0</asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
     <br />
      <asp:Label ID="Label23" runat="server" Text="Accomadation:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>&nbsp;&nbsp;
     <asp:DropDownList ID="DropDownList3" 
         runat="server" Width="400px" Height="40px" AutoPostBack="True" >
 </asp:DropDownList> 
        <br />
        <br />
          <asp:Label ID="Label3" runat="server" Text="Description :" 
     Font-Names="Arial" Font-Size="Medium"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" 
         runat="server" Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox>
<br />
 <br />
          <asp:Label ID="Label4" runat="server" Text="Food Type:" Font-Names="Arial" 
     Font-Size="Medium"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" 
         runat="server" Width="400px" Height="40px" AutoPostBack="True" 
         onselectedindexchanged="DropDownList2_SelectedIndexChanged" >
 </asp:DropDownList> 
         <br /> 
<br />
                  <asp:Label ID="Label5" runat="server" Text="Vehicle:" Font-Names="Arial" 
     Font-Size="Medium"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" 
         runat="server" Width="400px" Height="40px" AutoPostBack="True" 
         onselectedindexchanged="DropDownList2_SelectedIndexChanged" >
 </asp:DropDownList> 
         <br /> 
<br />
      <asp:Label ID="Label18" runat="server" Text="Main Image:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>            
         <div style="margin-top:-18px;margin-left:125px;"> 
             <asp:FileUpload ID="FileUpload1" runat="server" Width="400px" Height="40px" onload="FileUpload1_Load"/> 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
             ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></div>
              <asp:Label ID="Label19" runat="server" Text="Sub Design1:" 
         Font-Names="Arial" Font-Size="Medium"></asp:Label>            
         <div style="margin-top:-18px;margin-left:125px;"> 
             <asp:FileUpload ID="FileUpload2" runat="server" Width="400px" Height="40px" 
                 onload="FileUpload2_Load"/> 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
             ControlToValidate="FileUpload2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></div>
      <asp:Label ID="Label21" runat="server" Text="Sub Design2:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>            
         <div style="margin-top:-18px;margin-left:125px;"> 
             <asp:FileUpload ID="FileUpload3" runat="server" Width="400px" Height="40px" 
                 onload="FileUpload3_Load"/> 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
             ControlToValidate="FileUpload3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></div>     
     <asp:Label ID="Label22" runat="server" Text="Sub Design3:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>             
         <div style="margin-top:-18px;margin-left:125px;"> 
             <asp:FileUpload ID="FileUpload4" runat="server" Width="400px" Height="40px" 
                 onload="FileUpload4_Load"/> 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
             ControlToValidate="FileUpload4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></div>
              <br />
      <asp:Label ID="Label24" runat="server" Text="HighLights:" Font-Names="Arial" 
         Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:TextBox ID="TextBox15" runat="server" Width="400px" Height="40px" ></asp:TextBox>
     <br />
 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                  <asp:Label ID="Label6" runat="server" Text="Inclusion :" 
     Font-Names="Arial" Font-Size="Medium"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" 
         runat="server" Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox>
<br />
 <br />
                  <asp:Label ID="Label9" runat="server" Text="Exclusion :" 
     Font-Names="Arial" Font-Size="Medium"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox4" 
         runat="server" Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox>
<br />
 <br />
          <asp:Label ID="Label10" runat="server" Text="Location:" Font-Names="Arial" 
     Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:TextBox ID="TextBox5" runat="server" Width="400px" Height="40px" ></asp:TextBox>
        <br />
        <br />
        <br />
          <asp:Label ID="Label25" runat="server" Text="Tour Plan:" Font-Names="Arial" 
     Font-Size="Medium"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:TextBox ID="TextBox16" runat="server" Width="396px" Height="105px" TextMode="MultiLine" ></asp:TextBox>
 <br /> Eg: Day 1:@ Arrival and North Goa Exploration#Day 2: @North Goa Sightseeing#Day 
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
             ID="Button1" runat="server" Height="40px" Text="Submit" class="btn  btn-primary"   onclick="Button1_Click"  
    Width="200px"/> &nbsp;&nbsp;<asp:Button ID="Button2" 
             runat="server" Height="40px" Text="Cancel"  class="btn  btn-primary"
    Width="200px" onclick="Button2_Click1"/>
    <br />
    <br />
     <asp:Label ID="Label11" runat="server" Visible="False"></asp:Label>

      </div>
</asp:Content>

