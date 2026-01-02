<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminViewRating.aspx.cs" Inherits="AdminViewRating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
              <div class="text-center mb-3 pb-3">
    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;"></h6>
    <h1>View Agent Feedbacks</h1>
</div>
        <div class="card-body table-border-style">
            <div class="table-responsive">
         <asp:DataList ID="DataList1" runat="server" DataKeyField="rid" >
    <HeaderTemplate>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Agent Username</th>
                            <th>Customer Name</th>
                            <th>Location</th>
                            <th>Rating</th>
                             <th align="center" style="width:700px";text-align: center;" align="center">Comments</th>
                        </tr>
                    </thead>
                    </HeaderTemplate>
<ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%# Eval("auname")%></td>
                            <td><%# Eval("cuname")%></td>
                            <td><%# Eval("location")%></td>
                            <td><%# Eval("rating")%></td>
                            <td style="width:700px"><%# Eval("comments")%></td>
                            
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

