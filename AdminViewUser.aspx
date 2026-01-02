<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminViewUser.aspx.cs" Inherits="AdminViewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="col-xl-12">
    <div class="card">
        <div class="card-header">
            <h5>View User</h5>
            
        </div>
        <div class="card-body table-border-style">
            <div class="table-responsive">
         <asp:DataList ID="DataList1" runat="server" DataKeyField="uid" >
    <HeaderTemplate>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>UserName</th>
                            <th>Name</th>
                            <th>Email</th>
                             <th>Contact</th>
                             <th>Gender</th>
                             <th>DOB</th>
                             <th>Aadhaar</th>
                            
                        </tr>
                    </thead>
                    </HeaderTemplate>
<ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%# Eval("uid")%></td>
                            <td><%# Eval("uname")%></td>
                            <td><%# Eval("name")%></td>
                            <td><%# Eval("emailid")%></td>
                            <td><%# Eval("contact")%></td>
                            <td><%# Eval("gender")%></td>
                            <td><%# Eval("dob")%></td>
                            <td><%# Eval("aadhaar")%></td>
                           
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

