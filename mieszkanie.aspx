<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mieszkanie.aspx.cs" MasterPageFile="~/ubezpieczenie.Master" Inherits="ubezpieczenie.mieszkanie" %>

<asp:Content ID="zawartoschead" ContentPlaceHolderID="masterHead" runat="server">

    
    <script type="text/javascript">
        function wyswietlKalendarz()
        {
            var wyborDaty = document.getElementById('wyborDaty');
            wyborDaty.style.display ='block';
        }
    </script>
    <style type="text/css">
        #wyborDaty
        {
            display:none;
            position:fixed;
            border:solid 2px black;
            background-color:white;
        }
        .auto-style1 {
            width: 200px;
            text-align: right;
        }
        .auto-style2 {
            width: 400px;
            text-align: right;
        }
        .auto-style3 {
            
            width:200px;
            text-align:center;
        }
        .auto-style5 {
            width: 200px;
            
            text-align:right;
        }        
        
    </style>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    
        <div style="width:800px; margin:0 auto; text-align:left">
            <asp:Panel runat="server" Style="margin-left: 0px" ID="RodzajBudynku">
                <table  style="width: 100%; background-color: #8ec9e0;">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lbCoUbezpieczyc" runat="server" Font-Bold="true" Text="Co chcesz ubezpieczyć?"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 300px; height: 90px; vertical-align: middle">
                            <asp:RadioButtonList ID="rbCoubezpieczyc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RbCoubezpieczyc_SelectedIndexChanged" Height="52px">
                                <asp:ListItem>Dom</asp:ListItem>
                                <asp:ListItem>Mieszkanie</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:Panel ID="PanelDom" runat="server" Visible="false">
                                <asp:RadioButtonList ID="rbRodzajDomu" runat="server" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="rbJakiObiektiStan_SelectedIndexChanged">
                                    <asp:ListItem Value="1">Ubezpieczenie domu</asp:ListItem>
                                    <asp:ListItem Value="2">Ubezpieczenie domu w budowie</asp:ListItem>

                                </asp:RadioButtonList>
                            </asp:Panel>
                            <asp:Panel ID="PanelMieszkanie" runat="server" Visible="false">
                                <asp:RadioButtonList ID="rbRodzajMieszkania" runat="server" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="rbJakiObiektiStan_SelectedIndexChanged">
                                    <asp:ListItem Value="3">Ubezpieczenie mieszkania</asp:ListItem>
                                    <asp:ListItem Value="4">Ubezpieczenie mieszkania w budowie</asp:ListItem>

                                </asp:RadioButtonList>
                            </asp:Panel>
                        </td>
                    </tr>

                </table>
            </asp:Panel>
            <asp:Panel ID="Ppodstawowy" runat="server" Style="margin-left: 0px" Visible="False">
                <table style="width: 100%; background-color: #cefaff;">
                    <tr>
                        <td style="height: 50px" colspan="2">
                            <asp:Label ID="lbCoubezpieczone" runat="server" ></asp:Label>
                            </td>
                        <td>
                            Dziś jest: 
                            <asp:Label  runat="server" ID="lbDataTeraz" ValidateRequestMode="Enabled" ForeColor="Gray"> </asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                    <td style="height: 50px" colspan="3">                           
                    <asp:FormView
                        id="frmUlica"  DataSourceID="sprawdzKod"
                        AllowPaging="True"  Visible="False"
                        Runat="server"  Width="755px"
                        BackColor="White" BorderColor="#336666" 
                        BorderStyle="Double" BorderWidth="3px" 
                        CellPadding="4" GridLines="Horizontal"
                        OnDataBound="frmUlica_DataBoundChanged">
                        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <asp:Label ID="fvlbKod" runat="server" 
                                Text='<%# Eval("kod")%>'></asp:Label><b>, </b>
                            <asp:Label ID="fvlbMiasto" runat="server" 
                                Text='<%# Eval("miasto") %>'></asp:Label><b>, </b>
                            <asp:Label ID="fvlbUlica" runat="server" 
                                Text='<%# Eval("ulica") %>'></asp:Label><b>, </b>
                            gmina <asp:Label ID="fvlbGmina" runat="server" 
                                Text='<%# Eval("gmina") %>'></asp:Label><b>, </b>
                            <asp:Label ID="fvlbWojewodztwo" runat="server" 
                                Text='<%#Eval("wojewodztwo") %>'></asp:Label>
                        </ItemTemplate>
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="left" />
                        <PagerTemplate>
                            <asp:DropDownList
                                id="ddlLista"
                                Runat="server"
                                DataSourceID="sprawdzKod" 
                                DataTextField="ulica" 
                                DataValueField="ulica"
                                CausesValidation="false">
                            </asp:DropDownList>
                            <asp:Button
                                id="btnPage" Text="Wybierz" CausesValidation="false"
                                Runat="server" OnClick="btnPage_Click" />
                        </PagerTemplate>
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        </asp:FormView> 
                            <asp:Label ID="lbUlica" runat="server" Text="Label" Visible="False"></asp:Label>
                            <asp:Label ID="lbMiasto" runat="server"  Text="Label" Visible="False"></asp:Label>
                            <asp:Label ID="lbNiepoprawnykod" runat="server" ForeColor="Red" Visible="false" Text="Label"></asp:Label>
                           
                        </td>
                     </tr>
                    <tr>
                        <td style="border: 0px none #FFFFFF; width: 180px; padding: 0px; margin: 0px">

                            <asp:Label ID="lbKodpocztowy" runat="server" Text="Kod pocztowy&nbsp" Height="25px"></asp:Label>
                            <asp:TextBox ID="tbKodpocztowy" runat="server" MaxLength="6" Width="50px"  OnTextChanged="tbKodpocztowy_TextChanged" AutoPostBack="true" ToolTip="Wpisz kod pocztowy miejsca, które chcesz ubezpieczyć w fomacie XX-XXX" ></asp:TextBox>
                            <asp:SqlDataSource ID="sprawdzKod"    
                                ConnectionString="<%$ ConnectionStrings:KodPocztowy %>" 
                                SelectCommand="SELECT [Kod], [miasto], [ulica], [gmina], [wojewodztwo] FROM [vKodyPocztowe]"
                                FilterExpression="Kod like '{0}'"
                                EnableCaching="true"
                                runat="server">
                                <FilterParameters>
                                    <asp:ControlParameter Name="kod" ControlID="tbKodpocztowy" />    
                                </FilterParameters> 
                            </asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldKodpocztowy" runat="server" ControlToValidate="tbKodpocztowy" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionKodpocztowy" ControlToValidate="tbKodpocztowy" runat="server" ErrorMessage="Niepoprawny format kodu pocztowego" ForeColor="red" ValidationExpression="\d\d-\d\d\d" Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                            


                        </td>
                        <td style="width: 310px">
                            <asp:Label ID="lbTerminUbezp" runat="server" Text="Początek ubezpieczenia&nbsp" Height="25px"></asp:Label>
                            <asp:TextBox ID="tbTerminUbezp" runat="server" Width="83px" ReadOnly="True" AutoPostBack="true" CausesValidation="True"  OnTextChanged="tbWartosc_TextChanged" ToolTip="Wybierz z kalendarza datę rozpoczęcia obowiązywania ubezpieczenia" ></asp:TextBox>

                            <img src="Obrazki/kalendarz.png" runat="server" onclick="wyswietlKalendarz()" style="height: 22px; width: 22px" />

                            <div id="wyborDaty">
                                <asp:Calendar
                                    ID="calDataZdarzenia"
                                    OnSelectionChanged="calDataZdarzenia_SelectionChanged"
                                    runat="server" />
                            </div>
                            <asp:CompareValidator ID="CompareValidatorDataUbezpieczenia" runat="server" ControlToValidate="tbTerminUbezp" ErrorMessage="Data ubezpieczenia musi być starsza niż dzisiejsza data" ForeColor="red" Type="Date" Display="Dynamic" Operator="GreaterThan" SetFocusOnError="True">*</asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldTerminUbezp" runat="server" ControlToValidate="tbTerminUbezp" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="lbWartosc" runat="server" Text="Wartość nieruchomości&nbsp" Height="25px"></asp:Label>
                            <asp:TextBox ID="tbWartosc" runat="server" MaxLength="7" Width="83px" AutoPostBack="true" CausesValidation="True"  OnTextChanged="tbWartosc_TextChanged" ToolTip="Wartość nieruchomości musi zawierać się pomiędzy 10000 zł a 1000000 zł" Enabled="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldWartosc" runat="server" ControlToValidate="tbWartosc" ForeColor="Red" Display="None" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Wartość nieruchomości musi zawierać się pomiędzy 10000zł a 1000000zł" ControlToValidate="tbWartosc" Display="Dynamic" ForeColor="Red" MaximumValue="1000000" MinimumValue="10000" SetFocusOnError="True" Type="Integer">*</asp:RangeValidator>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">

                            <asp:Label ID="Label22" runat="server" Text="Czy lokal jest zamieszkany na stałe?"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rbZamieszkany" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>

                        </td>
                        <td>

                            <asp:RadioButtonList ID="rbZamieszkany" runat="server" AutoPostBack="true" CausesValidation="True" OnTextChanged="tbWartosc_TextChanged" RepeatColumns="2">
                                <asp:ListItem>nie</asp:ListItem>
                                <asp:ListItem>tak</asp:ListItem>
                            </asp:RadioButtonList>
                            &nbsp &nbsp
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="PanelLokal" Visible="False">
                <table style="width: 100%; background-color: #e4faff;">
                    <tr>
                        <td style="background-color: antiquewhite" colspan="4"></td>
                    </tr>
                    <tr style="background-color: aqua;">
                        <td colspan="2">
                            <asp:Label ID="Label2" runat="server" Text="WARTOŚĆ LOKALU MIESZKALNEGO"></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:Label ID="Label21" runat="server" Text="Suma ubezpieczenia"></asp:Label>
                        </td>
                        <td style="text-align:center">CENA</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="ImageDom" runat="server" Height="40"  ImageUrl="~/Obrazki/domikona.png"  ImageAlign="Middle" />
                        </td>
                        <td style="text-align: right" class="auto-style5">
                            <asp:Label ID="Label10" runat="server" Text="Zdarzenia losowe&amp;nbsp"></asp:Label>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Enabled="False" />
                            <br />
                            <asp:Label ID="Label24" runat="server" Text="Kradzież&nbsp"></asp:Label>
                            <asp:CheckBox ID="boxLokalKradziez" AutoPostBack="true" OnCheckedChanged="wyliczanie_skladki" runat="server" Checked="True" />
                        </td>
                        <td class="auto-style1">

                            <asp:TextBox ID="tbLokalLosowe" runat="server" CausesValidation="true" ReadOnly="True" AutoPostBack="True" OnTextChanged="wyliczanie_skladki"></asp:TextBox><br />
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tbLokalKradziez" ErrorMessage="Wartość od 1000 zł do 100000 zł" 
                                Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="100000" Type="Integer" >*</asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbLokalKradziez" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="tbLokalKradziez" runat="server" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" MaxLength="6" ToolTip="Wartość od 1000 zł do 100000 zł"></asp:TextBox>
                        </td>

                        <td class="auto-style3">


                            <asp:Label ID="lbCenazalokallosowe" runat="server"></asp:Label> &nbsp <asp:Label ID="pln1" runat="server" Text="PLN"></asp:Label><br />
                            <asp:Label ID="lbCenazalokalkradziez" runat="server"></asp:Label> &nbsp <asp:Label ID="pln2" runat="server" Text="PLN"></asp:Label>

                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel runat="server" ID="PanelRuchomosci" Visible="False">
                <table style="width: 100%; background-color: #e4faff;">
                    <tr>
                        <td style="background-color: antiquewhite" colspan="4"></td>
                    </tr>
                    <tr>
                        <td style="background-color: aqua;" colspan="4">
                            <asp:Label ID="Label4" runat="server" Text="WARTOŚĆ RUCHOMOŚCI DOMOWYCH"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="ImageMeble" runat="server" Height="40" ImageUrl="~/Obrazki/mebleikona.png" ImageAlign="Middle" />
                        </td>
                        <td class="auto-style5">
                            <asp:Label ID="Label17" runat="server" Text="Zdarzenia losowe&amp;nbsp"></asp:Label>
                            <asp:CheckBox ID="boxRuchomeLosowe" runat="server" Checked="True" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" />
                            <br />
                            <asp:Label ID="Label18" runat="server" Text="Kradzież&nbsp"></asp:Label>
                            <asp:CheckBox ID="boxRuchomeKradziez" runat="server" Checked="True" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" />

                        </td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbRuchomosciLosowe" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="tbRuchomosciLosowe" ErrorMessage="Maksymalna wartość 50000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="50000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbRuchomosciLosowe" runat="server" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" MaxLength="5" ToolTip="Wartość od 1000 zł do 50000 zł"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbRuchomosciKradziez" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="tbRuchomosciKradziez" ErrorMessage="Maksymalna wartość 50000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="50000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbRuchomosciKradziez" runat="server" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" MaxLength="5" ToolTip="Wartość od 1000 zł do 50000 zł"></asp:TextBox>

                        </td>
                        <td class="auto-style3">


                            <asp:Label ID="lbCenaRuchLos" runat="server"></asp:Label>&nbsp<asp:Label ID="pln3" runat="server" Text="PLN"></asp:Label><br />
                            <asp:Label ID="lbCenaRuchKr" runat="server"></asp:Label>&nbsp<asp:Label ID="pln4" runat="server" Text="PLN"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="PanelGaraz" Visible="False">
                <table style="width: 100%; background-color: #e4faff;">
                    <tr>
                        <td style="background-color: antiquewhite" colspan="4"></td>
                    </tr>
                    <tr style="background-color: aqua">
                        <td style="background-color: aqua; height: 20px" colspan="4">
                            <asp:Label ID="Label5" runat="server" Text="WARTOŚĆ GARAŻU WOLNOSTOJĄCEGO"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="ImageGaraz" runat="server" Height="40" ImageUrl="~/Obrazki/garazikona.png" ImageAlign="Middle" />
                        </td>
                        <td class="auto-style5">
                            <asp:Label ID="Label19" runat="server" Text="Zdarzenia losowe&amp;nbsp"></asp:Label>
                            <asp:CheckBox ID="boxGarazLosowe" runat="server" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" />
                            <br />
                            <asp:Label ID="Label20" runat="server" Text="Kradzież&nbsp"></asp:Label>
                            <asp:CheckBox ID="boxGarazKradziez" runat="server" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" /></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbGarazLosowe" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="tbGarazLosowe" ErrorMessage="Maksymalna wartość 100000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="100000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbGarazLosowe" runat="server" AutoPostBack="True" CausesValidation="true" OnTextChanged="wyliczanie_skladki" Enabled="False" MaxLength="6" ToolTip="Wartość od 1000 zł do 100000 zł"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbGarazKradziez" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="tbGarazKradziez" ErrorMessage="Maksymalna wartość 100000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="100000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbGarazKradziez" runat="server" Enabled="False" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" MaxLength="6" ToolTip="Wartość od 1000 zł do 100000 zł"></asp:TextBox>

                        </td>
                        <td class="auto-style3">

                            <asp:Label ID="lbCenaGarazLos" runat="server" ></asp:Label>&nbsp<asp:Label ID="pln5" runat="server" Text="PLN"></asp:Label><br />
                            <asp:Label ID="lbCenaGarazKr" runat="server" ></asp:Label>&nbsp<asp:Label ID="pln6" runat="server" Text="PLN"></asp:Label>

                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="PanelOgrodzenie" Visible="False">
                <table style="width: 100%; background-color: #e4faff;">
                    <tr>
                        <td style="background-color: antiquewhite" colspan="4"></td>
                    </tr>
                    <tr>
                        <td style="background-color: aqua; height: 20px" colspan="4">
                            <asp:Label ID="Label12" runat="server" Text="WARTOŚĆ OGRODZENIA"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="ImageSiatka" runat="server" Height="40" ImageUrl="~/Obrazki/ogrodzenieikona.png"  ImageAlign="Middle" />
                        </td>
                        <td class="auto-style5">
                            <asp:Label ID="Label13" runat="server" Text="Zdarzenia losowe&amp;nbsp"></asp:Label>
                            <asp:CheckBox ID="boxOgrodzenieLosowe" runat="server" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" />
                        </td>

                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbOgrodzenieLosowe" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator7" runat="server" ControlToValidate="tbOgrodzenieLosowe" ErrorMessage="Maksymalna wartość 50000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="50000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbOgrodzenieLosowe" runat="server" Enabled="False" MaxLength="5" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" ToolTip="Wartość od 1000 zł do 50000 zł"></asp:TextBox>
                        </td>

                        <td class="auto-style3">
                            <asp:Label ID="lbCenaOgrodzLos" runat="server" ></asp:Label>&nbsp<asp:Label ID="pln7" runat="server" Text="PLN"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="PanelInnyBudynek" Visible="False">
                <table style="width: 100%; background-color: #e4faff;">
                    <tr>
                        <td style="background-color: antiquewhite" colspan="4"></td>
                    </tr>
                    <tr>
                        <td style="background-color: aqua; height: 20px" colspan="4">
                            <asp:Label ID="Label3" runat="server" Text="WARTOŚĆ INNEGO BUDYNKU"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="ImageInne" runat="server" Height="40" ImageUrl="~/Obrazki/innybudynekikona.png" ImageAlign="Middle" />
                        </td>
                        <td class="auto-style5">
                            <asp:Label ID="Label15" runat="server" Text="Zdarzenia losowe&amp;nbsp"></asp:Label>
                            <asp:CheckBox ID="boxInnyLosowe" runat="server" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" />
                            <br />
                            <asp:Label ID="Label16" runat="server" Text="Kradzież&nbsp"></asp:Label>
                            <asp:CheckBox ID="boxInnyKradziez" runat="server" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" />
                        </td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbInnyLosowe" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator8" runat="server" ControlToValidate="tbInnyLosowe" ErrorMessage="Maksymalna wartość 100000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="100000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbInnyLosowe" runat="server" Enabled="False" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" MaxLength="6" ToolTip="Wartość od 1000 zł do 100000 zł"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tbInnyKradziez" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator9" runat="server" ControlToValidate="tbInnyKradziez" ErrorMessage="Maksymalna wartość 100000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="100000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbInnyKradziez" runat="server" Enabled="False" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" MaxLength="6" ToolTip="Wartość od 1000 zł do 100000 zł"></asp:TextBox>
                        </td>
                        <td class="auto-style3">
                            <asp:Label ID="lbCenaInnyLos" runat="server" Text="0"></asp:Label>&nbsp<asp:Label ID="pln8" runat="server" Text=" PLN"></asp:Label><br />
                            <asp:Label ID="lbCenaInnyKr" runat="server" Text="0"></asp:Label>&nbsp<asp:Label ID="pln9" runat="server" Text=" PLN"></asp:Label>

                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="PanelRyzyka" Visible="False">
                <table style="width: 100%; background-color: #e4faff;">
                    <tr>
                        <td style="background-color: antiquewhite" colspan="4"></td>
                    </tr>
                    <tr>
                        <td style="background-color: aqua; height: 20px" colspan="4">
                            <asp:Label ID="Label6" runat="server" Text="RYZYKA DODATKOWE"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 5px" colspan="4"></td>


                    </tr>

                    <tr style="height: 50px">
                        <td class="auto-style2" colspan="2">Ubezpieczenie Odpowiedzialności Cywilnej<asp:CheckBox ID="boxOC" runat="server" Checked="True" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" /></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tbOC" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator10" runat="server" ControlToValidate="tbOC" ErrorMessage="Maksymalna wartość 50000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="50000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbOC" runat="server" MaxLength="5" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" Text="30000" ToolTip="Wartość od 1000 zł do 50000 zł"></asp:TextBox>
                        </td>
                        <td class="auto-style3">
                            <asp:Label ID="lbCenaOc" runat="server"></asp:Label> &nbsp <asp:Label ID="pln10" runat="server" Text="PLN"></asp:Label></td>
                    </tr>
                    <tr style="height: 50px">
                        <td class="auto-style2" colspan="2">Następstwa Nieszczęśliwych Wypadków<asp:CheckBox ID="boxNnw" runat="server" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" /></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="tbNnw" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator11" runat="server" ControlToValidate="tbNnw" ErrorMessage="Maksymalna wartość 50000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="1000" MaximumValue="50000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbNnw" runat="server" Enabled="False" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" MaxLength="5" ToolTip="Wartość od 1000 zł do 50000 zł">0</asp:TextBox>
                        </td>
                        <td class="auto-style3">
                            <asp:Label ID="lbCenaNnw" runat="server"></asp:Label> &nbsp <asp:Label ID="pln11" runat="server" Text="PLN"></asp:Label></td>
                    </tr>
                    <tr style="height: 50px">
                        <td class="auto-style2" colspan="2">Pakiet Torebka<asp:CheckBox ID="boxTorebka" runat="server" Checked="True" AutoPostBack="True" OnCheckedChanged="wyliczanie_skladki" /></td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbTorebka" ErrorMessage="Wypełnij pole" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator12" runat="server" ControlToValidate="tbTorebka" ErrorMessage="Maksymalna wartość 2000 zł" Display="Dynamic" ForeColor="Red" MinimumValue="100" MaximumValue="2000" Type="Integer">*</asp:RangeValidator>
                            <asp:TextBox ID="tbTorebka" runat="server" MaxLength="4" CausesValidation="true" AutoPostBack="True" OnTextChanged="wyliczanie_skladki" Text="1000" ToolTip="Wartość od 100 zł do 2000 zł"></asp:TextBox>
                        </td>
                        <td class="auto-style3">
                            <asp:Label ID="lbCenaTorebka" runat="server"></asp:Label> &nbsp <asp:Label ID="pln12" runat="server" Text="PLN"></asp:Label></td>
                    </tr>
                    <tr style="height: 50px">
                        <td class="auto-style2" colspan="2">Assistance - Pomoc w Domu&nbsp<asp:CheckBox ID="boxAssistance" runat="server" Checked="True" AutoPostBack="true" OnCheckedChanged="wyliczanie_skladki" /></td>
                        <td class="auto-style1">
                            
                            &nbsp;</td>
                        <td class="auto-style3">
                            <asp:Label ID="lbCenaAssist" runat="server" Text=""></asp:Label>&nbsp<asp:Label ID="pln13" runat="server" Text="PLN"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2"  style="text-align: right">
                            <asp:Label ID="lbznikza" runat="server" Text="Cena:&nbsp"></asp:Label>
                            <asp:Label ID="lbCena" runat="server" Font-Strikeout="True" ></asp:Label>

                        </td>
                        <td style="text-align: right">
                            <asp:Label ID="lbSuma" runat="server" EnableTheming="True" Font-Bold="true" Font-Size="Larger" Text="Cena końcowa:&nbsp;"></asp:Label>
                        </td>
                        <td>

                            

                            <asp:Label ID="lbCenaKoncowa" runat="server" Font-Bold="True" Font-Size="Larger" Text="cena koncowa"></asp:Label>

                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
        </div>
    

</asp:Content>
<asp:Content ID="Stopka" ContentPlaceHolderID="MasterStopka" runat="server" >

    <asp:Button ID="btnPodsumowanie" runat="server" Visible="false" OnClick="btnPodsumowanie_Click" Text="Dalej" Font-Bold="True" Width="80px" />

</asp:Content>