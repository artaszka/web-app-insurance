<%@ Page Title="" Language="C#" MasterPageFile="~/ubezpieczenie.Master" AutoEventWireup="true" CodeBehind="podrozne_podsumowanie.aspx.cs" Inherits="ubezpieczenie.podrozne_podsumowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="masterHead" runat="server">
    
    <script type = "text/javascript">
        function Potwierdz() {
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
                        <table style="width: 100%; font-size:smaller">
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label8" runat="server" Text="Wybrany pakiet/wariant "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbJakieubezpieczenie" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label7" runat="server" Text="Początek ubezpieczenia "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbDataubezpieczenia" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label6" runat="server" Text="Koniec ubezpieczenia "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbDatakoniec" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label9" runat="server" Text="Koszty leczenia "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbKosztyleczenia" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label10" runat="server" Text="Następstwa nieszczęśliwych wypadków "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbNww" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label11" runat="server" Text="Assistance standard "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbAssiststandard" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label12" runat="server" Text="Assistance super "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbAssistsuper" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label13" runat="server" Text="Odpowiedzialność cywilna "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbOC" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label14" runat="server" Text="Bagaż podróżny "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbBagaz" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label15" runat="server" Text="Ski Plus "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbSkiplus" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label16" runat="server" Text="Ratownictwo "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbRatownictwo" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <asp:Label ID="Label17" runat="server" Text="Leczenie w RP "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbleczenie" Font-Bold="true" runat="server"></asp:Label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                
                            </tr>

                        </table>

                        
                            </td></tr>
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
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony1">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td colspan="2">
                        <b>Ubezpieczeni</b><br />
                        </td></tr>
                        <tr>
                        <td class="auto-style2">
                        <asp:Label ID="imie1" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie1" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko1" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko1" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel1" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel1" runat="server" Text="pesel"></asp:Label><br />
                        </td>
                    <td>

                    </td>
                </tr>
                
                </table>
            </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony2">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie2" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie2" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko2" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko2" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel2" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel2" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony3">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie3" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie3" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko3" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko3" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel3" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel3" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony4">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie4" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie4" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko4" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko4" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel4" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel4" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony5">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie5" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie5" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="naziwsko5" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko5" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel5" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel5" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony6">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie6" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie6" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko6" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko6" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel6" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel6" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony7">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie7" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie7" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko7" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko7" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel7" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel7" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony8">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie8" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie8" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="naziwsko8" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko8" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel8" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel8" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony9">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie9" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie9" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="naziwsko9" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko9" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel9" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel9" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" Style="margin-left: 0px" ID="panelUbezpieczony10">
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="imie10" runat="server" font-size="10" Text="imię:"></asp:Label>&nbsp
                        <asp:Label ID="lbImie10" runat="server" Text="imie"></asp:Label>&nbsp
                        <asp:Label ID="nazwisko10" runat="server" font-size="10" Text="nazwisko:"></asp:Label>&nbsp
                        <asp:Label ID="lbNazwisko10" runat="server" Text="nazwisko"></asp:Label>&nbsp
                        <asp:Label ID="pesel10" runat="server" font-size="10" Text="pesel:"></asp:Label>&nbsp
                        <asp:Label ID="lbPesel10" runat="server" Text="pesel"></asp:Label><br />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:Panel>
            <table  style="width: 100%; background-color: #8ec9e0;">
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Do zapłaty "></asp:Label>
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
        
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MasterStopka" runat="server">
</asp:Content>
