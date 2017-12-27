using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubezpieczenie
{
    public partial class podrozne : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Tb_dataWyjazdu.Attributes["onclick"] = "wyswietlKalendarz(this.id)";
            Tb_dataPowrotu.Attributes["onclick"] = "wyswietlKalendarz2(this.id)";

            if (!IsPostBack)
            {
                WyliczSkladke.Enabled = false;
            }
            CompareValidatorDataWyjazdu.ValueToCompare = DateTime.Now.ToString("d");

        }
         
        protected void calDataZdarzenia_SelectionChanged(object sender, EventArgs e)
        {
            Tb_dataWyjazdu.Text = calDataZdarzenia.SelectedDate.ToString("d");
            if (Tb_dataPowrotu.Text!=null)
            {
                Button1_Click(Tb_dataWyjazdu,e);
            }
        }
        protected void calDataZdarzenia2_SelectionChanged(object sender, EventArgs e)
        {
            Tb_dataPowrotu.Text = calDataZdarzenia2.SelectedDate.ToString("d");
            if (Tb_dataWyjazdu.Text != null)
            {
                Button1_Click(Tb_dataPowrotu, e);
            }
        }


       

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                Session["datawyjazdu"] = Tb_dataWyjazdu.Text;
                Session["datapowrotu"] = Tb_dataPowrotu.Text;

                DateTime date1 = DateTime.Parse(Tb_dataWyjazdu.Text);
                DateTime date2 = DateTime.Parse(Tb_dataPowrotu.Text);
                DateTime date3 = DateTime.Today;
                int dni = ((date2 - date1).Days +1);
                WyliczSkladke.Enabled = false;
            
            

            if (dni < 1)
            {
                lbInfo.Text = "Data Powrotu nie może być wcześniejsza od daty wyjazdu";
                tbIleDni.Text = "XX";
                lbSkladkaStandard.Text = "";
                lbSkladkaKomfort.Text = "";
                lbSkladkaPremium.Text = "";
            }
            else if (dni > 30)
            {
                lbInfo.Text = "Ubezpieczenie można zawrzeć maksymalnie na 30 dni";
                tbIleDni.Text = "XX";
                lbSkladkaStandard.Text = "";
                lbSkladkaKomfort.Text = "";
                lbSkladkaPremium.Text = "";
            }
            else if (date3 >= date1)
            {
                lbInfo.Text = "Ubezpieczenie możliwe najwcześniej od następnego dnia";
                tbIleDni.Text = "XX";
                lbSkladkaStandard.Text = "";
                lbSkladkaKomfort.Text = "";
                lbSkladkaPremium.Text = "";
            }
            else if (Convert.ToInt16(tbLiczbUbezp.Text) < 1)
            {
                lbInfo.Text = "Musisz podać liczbę ubezpieczonych";
                tbIleDni.Text = "XX";
                lbSkladkaStandard.Text = "";
                lbSkladkaKomfort.Text = "";
                lbSkladkaPremium.Text = "";
            }
            else
                
            {
                tbIleDni.Text = dni.ToString();
                WyliczSkladke.Enabled = true;
                lbInfo.Text = "";
                tbWybierzStandard.Enabled = true;
                tbWybierzKomfort.Enabled = true;
                tbWybierzPremium.Enabled = true;
            }
            }
            catch
            {
                lbInfo.Text = "Podaj daty";
                tbWybierzStandard.Enabled = false;
                tbWybierzKomfort.Enabled = false;
                tbWybierzPremium.Enabled = false;
                //Response.Redirect("~/podrozne.aspx");
            }
            try
            {
                double wynik, a, ks, nwwS, iledni, ockomf, bagazprem, asuper, skiplus, 
                    leczkomf, leczprem, wiekdo17, wiekdo70, wiekpowyzej70, znizkaforma=1;

            wiekdo17 = Convert.ToInt16(DD_024.SelectedValue);
            wiekdo70 = Convert.ToInt16(DD_2570.SelectedValue);
            wiekpowyzej70 = Convert.ToInt16(DD_71.SelectedIndex);
            
                //który button wybrany

            {
                if (RadioButton1.Checked) znizkaforma = 10;
                if (RadioButton2.Checked) znizkaforma = 9;
                if (RadioButton3.Checked) znizkaforma = 8;
            }
       

       ////

            if (this.cbASuper.Checked)
            {
                asuper = 10;
                Session["assistsuper"] = "Tak";
            }
            else
            {
                asuper = 0;
                Session["assistsuper"] = "-";
            }
            if (this.cbSkiPlus.Checked)
            {
                skiplus = 5;
                Session["skiplus"] = "Tak";
            }
            else
            {
                skiplus = 0;
                Session["skiplus"] = "-";
            }
            if (this.cbLeczenieKomfort.Checked)
            {
                leczkomf = 6;
                Session["leczenie"] = "Tak";
            }
            else
            {
                leczkomf = 0;
                Session["leczenie"] = "-";
            }
            if (this.cbLeczeniePremium.Checked)
            {
                leczprem = 6;
                Session["leczenie"] = "Tak";
            }
            else
            {
                leczprem = 0;
                Session["leczenie"] = "-";
            }
            ks = Convert.ToInt16(ddKosztyStandard.SelectedValue);
            nwwS = Convert.ToInt16(ddNwwStandard.SelectedValue);
            iledni = Convert.ToInt16(tbIleDni.Text.ToString());


            wynik = ((wiekdo17 + (wiekdo70 * 10 / 8) + (wiekpowyzej70 * 2)) * ((ks + nwwS) * iledni + 10)) * (znizkaforma/10);

            lbSkladkaStandard.Text = Convert.ToString(wynik);
            lbInfo2.Text = Convert.ToString(znizkaforma);


            ks = Convert.ToDouble(ddKosztyKomfort.SelectedValue);
            nwwS = Convert.ToDouble(ddNwwKomfort.SelectedValue);
            iledni = Convert.ToInt16(tbIleDni.Text.ToString()); 
            ockomf = Convert.ToDouble(ddOcKomfort.SelectedValue);
            bagazprem = Convert.ToDouble(ddBagażKomfort.SelectedValue);
            wynik = ((wiekdo17 + (wiekdo70 * 10 / 8) + (wiekpowyzej70 * 2)) * (ks + nwwS + ockomf + bagazprem + leczkomf) * iledni + 10) * (znizkaforma / 10);
            a = Math.Ceiling(wynik);
            lbSkladkaKomfort.Text = Convert.ToString(a);
            
            
            ks = Convert.ToDouble(ddKosztyPremium.SelectedValue);
            nwwS = Convert.ToDouble(ddNwwPremium.SelectedValue);
            iledni = Convert.ToInt16(tbIleDni.Text.ToString()); 
            ockomf = Convert.ToDouble(ddOcPremium.SelectedValue);
            bagazprem = Convert.ToDouble(ddBagażPremium.SelectedValue);
            wynik = ((wiekdo17 + (wiekdo70 * 10 / 8) + (wiekpowyzej70 * 2)) * (ks + nwwS + ockomf + bagazprem + asuper + skiplus + leczprem) * iledni + 10) * (znizkaforma / 10);
            a = Math.Ceiling(wynik);
            lbSkladkaPremium.Text = Convert.ToString(a);
   
            }
            catch
            { }
            
        }

        protected void przelicz(object sender, EventArgs e)
        {
            double wiekdo17, wiekdo70, wiekpowyzej70, liczbubezp;

            wiekdo17 = Convert.ToInt16(DD_024.SelectedValue);
            wiekdo70 = Convert.ToInt16(DD_2570.SelectedValue);
            wiekpowyzej70 = Convert.ToInt16(DD_71.SelectedIndex);
            //sumuje wszystkich ubezpieczonych
            liczbubezp = (wiekdo17 + wiekdo70 + wiekpowyzej70);
            tbLiczbUbezp.Text = liczbubezp.ToString();

            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;

            //sprawdzam jaka forma ubezpieczenia i czy nie przekracza max liczby osób
            //dla indywidualnej
            if (liczbubezp < 11 & liczbubezp > 0 )
            {
                if (wiekdo17 < 6 & wiekdo70 < 6 & wiekpowyzej70 < 6 & liczbubezp < 6 & liczbubezp > 0)
                {
                    RadioButton1.Checked = true;
                    WyliczSkladke.Enabled = true;
                    Session["formaubezp"] = "Indywidualne";
                    lbInfo.Text = "";
                }
            
                //dla rodzinnej

                if (wiekdo17 > 0 & wiekdo70 > 1 & liczbubezp > 2 & liczbubezp < 6)
                {
                    RadioButton1.Checked = false;
                    RadioButton2.Checked = true;
                    WyliczSkladke.Enabled = true;
                    Session["formaubezp"] = "Rodzinne";
                    lbInfo.Text = "";
                }
            
                //dla grupowej

                if (liczbubezp > 5)
                {
                    RadioButton3.Checked = true;
                    WyliczSkladke.Enabled = true;
                    Session["formaubezp"] = "Grupowe";
                    lbInfo.Text = "";
                
                }
                Tb_dataWyjazdu.Enabled = true;
                Tb_dataPowrotu.Enabled = true;
                Session["liczbaubezp"] = tbLiczbUbezp.Text;
                Button1_Click(WyliczSkladke, e);
            }
            else
            {
                RadioButton1.Checked = false;
                RadioButton2.Checked = false;
                RadioButton3.Checked = false;
                WyliczSkladke.Enabled = false;
                tbWybierzStandard.Enabled = false;
                tbWybierzKomfort.Enabled = false;
                tbWybierzPremium.Enabled = false;
                lbSkladkaKomfort.Text = "";
                lbSkladkaPremium.Text = "";
                lbSkladkaStandard.Text = "";

                lbInfo.Text = "Wybierz od 1 do 10 ubezpieczonych";
            }
            
            
           
        }

        protected void tbWybierzStandard_Click(object sender, EventArgs e)
        {
            Session["wariantpolisy"] = "Standard";
            Session["kosztyleczenia"] = ddKosztyStandard.SelectedItem;
            Session["nww"] = ddNwwStandard.SelectedItem;
            Session["suma"] = lbSkladkaStandard.Text;
            Session["assistsuper"] = "-";
            Session["OC"] = "-";
            Session["bagaz"] = "-";
            Session["skiplus"] = "-";
            Session["ratownictwo"] = "Tak";
            Session["leczenie"] = "-";
            Response.Redirect("~/podrozne_dane.aspx");
        }

        protected void tbWybierzKomfort_Click(object sender, EventArgs e)
        {
            Session["wariantpolisy"] = "Komfort";
            Session["kosztyleczenia"] = ddKosztyKomfort.SelectedItem;
            Session["nww"] = ddNwwKomfort.SelectedItem;
            Session["OC"] = ddOcKomfort.SelectedItem;
            Session["bagaz"] = ddBagażKomfort.SelectedItem;
            Session["suma"] = lbSkladkaKomfort.Text;
            Session["assistsuper"] = "-";
            Session["skiplus"] = "-";
            Session["ratownictwo"] = "Tak";
            Response.Redirect("~/podrozne_dane.aspx");
        }

        protected void tbWybierzPremium_Click(object sender, EventArgs e)
        {
            Session["wariantpolisy"] = "Premium";
            Session["kosztyleczenia"] = ddKosztyPremium.SelectedItem;
            Session["nww"] = ddNwwPremium.SelectedItem;
            Session["OC"] = ddOcPremium.SelectedItem;
            Session["bagaz"] = ddBagażPremium.SelectedItem;
            Session["suma"] = lbSkladkaPremium.Text;
            Session["ratownictwo"] = "Tak";
            Response.Redirect("~/podrozne_dane.aspx");
            
            
        }
    }
}