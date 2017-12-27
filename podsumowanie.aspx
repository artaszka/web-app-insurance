<%@ Page Title="" Language="C#" MasterPageFile="~/ubezpieczenie.Master" AutoEventWireup="true" CodeBehind="podsumowanie.aspx.cs" Inherits="ubezpieczenie.podsumowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="masterHead" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            font-family:Arial;
        }
        .auto-style2 {
            width: 150px;
            font-family:Arial;
        }
        .auto-style3 {
            width: 650px;
            font-family:Arial;
        }
        .auto-style4 {
            width: 250px;
        }
        .auto-style5 {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="width:800px; margin:0 auto; text-align:left">
            <asp:Panel runat="server" Style="margin-left: 0px" ID="panelDaneUbezpieczajacego">
                <table  style="width: 100%; background-color: #8ec9e0;">
                    <tr>
                    <td colspan="2">
                            <asp:Label ID="lbadresubezpieczenia" runat="server" Text=""></asp:Label>
                            <asp:Label ID="lbnr" runat="server" Font-Size="Small" Text="Nr :"></asp:Label>
                            <asp:TextBox ID="tbNumerdomu0" runat="server" AutoPostBack="true" OnTextChanged="tbNumerdomu0_TextChanged" Width="50px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="tbNumerdomu" Display="Dynamic" ErrorMessage="*" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbrozdzielnik" runat="server" Font-Size="Large" Text=" / "></asp:Label>
                            
                            <asp:TextBox ID="tbNumerlokalu0" AutoPostBack="true" runat="server" OnTextChanged="tbNumerdomu0_TextChanged" Width="50px"></asp:TextBox>
                            

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style1" >
                            <asp:Label ID="lbJakieubezpieczenie" runat="server"></asp:Label> <br />
                            <asp:Label ID="lbDaneUbezp" runat="server" Text="UBEZPIECZAJĄCY"></asp:Label>&nbsp;

                        </td>
                    </tr>
                    <tr>
                         
                        <td class="auto-style2">
                            <asp:Label ID="lbImie" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko" runat="server" Text="Nazwisko"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbImie" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbImie" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko"  CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbNazwisko" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                        </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel" runat="server" Text="PESEL"></asp:Label><br />
                            <asp:Label ID="lbTelefon" runat="server" Text="Telefon"></asp:Label><br />
                            <asp:Label ID="lbEmail" runat="server" Text="E-mail"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel" runat="server" MaxLength="11" Width="120px"  AutoPostBack="true" OnTextChanged="tbPesel_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbPesel" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            
                            <asp:Label ID="wynik1" runat="server" Font-Size="Small"></asp:Label> 
                            <br />
                            <asp:TextBox ID="tbTelefon" CausesValidation="true" runat="server" MaxLength="13" Width="135px" TextMode="Phone"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="tbTelefon" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbEmail" CausesValidation="true" runat="server" Width="250px" TextMode="Email"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style1" >
                            <asp:Label ID="lbDanenieruchomosci" runat="server" Text="."></asp:Label><br />
                            <asp:CheckBox ID="chkAdrestensam" AutoPostBack="true" OnCheckedChanged="chkAdrestensam_CheckedChanged" runat="server" Checked="true" Text="Adres ubezpieczającego jest ten sam co ubezpieczanej nieruchomości" />
                        </td>
                    </tr>
                    </table>
                <asp:Panel ID="Panel_innyadres" Visible="false" runat="server">
                <table style="width: 100%; background-color: #8ec9e0;">
                    <tr>
                <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" Text="Kod pocztowy"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3" >
                            <asp:TextBox ID="tbKod1" CausesValidation="false" MaxLength="6" Width="50px" runat="server" OnTextChanged="tbKod1_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tbKod1" runat="server" ErrorMessage="*" Display="Dynamic" Font-Size="X-Small" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbKod1" runat="server" ErrorMessage="Niepoprawny format kodu pocztowego" Font-Size="X-Small" ForeColor="red" ValidationExpression="\d\d-\d\d\d" Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                            <asp:Label ID="lbNiepoprawnykod1" runat="server" ForeColor="Red" Text=" Niepoprawny kod pocztowy" Visible="False"></asp:Label>
                            </td>
                        </tr>
                <tr>
                    <td colspan="2">

                        
                            <asp:SqlDataSource ID="sprawdzKod1" 
                                 
                                ConnectionString="<%$ ConnectionStrings:KodPocztowy %>" 
                                SelectCommand="SELECT [kod], [miasto], [ulica] FROM [vKodyPocztowe]"
                                FilterExpression="kod like '{0}'"
                                runat="server">
                                <FilterParameters>
                                    <asp:ControlParameter Name="kod" ControlID="tbKod1" />    
                                </FilterParameters> 

                            </asp:SqlDataSource>
                            <asp:FormView 
                                ID="frmInnyadres" 
                                Runat="server" 
                                AllowPaging="true" 
                                DataSourceID="sprawdzKod1" 
                                Visible="false" 
                                OnDataBound="frmInnyadres_DataBoundChanged">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width:143px">
                                                <asp:Label ID="lbMiasto2" runat="server"  Text="Miasto"></asp:Label><br />
                                                <asp:Label ID="lbUlica2" runat="server"  Text="Ulica"></asp:Label><br />
                                                
                                            
                                            </td>
                                            
                                            <td>
                                                <asp:TextBox ID="fvlbMiasto" runat="server" Width="300px" Enabled="false" Text='<%# Eval("miasto") %>'></asp:TextBox><br />
                                                <asp:TextBox ID="fvlbUlica" runat="server" Width="300px" Enabled="false" Text='<%# Eval("ulica") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <PagerTemplate>
                                    <asp:Label ID="lbWybierz1" runat="server"  Text="Wybierz ulicę/miasto"></asp:Label>
                                    <asp:DropDownList ID="ddlLista" Runat="server" CausesValidation="false" DataSourceID="sprawdzKod1" DataTextField="ulica" DataValueField="ulica" />
                                    <asp:Button ID="btnPage" Runat="server" CausesValidation="false" OnClick="btnPage_Click1" Text="Wybierz" />
                                </PagerTemplate>
                            </asp:FormView>
                            
                        </td>
                    </tr>
                </table>
             </asp:Panel>
                <asp:Panel ID="Panel_tensamadres" runat="server">
                <table style="width: 100%; background-color: #8ec9e0;">
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbKodpocztowy" runat="server" Text="Kod pocztowy"></asp:Label><br />
                            
                            <asp:Label ID="lbMiasto" runat="server" Text="Miasto"></asp:Label><br />
                            <asp:Label ID="lbUlica" runat="server" Text="Ulica"></asp:Label>
                        </td>
                        
                        <td class="auto-style3">
                            <asp:TextBox ID="tbKodpocztowy" CausesValidation="true" runat="server" Width="70px" Enabled="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tbKodpocztowy" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbMiasto" CausesValidation="true" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbMiasto" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbUlica" runat="server" Width="300px" Enabled="False"></asp:TextBox><br />
                        </td>

                    </tr>
                    </table>
                    </asp:Panel>
                <asp:Panel ID="Panel_nrdomu" runat="server">
                    <table style="width: 100%; background-color: #8ec9e0;">
                    <tr>
                        <td class="auto-style2">
                            
                            <asp:Label ID="lbNumerdomu" runat="server" Text="Nr domu"></asp:Label><br />
                            <asp:Label ID="lbNumerlokalu" runat="server" Text="Nr mieszkania"></asp:Label><br />
                            
                        </td>
                    
                        <td class="auto-style3">
                            
                            <asp:TextBox ID="tbNumerdomu" CausesValidation="true" runat="server" Width="50px" Enabled="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbNumerdomu" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNumerlokalu" runat="server" Width="50px" Enabled="False"></asp:TextBox><br />
                            
                        </td>
                        
                    </tr>
                </table>
            </asp:Panel>
            </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelCzytensam">
            <table style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style1"  >
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="WŁAŚCICIEL"></asp:Label><br />

                            <asp:CheckBox ID="chkCzytensam" runat="server" OnCheckedChanged="chkCzytensam_CheckedChanged" AutoPostBack="true" Text="Właściciel jest ubezpieczającym" />

                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelDanewlasciciela">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                         
                        <td class="auto-style2">
                            <asp:Label ID="lbimie2" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko2" runat="server" Text="Nazwisko"></asp:Label><br />
                            
                            
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie2" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbimie2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko2" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbNazwisko2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel2" runat="server" Text="PESEL"></asp:Label><br />
                            <asp:Label ID="lbTelefon2" runat="server" Text="Telefon"></asp:Label><br />
                            <asp:Label ID="lbMail2" runat="server" Text="E-mail"></asp:Label><br />
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel2" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel2_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbPesel2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="wynik2" runat="server" Font-Size="Small" ></asp:Label>
                            <br />
                            <asp:TextBox ID="tbTelefon2" runat="server" MaxLength="13" Width="135px"></asp:TextBox><br />
                            <asp:TextBox ID="tbEmail2" runat="server" Width="250px" TextMode="Email"></asp:TextBox><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbKod2" runat="server" Text="Kod pocztowy"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3" >
                            <asp:TextBox ID="tbKod2" CausesValidation="false" MaxLength="6" Width="50px" runat="server" OnTextChanged="tbKod2_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorkodpocztowy2" ControlToValidate="tbKod2" runat="server" ErrorMessage="*" Display="Dynamic" Font-Size="X-Small" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionKodpocztowy2" ControlToValidate="tbKod2" runat="server" ErrorMessage="Niepoprawny format kodu pocztowego" Font-Size="X-Small" ForeColor="red" ValidationExpression="\d\d-\d\d\d" Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                            <asp:Label ID="lbNiepoprawnykod" runat="server" ForeColor="Red" Text=" Niepoprawny kod pocztowy" Visible="False"></asp:Label>
                        </td>
                        </tr>
                <tr>
                    <td colspan="2" class="auto-style1">

                        
                            <asp:SqlDataSource ID="sprawdzKod" 
                                 
                                ConnectionString="<%$ ConnectionStrings:KodPocztowy %>" 
                                SelectCommand="SELECT [kod], [miasto], [ulica] FROM [vKodyPocztowe]"
                                FilterExpression="kod like '{0}'"
                                runat="server">
                                <FilterParameters>
                                    <asp:ControlParameter Name="kod" ControlID="tbKod2" />    
                                </FilterParameters> 

                            </asp:SqlDataSource>
                            <asp:FormView 
                                ID="frmUlica" 
                                Runat="server" 
                                AllowPaging="true" 
                                DataSourceID="sprawdzKod" 
                                Visible="false"
                                OnDataBound="frmUlica_DataBoundChanged" >
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width:143px">
                                                <asp:Label ID="lbMiasto2" runat="server"  Text="Miasto"></asp:Label><br />
                                                <asp:Label ID="lbUlica2" runat="server"  Text="Ulica"></asp:Label><br />
                                                
                                            
                                            </td>
                                            
                                            <td>
                                                <asp:TextBox ID="fvlbMiasto" runat="server" Width="300px" Enabled="false" Text='<%# Eval("miasto") %>'></asp:TextBox><br />
                                                <asp:TextBox ID="fvlbUlica" runat="server" Width="300px" Enabled="false" Text='<%# Eval("ulica") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <PagerTemplate>
                                    <asp:Label ID="lbWybierz2" runat="server"  Text="Wybierz ulicę/miasto"></asp:Label>
                                    <asp:DropDownList ID="ddlLista" Runat="server" CausesValidation="false" DataSourceID="sprawdzKod" DataTextField="ulica" DataValueField="ulica" />
                                    <asp:Button ID="btnPage" Runat="server" CausesValidation="false" OnClick="btnPage_Click" Text="Wybierz" />
                                </PagerTemplate>
                            </asp:FormView>
                            
                        </td>
                    </tr>
                <tr>
                    <td class="auto-style2">
                        
                        <asp:Label ID="lbNrdomu2" runat="server" Text="Nr domu"></asp:Label><br />
                        <asp:Label ID="lbNrlokalu2" runat="server" Text="Nr mieszkania"></asp:Label><br />
                        
                    </td>
                    <td class="auto-style3">
                        
                        <asp:TextBox ID="tbNrdomu2" CausesValidation="true" runat="server" Width="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbNrdomu2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="tbNrlokalu2" runat="server" Width="50px"></asp:TextBox><br />
                        
                    </td>
                </tr>
                </table>

            </asp:Panel>
        </div>


</asp:Content>
<asp:Content ID="Stopka" ContentPlaceHolderID="MasterStopka" runat="server" >

    <asp:Button ID="btnPodsumowanie" runat="server" CausesValidation="true"  OnClick="btnPodsumowanie_Click" Text="Dalej" Font-Bold="True" Width="80px" />

</asp:Content>
