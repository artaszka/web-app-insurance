using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace ubezpieczenie
{
    public partial class mieszkanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            CompareValidatorDataUbezpieczenia.ValueToCompare = DateTime.Now.ToString("d");
            lbDataTeraz.Text = DateTime.Today.ToShortDateString();
            
            tbTerminUbezp.Attributes["onclick"] = "wyswietlKalendarz(this.id)";
        } 
        protected void calDataZdarzenia_SelectionChanged(object sender, EventArgs e)
        {
            tbWartosc.Text = "";
            tbTerminUbezp.Text = calDataZdarzenia.SelectedDate.ToString("d");
        }

        
//Wybór ubezpieczenia domu lub mieszkania
        protected void RbCoubezpieczyc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                switch (rbCoubezpieczyc.SelectedItem.Value)
                {
                    case "Dom":
                        lbCoubezpieczone.Text = "Wybrałeś ubezpieczenie domu";
                        PanelMieszkanie.Visible = false;
                        PanelDom.Visible = true;
                        Ppodstawowy.Visible = false;
                        rbRodzajMieszkania.SelectedIndex = -1;
                        ImageDom.ImageUrl = "~/Obrazki/domikona.png";
                        break;
                    case "Mieszkanie":
                        lbCoubezpieczone.Text = "Wybrałeś ubezpieczenie mieszkania";
                        PanelMieszkanie.Visible = true;
                        PanelDom.Visible = false;
                        Ppodstawowy.Visible = false;
                        rbRodzajDomu.SelectedIndex = -1;
                        ImageDom.ImageUrl = "~/Obrazki/budynekikona.png";
                        break;

                    default:
                        lbCoubezpieczone.Text = "nic nie wybrano";
                        break;
                }
            }
        }


