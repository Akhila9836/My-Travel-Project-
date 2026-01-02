<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserWeather.aspx.cs" Inherits="UserWeather" %>
<%@ Register Assembly="System.Web.DataVisualization" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <style>
    body {
        font-family: Segoe UI, sans-serif;
        background-color: #f0f2f5;
        padding: 40px;
    }

    .form-container {
        background-color: #fff;
        padding: 30px;
        max-width: 600px;
        margin: auto;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h2 {
        color: #333;
        text-align: center;
        margin-bottom: 30px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: 600;
        margin-bottom: 5px;
    }

    input[type=text], input[type=date], input[type=email], input[type=number], textarea, select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    .btn-submit {
        background-color: #82ae46;
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
    }

    .btn-submit:hover {
        background-color: #6d9239;
    }

    .message {
        margin-top: 15px;
        color: green;
        font-weight: bold;
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <h2>Weather Prediction</h2>
<div style="margin:20px;">
        <asp:TextBox ID="txtCity" runat="server" Width="200px" Placeholder="Enter city"></asp:TextBox>
        <asp:Button ID="btnGet" runat="server"  CssClass="btn-submit" Text="Get Forecast" OnClick="btnGet_Click" />
        <br /><br />
        <asp:Label ID="lblWeather" runat="server" EnableHtml="true"></asp:Label>
        <br /><br />
        <br />
        <asp:Chart ID="chartRain" runat="server" Height="400px" Width="600px">
                <titles>
                    <asp:Title Name="Title1" Text="Rain Forecast (12 PM - Next 3 Days)" />
                </titles>
                <series>
                    <asp:Series ChartType="Column" Name="RainForecast" />
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1" />
                </chartareas>
            </asp:Chart>
    </div>
</asp:Content>

