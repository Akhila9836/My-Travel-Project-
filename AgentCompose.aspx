<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMasterPage.master" AutoEventWireup="true" CodeFile="AgentCompose.aspx.cs" Inherits="AgentCompose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <div class="text-center mb-3 pb-3">
<h6 class="text-primary text-uppercase" style="letter-spacing: 5px;"></h6>
<h1>Send Message</h1>
<div style="Width:500px;text-align:left;padding-left: 60px;">
          <asp:Label ID="Label1" runat="server" Text="Comp ID:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" 
                   runat="server" Width="275px" Enabled="False"></asp:TextBox>
        <br />
        <br />
          <div style="Width:500px;text-align:left">
          <asp:Label ID="Label4" runat="server" Text="Sender:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server" Width="275px"></asp:TextBox>
        <br />
        <br />
         <div style="Width:500px;text-align:left">
          <asp:Label ID="Label3" runat="server" Text="Subject:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="275px"></asp:TextBox>
        <br />
        <br />
         <asp:Label ID="Label6" runat="server" Text="Complaints:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server" Width="275px" 
                 Height="100px" TextMode="MultiLine"></asp:TextBox>
        <br />
         <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                 ID="Button1" runat="server" Height="40px" Text="Register" class="btn  btn-primary"   
        Width="275px"  onclick="Button1_Click"/>
        <br />
        <br />
         <asp:Label ID="Label11" runat="server" Visible="False"></asp:Label>
        </div>
        <div style="Width:800px;text-align:left">
         <asp:DataGrid ID="dgdpublic" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" 
                            DataKeyField="compid" Width="830px" 
                GridLines="Horizontal" BackColor="White" BorderColor="#336666" 
                BorderStyle="Double" BorderWidth="3px">
                            <Columns>
                                <asp:BoundColumn DataField="compid" HeaderText="ID"></asp:BoundColumn>
                                <asp:BoundColumn DataField="sub" HeaderText="Subject"></asp:BoundColumn>
                                <asp:BoundColumn DataField="msg" HeaderText="Mail"></asp:BoundColumn>
                                <asp:BoundColumn DataField="date1" HeaderText="Send Date"></asp:BoundColumn>
                                 <asp:BoundColumn DataField="reply" HeaderText="Reply"></asp:BoundColumn>
                                  <asp:BoundColumn DataField="date2" HeaderText="Reply Date"></asp:BoundColumn>
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="White" ForeColor="#333333" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                            <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        </asp:DataGrid>

         </div>
  </div>
    </div>
</asp:Content>

