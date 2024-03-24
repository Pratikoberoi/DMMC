<%@ Page Title="DMMC" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DMMC._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script type="text/javascript">  
        $(document).ready(function () {
            SearchText();
        });
        function SearchText() {
            debugger;
            $("#txtEmpName").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Default.aspx/GetEmployeeName",
                        data: "{'empName':'" + document.getElementById('txtEmpName').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No Match");
                        }
                    });
                }
            });
        }
    </script>   
   
    
    <div class="jumbotron">
        <p>
            <asp:Label ID="Label3" runat="server" Text="Name: "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="Phone No: "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-default"/>
            <asp:Button ID="Button2" runat="server" Text="Add New" class="btn btn-default" />
            <h3>Patients</h3>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </p>
    </div>
    <div>
        <table>
            <tr>
                <td class="jumbotron" style="width:700px">
                     <p>Details:</p>
                        <div>
                            <asp:Label ID="Label1" runat="server" Text="Name: "></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" class="txt"></asp:TextBox>
                            <asp:Label ID="Label2" runat="server" Text="Phone No: "></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <asp:Label ID="Label9" runat="server" Text="Sex: "></asp:Label>
                            <asp:DropDownList ID="ddlSex" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Transgender</asp:ListItem>
                            </asp:DropDownList>
                        </div><p></p>
                        <div>
                            <asp:Label ID="Label5" runat="server" Text="Symptoms: "></asp:Label>
                            <asp:ListBox runat="server" ID="ddlSymptoms" SelectionMode="Multiple" Height="25px" Font-Size="10px">
                            </asp:ListBox>
                            <asp:Button Text="Get Values" Visible="false" ID="btnGetSelectedValues" OnClick="btnGetSelectedValues_Click" runat="server" />
                                


                           
                           <asp:Label ID="Label6" runat="server" Text="Medication: "></asp:Label>
                           <%--<asp:DropDownList ID="ddlMedication" runat="server"></asp:DropDownList>--%>
                            <asp:TextBox ID="txtEmpName" runat="server" Width="160px" />  

                            
            
                        </div><p></p>
                        <div>
                           <asp:Label ID="Label19" runat="server" Text="Remark: "></asp:Label>
                           <asp:TextBox ID="TextBox15" runat="server" Width="300px"></asp:TextBox>
                        </div>
                        <div>
                           <asp:Button ID="Button3" runat="server" Text="Save" class="btn btn-default" />
                        </div>
                </td>
                <td style="width:10px"></td>
                <td class="jumbotron">
                     <p>History:</p>
                    <asp:GridView ID="GridView2" runat="server"></asp:GridView>
                </td>
            </tr>
        </table>

    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>


    

</asp:Content>


