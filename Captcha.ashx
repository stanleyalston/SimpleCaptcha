<%@ WebHandler Language="C#" Class="Captcha" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Text;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

public class Captcha : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        Bitmap objBmp = new Bitmap(170, 50);
        Graphics objGraphics = Graphics.FromImage(objBmp);
        objGraphics.Clear(Color.White);
        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;
        objGraphics.CompositingQuality = CompositingQuality.HighQuality;
        objGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

        //configure to use for text
        Font objFont = new Font("Segoe UI", 19, FontStyle.Regular);

        //generate a random string for captcha
        string randomStr = GenerateRandomString(7);

        //string to be added to the session cookie, to be compared later
        HttpContext.Current.Session.Add("captcha", randomStr);

        //write the text
        objGraphics.DrawString(randomStr, objFont, Brushes.Blue, 3, 3);

        //set content type and return image
        context.Response.ContentType = "image/JPEG";

        //render image
        objBmp.Save(context.Response.OutputStream, ImageFormat.Jpeg);

        //dispose everything, not needed
        objFont.Dispose();
        objGraphics.Dispose();
        objBmp.Dispose();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public static string GenerateRandomString(int length)
    {
        string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        string result = "";
        Random rand = new Random();
        for (int i = 0; i < length; i++)
        {
            result += chars[rand.Next(chars.Length)];
        }
        return result;
    }
}