//Wybór rodzaju lokalu 
        protected void rbJakiObiektiStan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                try
                {
                    lbCoUbezpieczyc.Visible = false;
                    switch (rbRodzajDomu.SelectedItem.Value)
                    {
                        case "1":
                            Ppodstawowy.Visible = true;
                            RodzajBudynku.Enabled = false;
                            rbZamieszkany.SelectedValue = null;
                            rbZamieszkany.Visible = true;
                            Label22.Visible = true;
                            break;

                        case "2":
                            Ppodstawowy.Visible = true;
                            lbCoubezpieczone.Text = "Wybrałeś ubezpieczenie domu w budowie";
                            RodzajBudynku.Enabled = false;
                            rbZamieszkany.SelectedValue = "nie";
                            rbZamieszkany.Visible = false;
                            Label22.Visible = false;
                            break;
                        default:
                            break;
                    }
                }
                catch { }
                
                try
                {
                    switch (rbRodzajMieszkania.SelectedItem.Value)
                    {
                        case "3":
                            Ppodstawowy.Visible = true;
                            RodzajBudynku.Enabled = false;
                            rbZamieszkany.SelectedValue = null;
                            rbZamieszkany.Visible = true;
                            Label22.Visible = true;
                            break;

                        case "4":
                            Ppodstawowy.Visible = true;
                            lbCoubezpieczone.Text = "Wybrałeś ubezpieczenie mieszkania w budowie";
                            RodzajBudynku.Enabled = false;
                            rbZamieszkany.SelectedValue = "nie";
                            rbZamieszkany.Visible = false;
                            Label22.Visible = false;
                            break;

                        default:
                            break;
                    }
                }
                catch { }
            }
            else
            {
                PanelLokal.Visible = false;
                PanelRuchomosci.Visible = false;
                PanelGaraz.Visible = false;
                PanelOgrodzenie.Visible = false;
                PanelInnyBudynek.Visible = false;
                PanelRyzyka.Visible = false;
                lbCoUbezpieczyc.Visible = true;
            }
        }

        protected void tbWartosc_TextChanged(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    switch (rbRodzajDomu.SelectedItem.Value)
                    {
                        case "1":
                            Ppodstawowy.Enabled = false;
                            PanelLokal.Visible = true;
                            PanelRuchomosci.Visible = true;
                            PanelGaraz.Visible = true;
                            PanelOgrodzenie.Visible = true;
                            PanelInnyBudynek.Visible = true;
                            PanelRyzyka.Visible = true;
                            RodzajBudynku.Visible = false;
                            btnPodsumowanie.Visible = true;
                            Label2.Text = "WARTOŚĆ DOMU JEDNORODZINNEGO";
                            break;

                        case "2":
                            Ppodstawowy.Enabled = false;
                            PanelLokal.Visible = true;
                            PanelRuchomosci.Visible = false;
                            PanelGaraz.Visible = true;
                            PanelOgrodzenie.Visible = false;
                            PanelInnyBudynek.Visible = false;
                            PanelRyzyka.Visible = true;
                            RodzajBudynku.Visible = false;
                            btnPodsumowanie.Visible = true;
                            Label2.Text = "WARTOŚĆ DOMU JEDNORODZINNEGO";
                            break;

                        default:
                            break;
                    }
                }
                catch
                {
                }
                try
                {
                    switch (rbRodzajMieszkania.SelectedItem.Value)
                    {
                        case "3":
                            Ppodstawowy.Enabled = false;
                            PanelLokal.Visible = true;
                            PanelRuchomosci.Visible = true;
                            PanelGaraz.Visible = true;
                            PanelOgrodzenie.Visible = false;
                            PanelInnyBudynek.Visible = false;
                            PanelRyzyka.Visible = true;
                            RodzajBudynku.Visible = false;
                            btnPodsumowanie.Visible = true;
                            Label2.Text = "WARTOŚĆ MIESZKANIA";
                            break;

                        case "4":
                            Ppodstawowy.Enabled = false;
                            PanelLokal.Visible = true;
                            PanelRuchomosci.Visible = false;
                            PanelGaraz.Visible = false;
                            PanelOgrodzenie.Visible = false;
                            PanelInnyBudynek.Visible = false;
                            PanelRyzyka.Visible = true;
                            RodzajBudynku.Visible = false;
                            btnPodsumowanie.Visible = true;
                            Label2.Text = "WARTOŚĆ MIESZKANIA";
                            break;

                        default:
                            break;
                    }
                }
                catch { }
                
                try
                {
                    tbLokalLosowe.Text = tbWartosc.Text;

                    long wartosc = Convert.ToInt32(tbWartosc.Text);
                    if (Convert.ToInt32(wartosc * 3 / 100) < 1000)
                        tbLokalKradziez.Text = Convert.ToString(1000);
                    else
                        tbLokalKradziez.Text = Convert.ToString(wartosc * 3 / 100);

                    if (Convert.ToInt32(wartosc * 35 / 1000) < 1000)
                        tbRuchomosciKradziez.Text = Convert.ToString(1000);
                    else
                        tbRuchomosciKradziez.Text = Convert.ToString(wartosc * 35 / 1000);
                    
                    tbRuchomosciLosowe.Text = Convert.ToString(wartosc / 10);
                    if (Convert.ToInt32(tbRuchomosciLosowe.Text) > 50000)
                    {
                        tbRuchomosciLosowe.Text = "50000";
                    }
                    long lokallosowe = Convert.ToInt32(tbLokalLosowe.Text);
                    if (lokallosowe > 64000)
                        lbCenazalokallosowe.Text = Convert.ToString((lokallosowe - 64000) / 1100 + 50);
                    else
                        lbCenazalokallosowe.Text = "50";
                    if (Convert.ToInt32(tbLokalKradziez.Text) > 8000)
                        lbCenazalokalkradziez.Text = Convert.ToString((Convert.ToInt32(tbLokalKradziez.Text) - 8000) / 800 + 10);
                    else
                        lbCenazalokalkradziez.Text = "10";
                    if (PanelRuchomosci.Visible == true)
                    {
                        if (Convert.ToInt32(tbRuchomosciLosowe.Text) > 7000)
                            lbCenaRuchLos.Text = Convert.ToString((Convert.ToInt32(tbRuchomosciLosowe.Text) - 7000) / 245 + 30);
                        else
                            lbCenaRuchLos.Text = "30";
                        if (Convert.ToInt32(tbRuchomosciKradziez.Text) > 2000)
                            lbCenaRuchKr.Text = Convert.ToString((Convert.ToInt32(tbRuchomosciKradziez.Text) - 2000) / 189 + 10);
                        else
                            lbCenaRuchKr.Text = "10";
                    }
                    else
                    {
                        lbCenaRuchLos.Text = "";
                        lbCenaRuchKr.Text = "";
                    }
                    wyliczanie_skladki(sender, e);
                }
                catch
                {
                }
            }
            else
            {
                if (rbZamieszkany.Visible == true)
                    rbZamieszkany.ClearSelection();
                else
                    rbZamieszkany.SelectedValue = "nie";
            }
        }
        protected void wyliczanie_skladki(object sender, EventArgs e)
        {
//Sprawdzanie, które ryzyka zaznaczone
            Session["lokallosowe"] = tbLokalLosowe.Text;
            if (boxLokalKradziez.Checked)
            {
                tbLokalKradziez.Enabled = true;
                tbLokalKradziez.Focus();
                pln2.Visible=true;
                RequiredFieldValidator3.Enabled = true;
                Session["lokalkradziez"] = tbLokalKradziez.Text;
            }
            else
            {
                tbLokalKradziez.Enabled = false;
                tbLokalKradziez.Text = "";
                lbCenazalokalkradziez.Text = "";
                pln2.Visible = false;
                RequiredFieldValidator3.Enabled = false;
                Session["lokalkradziez"] = null;
            }

            if (boxRuchomeLosowe.Checked)
            {
                tbRuchomosciLosowe.Enabled = true;
                tbRuchomosciLosowe.Focus();
                pln3.Visible = true;
                RequiredFieldValidator4.Enabled = true;
                Session["ruchomoscilosowe"] = tbRuchomosciLosowe.Text;
            }
            else
            {
                tbRuchomosciLosowe.Enabled = false;
                tbRuchomosciLosowe.Text = "";
                lbCenaRuchLos.Text = "";
                pln3.Visible = false;
                RequiredFieldValidator4.Enabled = false;
                Session["ruchomoscilosowe"] = null;
            }

            if (boxRuchomeKradziez.Checked)
            {
                tbRuchomosciKradziez.Enabled = true;
                tbRuchomosciKradziez.Focus();
                pln4.Visible = true;
                RequiredFieldValidator5.Enabled = true;
                Session["ruchomoscikradziez"] = tbRuchomosciKradziez.Text;
            }
            else
            {
                tbRuchomosciKradziez.Enabled = false;
                tbRuchomosciKradziez.Text = "";
                lbCenaRuchKr.Text = "";
                pln4.Visible = false;
                RequiredFieldValidator5.Enabled = false;
                Session["ruchomoscikradziez"] = null;
            }

            if (boxGarazLosowe.Checked)
            {
                tbGarazLosowe.Enabled = true;
                pln5.Visible = true;
                RequiredFieldValidator6.Enabled = true;
                Session["garazlosowe"] = tbGarazLosowe.Text;
            }
            else
            {
                tbGarazLosowe.Enabled = false;
                tbGarazLosowe.Text = "";
                lbCenaGarazLos.Text = "";
                pln5.Visible = false;
                RequiredFieldValidator6.Enabled = false;
                Session["garazlosowe"] = null;
            }

            if (boxGarazKradziez.Checked)
            {
                tbGarazKradziez.Enabled = true;
                pln6.Visible = true;
                RequiredFieldValidator7.Enabled = true;
                Session["garazkradziez"] = tbGarazKradziez.Text;
            }
            else
            {
                tbGarazKradziez.Enabled = false;
                tbGarazKradziez.Text = "";
                lbCenaGarazKr.Text = "";
                pln6.Visible = false;
                RequiredFieldValidator7.Enabled = false;
                Session["garazkradziez"] = null;
            }

            if (boxOgrodzenieLosowe.Checked)
            {
                tbOgrodzenieLosowe.Enabled = true;
                pln7.Visible = true;
                RequiredFieldValidator8.Enabled = true;
                Session["ogrodzenielosowe"] = tbOgrodzenieLosowe.Text;
            }
            else
            {
                tbOgrodzenieLosowe.Enabled = false;
                tbOgrodzenieLosowe.Text = "";
                lbCenaOgrodzLos.Text = "0";
                pln7.Visible = false;
                RequiredFieldValidator8.Enabled = false;
                Session["ogrodzenielosowe"] = null;
            }

            if (boxInnyLosowe.Checked)
            {
                tbInnyLosowe.Enabled = true;
                pln8.Visible = true;
                RequiredFieldValidator9.Enabled = true;
                Session["innylosowe"] = tbInnyLosowe.Text;
            }
            else
            {
                tbInnyLosowe.Enabled = false;
                tbInnyLosowe.Text = "";
                lbCenaInnyLos.Text = "0";
                pln8.Visible = false;
                RequiredFieldValidator9.Enabled = false;
                Session["innylosowe"] = null;
            }

            if (boxInnyKradziez.Checked)
            {
                tbInnyKradziez.Enabled = true;
                pln9.Visible = true;
                RequiredFieldValidator10.Enabled = true;
                Session["innykradziez"] = tbInnyKradziez.Text;
            }
            else
            {
                tbInnyKradziez.Enabled = false;
                tbInnyKradziez.Text = "";
                lbCenaInnyKr.Text = "0";
                pln9.Visible = false;
                RequiredFieldValidator10.Enabled = false;
                Session["innykradziez"] = null;
            }

            if (boxOC.Checked)
            {
                tbOC.Enabled = true;
                pln10.Visible = true;
                RequiredFieldValidator11.Enabled = true;
                Session["oc"] = tbOC.Text;
            }
            else
            {
                tbOC.Enabled = false;
                tbOC.Text = "";
                lbCenaOc.Text = "0";
                pln10.Visible = false;
                RequiredFieldValidator11.Enabled = false;
                Session["oc"] = null;
            }

            if (boxNnw.Checked)
            {
                tbNnw.Enabled = true;
                pln11.Visible = true;
                RequiredFieldValidator12.Enabled = true;
                Session["nnw"] = tbNnw.Text;
            }
            else
            {
                tbNnw.Enabled = false;
                tbNnw.Text = "";
                lbCenaNnw.Text = "0";
                pln11.Visible = false;
                RequiredFieldValidator12.Enabled = false;
                Session["nnw"] = null;
            }

            if (boxTorebka.Checked)
            {
                tbTorebka.Enabled = true;
                pln12.Visible = true;
                RequiredFieldValidator2.Enabled = true;
                Session["torebka"] = tbTorebka.Text;
            }
            else
            {
                tbTorebka.Enabled = false;
                tbTorebka.Text = "";
                lbCenaTorebka.Text = "0";
                pln12.Visible = false;
                RequiredFieldValidator2.Enabled = false;
                Session["torebka"] = null;
            }

            if (boxAssistance.Checked)
            {
                pln13.Visible = true;
                lbCenaAssist.Visible = true;
                lbCenaAssist.Text = "19";
                Session["assistance"] = "Assistance - Pomoc w domu ";
            }
            else
            {
                pln13.Visible = false;
                lbCenaAssist.Visible = false;
                lbCenaAssist.Text = "";
                Session["assistance"] = null;
            }
//Obliczanie ceny za każdą pozycję
            long lokallosowe = Convert.ToInt32(tbLokalLosowe.Text);
            if (lokallosowe > 66000)
                lbCenazalokallosowe.Text = Convert.ToString((lokallosowe - 66000) / 1613 + 50);
            else
                lbCenazalokallosowe.Text = "50";

            if (String.IsNullOrEmpty(tbLokalKradziez.Text))
                lbCenazalokalkradziez.Text = "";
            else
            {
                if (Convert.ToInt32(tbLokalKradziez.Text) > 8000)
                    lbCenazalokalkradziez.Text = Convert.ToString((Convert.ToInt32(tbLokalKradziez.Text) - 8000) / 800 + 10);
                else
                   lbCenazalokalkradziez.Text = "10";
            }

            if (PanelRuchomosci.Visible == true)
            {
                if (String.IsNullOrEmpty(tbRuchomosciLosowe.Text))
                    lbCenaRuchLos.Text = "";
                else
                {
                    if (Convert.ToInt32(tbRuchomosciLosowe.Text) > 7000)
                        lbCenaRuchLos.Text = Convert.ToString((Convert.ToInt32(tbRuchomosciLosowe.Text) - 7000) / 245 + 30);
                    else
                        lbCenaRuchLos.Text = "30";
                }

                if (String.IsNullOrEmpty(tbRuchomosciKradziez.Text))
                    lbCenaRuchKr.Text = "";
                else
                {
                    if (Convert.ToInt32(tbRuchomosciKradziez.Text) > 2000)
                        lbCenaRuchKr.Text = Convert.ToString((Convert.ToInt32(tbRuchomosciKradziez.Text) - 2000) / 189 + 10);
                    else
                        lbCenaRuchKr.Text = "10";
                }
            }
            else
            {
                lbCenaRuchLos.Text = "";
                lbCenaRuchKr.Text = "";
            }

            if (String.IsNullOrEmpty(tbGarazLosowe.Text))
                lbCenaGarazLos.Text = "";
            else
            {
                if (Convert.ToInt32(tbGarazLosowe.Text) > 31000)
                    lbCenaGarazLos.Text = Convert.ToString((Convert.ToInt32(tbGarazLosowe.Text) - 31000) / 1000 + 30);
                else
                    lbCenaGarazLos.Text = "30";
            }

            if (String.IsNullOrEmpty(tbGarazKradziez.Text))
                lbCenaGarazKr.Text = "";
            else
            {
                if (Convert.ToInt32(tbGarazKradziez.Text) > 8000)
                    lbCenaGarazKr.Text = Convert.ToString((Convert.ToInt32(tbGarazKradziez.Text) - 8000) / 750 + 10);
                else
                    lbCenaGarazKr.Text = "10";
            }

            if (String.IsNullOrEmpty(tbOgrodzenieLosowe.Text))
                lbCenaOgrodzLos.Text = "";
            else
            {
                if (Convert.ToInt32(tbOgrodzenieLosowe.Text) > 10000)
                    lbCenaOgrodzLos.Text = Convert.ToString((Convert.ToInt32(tbOgrodzenieLosowe.Text) - 10000) / 1026 + 10);
                else
                    lbCenaOgrodzLos.Text = "10";
            }

            if (String.IsNullOrEmpty(tbInnyLosowe.Text))
                lbCenaInnyLos.Text = "";
            else
            {
                if (Convert.ToInt32(tbInnyLosowe.Text) > 31000)
                    lbCenaInnyLos.Text = Convert.ToString((Convert.ToInt32(tbInnyLosowe.Text) - 31000) / 1015 + 30);
                else
                    lbCenaInnyLos.Text = "30";
            }

            if (String.IsNullOrEmpty(tbInnyKradziez.Text))
                lbCenaInnyKr.Text = "";
            else
            {
                if (Convert.ToInt32(tbInnyKradziez.Text) > 8000)
                    lbCenaInnyKr.Text = Convert.ToString((Convert.ToInt32(tbInnyKradziez.Text) - 8000) / 760 + 10);
                else
                    lbCenaInnyKr.Text = "10";
            }

            if (String.IsNullOrEmpty(tbOC.Text))
                lbCenaOc.Text = "";
            else
            {
                if (Convert.ToInt32(tbOC.Text) > 11000)
                    lbCenaOc.Text = Convert.ToString((Convert.ToInt32(tbOC.Text) - 11000) / 1114 + 10);
                else
                    lbCenaOc.Text = "10";
            }

            if (String.IsNullOrEmpty(tbNnw.Text))
                lbCenaNnw.Text = "";
            else
            {
                if (Convert.ToInt32(tbNnw.Text) > 1000)
                    lbCenaNnw.Text = Convert.ToString((Convert.ToInt32(tbNnw.Text) - 1000) / 111 + 10);
                else
                    lbCenaNnw.Text = "10";
            }

            if (String.IsNullOrEmpty(tbTorebka.Text))
                lbCenaTorebka.Text = "";
            else
            {
                if (Convert.ToInt32(tbTorebka.Text) > 200)
                    lbCenaTorebka.Text = Convert.ToString((Convert.ToInt32(tbTorebka.Text) - 200) / 29 + 10);
                else
                    lbCenaTorebka.Text = "10";
            }
//Obliczanie sumy wszystkich pozycji
            int cenazaloklos=0;
            int cenazalokkr = 0;
            int cenaruchlos=0;
            int cenaruchkr = 0;
            int cenagarazlos=0;
            int cenagarazkr=0;
            int cenaogrodz=0;
            int cenainnnylos=0;
            int cenainnykr=0;
            int cenaOC = 0;
            int cenannw = 0;
            int torebka = 0;
            int assistance = 0;
            int zamieszkany = 0;

            if (rbZamieszkany.SelectedValue == "nie")
            {
                lbznikza.Visible = false;
                lbCena.Visible = false;
                zamieszkany = 0;
                Session["zamieszkany"] = "Lokal nie jest zamieszkany na stałe";
            }

            else if (rbZamieszkany.SelectedValue == "tak")
            {
                lbznikza.Visible = true;
                lbCena.Visible = true;
                zamieszkany = 2;
                Session["zamieszkany"] = "Lokal jest zamieszkany na stałe";
            }
                
            try
            {
                cenazaloklos = (Convert.ToInt32(lbCenazalokallosowe.Text));
            }
            catch { }
            
            try
            {
                cenazalokkr = (Convert.ToInt32(lbCenazalokalkradziez.Text));
            }
            catch { }
            
            try
            {
                cenaruchlos = (Convert.ToInt32(lbCenaRuchLos.Text));
            }
            catch { }
            
            try
            {
                cenaruchkr = (Convert.ToInt32(lbCenaRuchKr.Text));
            }
            catch { }
            
            try
            {
                cenagarazlos = (Convert.ToInt32(lbCenaGarazLos.Text));
            }
            catch { }
            
            try
            {
                cenagarazkr = (Convert.ToInt32(lbCenaGarazKr.Text));
            }
            catch { }
            
            try
            {
                cenaogrodz = (Convert.ToInt32(lbCenaOgrodzLos.Text));
            }
            catch { }
            
            try
            {
                cenainnnylos = (Convert.ToInt32(lbCenaInnyLos.Text));
            }
            catch { }
           
            try
            {
                cenainnykr = (Convert.ToInt32(lbCenaInnyKr.Text));
            }
            catch { }

            try
            {
                cenaOC = (Convert.ToInt32(lbCenaOc.Text));
            }
            catch { }

            try
            {
                cenannw = (Convert.ToInt32(lbCenaNnw.Text));
            }
            catch { }

            try
            {
                torebka = (Convert.ToInt32(lbCenaTorebka.Text));
            }
            catch { }

            try
            {
                assistance = (Convert.ToInt32(lbCenaAssist.Text));
            }
            catch { }
            
            int cena = (cenazaloklos + cenazalokkr + cenaruchlos + cenaruchkr +
                cenagarazlos + cenagarazkr + cenaogrodz + cenainnnylos + cenainnykr + cenaOC + cenannw + torebka + assistance);

            lbCenaKoncowa.Text = Convert.ToString(cena -(cena * zamieszkany) / 100);
            //lbcenamaster.Text = Convert.ToString(cena - (cena * zamieszkany) / 100);
            lbCena.Text = Convert.ToString(cena);
            Session["cena"] = lbCenaKoncowa.Text;
        }   

        protected void btnPage_Click(object sender, EventArgs e)
        {
            DropDownList ddlLista = (DropDownList)frmUlica.BottomPagerRow.Cells[0].FindControl("ddlLista");
            frmUlica.PageIndex = ddlLista.SelectedIndex;
            lbUlica.Text= (frmUlica.Row.FindControl("fvlbUlica")as Label).Text;
            lbMiasto.Text = (frmUlica.Row.FindControl("fvlbMiasto") as Label).Text;
            string wybranemiasto = lbMiasto.Text;
            frmUlica.Row.Cells[0].FindControl("lbUlica");
        }

        protected void tbKodpocztowy_TextChanged(object sender, EventArgs e)
        {
            try 
            { 
                if (tbKodpocztowy.Text.Length==6 & tbKodpocztowy.Text[2] =='-')
                {
                    frmUlica.Visible = true;
                    tbWartosc.Enabled = true;
                    tbWartosc.Text = "";
                }
            }
            catch
            {

                frmUlica.Visible = false;
                tbWartosc.Enabled = false;
            }
        }

        protected void btnPodsumowanie_Click(object sender, EventArgs e)
        {
            lbUlica.Text = (frmUlica.Row.FindControl("fvlbUlica") as Label).Text;
            lbMiasto.Text = (frmUlica.Row.FindControl("fvlbMiasto") as Label).Text;
            Session["data"] = tbTerminUbezp.Text;
            Session["kodu"] = tbKodpocztowy.Text;
            Session["ulicau"] = lbUlica.Text;
            Session["miastou"] = lbMiasto.Text;
            Session["coubezpieczone"] = lbCoubezpieczone.Text;
            Response.Redirect("~/podsumowanie.aspx");
        }

        protected void frmUlica_DataBoundChanged(object sender, EventArgs e)
        {
            tbTerminUbezp.Enabled = true;
            tbWartosc.Enabled = true;
            lbNiepoprawnykod.Visible = false;
            int total = frmUlica.PageCount;
            if (Convert.ToString(total) == "0")
            {
                tbKodpocztowy.Focus();
                tbKodpocztowy.Attributes.Add("onfocusin", " select();");
                tbWartosc.Enabled = false;
                lbNiepoprawnykod.Visible = true;
                lbNiepoprawnykod.Text = "niepoprawny kod pocztowy";
            }
        }
    }
} 