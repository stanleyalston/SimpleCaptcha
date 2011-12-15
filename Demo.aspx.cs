using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Demo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnValidate_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["captcha"].ToString().ToLower() == txtValidate.Text.ToLower())
        {
            Response.Write("Correct");
        }
        else 
        {
            Response.Write("Incorrect");
        }
    }
}