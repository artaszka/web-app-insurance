<%@ Page Title="" Language="C#" MasterPageFile="~/ubezpieczenie.Master" AutoEventWireup="true" CodeBehind="podsumowanie2.aspx.cs" Inherits="ubezpieczenie.podsumowanie2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="masterHead" runat="server">
    
    <script type = "text/javascript">
        function Potwierdz()
        {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Czy chcesz wykupić wyliczoną polisę?")) {
                confirm_value.value = "Tak";
            } else {
                confirm_value.value = "Nie";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

    <style type="text/css">
        .auto-style1 {
            width: 621px;
        }
        .auto-style2 {
            width: 620px;
            background-color:#e3f8ff ;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width:800px; margin:0 auto; text-align:left">
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelDaneUbezpieczajacego">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td colspan="2">
                        <b>Podsumowanie</b>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                        <asp:Label ID="lbJakieubezpieczenie" runat="server" Text="jakie ubezpieczenie"></asp:Label>
                        <br />
                        <asp:Label ID="lbDataubezpieczenia" runat="server" ></asp:Label>
                        
                        <br />
                        <asp:Label ID="lbDatakoniec" runat="server" ></asp:Label><br />
                        <asp:Label ID="Label1" runat="server" font-size="10" Text="adres ubezpieczonego mienia: "></asp:Label>
                        <asp:Label ID="lbKodu" runat="server" ></asp:Label>
                        <asp:Label ID="lbMiastou" runat="server"></asp:Label>
                        <asp:Label ID="lbUlicau" runat="server"></asp:Label>
                        
                        <br /><br /></td><td></td></tr>
                <tr>
                    <td colspan="2">        
                    <b><asp:Label ID="ubezpieczajacy" runat="server" Text="Ubezpieczający"></asp:Label></b>
                    </td>
                </tr>    
                <tr>
                    <td class="auto-style2">
                        
                        <asp:Label ID="imie" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel" runat="server" Text="pesel"></asp:Label><br />
                        <asp:Label ID="adres" runat="server" font-size="10" Text="adres:"></asp:Label>&nbsp
                        <asp:Label ID="lbKodpocztowy" runat="server" Text="kod"></asp:Label>&nbsp
                        <asp:Label ID="lbMiasto" runat="server" Text="miasto"></asp:Label>,&nbsp
                        <asp:Label ID="lbUlica" runat="server" Text="ulica"></asp:Label>&nbsp
                        <asp:Label ID="lbNumerdomu" runat="server" Text="nr domu"></asp:Label>&nbsp/&nbsp
                        <asp:Label ID="lbNumerlokalu" runat="server" Text="nr lokal"></asp:Label>&nbsp<br />
                        <asp:Label ID="telefon" runat="server" font-size="10" Text="telefon:"></asp:Label>&nbsp
                        <asp:Label ID="lbTelefon" runat="server" Text="Label"></asp:Label>&nbsp
                        <asp:Label ID="email" runat="server" font-size="10" Text="email:"></asp:Label>&nbsp
                        <asp:Label ID="lbEmail" runat="server" Text="Label"></asp:Label><br /><br />
                    </td>
                    <td></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelWlasciciela">
            <table  style="width: 100%; background-color: #8ec9e0; empty-cells:hide;">
                <tr>
                    <td colspan="2">
                        <b>Właściciel</b><br />
                        </td></tr>
                        <tr>
                        <td class="auto-style2">
                        <asp:Label ID="imie2" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie2" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko2" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko2" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel2" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel2" runat="server" Text="pesel"></asp:Label><br />
                        <asp:Label ID="adres2" runat="server" font-size="10" Text="adres:"></asp:Label>&nbsp
                        <asp:Label ID="lbKod2" runat="server" Text="kod"></asp:Label>&nbsp
                        <asp:Label ID="lbMiasto2" runat="server" Text="miasto"></asp:Label>,&nbsp
                        <asp:Label ID="lbUlica2" runat="server" Text="ulica"></asp:Label>&nbsp
                        <asp:Label ID="lbNrdomu2" runat="server" Text="nr domu"></asp:Label>&nbsp/&nbsp
                        <asp:Label ID="lbNrlokalu2" runat="server" Text="nr lokal"></asp:Label>&nbsp<br />
                        <asp:Label ID="telefon2" runat="server" font-size="10" Text="telefon:"></asp:Label>&nbsp
                        <asp:Label ID="lbTelefon2" runat="server" Text="Label"></asp:Label>&nbsp&nbsp
                        <asp:Label ID="email2" runat="server" font-size="10" Text="email:"></asp:Label>&nbsp
                        <asp:Label ID="lbEmail2" runat="server" Text="Label"></asp:Label> 
                        <br />
                        <br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <b>
                        <asp:Label ID="lbWybrane" runat="server"  Text="Wybrane ubezpieczenia" ></asp:Label></b>
                        </td>
                    </tr>
                <tr>
                    <td class="auto-style2"> 
                        <asp:Label ID="lbzamieszkany" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbloklosowe" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lblokalkradziez" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbruchomoscilosowe" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbruchomoscikradziez" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbgarazlosowe" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbgarazkradziez" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbogrodzenielosowe" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbinnylosowe" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbinnykradziez" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lboc" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbnnw" runat="server" ></asp:Label>
                        <br />
                        <asp:Label ID="lbtorebka" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lbassistance" runat="server"></asp:Label>
                        <br />
                    </td>
                    <td>
                    </td>
                </tr>
                </table>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbwartosc" runat="server" Font-Bold="true" Text="Wartość"></asp:Label>
                        <br />
                        <br />
                        <asp:CheckBox ID="chkWarunki" runat="server" />
                        <span style="color: rgb(1, 35, 80);  font-size: 11px;   ">
                            Potwierdzam, że zapoznałem się z Ogólnymi Warunkami Ubezpieczenia oraz Regulaminem serwisu &quot;TWÓJ ZAKŁAD UBEZPIECZEŃ&quot; S.A. 
                            z siedzibą w Warszawie 00-798 przy Teodozyjnej 29 . Zobowiązuję się również do zapoznania z treścią w/w Ogólnych Warunków 
                            Ubezpieczenia oraz Regulaminu pozostałych Ubezpieczeń. Potwierdzam również, że wszystkie dane wprowadzone do niniejszej 
                            umowy ubezpieczenia są prawdziwe.</span>
                        <span class="pdfLink" color: rgb(1, 35, 80)" >
                            <a href="Dokumenty/warunki.pdf" target="_blank" style="font-size: 11px">Ogólne Warunki Ubezpieczenia</a>, 
                            <span class="Apple-converted-space">&nbsp;</span>
                            <a href="Dokumenty/warunki.pdf" style="font-size: 11px"  target="_blank">Regulamin</a></span><br />
                        <br />
                        <asp:CheckBox ID="chkZgoda" runat="server" />
                        <span style="color: rgb(1, 35, 80); font-size: 11px;  ">
                            Wyrażam zgodę aby dane osobowe były przetwarzane przez &quot;TWÓJ ZAKŁAD UBEZPIECZEŃ&quot; S.A. z siedzibą w Warszawie,
                            00-798 przy Teodozyjnej 29, w celu przedstawienia mi ofert ubezpieczeniowych oraz zawarcia i realizacji umowy. Podawanie 
                            danych osobowych jest dobrowolne i przysługuje mi prawo dostępu do treści przekazywanych danych i ich poprawiania. Wypełnienie 
                            formularza i pozostawienie danych kontaktowych oznacza zgodę na kontakt telefoniczny lub przesyłanie informacji handlowych 
                            drogą elektroniczną. Jeżeli nie wyrażasz zgody na wykorzystanie danych kontaktowych informujemy, że ofertę ubezpieczenia 
                            możesz otrzymać kontaktując się z naszą infolinią 0 801 000 000 lub +48 22 801 00 00.</span></td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <asp:Button ID="btKuppolise" OnClientClick = "Potwierdz()" OnClick="btKuppolise_Click" runat="server" Text="Kup polisę" />
                        <br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MasterStopka" runat="server">
</asp:Content>
