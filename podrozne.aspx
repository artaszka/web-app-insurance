<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ubezpieczenie.Master" CodeBehind="podrozne.aspx.cs" Inherits="ubezpieczenie.podrozne" %>

<asp:Content ID="zawartoschead" ContentPlaceHolderID="masterHead" runat="server">


    <script type="text/javascript">

        function wyswietlKalendarz() {
            var wyborDaty = document.getElementById('wyborDaty');
            wyborDaty.style.display = 'block';
        }
        function wyswietlKalendarz2() {
            var wyborDaty2 = document.getElementById('wyborDaty2');
            wyborDaty2.style.display = 'block';
        }
        
    </script>
    <style type="text/css">
        #wyborDaty
        {
            display:none;
            position:absolute;
            border:solid 2px black;
            background-color:white;
        }
        #wyborDaty2
        {
            display:none;
            position:absolute;
            border:solid 2px black;
            background-color:white;
        }
        .content
        {
            width:400px;
            background-color:white;
            margin:auto;
            padding:10px;
        }
        html
        {
            
        }
        
        .auto-style1 {
            height: 25px;
        }
        
    </style>
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    
    
    <div style="width:800px; margin:0 auto; text-align:left">
        <asp:Panel runat="server" style="margin-left: 0px"> 
        <table style="width: 100%; ">
            <tr>
                <td>forma ubezpieczenia</td>
                <td class="auto-style2">ubezpieczeni</td>
                <td class="auto-style6">&nbsp;</td><td></td><td></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Indywidualna" Enabled="false" /> <br />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Rodzinna" Enabled="false"/> <br />
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="Grupowa" Enabled="false"/> 
                    
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Liczba ubezpieczonych" Width="175px"></asp:Label>
                    <br />
