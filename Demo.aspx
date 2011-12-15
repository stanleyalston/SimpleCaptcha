<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Demo.aspx.cs" Inherits="Demo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
        <img src="Captcha.ashx"/>
        
        </div>
        <div>
        <asp:TextBox ID="txtValidate" runat="server" style="width:180px"></asp:TextBox> 
        <asp:Button ID="btnValidate" runat="server" Text="Validate Now" 
            onclick="btnValidate_Click" />
        </div>
    </div>
    </form>
</body>
</html>
