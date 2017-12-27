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
    public partial class podsumowanie2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["coubezpieczone"]!=null )
                {
                    lbKodu.Text = Session["kodu"].ToString();
                    lbMiastou.Text = Session["miastou"].ToString();
                    lbUlicau.Text = (Session["ulicau"].ToString() + " " + Session["nrdomuubezp"].ToString() + "/" + Session["nrmieszkaniaubezp"].ToString());
                    lbKodpocztowy.Text = Session["kod"].ToString();
                    lbUlica.Text = Session["ulica"].ToString();
                    lbMiasto.Text = Session["miasto"].ToString();
                    lbJakieubezpieczenie.Text = Session["coubezpieczone"].ToString();
                    lbImie.Text = Session["imie"].ToString();
                    lbNazwisko.Text = Session["nazwisko"].ToString();
                    lbPesel.Text = Session["pesel"].ToString();
                    lbTelefon.Text = Session["telefon"].ToString();
                    lbEmail.Text = Session["email"].ToString();
                    lbNumerdomu.Text = Session["nrdomu"].ToString();
                    lbNumerlokalu.Text = Session["nrmieszkania"].ToString();
                }
                else
                    Response.Redirect("~/default.aspx");
            }
            catch
            { }
            try
            {
                lbUlica2.Text = Session["ulica2"].ToString();
                lbMiasto2.Text = Session["miasto2"].ToString();
                lbKod2.Text = Session["Kod2"].ToString();
                lbImie2.Text = Session["imie2"].ToString();
                lbNazwisko2.Text = Session["nazwisko2"].ToString();
                lbPesel2.Text = Session["pesel2"].ToString();
                lbTelefon2.Text = Session["telefon2"].ToString();
                lbEmail2.Text = Session["email2"].ToString();
                lbNrdomu2.Text = Session["nrdomu2"].ToString();
                lbNrlokalu2.Text = Session["nrmieszkania2"].ToString();
            }
            catch
            { panelWlasciciela.Visible = false; }

            if (Session["zamieszkany"] != null)
            {
                lbzamieszkany.Text = Session["zamieszkany"].ToString();
            }
           
            if (Session["lokallosowe"] != null)
            {
                lbloklosowe.Text = "Ubezpieczenie lokalu od zdarzeń losowych: " + Session["lokallosowe"].ToString() + " zł";
            }
            if (Session["lokalkradziez"] != null)
            {
                lblokalkradziez.Text = "Ubezpieczenie lokalu od kradzieży: " + Session["lokalkradziez"].ToString() + " zł";
            }
            if (Session["ruchomoscilosowe"] != null)
            {
                lbruchomoscilosowe.Text = "Ubezpieczenie ruchomości domowych od zdarzeń losowych: " + Session["ruchomoscilosowe"].ToString() + " zł";
            }
            if (Session["ruchomoscikradziez"] != null)
            {
                lbruchomoscikradziez.Text = "Ubezpieczenie ruchomości domowych od kradzieży: " + Session["ruchomoscikradziez"].ToString() + " zł";
            }
            if (Session["garazlosowe"] != null)
            {
                lbgarazlosowe.Text = "Ubezpieczenie garażu od zdarzeń losowych: " + Session["garazlosowe"].ToString() + " zł";
            }
            if (Session["garazkradziez"] != null)
            {
                lbgarazkradziez.Text = "Ubezpieczenie garażu od kradzieży: " + Session["garazkradziez"].ToString() + " zł";
            }
            if (Session["ogrodzenielosowe"] != null)
            {
                lbogrodzenielosowe.Text = "Ubezpieczenie ogrodzenia od zdarzeń losowych: " + Session["ogrodzenielosowe"].ToString() + " zł";
            }
            if (Session["innylosowe"] != null)
            {
                lbinnylosowe.Text = "Ubezpieczenie innego budynku od zdarzeń losowych: " + Session["innylosowe"].ToString() + " zł";
            }
            if (Session["innykradziez"] != null)
            {
                lbinnykradziez.Text = "Ubezpieczenie innego budynku od kradzieży: " + Session["innykradziez"].ToString() + " zł";
            }
            if (Session["oc"] != null)
            {
                lboc.Text = "Ubezpieczenie odpowiedzialności cywilnej (OC): " + Session["oc"].ToString() + " zł";
            }
            
            if (Session["nnw"] != null)
            {
                lbnnw.Text = "Ubezpieczenie następstw nieszczęśliwych wypadków: " + Session["nnw"].ToString() + " zł";
            }
            
            if (Session["torebka"] != null)
            {
                lbtorebka.Text = "Pakiet - Torebka: " + Session["torebka"].ToString() + " zł";
            }
            
            if (Session["assistance"] != null)
            {
                lbassistance.Text = Session["assistance"].ToString();
            }
            
            if (Session["cena"] != null)
            {
                lbwartosc.Text = "Do zapłaty : " + Session["cena"].ToString() + " zł";
            }
        }

        protected void btKuppolise_Click(object sender, EventArgs e)
        {
            if (Session["cena"] != null)
            {
                if (chkWarunki.Checked == true & chkZgoda.Checked == true)
                {
                    string confirmValue = Request.Form["confirm_value"];
                    if (confirmValue == "Tak")
                    {
                        Session.Remove("cena");
                        string p = Path.Combine("\\umowy\\mieszkanie\\", Convert.ToString(System.DateTime.Now.Ticks) + lbPesel.Text + ".txt");

                        FileStream fsw = new FileStream(HttpContext.Current.Server.MapPath(p), FileMode.OpenOrCreate, FileAccess.Write);
                        StreamWriter sw = new StreamWriter(fsw);
                        sw.WriteLine(lbKodu.Text);
                        sw.WriteLine(lbMiastou.Text);
                        sw.WriteLine(lbUlicau.Text);
                        sw.WriteLine(lbKodpocztowy.Text);
                        sw.WriteLine(lbUlica.Text);
                        sw.WriteLine(lbMiasto.Text);
                        sw.WriteLine(lbJakieubezpieczenie.Text);
                        sw.WriteLine(lbImie.Text);
                        sw.WriteLine(lbNazwisko.Text);
                        sw.WriteLine(lbPesel.Text);
                        sw.WriteLine(lbTelefon.Text);
                        sw.WriteLine(lbEmail.Text);
                        sw.WriteLine(lbNumerdomu.Text);
                        sw.WriteLine(lbNumerlokalu.Text);
                        sw.WriteLine(lbUlica2.Text);
                        sw.WriteLine(lbMiasto2.Text);
                        sw.WriteLine(lbKod2.Text);
                        sw.WriteLine(lbImie2.Text);
                        sw.WriteLine(lbNazwisko2.Text);
                        sw.WriteLine(lbPesel2.Text);
                        sw.WriteLine(lbTelefon2.Text);
                        sw.WriteLine(lbEmail2.Text);
                        sw.WriteLine(lbNrdomu2.Text);
                        sw.WriteLine(lbNrlokalu2.Text);
                        sw.WriteLine(lbzamieszkany.Text);
                        sw.WriteLine("Ubezpieczenie lokalu od zdarzeń losowych: " + lbloklosowe.Text + " zł");
                        sw.WriteLine("Ubezpieczenie lokalu od kradzieży: " + lblokalkradziez.Text + " zł");
                        sw.WriteLine("Ubezpieczenie ruchomości domowych od zdarzeń losowych: " + lbruchomoscilosowe.Text + " zł");
                        sw.WriteLine("Ubezpieczenie ruchomości domowych od kradzieży: " + lbruchomoscikradziez.Text + " zł");
                        sw.WriteLine("Ubezpieczenie garażu od zdarzeń losowych: " + lbgarazlosowe.Text + " zł");
                        sw.WriteLine("Ubezpieczenie garażu od kradzieży: " + lbgarazkradziez.Text + " zł");
                        sw.WriteLine("Ubezpieczenie ogrodzenia od zdarzeń losowych: " + lbogrodzenielosowe.Text + " zł");
                        sw.WriteLine("Ubezpieczenie innego budynku od zdarzeń losowych: " + lbinnylosowe.Text + " zł");
                        sw.WriteLine("Ubezpieczenie innego budynku od kradzieży: " + lbinnykradziez.Text + " zł");
                        sw.WriteLine("Ubezpieczenie odpowiedzialności cywilnej (OC): " + lboc.Text + " zł");
                        sw.WriteLine("Ubezpieczenie następstw nieszczęśliwych wypadków: " + lbnnw.Text + " zł");
                        sw.WriteLine("Pakiet - Torebka: " + lbtorebka.Text + " zł");
                        sw.WriteLine("Assistance Super: " + lbassistance.Text);
                        sw.WriteLine("Do zapłaty : " + lbwartosc.Text + " zł");
                        sw.Close();
                        fsw.Close();
                        
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Dziękujemy za złożenie wniosku o ubezpieczenie, niedługo skontaktuje się z Tobą nasz pracownik w celu sfinalizowania transakcji. Pozdrawiamy')", true);
                    }
                    else
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Wniosek nie został wysłany')", true);
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