<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserServiceProviderList.aspx.cs" Inherits="UserServiceProviderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Service Provider Ratings</title>
    <style>
        table { width: 90%; border-collapse: collapse; margin: 20px auto; font-family: Arial; }
        th, td { border: 1px solid #ccc; padding: 12px; text-align: center; }
        th { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .rating { color: #ffc107; font-size: 18px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="text-align: center;">Service Providers & Ratings</h2>
        <asp:GridView ID="gvProviders" runat="server" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:BoundField DataField="uname" HeaderText="Username" />
                <asp:BoundField DataField="cname" HeaderText="Company Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="contact" HeaderText="Contact" />
                <asp:BoundField DataField="location" HeaderText="Location" />
                <asp:TemplateField HeaderText="Average Rating">
            <ItemTemplate>
                <span class="rating">
                    <%# GetStars(Convert.ToDouble(Eval("AverageRating"))) %>
                    (<%# Math.Round(Convert.ToDouble(Eval("AverageRating")), 1) %>)
                </span>
            </ItemTemplate>
        </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
</asp:Content>

