<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MobileCruncher.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sqlDSProductsList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT p.Id, p.Name, p.Price,
                            m.name AS Manufacturer, os.name AS 'Operating System' 
                            FROM products p JOIN product_details pd ON p.id = pd.product_id 
                            JOIN manufacturers m ON pd.manufacturer_id = m.id 
                            JOIN operating_systems os ON os.id = pd.os_id">
    </asp:SqlDataSource>
    
    <asp:GridView ID="grdViewProducts" runat="server" DataSourceID="sqlDSProductsList" AutoGenerateColumns="False" DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
            <asp:BoundField DataField="Operating System" HeaderText="Operating System" SortExpression="Operating System" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <asp:DetailsView ID="dtlViewProductDetails" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="sqlDSProductDetails" Height="50px" Width="125px" OnItemDeleted="dtlViewProductDetails_ItemDeleted" OnItemInserted="dtlViewProductDetails_ItemInserted" OnItemUpdated="dtlViewProductDetails_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
            <asp:BoundField DataField="RAM" HeaderText="RAM" SortExpression="RAM" />
            <asp:BoundField DataField="StorageCapacity" HeaderText="Storage Capacity" SortExpression="StorageCapacity" />
            <asp:BoundField DataField="ScreenSize" HeaderText="Screen Size" SortExpression="ScreenSize" />
            <asp:BoundField DataField="ProcessorSpeed" HeaderText="Processor Speed" SortExpression="ProcessorSpeed" />
            <asp:BoundField DataField="OpticalSensorResolution" HeaderText="Optical Sensor Resolution" SortExpression="OpticalSensorResolution" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
            <asp:BoundField DataField="Dimension" HeaderText="Dimension" SortExpression="Dimension" />
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
    </asp:DetailsView>
    <asp:SqlDataSource ID="sqlDSProductDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [product_details] WHERE [id] = @id; DELETE FROM [products] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [products] ([name], [price], [quantity], [image_path]) VALUES (@name, @price, @quantity, @image_path)" 
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
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="image_path" Type="String" />
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="sqlDSManufacturers">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
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
    </asp:Content>
