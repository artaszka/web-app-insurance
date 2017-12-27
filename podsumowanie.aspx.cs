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
    public partial class podsumowanie : System.Web.UI.Page
    {
        string pesel;
        string weryfikacja;
        string box;
        string info;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["coubezpieczone"]!=null)
                {
                    lbadresubezpieczenia.Text = (Session["kodu"].ToString() + " " + Session["miastou"].ToString() + ", " + Session["ulicau"].ToString() + " ");
                    tbKodpocztowy.Text = Session["kodu"].ToString();
                    tbUlica.Text = Session["ulicau"].ToString();
                    tbMiasto.Text = Session["miastou"].ToString();
                    lbJakieubezpieczenie.Text = Session["coubezpieczone"].ToString();
                }
                else
                    Response.Redirect("~/default.aspx"); 
            }
            catch
            { }
        }

        protected void chkAdrestensam_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAdrestensam.Checked == true)
            {
                Panel_innyadres.Visible = false;
                Panel_tensamadres.Visible = true;
                tbNumerdomu.Enabled = false;
                tbNumerlokalu.Enabled = false;
            }
            else
            {
                Panel_tensamadres.Visible = false;
                Panel_innyadres.Visible = true;
                tbNumerdomu.Enabled = true;
                tbNumerlokalu.Enabled = true;
            }
        }

        protected void chkCzytensam_CheckedChanged(object sender, EventArgs e)
        {
            if (chkCzytensam.Checked == true)
            {
                panelDanewlasciciela.Visible = false;
            }
            else
                panelDanewlasciciela.Visible = true;
        }

        protected void btnPodsumowanie_Click(object sender, EventArgs e)
        {
            try
            {
                Session["nrdomuubezp"] = tbNumerdomu0.Text;
                Session["nrmieszkaniaubezp"] = tbNumerlokalu0.Text;
                Session["coubezpieczone"] = lbJakieubezpieczenie.Text;
                Session["imie"] = tbImie.Text;
                Session["nazwisko"] = tbNazwisko.Text;
                Session["pesel"] = tbPesel.Text;
                Session["telefon"] = tbTelefon.Text;
                Session["email"] = tbEmail.Text;
                Session["nrdomu"] = tbNumerdomu.Text;
                Session["nrmieszkania"] = tbNumerlokalu.Text;

                if (chkCzytensam.Checked == true)
                {
                    if (chkAdrestensam.Checked == true)
                    {
                        Session["kod"] = tbKodpocztowy.Text;
                        Session["ulica"] = tbUlica.Text;
                        Session["miasto"] = tbMiasto.Text;
                        Session["kod2"] = tbKodpocztowy.Text;
                        Session["ulica2"] = tbUlica.Text;
                        Session["miasto2"] = tbMiasto.Text;
                    }
                    else
                    {
                        Session["kod"] = tbKod1.Text;
                        Session["ulica"] = (frmInnyadres.Row.FindControl("fvlbUlica") as TextBox).Text;
                        Session["miasto"] = (frmInnyadres.Row.FindControl("fvlbMiasto") as TextBox).Text;
                        Session["kod2"] = tbKod1.Text;
                        Session["ulica2"] = (frmInnyadres.Row.FindControl("fvlbUlica") as TextBox).Text;
                        Session["miasto2"] = (frmInnyadres.Row.FindControl("fvlbMiasto") as TextBox).Text;
                    }
                    Session["imie2"] = tbImie.Text;
                    Session["nazwisko2"] = tbNazwisko.Text;
                    Session["pesel2"] = tbPesel.Text;
                    Session["telefon2"] = tbTelefon.Text;
                    Session["email2"] = tbEmail.Text;
                    Session["nrdomu2"] = tbNumerdomu.Text;
                    Session["nrmieszkania2"] = tbNumerlokalu.Text;
                }
                else
                {
                     if (chkAdrestensam.Checked == true)
                    {
                        Session["kod"] = tbKodpocztowy.Text;
                        Session["ulica"] = tbUlica.Text;
                        Session["miasto"] = tbMiasto.Text;
                        Session["kod2"] = tbKod2.Text;
                        Session["ulica2"] = (frmUlica.Row.FindControl("fvlbUlica") as TextBox).Text;
                        Session["miasto2"] = (frmUlica.Row.FindControl("fvlbMiasto") as TextBox).Text;
                    }
                    else
                    {
                        Session["kod"] = tbKod1.Text;
                        Session["ulica"] = (frmInnyadres.Row.FindControl("fvlbUlica") as TextBox).Text;
                        Session["miasto"] = (frmInnyadres.Row.FindControl("fvlbMiasto") as TextBox).Text;
                        Session["kod2"] = tbKod1.Text;
                        Session["ulica2"] = (frmUlica.Row.FindControl("fvlbUlica") as TextBox).Text;
                        Session["miasto2"] = (frmUlica.Row.FindControl("fvlbMiasto") as TextBox).Text;
                    }
                    Session["imie2"] = tbImie2.Text;
                    Session["nazwisko2"] = tbNazwisko2.Text;
                    Session["pesel2"] = tbPesel2.Text;
                    Session["telefon2"] = tbTelefon2.Text;
                    Session["email2"] = tbEmail2.Text;
                    Session["nrdomu2"] = tbNrdomu2.Text;
                    Session["nrmieszkania2"] = tbNrlokalu2.Text;
                }
                Response.Redirect("~/podsumowanie2.aspx");
            }
            catch
            {  }
        }

        protected void tbKod2_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (tbKodpocztowy.Text.Length == 6 & tbKodpocztowy.Text[2] == '-')
                {
                    frmUlica.Visible = true;
                }
            }
            catch
            {
                frmUlica.Visible = false;
            }
        }
        protected void btnPage_Click(object sender, EventArgs e)
        {
            DropDownList ddlLista = (DropDownList)frmUlica.BottomPagerRow.Cells[0].FindControl("ddlLista");
            frmUlica.PageIndex = ddlLista.SelectedIndex;
        }

        protected void btnPage_Click1(object sender, EventArgs e)
        {
            DropDownList ddlLista = (DropDownList)frmInnyadres.BottomPagerRow.Cells[0].FindControl("ddlLista");
            frmInnyadres.PageIndex = ddlLista.SelectedIndex;
        }

        protected void tbKod1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (tbKodpocztowy.Text.Length == 6 & tbKodpocztowy.Text[2] == '-')
                {
                    frmInnyadres.Visible = true;
                    
                }
            }
            catch
            {
                frmInnyadres.Visible = false;
                

            }
        }

                

        protected void tbPesel_TextChanged(object sender, EventArgs e)
        {
                box = tbPesel.Text;
                walidacja_PESEL();
                tbPesel.Text = box;
                wynik1.ForeColor = System.Drawing.Color.Red;
                wynik1.Text = info;
        }

        protected void tbPesel2_TextChanged(object sender, EventArgs e)
        {
            box = tbPesel2.Text;
            walidacja_PESEL();
            wynik2.ForeColor = System.Drawing.Color.Red;
            tbPesel2.Text = box;
            wynik2.Text = info;
        }
        protected void frmInnyadres_DataBoundChanged(object sender, EventArgs e)
        {
            lbNiepoprawnykod1.Visible = false;
            int total = frmInnyadres.PageCount;
            if (Convert.ToString(total) == "0")
            {
                tbKod1.Focus();
                tbKod1.Attributes.Add("onfocusin", " select();");
                lbNiepoprawnykod1.Visible = true;

            }
        }
        protected void frmUlica_DataBoundChanged(object sender, EventArgs e)
        {
            lbNiepoprawnykod.Visible = false;
            int total = frmUlica.PageCount;
            if (Convert.ToString(total) == "0")
            {
                tbKod2.Focus();
                tbKod2.Attributes.Add("onfocusin", " select();");
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

                        pesel = ((10 - (((i1 * 1) + (i2 * 3) + (i3 * 7) + (i4 * 9) + (i5 * 1) + (i6 * 3)
                              + (i7 * 7) + (i8 * 9) + (i9 * 1) + (i10 * 3)) % 10))%10).ToString();
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

        protected void tbNumerdomu0_TextChanged(object sender, EventArgs e)
        {
            tbNumerdomu.Text = tbNumerdomu0.Text;
            tbNumerlokalu.Text = tbNumerlokalu0.Text;
        }
    }
}