<%@ Page Title="MobileCrunchers - Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MobileCruncher.Dashboard" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 id="title" class="text-center mb-3 mc-color-primary"><%: Title %></h2>
    <asp:SqlDataSource ID="sqlDSProductsList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT p.Id, p.Name, p.Price,
                            m.name AS Manufacturer, os.name AS 'Operating System' 
                            FROM products p JOIN product_details pd ON p.id = pd.product_id 
                            JOIN manufacturers m ON pd.manufacturer_id = m.id 
                            JOIN operating_systems os ON os.id = pd.os_id">
    </asp:SqlDataSource>
    
    <h4 class="text-center mc-color-secondary">Products List</h4>
    <div class="product_details_container">
        <div class="d-flex mt-3 mx-auto justify-content-center">
            <asp:GridView ID="grdViewProducts" runat="server" DataSourceID="sqlDSProductsList" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="me-4" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="grdViewProducts_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                    <asp:BoundField DataField="Operating System" HeaderText="Operating System" SortExpression="Operating System" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>

        <div class="d-flex mt-4 mx-auto justify-content-center">
            <asp:DetailsView ID="dtlViewProductDetails" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="sqlDSProductDetails" Height="50px" Width="125px" OnItemDeleted="dtlViewProductDetails_ItemDeleted" OnItemInserted="dtlViewProductDetails_ItemInserted" OnItemUpdated="dtlViewProductDetails_ItemUpdated" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditName" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertName" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditPrice" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Price", "{0:c}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertPrice" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price", "{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RAM" SortExpression="RAM">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RAM") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditRAM" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RAM") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertRAM" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("RAM") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Storage Capacity" SortExpression="StorageCapacity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("StorageCapacity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditSC" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("StorageCapacity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertSC" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("StorageCapacity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Screen Size" SortExpression="ScreenSize">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ScreenSize") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditSS" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ScreenSize") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertSS" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ScreenSize") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Processor Speed" SortExpression="ProcessorSpeed">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ProcessorSpeed") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditPS" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ProcessorSpeed") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertPS" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ProcessorSpeed") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Optical Sensor Resolution" SortExpression="OpticalSensorResolution">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("OpticalSensorResolution") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditOSR" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("OpticalSensorResolution") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertOSR" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("OpticalSensorResolution") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weight" SortExpression="Weight">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Weight") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditW" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Weight") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertW" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dimension" SortExpression="Dimension">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Dimension") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEditD" runat="server" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Dimension") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVInsertD" runat="server" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="This field is required." Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Dimension") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer" SortExpression="Manufacturer">
                        <EditItemTemplate>
                            <asp:DropDownList ID="drpDwnManufacturer" runat="server" DataSourceID="sqlDSManufacturers" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("ManufacturerId") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                             <asp:DropDownList ID="drpDwnManufacturer" runat="server" DataSourceID="sqlDSManufacturers" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("ManufacturerId") %>'>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                             <asp:DropDownList CssClass="select-view" ID="drpDwnManufacturer" runat="server" DataSourceID="sqlDSManufacturers" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("ManufacturerId") %>' Enabled="False">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Operating System" SortExpression="Operating System">
                        <EditItemTemplate>
                            <asp:DropDownList ID="drpDwnOS" runat="server" DataSourceID="sqlDSOS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("OperatingSystemId") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="drpDwnOS" runat="server" DataSourceID="sqlDSOS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("OperatingSystemId") %>'>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList CssClass="select-view" ID="drpDwnOS" runat="server" DataSourceID="sqlDSOS" DataTextField="name" DataValueField="id" Enabled="False" SelectedValue='<%# Bind("OperatingSystemId") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Processor Type" SortExpression="Processor Type">
                        <EditItemTemplate>
                            <asp:DropDownList ID="drpDwnProcessorType" runat="server" DataSourceID="sqlDSProcessorTypes" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("ProcessorTypeId") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="drpDwnProcessorType" runat="server" DataSourceID="sqlDSProcessorTypes" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("ProcessorTypeId") %>'>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="drpDwnProcessorType" runat="server" DataSourceID="sqlDSProcessorTypes" DataTextField="name" Enabled="False" DataValueField="id" SelectedValue='<%# Bind("ProcessorTypeId") %>' CssClass="select-view">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:DetailsView>
        </div>
    </div>

    <asp:SqlDataSource ID="sqlDSProductDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [product_details] WHERE [product_id] = @id; DELETE FROM [products] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [product_details] ([ram], [storage_capacity], [screen_size],
                        [processor_speed], [optical_sensor_resolution], [weight], [dimension], [product_id],
                        [manufacturer_id], [processor_type_id], [os_id]) VALUES 
                        (@RAM,
                        @StorageCapacity,
                        @ScreenSize,
                        @processorSpeed,
                        @OpticalSensorResolution,
                        @Weight,
                        @Dimension,
                        @ProductId,
                        @ManufacturerId,
                        @ProcessorTypeId,
                        @OperatingSystemId)" 
        SelectCommand="SELECT p.Id, p.Name, p.Price, pd.ram AS 'RAM',
                        pd.storage_capacity AS 'StorageCapacity', pd.screen_size AS 'ScreenSize', 
                        pd.processor_speed AS 'ProcessorSpeed', 
                        pd.optical_sensor_resolution AS 'OpticalSensorResolution', 
                        pd.Weight, pd.Dimension, m.id AS ManufacturerId, os.id AS 'OperatingSystemId', 
                        pt.id AS 'ProcessorTypeId'
                        FROM products p JOIN product_details pd ON p.id = pd.product_id 
                        JOIN manufacturers m ON pd.manufacturer_id = m.id 
                        JOIN operating_systems os ON os.id = pd.os_id
                        JOIN processor_types pt ON pt.id = pd.processor_type_id WHERE p.Id= @Id" 
        UpdateCommand="UPDATE [products] SET [name] = @Name, [price] = @Price WHERE [Id] = @Id;
                        UPDATE [product_details] SET [ram] = @RAM, [storage_capacity] = @StorageCapacity, [screen_size] = @ScreenSize,
                        [processor_speed] = @ProcessorSpeed, [optical_sensor_resolution] = @OpticalSensorResolution,
                        [weight] = @Weight, [dimension] = @Dimension, [manufacturer_id] = @ManufacturerId,
                        [os_id] = @OperatingSystemId, [processor_type_id] = @ProcessorTypeId WHERE [product_id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RAM" Type="String" />
            <asp:Parameter Name="StorageCapacity" Type="String" />
            <asp:Parameter Name="ScreenSize" Type="String" />
            <asp:Parameter Name="ProcessorSpeed" Type="String" />
            <asp:Parameter Name="OpticalSensorResolution" Type="String" />
            <asp:Parameter Name="Weight" Type="String" />
            <asp:Parameter Name="Dimension" Type="String" />
            <asp:Parameter Name="ManufacturerId" Type="Int32" />
            <asp:Parameter Name="OperatingSystemId" Type="Int32" />
            <asp:Parameter Name="ProcessorTypeId" Type="Int32" />
            <asp:Parameter Name="ProductId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grdViewProducts" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="RAM" Type="String" />
            <asp:Parameter Name="StorageCapacity" Type="String" />
            <asp:Parameter Name="ScreenSize" Type="String" />
            <asp:Parameter Name="ProcessorSpeed" Type="String" />
            <asp:Parameter Name="OpticalSensorResolution" Type="String" />
            <asp:Parameter Name="Weight" Type="String" />
            <asp:Parameter Name="Dimension" Type="String" />
            <asp:Parameter Name="ManufacturerId" Type="Int32" />
            <asp:Parameter Name="OperatingSystemId" Type="Int32" />
            <asp:Parameter Name="ProcessorTypeId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlLastRowId" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 1 [id] FROM [products] ORDER BY [id] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSManufacturers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [manufacturers] WHERE [id] = @id" InsertCommand="INSERT INTO [manufacturers] ([name]) VALUES (@name)" SelectCommand="SELECT * FROM [manufacturers]" UpdateCommand="UPDATE [manufacturers] SET [name] = @name WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSOS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [operating_systems] WHERE [id] = @id" InsertCommand="INSERT INTO [operating_systems] ([name]) VALUES (@name)" SelectCommand="SELECT * FROM [operating_systems]" UpdateCommand="UPDATE [operating_systems] SET [name] = @name WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [products] WHERE [id] = @id" InsertCommand="INSERT INTO [products] ([name], [price], [image_path]) VALUES (@name, @price, 'default.jpg')" SelectCommand="SELECT [id], [name], [price] FROM [products]" UpdateCommand="UPDATE [products] SET [name] = @name, [price] = @price WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlDSProcessorTypes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [processor_types] WHERE [id] = @id" InsertCommand="INSERT INTO [processor_types] ([name]) VALUES (@name)" SelectCommand="SELECT * FROM [processor_types]" UpdateCommand="UPDATE [processor_types] SET [name] = @name WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="lists">
        <div class="manufacturer_container">
            <h4 class="text-center mt-3 mc-color-secondary">Manufacturers List</h4>
            <div class="d-flex mt-3 mx-auto justify-content-center">
                <asp:GridView ID="grdViewManufacturers" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="sqlDSManufacturers" ShowFooter="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id">
                            <EditItemTemplate>
                                <asp:Label ID="lblManufacturerId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblManufacturerId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                             <FooterTemplate>
                                <asp:LinkButton ID="lnkBtnManuInsert" runat="server" OnClick="LnkBtnManuInsert_Click" ValidationGroup="manufacturer">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtManufacturer" runat="server" ControlToValidate="txtManufacturer" ValidationGroup="manufacturer" Placeholder="Manufacturer Name"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." Display="Dynamic" ControlToValidate="txtManufacturer" ValidationGroup="manufacturer" CssClass="red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </div>
        </div>
    
        <div class="processor_types_container">
            <h4 class="text-center mt-3 mc-color-secondary">Processors List</h4>
            <div class="d-flex mt-3 mx-auto justify-content-center">
                <asp:GridView ID="grdViewProcessorTypes" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="sqlDSProcessorTypes" ShowFooter="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id">
                            <EditItemTemplate>
                                <asp:Label ID="lblProcessorId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProcessorId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="lnkBtnProcInsert" runat="server" OnClick="LnkBtnProcInsert_Click" ValidationGroup="processor">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtProcessor" runat="server" ValidationGroup="processor" Placeholder="Processor Name"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." Display="Dynamic" ControlToValidate="txtProcessor" ValidationGroup="processor" CssClass="red"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </div>
        </div>
    </div>
    </asp:Content>
