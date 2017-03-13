<%@ page language="C#" autoeventwireup="true" inherits="Login2, App_Web_qmy8az-s" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
</head>
<body>
    <form id="form1" runat="server">
  <div>
    <table width="83%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 30px"></td>
        <td style="height: 30px">
            &nbsp;</td>
      </tr>
      <tr>  
    <td width="16%" height="52" align="center">用户名：</td>
    <td width="47%" height="52" align="left">      
         <asp:TextBox ID="txtUsername" runat="server" CssClass="input_2" Enabled="False"></asp:TextBox></td>
</tr>
      <tr>
        <td align="center" style="height: 36px">密 码：</td>
        <td align="left" style="height: 36px"><asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="145px" Enabled="False" ></asp:TextBox></td>
      </tr>
      <tr>
        <td style="height: 38px"></td>
        <td colspan="3" align="left" valign="bottom" style="color:#666; height: 38px;"><asp:Button runat="server" ID="btnLogin" Text="确定" Width="100px" OnClick="btnLogin_Click" Enabled="False" />
        </td>
      </tr>
    </table>
  </div>
    </form>
</body>
</html>
