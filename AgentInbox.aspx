<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMasterPage.master" AutoEventWireup="true" CodeFile="AgentInbox.aspx.cs" Inherits="AgentInbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <div class="text-center mb-3 pb-3">
<h6 class="text-primary text-uppercase" style="letter-spacing: 5px;"></h6>
<h1>AgentInbox</h1>
    <div style="Width:900px;text-align:left;padding-left: 60px;">
<%--<asp:Label ID="Label2" runat="server" Font-Bold="True" 
            Text="Information: Status 0: Waiting for Approval !! Status 1:Delivered !! Status 2:Rejected "></asp:Label>--%>
        <br />
         <br />
        <asp:DataGrid ID="dgpublic" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
        DataKeyField="compid" Width="830px" 
        onselectedindexchanged="dgpublic_SelectedIndexChanged" GridLines="Horizontal" >
                    <Columns>
                        <asp:BoundColumn DataField="compid" HeaderText="Complaint ID"></asp:BoundColumn>
                        <asp:BoundColumn DataField="suname" HeaderText="UserName"></asp:BoundColumn>
                        <asp:BoundColumn DataField="sub" HeaderText="Subject"></asp:BoundColumn>
                        <asp:BoundColumn DataField="msg" HeaderText="Message"></asp:BoundColumn>
                         <asp:BoundColumn DataField="date1" HeaderText="Send Date"></asp:BoundColumn>
                        <asp:ButtonColumn CommandName="Select" Text="Select"></asp:ButtonColumn>
                    </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="White" ForeColor="#333333" />
                            <PagerStyle BackColor="#336666" ForeColor="White" 
                        HorizontalAlign="Center" Mode="NumericPages" />
                            <SelectedItemStyle BackColor="#339966" Font-Bold="True" 
                        ForeColor="White" />
                </asp:DataGrid>
                 <br />
        <div style="Width:1300px;text-align:left">
         <asp:Label ID="Label9" runat="server" Text="Reply:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                 ID="TextBox6" runat="server" Width="475px" Height="108px" 
                TextMode="MultiLine" Enabled="False"></asp:TextBox>
         <br />
         <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                 ID="Button2" runat="server" Height="40px" Text="Submit"   
        Width="100px" class="btn  btn-primary"
                 onclick="Button2_Click"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        </div>
</asp:Content>

