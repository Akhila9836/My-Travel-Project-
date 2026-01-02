<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserRecomendation.aspx.cs" Inherits="UserRecomendation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <h2>Tourism Recommendation System</h2>

        <label>Budget:</label>
        <asp:TextBox ID="txtBudget" runat="server"></asp:TextBox>
        <br /><br />

        <label>Preferred Category:</label>
        <asp:DropDownList ID="ddlCategory" runat="server">
            <asp:ListItem Text="Beach" Value="Beach"></asp:ListItem>
            <asp:ListItem Text="Historical" Value="Historical"></asp:ListItem>
            <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
        </asp:DropDownList>
        <br /><br />

        <asp:Button ID="btnRecommend" runat="server" Text="Get Recommendations" OnClick="btnRecommend_Click" />
        <br /><br />

        <asp:Label ID="lblResult" runat="server"></asp:Label>
</asp:Content>

