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
using System.IO;

namespace ubezpieczenie
{
    public partial class podrozne_podsumowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["coubezpieczone"] != null)
                {
                    int liczbaubezp = Convert.ToInt32(Session["liczbaubezp"]);

                    lbJakieubezpieczenie.Text = Session["coubezpieczone"].ToString();
                    lbDataubezpieczenia.Text = Session["datawyjazdu"].ToString();
                    lbDatakoniec.Text = Session["datapowrotu"].ToString();
                    lbKosztyleczenia.Text = Session["kosztyleczenia"].ToString();
                    lbNww.Text = Session["nww"].ToString();
                    lbAssiststandard.Text = "Tak";
                    lbAssistsuper.Text = Session["assistsuper"].ToString();
                    lbOC.Text = Session["OC"].ToString();
                    lbBagaz.Text = Session["bagaz"].ToString();
                    lbSkiplus.Text = Session["skiplus"].ToString();
                    lbRatownictwo.Text = "Tak";
                    lbleczenie.Text = Session["leczenie"].ToString();
                    lbwartosc.Text = Session["suma"].ToString();
                    lbKodpocztowy.Text = Session["kod"].ToString();
                    lbUlica.Text = Session["ulica"].ToString();
                    lbMiasto.Text = Session["miasto"].ToString();
                    lbImie.Text = Session["imie"].ToString();
                    lbNazwisko.Text = Session["nazwisko"].ToString();
                    lbPesel.Text = Session["pesel"].ToString();
                    lbTelefon.Text = Session["telefon"].ToString();
                    lbEmail.Text = Session["email"].ToString();
                    lbNumerdomu.Text = Session["nrdomu"].ToString();
                    lbNumerlokalu.Text = Session["nrmieszkania"].ToString();
                    lbImie1.Text = Session["imie1"].ToString();
                    lbNazwisko1.Text = Session["nazwisko1"].ToString();
                    lbPesel1.Text = Session["pesel1"].ToString();



                    if (liczbaubezp >= 2)
                    {
                        panelUbezpieczony2.Visible = true;
                        lbImie2.Text = Session["imie2"].ToString();
                        lbNazwisko2.Text = Session["nazwisko2"].ToString();
                        lbPesel2.Text = Session["pesel2"].ToString();
                    }
                    else
                        panelUbezpieczony2.Visible = false;
                    if (liczbaubezp >= 3)
                    {
                        panelUbezpieczony3.Visible = true;
                        lbImie3.Text = Session["imie3"].ToString();
                        lbNazwisko3.Text = Session["nazwisko3"].ToString();
                        lbPesel3.Text = Session["pesel3"].ToString();
                    }
                    else
                        panelUbezpieczony3.Visible = false;
                    if (liczbaubezp >= 4)
                    {
                        panelUbezpieczony4.Visible = true;
                        lbImie4.Text = Session["imie4"].ToString();
                        lbNazwisko4.Text = Session["nazwisko4"].ToString();
                        lbPesel4.Text = Session["pesel4"].ToString();
                    }
                    else
                        panelUbezpieczony4.Visible = false;
                    if (liczbaubezp >= 5)
                    {
                        panelUbezpieczony5.Visible = true;
                        lbImie5.Text = Session["imie5"].ToString();
                        lbNazwisko5.Text = Session["nazwisko5"].ToString();
                        lbPesel5.Text = Session["pesel5"].ToString();
                    }
                    else
                        panelUbezpieczony5.Visible = false;
                    if (liczbaubezp >= 6)
                    {
                        panelUbezpieczony6.Visible = true;
                        lbImie6.Text = Session["imie6"].ToString();
                        lbNazwisko6.Text = Session["nazwisko6"].ToString();
                        lbPesel6.Text = Session["pesel6"].ToString();
                    }
                    else
                        panelUbezpieczony6.Visible = false;
                    if (liczbaubezp >= 7)
                    {
                        panelUbezpieczony7.Visible = true;
                        lbImie7.Text = Session["imie7"].ToString();
                        lbNazwisko7.Text = Session["nazwisko7"].ToString();
                        lbPesel7.Text = Session["pesel7"].ToString();
                    }
                    else
                        panelUbezpieczony7.Visible = false;
                    if (liczbaubezp >= 8)
                    {
                        panelUbezpieczony8.Visible = true;
                        lbImie8.Text = Session["imie8"].ToString();
                        lbNazwisko8.Text = Session["nazwisko8"].ToString();
                        lbPesel8.Text = Session["pesel8"].ToString();
                    }
                    else
                        panelUbezpieczony8.Visible = false;
                    if (liczbaubezp >= 9)
                    {
                        panelUbezpieczony9.Visible = true;
                        lbImie9.Text = Session["imie9"].ToString();
                        lbNazwisko9.Text = Session["nazwisko9"].ToString();
                        lbPesel9.Text = Session["pesel9"].ToString();
                    }
                    else
                        panelUbezpieczony9.Visible = false;
                    if (liczbaubezp >= 10)
                    {
                        panelUbezpieczony10.Visible = true;
                        lbImie10.Text = Session["imie10"].ToString();
                        lbNazwisko10.Text = Session["nazwisko10"].ToString();
                        lbPesel10.Text = Session["pesel10"].ToString();
                    }
                    else
                        panelUbezpieczony10.Visible = false;
                }
                else
                    Response.Redirect("~/default.aspx");
            }
            catch
            {  }
        }

        protected void btKuppolise_Click(object sender, EventArgs e)
        {
            if (Session["suma"] != null)
            {
                if (chkWarunki.Checked == true & chkZgoda.Checked == true)
                {
                    int liczbaubezp = Convert.ToInt32(Session["liczbaubezp"]);
                    {
                        string confirmValue = Request.Form["confirm_value"];
                        if (confirmValue == "Tak")
                        {
                            Session.Remove("suma");
                            string p = Path.Combine("\\umowy\\podroz\\", Convert.ToString(System.DateTime.Now.Ticks) + lbPesel.Text + ".txt");

                            FileStream fsw = new FileStream(HttpContext.Current.Server.MapPath(p), FileMode.OpenOrCreate, FileAccess.Write);
                            StreamWriter sw = new StreamWriter(fsw);

                            sw.WriteLine(lbJakieubezpieczenie.Text);
                            sw.WriteLine(lbDataubezpieczenia.Text);
                            sw.WriteLine(lbDatakoniec.Text);
                            sw.WriteLine(lbKosztyleczenia.Text);
                            sw.WriteLine(lbNww.Text);
                            sw.WriteLine(lbAssiststandard.Text);
                            sw.WriteLine(lbAssistsuper.Text);
                            sw.WriteLine(lbOC.Text);
                            sw.WriteLine(lbBagaz.Text);
                            sw.WriteLine(lbSkiplus.Text);
                            sw.WriteLine(lbRatownictwo.Text);
                            sw.WriteLine(lbleczenie.Text);
                            sw.WriteLine(lbwartosc.Text);
                            sw.WriteLine(lbKodpocztowy.Text);
                            sw.WriteLine(lbUlica.Text);
                            sw.WriteLine(lbMiasto.Text);
                            sw.WriteLine(lbImie.Text);
                            sw.WriteLine(lbNazwisko.Text);
                            sw.WriteLine(lbPesel.Text);
                            sw.WriteLine(lbTelefon.Text);
                            sw.WriteLine(lbEmail.Text);
                            sw.WriteLine(lbNumerdomu.Text);
                            sw.WriteLine(lbNumerlokalu.Text);
                            sw.WriteLine(lbImie1.Text);
                            sw.WriteLine(lbNazwisko1.Text);
                            sw.WriteLine(lbPesel1.Text);

                            if (liczbaubezp >= 2)
                            {
                                sw.WriteLine(lbImie2.Text);
                                sw.WriteLine(lbNazwisko2.Text);
                                sw.WriteLine(lbPesel2.Text);
                            }
                            if (liczbaubezp >= 3)
                            {
                                sw.WriteLine(lbImie3.Text);
                                sw.WriteLine(lbNazwisko3.Text);
                                sw.WriteLine(lbPesel3.Text);
                            }
                            if (liczbaubezp >= 4)
                            {
                                sw.WriteLine(lbImie4.Text);
                                sw.WriteLine(lbNazwisko4.Text);
                                sw.WriteLine(lbPesel4.Text);
                            }
                            if (liczbaubezp >= 5)
                            {
                                sw.WriteLine(lbImie5.Text);
                                sw.WriteLine(lbNazwisko5.Text);
                                sw.WriteLine(lbPesel5.Text);
                            }
                            if (liczbaubezp >= 6)
                            {
                                sw.WriteLine(lbImie6.Text);
                                sw.WriteLine(lbNazwisko6.Text);
                                sw.WriteLine(lbPesel6.Text);
                            }

                            if (liczbaubezp >= 7)
                            {
                                sw.WriteLine(lbImie7.Text);
                                sw.WriteLine(lbNazwisko7.Text);
                                sw.WriteLine(lbPesel7.Text);
                            }

                            if (liczbaubezp >= 8)
                            {
                                sw.WriteLine(lbImie8.Text);
                                sw.WriteLine(lbNazwisko8.Text);
                                sw.WriteLine(lbPesel8.Text);
                            }

                            if (liczbaubezp >= 9)
                            {
                                sw.WriteLine(lbImie9.Text);
                                sw.WriteLine(lbNazwisko9.Text);
                                sw.WriteLine(lbPesel9.Text);
                            }

                            if (liczbaubezp >= 10)
                            {
                                sw.WriteLine(lbImie10.Text);
                                sw.WriteLine(lbNazwisko10.Text);
                                sw.WriteLine(lbPesel10.Text);
                            }
                            sw.Close();
                            fsw.Close();

                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Dziękujemy za złożenie wniosku o ubezpieczenie, niedługo skontaktuje się z Tobą nasz pracownik w celu sfinalizowania transakcji. Pozdrawiamy')", true);
                        }
                        else
                        {
                            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Wniosek nie został wysłany')", true);
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Wypełnij brakujące pola')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Nie możesz przesłać powtórnie formularza. Wybierz nowe ubezpieczenie.')</script>");
            }
        }
    }
}
