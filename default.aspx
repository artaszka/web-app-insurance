<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ubezpieczenie.Master" CodeBehind="default.aspx.cs" Inherits="ubezpieczenie._default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="masterHead" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <div style="width:800px; margin:0 auto; text-align:left">    
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" ForeColor="White"  ><h2>
            Wybierz ubezpieczenie dla siebie</h2>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center" Height="222px"  >
                <table style="margin: 0 auto; width:800px; background-color:transparent;"  >
                    <tr>
                        <td>
                            <br />
                            <asp:ImageButton ID="ImageButton3" BorderStyle="Solid" BorderColor="LightGray" runat="server" ImageUrl="~/Obrazki/podroz.png" PostBackUrl="~/podrozne.aspx"  />
                            &nbsp
                            <asp:ImageButton ID="ImageButton1" BorderStyle="Solid" BorderColor="LightGray" runat="server" ImageUrl="~/Obrazki/mieszkanie.png" PostBackUrl="~/mieszkanie.aspx"/>
                            &nbsp
                            <asp:ImageButton ID="ImageButton2" BorderStyle="Solid" BorderColor="LightGray" runat="server" ImageUrl="~/Obrazki/inne.png" PostBackUrl="~/errors/przekroczonyczas.aspx"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
    <br />
    </div>
    

</asp:Content>