&nbsp;<asp:TextBox ID="tbLiczbUbezp" runat="server" Font-Bold="true" BackColor="#3399ff" Text="0" Enabled="false" Width="27px" BorderStyle="None"></asp:TextBox>
&nbsp;
                    <br />
                    <br />
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label2" runat="server" Text="0-18 lat" Height="25px" Width="70px"></asp:Label>
&nbsp;<br />
                    <asp:DropDownList ID="DD_024" runat="server" OnSelectedIndexChanged="przelicz" AutoPostBack="True">
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="18-70 lat" Height="25px" Width="70px"></asp:Label>
&nbsp;<br />
                    <asp:DropDownList ID="DD_2570" runat="server" AutoPostBack="True" OnSelectedIndexChanged="przelicz">
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="pow. 70 lat" Height="25px" Width="95px"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DD_71" runat="server" AutoPostBack="True" OnSelectedIndexChanged="przelicz">
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    
                </td>
                <td class="auto-style5">
                    <asp:Label ID="Label5" runat="server" Text="Dokąd jedziesz?"></asp:Label><br />
                    <asp:DropDownList ID="ddJakiRegion" runat="server">
                        <asp:ListItem>Europa</asp:ListItem>
                        <asp:ListItem>Świat</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td >
                    <asp:Label ID="Label6" runat="server" Text="Data wyjazdu"></asp:Label>
                    <br />
                    <asp:TextBox ID="Tb_dataWyjazdu" runat="server" OnTextChanged="Button1_Click" AutoPostBack="true" CausesValidation="true"  Width="83px" ReadOnly="True"></asp:TextBox>
                    <img src="Obrazki/kalendarz.png" onclick="wyswietlKalendarz()" style="height: 22px; width: 22px" />
                    <asp:CompareValidator ID="CompareValidatorDataWyjazdu" runat="server" ControlToValidate="Tb_dataWyjazdu" ErrorMessage="Data ubezpieczenia musi być starsza niż dzisiejsza data" ForeColor="red" Type="Date" Display="Dynamic" Operator="GreaterThan">*</asp:CompareValidator>
    
    <div id="wyborDaty">
    <asp:Calendar
        id="calDataZdarzenia"
        OnSelectionChanged="calDataZdarzenia_SelectionChanged" 
        Runat="server" />
    </div>
                </td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Data powrotu"></asp:Label>
                    <br />
                    <asp:TextBox ID="Tb_dataPowrotu" runat="server" Width="83px" ReadOnly="True" OnTextChanged="Button1_Click" AutoPostBack="true" CausesValidation="true"></asp:TextBox>
                    <img src="Obrazki/kalendarz.png" onclick="wyswietlKalendarz2()" style="height: 22px; width: 22px" />
                    <asp:CompareValidator ID="CompareValidatorDataPowrotu" runat="server" ControlToValidate="Tb_dataWyjazdu" ControlToCompare="Tb_dataPowrotu" ErrorMessage="Data ubezpieczenia musi być starsza niż dzisiejsza data" ForeColor="red" Type="Date" Display="Dynamic" Operator="LessThanEqual">*</asp:CompareValidator>

    <div id="wyborDaty2">
    <asp:Calendar
        id="calDataZdarzenia2"
        OnSelectionChanged="calDataZdarzenia2_SelectionChanged" 
        Runat="server" />
    </div>
                </td>
                <td>
                    <asp:Label runat="server" ID="lbIleDni" Text="Dni ubezpieczenia" ></asp:Label>
                    
                    <br />
                    <asp:TextBox ID="tbIleDni" Enabled="false" runat="server" Width="26px"></asp:TextBox>
                    
                </td>
            </tr>
        </table>
        <table style="width:100%; background-color: white;">
            <tr style="height:60px; background-color: aquamarine">
                <td>
                    <asp:Label ID="WariantPolisy" runat="server" Text="WARIANT POLISY"></asp:Label>
                </td>
                <td style="width:160px">
                    <asp:Label ID="lStandard" runat="server" Text="STANDARD"></asp:Label>
                </td>
                <td style="width:160px">
                    <asp:Label ID="lKomfort" runat="server" Text="KOMFORT"></asp:Label>
                </td>
                <td style="width:160px">
                    <asp:Label ID="lPremium" runat="server" Text="PREMIUM"></asp:Label>
                </td>
                
            </tr>
            <tr style="background-color: #e3f8ff">
                <td>
                    <asp:Label ID="Label8" runat="server" Text="KOSZTY LECZENIA" ToolTip="Zwrot kosztów leczenia związany z pobytem i operacjami w szpitalu, wizytami lekarskimi, badaniami i zabiegami, lekarstwami przepisanymi przez lekarza. Dla zdarzeń na terenie Polski koszty leczenia pokrywane są w przypadku wystąpienia Nieszczęśliwego Wypadku. "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddKosztyStandard" OnTextChanged="przelicz" AutoPostBack="true" runat="server" >
                        <asp:ListItem Value="2">40000</asp:ListItem>
                        <asp:ListItem Selected="True" Value="3">60000</asp:ListItem>
                        <asp:ListItem Value="4">80000</asp:ListItem>
                        <asp:ListItem Value="5">120000</asp:ListItem>
                        <asp:ListItem Value="6">160000</asp:ListItem>
                        <asp:ListItem Value="8">250000</asp:ListItem>
                    </asp:DropDownList>
