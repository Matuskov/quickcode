<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarEmpresa.aspx.cs" Inherits="WebApplication1.Pagina.Empresa.RegistrarEmpresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 159px;
        }
        .style3
        {
            width: 159px;
            height: 20px;
        }
        .style4
        {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                Datos de Ingreso</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Usuario*</td>
            <td>
                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Contraseña*</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Información de la Empresa</td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td class="style2">
                RUT*</td>
            <td>
                <asp:TextBox ID="txtRUT" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Razon Social (Nombre)*</td>
            <td>
                <asp:TextBox ID="txtRazonSocial" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Rubro</td>
            <td>
                <asp:DropDownList ID="ddlRubro" runat="server" DataSourceID="sdsRubro" 
                    DataTextField="DESCRIPCION" DataValueField="RUBRO_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsRubro" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ThequickcodeConnectionString %>" 
                    SelectCommand="SELECT [RUBRO_ID], [DESCRIPCION] FROM [RUBRO]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Region</td>
            <td>
                <asp:DropDownList ID="ddlRegion" runat="server" DataSourceID="sdsRegion" 
                    DataTextField="NOMBRE" DataValueField="REGION_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsRegion" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ThequickcodeConnectionString %>" 
                    SelectCommand="SELECT [REGION_ID], [NOMBRE] FROM [REGION]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Ciudad</td>
            <td>
                <asp:DropDownList ID="ddlCiudad" runat="server" DataSourceID="sdsCiudad" 
                    DataTextField="NOMBRE" DataValueField="CIUDAD_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsCiudad" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ThequickcodeConnectionString %>" 
                    SelectCommand="SELECT [NOMBRE], [CIUDAD_ID] FROM [CIUDAD] WHERE ([REGION_ID] = @REGION_ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlRegion" Name="REGION_ID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Comuna</td>
            <td>
                <asp:DropDownList ID="ddlComuna" runat="server" DataSourceID="sdsComuna" 
                    DataTextField="NOMBRE" DataValueField="COMUNA_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsComuna" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ThequickcodeConnectionString %>" 
                    SelectCommand="SELECT [COMUNA_ID], [NOMBRE] FROM [COMUNA] WHERE ([CIUDAD_ID] = @CIUDAD_ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCiudad" Name="CIUDAD_ID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Dir. Oficina</td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Correo Electronico*</td>
            <td>
                <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Telefono</td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnRegistrarEmpresa" runat="server" Text="Registrar Empresa" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" 
        ControlToValidate="txtUsuario" ErrorMessage="* Porfavor ingrese un usuario." 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
        ControlToValidate="txtPassword" 
        ErrorMessage="* Porfavor ingrese una contraseña." ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="* Porfavor ingrese un RUT." ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="* Porfavor ingrese una razón social." ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="* Porfavor ingrese un correo electrónico." ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ErrorMessage="* El usuario debe tener un minimo de 6 caracteres." 
        ForeColor="Red" MinimumValue="6"></asp:RangeValidator>
    <br />
    <asp:RangeValidator ID="RangeValidator2" runat="server" 
        ErrorMessage="* La contraseña debe tener un minimo de 8 caracteres." 
        ForeColor="Red" MinimumValue="8"></asp:RangeValidator>
    <br />
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ErrorMessage="* El correo electronico no es valido." ForeColor="Red"></asp:CustomValidator>
    <br />
    <br />
    <br />
&nbsp;El usuario:<br />
&nbsp;- Debe tener un minimo de 6 caracteres.<br />
    <br />
&nbsp;La contraseña:<br />
&nbsp;- Debe tener un minimo de 8 caracteres.<br />
&nbsp;- Debe contener al menos un digito.<br />
    <br />
&nbsp;*: Campo requerido<br />
</asp:Content>
