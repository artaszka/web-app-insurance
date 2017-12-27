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
    public partial class podrozne_dane : System.Web.UI.Page
    {
        string pesel;
        string weryfikacja;
        string box;
        string info;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int liczbaubezp = Convert.ToInt32(Session["liczbaubezp"]);
            lbLiczbaubezp.Text = Convert.ToString(liczbaubezp)+" osób";
            try
            {
                if (liczbaubezp >= 2)
                {
                    panelDaneUbezpieczonego2.Visible = true;
                }
                else
                    panelDaneUbezpieczonego2.Visible = false;
                if (liczbaubezp >= 3)
                {
                    panelDaneUbezpieczonego3.Visible = true;
                }
                else
                    panelDaneUbezpieczonego3.Visible = false;
                if (liczbaubezp >= 4)
                {
                    panelDaneUbezpieczonego4.Visible = true;
                }
                else
                    panelDaneUbezpieczonego4.Visible = false;
                if (liczbaubezp >= 5)
                {
                    panelDaneUbezpieczonego5.Visible = true;
                }
                else
                    panelDaneUbezpieczonego5.Visible = false;
                if (liczbaubezp >= 6)
                {
                    panelDaneUbezpieczonego6.Visible = true;
                }
                else
                    panelDaneUbezpieczonego6.Visible = false;
                if (liczbaubezp >= 7)
                {
                    panelDaneUbezpieczonego7.Visible = true;
                }
                else
                    panelDaneUbezpieczonego7.Visible = false;
                if (liczbaubezp >= 8)
                {
                    panelDaneUbezpieczonego8.Visible = true;
                }
                else
                    panelDaneUbezpieczonego8.Visible = false;
                if (liczbaubezp >= 9)
                {
                    panelDaneUbezpieczonego9.Visible = true;
                }
                else
                    panelDaneUbezpieczonego9.Visible = false;
                if (liczbaubezp >= 10)
                {
                    panelDaneUbezpieczonego10.Visible = true;
                }
                else
                    panelDaneUbezpieczonego10.Visible = false;
                    lbJakieubezpieczenie.Text = "Ubezpieczenie podróżne " + Session["formaubezp"].ToString() + ", pakiet " + Session["wariantpolisy"];
            }
            catch
            {
                Response.Redirect("~/default.aspx");
            }
        }

        protected void chkCzytensam_CheckedChanged(object sender, EventArgs e)
        {
            if (chkCzytensam.Checked == true)
            {
                panelDaneUbezpieczonego1.Enabled = false;
                tbImie1.Text = tbImie.Text;
                tbNazwisko1.Text = tbNazwisko.Text;
                tbPesel1.Text = tbPesel.Text;
            }
            else
            {
                panelDaneUbezpieczonego1.Enabled = true;
                tbImie1.Text = "";
                tbNazwisko1.Text = "";
                tbPesel1.Text = "";
            }
        }

        protected void btnPodsumowanie_Click(object sender, EventArgs e)
        {
            try
            {
                Session["coubezpieczone"] = lbJakieubezpieczenie.Text;
                Session["imie"] = tbImie.Text;
                Session["nazwisko"] = tbNazwisko.Text;
                Session["pesel"] = tbPesel.Text;
                Session["telefon"] = tbTelefon.Text;
                Session["email"] = tbEmail.Text;
                Session["nrdomu"] = tbNumerdomu.Text;
                Session["nrmieszkania"] = tbNumerlokalu.Text;
                Session["kod"] = tbKod1.Text;
                Session["ulica"] = (frmUlica.Row.FindControl("fvlbUlica") as TextBox).Text;
                Session["miasto"] = (frmUlica.Row.FindControl("fvlbMiasto") as TextBox).Text;
                
                if (chkCzytensam.Checked == true)
                {
                    Session["imie1"] = tbImie.Text;
                    Session["nazwisko1"] = tbNazwisko.Text;
                    Session["pesel1"] = tbPesel.Text;
                }
                else
                {
                    Session["imie1"] = tbImie1.Text;
                    Session["nazwisko1"] = tbNazwisko1.Text;
                    Session["pesel1"] = tbPesel1.Text;
                }
                if (panelDaneUbezpieczonego2.Visible == true)
                {
                    Session["imie2"] = tbImie2.Text;
                    Session["nazwisko2"] = tbNazwisko2.Text;
                    Session["pesel2"] = tbPesel2.Text;
                }
                if (panelDaneUbezpieczonego3.Visible == true)
                {
                    Session["imie3"] = tbImie3.Text;
                    Session["nazwisko3"] = tbNazwisko3.Text;
                    Session["pesel3"] = tbPesel3.Text;
                }
                if (panelDaneUbezpieczonego4.Visible == true)
                {
                    Session["imie4"] = tbImie4.Text;
                    Session["nazwisko4"] = tbNazwisko4.Text;
                    Session["pesel4"] = tbPesel4.Text;
                }
                if (panelDaneUbezpieczonego5.Visible == true)
                {
                    Session["imie5"] = tbImie5.Text;
                    Session["nazwisko5"] = tbNazwisko5.Text;
                    Session["pesel5"] = tbPesel5.Text;
                }
                if (panelDaneUbezpieczonego6.Visible == true)
                {
                    Session["imie6"] = tbImie6.Text;
                    Session["nazwisko6"] = tbNazwisko6.Text;
                    Session["pesel6"] = tbPesel6.Text;
                }
                if (panelDaneUbezpieczonego7.Visible == true)
                {
                    Session["imie7"] = tbImie7.Text;
                    Session["nazwisko7"] = tbNazwisko7.Text;
                    Session["pesel7"] = tbPesel7.Text;
                }
                if (panelDaneUbezpieczonego8.Visible == true)
                {
                    Session["imie8"] = tbImie8.Text;
                    Session["nazwisko8"] = tbNazwisko8.Text;
                    Session["pesel8"] = tbPesel8.Text;
                }
                if (panelDaneUbezpieczonego9.Visible == true)
                {
                    Session["imie9"] = tbImie9.Text;
                    Session["nazwisko9"] = tbNazwisko9.Text;
                    Session["pesel9"] = tbPesel9.Text;
                }
                if (panelDaneUbezpieczonego10.Visible == true)
                {
                    Session["imie10"] = tbImie10.Text;
                    Session["nazwisko10"] = tbNazwisko10.Text;
                    Session["pesel10"] = tbPesel10.Text;
                }
                Response.Redirect("~/podrozne_podsumowanie.aspx");
            }
            catch
            {  }
        }

        protected void btnPage_Click1(object sender, EventArgs e)
        {
            DropDownList ddlLista = (DropDownList)frmUlica.BottomPagerRow.Cells[0].FindControl("ddlLista");
            frmUlica.PageIndex = ddlLista.SelectedIndex;
        }

        protected void tbKod1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (tbKod1.Text.Length == 6 & tbKod1.Text[2] == '-')
                {
                    frmUlica.Visible = true;
                }
            }
            catch
            {
                frmUlica.Visible = false;
            }
        }

        protected void tbPesel_TextChanged(object sender, EventArgs e)
        {
                box = tbPesel.Text;
                walidacja_PESEL();
                tbPesel.Text = box;
                lbWynik.ForeColor = System.Drawing.Color.Red;
                lbWynik.Text = info;
                if (chkCzytensam.Checked == true)
                {
                    tbPesel1.Text = tbPesel.Text;
                }
                else
                {}
        }

        protected void tbPesel1_TextChanged(object sender, EventArgs e)
        {

            box = tbPesel1.Text;
            walidacja_PESEL();
            lbWynik1.ForeColor = System.Drawing.Color.Red;
            tbPesel1.Text = box;
            lbWynik1.Text = info;
        }
        protected void tbPesel2_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel2.Text;
            walidacja_PESEL();
            lbWynik2.ForeColor = System.Drawing.Color.Red;
            tbPesel2.Text = box;
            lbWynik2.Text = info;
        }
        protected void tbPesel3_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel3.Text;
            walidacja_PESEL();
            lbWynik3.ForeColor = System.Drawing.Color.Red;
            tbPesel3.Text = box;
            lbWynik3.Text = info;
        }
        protected void tbPesel4_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel4.Text;
            walidacja_PESEL();
            lbWynik4.ForeColor = System.Drawing.Color.Red;
            tbPesel4.Text = box;
            lbWynik4.Text = info;
        }
        protected void tbPesel5_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel5.Text;
            walidacja_PESEL();
            lbWynik5.ForeColor = System.Drawing.Color.Red;
            tbPesel5.Text = box;
            lbWynik5.Text = info;
        }
        protected void tbPesel6_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel6.Text;
            walidacja_PESEL();
            lbWynik6.ForeColor = System.Drawing.Color.Red;
            tbPesel6.Text = box;
            lbWynik6.Text = info;
        }
        protected void tbPesel7_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel7.Text;
            walidacja_PESEL();
            lbWynik7.ForeColor = System.Drawing.Color.Red;
            tbPesel7.Text = box;
            lbWynik7.Text = info;
        }
        protected void tbPesel8_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel8.Text;
            walidacja_PESEL();
            lbWynik8.ForeColor = System.Drawing.Color.Red;
            tbPesel8.Text = box;
            lbWynik8.Text = info;
        }
        protected void tbPesel9_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel9.Text;
            walidacja_PESEL();
            lbWynik9.ForeColor = System.Drawing.Color.Red;
            tbPesel9.Text = box;
            lbWynik9.Text = info;
        }
        protected void tbPesel10_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel10.Text;
            walidacja_PESEL();
            lbWynik10.ForeColor = System.Drawing.Color.Red;
            tbPesel10.Text = box;
            lbWynik10.Text = info;
        }
        protected void frmUlica_DataBoundChanged(object sender, EventArgs e)
        {
            lbNiepoprawnykod.Visible = false;
            int total = frmUlica.PageCount;
            if (Convert.ToString(total) == "0")
            {
                tbKod1.Focus();
                tbKod1.Attributes.Add("onfocusin", " select();");
                lbNiepoprawnykod.Visible = true;
                
            }
        }

        public void walidacja_PESEL ()
        {
            if (box != "")
            {
                //kod walidacji peselu
                try
                {
                    string temp = box;
                    char[] tablica = temp.ToCharArray();
                    foreach (int liczba in temp)
                    {
                        int i1 = int.Parse(Convert.ToString(tablica[0]));
                        int i2 = int.Parse(Convert.ToString(tablica[1]));
                        int i3 = int.Parse(Convert.ToString(tablica[2]));
                        int i4 = int.Parse(Convert.ToString(tablica[3]));
                        int i5 = int.Parse(Convert.ToString(tablica[4]));
                        int i6 = int.Parse(Convert.ToString(tablica[5]));
                        int i7 = int.Parse(Convert.ToString(tablica[6]));
                        int i8 = int.Parse(Convert.ToString(tablica[7]));
                        int i9 = int.Parse(Convert.ToString(tablica[8]));
                        int i10 = int.Parse(Convert.ToString(tablica[9]));
                        int i11 = int.Parse(Convert.ToString(tablica[10]));

                        pesel = ((10 - (((i1 * 1) + (i2 * 3) + (i3 * 7) + (i4 * 9)
                            + (i5 * 1) + (i6 * 3) + (i7 * 7) + (i8 * 9) + (i9 * 1)
                            + (i10 * 3)) % 10)) % 10).ToString();
                        weryfikacja = Convert.ToString(i11);
                        
                        if (pesel == weryfikacja & i5<4)
                        {
                            info = "ok";
                        }
                        else
                        {
                            info = "Błędny numer PESEL!";
                            box = "";
                        }
                    }
                }
                catch
                {
                    info = "Błędny numer PESEL!";
                    box = "";
                }
            }
        }
    }
}