&nbsp;<br />
                </td>
                <td>
                    <asp:DropDownList ID="ddKosztyKomfort" runat="server" OnTextChanged="przelicz" AutoPostBack="True">
                        <asp:ListItem Value="2">40000</asp:ListItem>
                        <asp:ListItem Value="3">60000</asp:ListItem>
                        <asp:ListItem Selected="True" Value="4">80000</asp:ListItem>
                        <asp:ListItem Value="5">120000</asp:ListItem>
                        <asp:ListItem Value="6">160000</asp:ListItem>
                        <asp:ListItem Value="8">250000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:DropDownList ID="ddKosztyPremium" runat="server" OnTextChanged="przelicz" AutoPostBack="True">
                        <asp:ListItem Value="2">40000</asp:ListItem>
                        <asp:ListItem Value="3">60000</asp:ListItem>
                        <asp:ListItem Value="4">80000</asp:ListItem>
                        <asp:ListItem Selected="True" Value="5">120000</asp:ListItem>
                        <asp:ListItem Value="6">160000</asp:ListItem>
                        <asp:ListItem Value="8">250000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="NWW" ToolTip="M.in. ratownictwo, doraźna pomoc medyczna, transport Ubezpieczonego, wcześniejszy powrót Ubezpieczonego, pomoc prawna, odzyskanie i ponowne skierowanie bagażu."></asp:Label>
                    </td>
                <td>
                    <asp:DropDownList ID="ddNwwStandard" runat="server" Width="79px" OnTextChanged="przelicz" AutoPostBack="True" >
                        <asp:ListItem Selected="True" Value="1">5000</asp:ListItem>
                        <asp:ListItem Value="2">10000</asp:ListItem>
                        <asp:ListItem Value="3">20000</asp:ListItem>
                        <asp:ListItem Value="4">30000</asp:ListItem>
                        <asp:ListItem Value="5">50000</asp:ListItem>
                        
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:DropDownList ID="ddNwwKomfort" runat="server" OnTextChanged="przelicz" AutoPostBack="True">
                        <asp:ListItem Value="1">5000</asp:ListItem>
                        <asp:ListItem Selected="True" Value="2">10000</asp:ListItem>
                        <asp:ListItem Value="3">20000</asp:ListItem>
                        <asp:ListItem Value="4">30000</asp:ListItem>
                        <asp:ListItem Value="5">50000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:DropDownList ID="ddNwwPremium" runat="server" OnTextChanged="przelicz" AutoPostBack="True">
                        <asp:ListItem Value="1">5000</asp:ListItem>
                        <asp:ListItem Value="2">10000</asp:ListItem>
                        <asp:ListItem Selected="True" Value="3">20000</asp:ListItem>
                        <asp:ListItem Value="4">30000</asp:ListItem>
                        <asp:ListItem Value="5">50000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr style="background-color: #e3f8ff">
                <td class="auto-style1">
                    <asp:Label ID="Label10" runat="server" Text="ASSISTANCE STANDARD" ToolTip="M.in. ratownictwo, doraźna pomoc medyczna, transport Ubezpieczonego, wcześniejszy powrót Ubezpieczonego, pomoc prawna, odzyskanie i ponowne skierowanie bagażu."></asp:Label>
                    </td>
                <td class="auto-style1">
                    <asp:CheckBox ID="chkAssistStandard"  Checked="true" runat="server" Enabled="False" />
                    </td>
                <td class="auto-style1">
                    <asp:CheckBox ID="chkAssistKomf" Checked="true"  runat="server" Enabled="False" />
                    </td>
                <td class="auto-style1">
                    <asp:CheckBox ID="chkAssistSuper" Checked="true" runat="server" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="ASSISTANCE SUPER" ToolTip="M.in. powrót osób bliskich Ubezpieczonego, kontynuacja podróży, kierowca zastępczy, opieka nad dziećmi, odwiedziny osoby bliskiej, pomoc finansowa"></asp:Label>
                    </td>
                <td>-</td>
                <td>-</td>
                <td>
                    <asp:CheckBox ID="cbASuper" Checked="true" runat="server" OnCheckedChanged="przelicz" AutoPostBack="True" />
                    </td>
            </tr>
            <tr style="background-color: #e3f8ff">
                <td>
                    <asp:Label ID="Label12" runat="server" Text="OC W ŻYCIU PRYWATNYM" ToolTip="Odpowiedzialność ubezpieczonego za szkody wyrządzone w życiu prywatnym (w podróży mającej charakter turystyczny) osobom trzecim a polegające na uszkodzeniu/zniszczeniu ich mienia i/lub spowodowania szkód zdrowotnych."></asp:Label>
                    </td>
                <td>-</td>
                <td>
                    <asp:DropDownList ID="ddOcKomfort" runat="server" OnTextChanged="przelicz" AutoPostBack="true">
                        <asp:ListItem Value="0,5">20000</asp:ListItem>
                        <asp:ListItem Selected="True" Value="1">50000</asp:ListItem>
                        <asp:ListItem Value="1,5">100000</asp:ListItem>
                        <asp:ListItem Value="2">200000</asp:ListItem>
                        <asp:ListItem Value="2,5">300000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:DropDownList ID="ddOcPremium" runat="server" OnTextChanged="przelicz" AutoPostBack="true">
                        <asp:ListItem Value="0,5">20000</asp:ListItem>
                        <asp:ListItem Value="1">50000</asp:ListItem>
                        <asp:ListItem Selected="True" Value="1,5">100000</asp:ListItem>
                        <asp:ListItem Value="2">200000</asp:ListItem>
                        <asp:ListItem Value="2,5">300000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="BAGAŻ PODRÓŻNY" ToolTip="Ubezpieczeniem objęte są rzeczy osobiste stanowiące własność Ubezpieczonego lub będące w jego posiadaniu podczas podróży, służące do jego użytku osobistego tj. sprzęt elektroniczny, sprzęt sportowy np. narty, ubrania, kosmetyki itp."></asp:Label>
                    </td>
                <td>-</td>
                <td>
                    <asp:DropDownList ID="ddBagażKomfort" runat="server" OnTextChanged="przelicz" AutoPostBack="true">
                        <asp:ListItem Value="1">500</asp:ListItem>
                        <asp:ListItem Selected="True" Value="2">1500</asp:ListItem>
                        <asp:ListItem Value="3">3000</asp:ListItem>
                        <asp:ListItem Value="4">5000</asp:ListItem>
                        <asp:ListItem Value="5">10000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:DropDownList ID="ddBagażPremium" runat="server" OnTextChanged="przelicz" AutoPostBack="true">
                        <asp:ListItem Value="1">500</asp:ListItem>
                        <asp:ListItem Value="2">1500</asp:ListItem>
                        <asp:ListItem Selected="True" Value="3">3000</asp:ListItem>
                        <asp:ListItem Value="4">5000</asp:ListItem>
                        <asp:ListItem Value="5">10000</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr style="background-color: #e3f8ff">
                <td>
                    <asp:Label ID="Label14" runat="server" Text="SKI PLUS" ToolTip="Ubezpieczeniem są objęte koszty wypożyczenia sprzętu narciarskiego, zwrot niewykorzystanego karnetu lub uczestnictwa w szkółce narciarskiej oraz świadczenie rekompensujące zamknięcie tras zjazdowych"></asp:Label>
                    </td>
                <td>-</td>
                <td>-</td>
                <td>
                    <asp:CheckBox ID="cbSkiPlus" Checked="true" runat="server" OnCheckedChanged="przelicz" AutoPostBack="true" />
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="RATOWNICTWO"></asp:Label>
                    </td>
                <td>
                    <asp:CheckBox ID="CheckBox2" Checked="true" runat="server" Enabled="False" />
                    </td>
                <td>
                    <asp:CheckBox ID="CheckBox4" Checked="true" runat="server" Enabled="False" />
                    </td>
                <td>
                    <asp:CheckBox ID="CheckBox6" Checked="true" runat="server" Enabled="False" Font-Bold="False" />
                    </td>
            </tr>
            <tr style="background-color: #e3f8ff">
                <td>
                    <asp:Label ID="Label16" runat="server" Text="LECZENIE W RP"></asp:Label>
                </td>
                <td>-</td>
                <td>
                    <asp:CheckBox ID="cbLeczenieKomfort" Checked="true" runat="server" OnCheckedChanged="przelicz" AutoPostBack="true" />
                    </td>
                <td>
                    <asp:CheckBox ID="cbLeczeniePremium" Checked="true" runat="server" OnCheckedChanged="przelicz" AutoPostBack="true" />
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="WyliczSkladke" runat="server" OnClick="Button1_Click" Text="Wylicz składkę" Visible="False" />
                </td>
                <td>
                    <asp:Label ID="lbSkladkaStandard" runat="server" Text="SkladkaStandard"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbSkladkaKomfort" runat="server" Text="SkladkaKomfort"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbSkladkaPremium" runat="server" Text="SkladkaPremium"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbInfo" ForeColor="Red" runat="server" ></asp:Label>
                    <br />
                    <asp:Label ID="lbInfo2"  runat="server" Visible="False" ></asp:Label>
                </td>
                <td>
                    <asp:Button ID="tbWybierzStandard" runat="server" Text="KUP POLISĘ" OnClick="tbWybierzStandard_Click" Enabled="False" />                
                </td>
                <td>
                    <asp:Button ID="tbWybierzKomfort" runat="server" Text="KUP POLISĘ" OnClick="tbWybierzKomfort_Click" Enabled="False" />                
                </td>
                <td>
                    <asp:Button ID="tbWybierzPremium" runat="server" Text="KUP POLISĘ" OnClick="tbWybierzPremium_Click" Enabled="False" />                
                </td>
            </tr>
        </table>
        
    </asp:Panel>
            </div>
        
        </asp:Content>
