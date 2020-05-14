<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deneme.aspx.cs" Inherits="FirstProject.Deneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="style.css" rel="stylesheet" />
</head>
<body>
     <form id="form1"  class="box"  runat="server">
         <h1>Login</h1>
         <asp:Label runat="server" ID="lbl_mesaj" />
         <asp:TextBox runat="server" ID="txt_username"  placeholder="Username"  CssClass="txtbx" />
         <asp:TextBox runat="server" ID="txt_password"  placeholder="Password"  CssClass="txtbx" TextMode="Password" />
         <asp:Button Text="Login" runat="server" ID="btn_login" CssClass="btnClass" OnClick="btn_login_Click" />
    </form>
</body>
</html>
