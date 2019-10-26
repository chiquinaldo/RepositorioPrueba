<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html class="bg-aqua" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <title>Acceso al sistema</title>
</head>
<body class="bg-aqua">
    <div class="form-box" id="loginBox">
        <div class="header">Registro</div>
        <form id="form1" runat="server">
            <div class="body bg-gray">
                <div class="form-group">
                    <asp:TextBox ID="TxtId" CssClass="form-control" runat="server" Height="32px" Width="323px" placeholder="Ingrese el id"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="TxtNombre" CssClass="form-control" runat="server" Height="32px" Width="323px" placeholder="Ingrese un nombre"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnAcceso" CssClass="btn bg-olive btn-block" runat="server" Text="Guardar" Height="35px" Width="323px" OnClick="btnAcceso_Click" />
                </div>

                <div class="form-group">
                   
                    <asp:Label ID="Label1" runat="server" Text="Label">Cola 1</asp:Label>
                    <asp:GridView ID="GridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="330px" DataKeyNames="id,idCliente" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Atender" ShowSelectButton="True" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="idCliente" HeaderText="idCliente" SortExpression="idCliente" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbproyectoConnectionString %>" SelectCommand="SELECT CO.id,c.idCliente,C.nombre FROM cliente C INNER JOIN cola1 CO  ON c.idCliente=CO.idCliente
WHERE (CO.estado=1 AND CO.tipo=1)"></asp:SqlDataSource>
                    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbproyectoConnectionString2 %>" SelectCommand="SELECT [id], [estado], [tiempo] FROM [cola1]"></asp:SqlDataSource>--%>
                </div>



                <div class="form-group">
                   <asp:Label ID="Label2" runat="server" Text="Label">Cola 2</asp:Label>

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="330px" DataKeyNames="id,idCliente" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Atender" ShowSelectButton="True" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="idCliente" HeaderText="idCliente" SortExpression="idCliente" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbproyectoConnectionString %>" SelectCommand="SELECT CO.id,c.idCliente,C.nombre FROM cliente C INNER JOIN cola1 CO  ON c.idCliente=CO.idCliente
WHERE (CO.estado=1 AND CO.tipo=2)"></asp:SqlDataSource>
                    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbproyectoConnectionString2 %>" SelectCommand="SELECT [id], [estado], [tiempo] FROM [cola1]"></asp:SqlDataSource>--%>
                </div>
            </div>
            <%--   <div class="footer">
                <asp:Button ID="btnAcceso" CssClass="btn bg-olive btn-block" runat="server" Text="Guardar" Height="35px" Width="332px" OnClick="btnAcceso_Click" />
            </div>--%>
        </form>
    </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" type="text/html"></script>
</html>
