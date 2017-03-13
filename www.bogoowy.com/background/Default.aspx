<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_qmy8az-s" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {font-size:12px;}
        table {table-layout:fixed;word-break:break-all;}
    </style>
 <script language="javascript">
     function selectAll(chkAll)   //全选或反选时调用的function
     {
         if (chkAll.checked) {
             for (var i = 0; i < form1.elements.length; i++) {
                 if (form1.elements[i].type == "checkbox") {
                     form1.elements[i].checked = true;
                 }
             }
         }
         else {
             for (var i = 0; i < form1.elements.length; i++) {
                 if (form1.elements[i].type == "checkbox") {
                     form1.elements[i].checked = false;
                 }
             }
         }
     }

     function SetFocus1()
     {
         var ctrl = document.getElementById("Button1");      
         ctrl.focus();
     }

     function SetFocus4() {
         var ctrl = document.getElementById("Button4");
         ctrl.focus();
     }   
 </script>
</head>
<body >
    <form id="form1" runat="server">
    <div>        
     <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="重新登录" 
            style="border-right-width=10px" TabIndex="10" />
           <font color="red">
        <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="修改密码" />
        单击表头可排序</font>  
    </div>
    <div>
    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="order" 
            Text="当日数据" Checked="True" />
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="order" 
            Text="三日数据"  />
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="order"
            Text="全部数据" />

        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="简单查询" TabIndex="1" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="客户名称包含："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Columns="10"  ></asp:TextBox>  &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="客户电话或手机包含："></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Columns="10" ></asp:TextBox>  &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="客户地址包含："></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Columns="10" ></asp:TextBox><asp:Label ID="Label4" runat="server"
                Text="客户IP："></asp:Label>
        <asp:TextBox
            ID="TextBox4" runat="server" Width="88px"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" Text="高级查询" onClick="Button4_Click" 
            TabIndex="2" />   &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="批量删除" 
            TabIndex="3" onclientclick="return confirm('确认要批量删除吗？')" />         
    </div>
    
   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" onpageindexchanging="GridView1_PageIndexChanging" 
        PageSize="15" AutoGenerateColumns="False" DataKeyNames="ID" 
        AllowSorting="True" onsorting="GridView1_Sorting" 
        onrowdeleting="GridView1_RowDeleting" >
        <Columns>
            
            <asp:TemplateField HeaderText="序号"> 
                <ItemTemplate> 
                    <%# dgCount-Container.DataItemIndex%> 
                </ItemTemplate> 
                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="3%" 
                    ForeColor="Red" />
            </asp:TemplateField>
            <asp:BoundField DataField="orderTime" HeaderText="下单时间" 
                SortExpression="orderTime"  >
            <ItemStyle Width="9%" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="productName" HeaderText="产品名称" 
                SortExpression="productName" >
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="userName" HeaderText="客户名字" 
                SortExpression="userName" >
                <ItemStyle Width="5%" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="payWay" HeaderText="支付方法" SortExpression="payWay" >
                <ItemStyle Width="5%" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="userMobile" HeaderText="客户电话" 
                SortExpression="userMobile" >
                <ItemStyle Width="7%" />
            </asp:BoundField>
            <asp:BoundField DataField="userAddress" HeaderText="客户地址" 
                SortExpression="userAddress" >
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="userContext" HeaderText="客户留言" 
                SortExpression="userContext" >
                <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField DataField="userIP" HeaderText="客户IP" SortExpression="userIP" >
                <ItemStyle Width="8%" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="FormSite" HeaderText="下单网站" 
                SortExpression="FormSite" >
                <ItemStyle Width="8%" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="siteIP" HeaderText="服务器IP" SortExpression="siteIP" >
                <ItemStyle Width="7%" HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" 
                DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;"  >
                <ItemStyle Width="3%" HorizontalAlign="Center" />
            </asp:CommandField>
           <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <asp:CheckBox id="chk_SelectAll" Text="全选" runat="server" checked="false" onclick="javascript:return selectAll(this)" />
                    </HeaderTemplate>
                   <ItemTemplate>                   
                      <input type="checkbox" id="chkSelect" runat="server" checked="false"
                      Value='<%# DataBinder.Eval(Container.DataItem,"ID") %>' name="chkSelect"/>                                                       
                   </ItemTemplate>
                   <ItemStyle Width="5%" HorizontalAlign="Center" /> 
           </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" Font-Bold="true" Font-Size="Large" />
        <RowStyle BackColor="White" ForeColor="#003399"  />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
       

    </asp:GridView>
    
    </form>
</body>
</html>
