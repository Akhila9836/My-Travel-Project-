<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminDeleteSP.aspx.cs" Inherits="AdminDeleteSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="col-xl-12">
    <div class="card">
        <div class="card-header">
            <h5>Delete Service Provider</h5>
            
        </div>
        <div class="card-body table-border-style">
            <div class="table-responsive">
         <asp:DataList ID="DataList1" runat="server" DataKeyField="aid" onselectedindexchanged="DataList1_SelectedIndexChanged" >
    <HeaderTemplate>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>UserName</th>
                            <th>Owner Name</th>
                            <th>Company Name</th>
                            <th>Email</th>
                             <th>Contact</th>
                             <th>Licence No</th>
                             <th>Location</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    </HeaderTemplate>
<ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%# Eval("aid")%></td>
                            <td><%# Eval("uname")%></td>
                            <td><%# Eval("oname")%></td>
                            <td><%# Eval("cname")%></td>
                            <td><%# Eval("email")%></td>
                            <td><%# Eval("contact")%></td>
                            <td><%# Eval("licence")%></td>
                            <td><%# Eval("location")%></td>
                            <td> <asp:Button class="btn  btn-primary btn-sm" ID="btn1" runat="server" CommandName="Select"  Text="Delete"  /> </td>
                        </tr>
                        
                    </tbody>

        </ItemTemplate>
       
       
</asp:DataList>
                </table>
            </div>
        </div>
    </div>
</div>
</asp:Content>

