<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.Pagina.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 440px;
    }
    .style3
    {
        width: 440px;
        height: 19px;
    }
    .style4
    {
        height: 19px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
    <tr>
        <td align="center" class="style2">
            QuickCode para Programadores</td>
        <td align="center">
            QuickCode para Empresas</td>
    </tr>
    <tr>
        <td align="center" class="style2">
            [AYUDA CON WEAS POR DINERO, CERDO CAPITALISTA]</td>
        <td align="center">
            [QUE TE AYUDEN CON WEAS A CAMBIO DE DINERO, INUTIL]</td>
    </tr>
    <tr>
        <td align="center" class="style2">
            <asp:Button ID="btnRegistrarProgramador" runat="server" 
                onclick="btnRegistrarProgramador_Click" Text="Registrarse como Programador" />
        </td>
        <td align="center">
            <asp:Button ID="btnRegistrarEmpresa" runat="server" 
                onclick="btnRegistrarEmpresa_Click" Text="Registrarse como Empresa" />
        </td>
    </tr>
    <tr>
        <td class="style3">
        </td>
        <td class="style4">
        </td>
    </tr>
</table>
<table class="style1">
    <tr>
        <td align="center">
            <asp:Label ID="lblRegistroExitoso" runat="server" Font-Bold="True" 
                ForeColor="Red" Text="Cuenta creada exitosamente, porfavor inicie sesión." 
                Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
