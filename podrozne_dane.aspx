<%@ Page Title="" Language="C#" MasterPageFile="~/ubezpieczenie.Master" AutoEventWireup="true" CodeBehind="podrozne_dane.aspx.cs" Inherits="ubezpieczenie.podrozne_dane" %>
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
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width:800px; margin:0 auto; text-align:left">
            <asp:Panel runat="server" Style="margin-left: 0px" ID="panelDaneUbezpieczajacego">
                <table  style="width: 100%; background-color: #8ec9e0;">
                    
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
                            <asp:TextBox ID="tbImie" AutoPostBack="true" CausesValidation="true" OnTextChanged="chkCzytensam_CheckedChanged" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbImie" runat="server" ErrorMessage=" imię," Display="Dynamic" ForeColor="Red" Font-Size="X-Small">*</asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko" AutoPostBack="true" CausesValidation="true" OnTextChanged="chkCzytensam_CheckedChanged" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbNazwisko" runat="server" ErrorMessage=" nazwisko," Display="Dynamic" ForeColor="Red" Font-Size="X-Small">*</asp:RequiredFieldValidator><br />
                        </td>
                        </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel" runat="server" Text="PESEL"></asp:Label><br />
                            <asp:Label ID="lbTelefon" runat="server" Text="Telefon"></asp:Label><br />
                            <asp:Label ID="lbEmail" runat="server" Text="E-mail"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel" runat="server" MaxLength="11" Width="120px" AutoPostBack="true" OnTextChanged="tbPesel_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbPesel" runat="server" ErrorMessage=" pesel," Display="Dynamic" ForeColor="Red" Font-Size="X-Small">*</asp:RequiredFieldValidator>

                            <asp:Label ID="lbWynik" runat="server" Font-Size="Small"></asp:Label>
                            <br />
                            <asp:TextBox ID="tbTelefon" runat="server" CausesValidation="true" MaxLength="13" TextMode="Phone" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="tbTelefon" runat="server" ErrorMessage=" telefon," Display="Dynamic" ForeColor="Red" Font-Size="X-Small">*</asp:RequiredFieldValidator>
                            
                            <br />
                            <asp:TextBox ID="tbEmail" CausesValidation="true" runat="server" Width="250px" TextMode="Email"></asp:TextBox>
                        </td>
                    </tr>
                    
                    </table>
                <asp:Panel ID="Panel_innyadres" runat="server">
                <table style="width: 100%; background-color: #8ec9e0;">
                    <tr>
                <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" Text="Kod pocztowy"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3" >
                            <asp:TextBox ID="tbKod1" CausesValidation="false" MaxLength="6" Width="50px" runat="server" OnTextChanged="tbKod1_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tbKod1" runat="server" ErrorMessage=" kod pocztowy," Display="Dynamic" Font-Size="X-Small" ForeColor="red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbKod1" runat="server" ErrorMessage="Niepoprawny format kodu pocztowego" Font-Size="X-Small" ForeColor="red" ValidationExpression="\d\d-\d\d\d" Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                            <asp:Label ID="lbNiepoprawnykod" runat="server" ForeColor="Red" Text=" Niepoprawny kod pocztowy" Visible="False"></asp:Label>
                        </td>
                        </tr>
                <tr>
                    <td colspan="2">

                        
                            <asp:SqlDataSource ID="sprawdzKod1" 
                                 
                                ConnectionString="<%$ ConnectionStrings:KodPocztowy %>" 
                                SelectCommand="SELECT [Kod], [miasto], [ulica] FROM [vKodyPocztowe]"
                                FilterExpression="Kod like '{0}'"
                                runat="server">
                                <FilterParameters>
                                    <asp:ControlParameter Name="kod" ControlID="tbKod1" />    
                                </FilterParameters> 

                            </asp:SqlDataSource>
                            <asp:FormView 
                                ID="frmUlica" Runat="server" 
                                AllowPaging="true" DataSourceID="sprawdzKod1" 
                                Visible="false" OnDataBound="frmUlica_DataBoundChanged" 
                                 >
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
                <asp:Panel ID="Panel_nrdomu" runat="server">
                    <table style="width: 100%; background-color: #8ec9e0;">
                    <tr>
                        <td class="auto-style2">
                            
                            <asp:Label ID="lbNumerdomu" runat="server" Text="Nr domu"></asp:Label><br />
                            <asp:Label ID="lbNumerlokalu" runat="server" Text="Nr mieszkania"></asp:Label><br />
                            
                        </td>
                    
                        <td class="auto-style3">
                            
                            <asp:TextBox ID="tbNumerdomu" CausesValidation="true" runat="server" Width="50px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbNumerdomu" runat="server" ErrorMessage=" nr domu," Display="Dynamic" ForeColor="Red" Font-Size="X-Small">*</asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNumerlokalu" runat="server" Width="50px" ></asp:TextBox><br />
                            
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
                        <asp:Label ID="Label2" runat="server" Text="UBEZPIECZENI: "></asp:Label>&nbsp;<asp:Label ID="lbLiczbaubezp" runat="server" Text="Label"></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" HeaderText="Uzupełnij " ForeColor="Red" style="margin-bottom: 0px" />
                        <br />
                        <asp:CheckBox ID="chkCzytensam" runat="server" OnCheckedChanged="chkCzytensam_CheckedChanged" AutoPostBack="true" Text="Ubezpieczający jest ubezpieczonym" />

                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080"  ID="panelDaneUbezpieczonego1">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie1" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko1" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie1" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" ControlToValidate="tbImie1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko1" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" ControlToValidate="tbNazwisko1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel1" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel1" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel1_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" ControlToValidate="tbPesel1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik1" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego2">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie2" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko2" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie2" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbImie2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko2" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbNazwisko2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel2" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel2" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel2_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbPesel2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik2" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080"  Visible="false" ID="panelDaneUbezpieczonego3">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie3" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko3" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie3" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tbImie3" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko3" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbNazwisko3" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel3" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel3" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel3_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbPesel3" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik3" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego4">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie4" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko4" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie4" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="tbImie4" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko4" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="tbNazwisko4" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel4" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel4" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel4_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="tbPesel4" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik4" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego5">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie5" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko5" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie5" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="tbImie5" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko5" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="tbNazwisko5" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel5" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel5" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel5_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="tbPesel5" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik5" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego6">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie6" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko6" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie6" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="tbImie6" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko6" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="tbNazwisko6" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel6" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel6" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel6_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="tbPesel6" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik6" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego7">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie7" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko7" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie7" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="tbImie7" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko7" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="tbNazwisko7" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel7" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel7" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel7_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="tbPesel7" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik7" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego8">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie8" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko8" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie8" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ControlToValidate="tbImie8" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko8" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" ControlToValidate="tbNazwisko8" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel8" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel8" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel8_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ControlToValidate="tbPesel8" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik8" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego9">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie9" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko9" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie9" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" ControlToValidate="tbImie9" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko9" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" ControlToValidate="tbNazwisko9" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel9" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel9" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel9_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" ControlToValidate="tbPesel9" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik9" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="border:groove; border-color:#808080" Visible="false" ID="panelDaneUbezpieczonego10">
            <table style="width: 100%; background-color: #8ec9e0;">

                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbImie10" runat="server" Text="Imię"></asp:Label><br />
                            <asp:Label ID="lbNazwisko10" runat="server" Text="Nazwisko"></asp:Label><br />
                        </td>
                        <td class="auto-style3">

                            <asp:TextBox ID="tbImie10" CausesValidation="true" runat="server" Width="135px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" ControlToValidate="tbImie10" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbNazwisko10" CausesValidation="true" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="tbNazwisko10" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbPesel10" runat="server" Text="PESEL"></asp:Label><br />
                            
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="tbPesel10" runat="server" AutoPostBack="true" MaxLength="11" OnTextChanged="tbPesel10_TextChanged" Width="120px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" ControlToValidate="tbPesel10" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                            <asp:Label ID="lbWynik10" runat="server" Font-Size="Small" ></asp:Label>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>

        </div>

</asp:Content>

<asp:Content ID="Stopka" ContentPlaceHolderID="MasterStopka" runat="server">
    
    <asp:Button ID="btnPodsumowanie" runat="server" CausesValidation="true"  OnClick="btnPodsumowanie_Click" Text="Dalej" Font-Bold="True" Width="80px" />
</asp:Content>
