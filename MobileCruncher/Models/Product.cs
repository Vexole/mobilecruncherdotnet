using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace MobileCruncher.Models
{
    public class Product
    {
        public int Id { get; set; }
        public String Name { get; set; }
        public Double Price { get; set; }
        public String Quantity { get; set; }
        public String ImagePath { get; set; }
        public String RAM { get; set; }
        public String StorageCapacity { get; set; }
        public String ScreenSize { get; set; }
        public String ProcessorType { get; set; }
        public String ProcessorSpeed { get; set; }
        public String OpticalSensorResolution { get; set; }
        public String Weight { get; set; }
        public String Dimension { get; set; }
        public String Manufacturer { get; set; }
        public String OS { get; set; }
    }

    [DataObject(true)]
    public static class ProductDAL
    {
        public static string connectionString = ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString;

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Product GetProductDetails(int Id)
        {
            string sql = 
                "SELECT p.*, " +
                "pd.ram, pd.storage_capacity, pd.screen_size, " +
                "pd.processor_speed, pd.optical_sensor_resolution, " +
                "pd.weight, pd.dimension, m.name AS manufacturer, " +
                "os.name AS OS, pt.name AS processor_type " +
                "FROM products p JOIN product_details pd ON p.id = pd.product_id " +
                "JOIN manufacturers m ON pd.manufacturer_id = m.id " +
                "JOIN operating_systems os ON os.id = pd.os_id " +
                "JOIN processor_types pt ON pt.id = pd.processor_type_id " +
                "WHERE p.id=@ProductId";

            Product product = new Product();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    command.Parameters.AddWithValue("ProductId", Id);
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        product.Id = Int32.Parse(reader["id"].ToString());
                        product.Name = reader["name"].ToString();
                        product.Price = Double.Parse(reader["price"].ToString());
                        product.Quantity = reader["quantity"].ToString();
                        product.ImagePath = reader["image_path"].ToString();
                        product.RAM = reader["ram"].ToString();
                        product.StorageCapacity = reader["storage_capacity"].ToString();
                        product.ScreenSize = reader["screen_size"].ToString();
                        product.ProcessorType = reader["processor_type"].ToString();
                        product.ProcessorSpeed = reader["processor_speed"].ToString();
                        product.OpticalSensorResolution = reader["optical_sensor_resolution"].ToString();
                        product.Weight = reader["weight"].ToString();
                        product.Dimension = reader["dimension"].ToString();
                        product.Manufacturer = reader["manufacturer"].ToString();
                        product.OS = reader["OS"].ToString();
                    }
                    connection.Close();
                }

            }
            return product;
        }

        public static int UpdateProduct(int Id, string Name, Double Price, string Description, string ImagePath)
        {
            string sql = "UPDATE product SET Name=@Name, Description=@Description, ImagePath=@ImagePath, Price=@Price WHERE id=@Id";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    command.Parameters.AddWithValue("Id", Id);
                    command.Parameters.AddWithValue("Name", Name);
                    command.Parameters.AddWithValue("Description", Description);
                    command.Parameters.AddWithValue("ImagePath", ImagePath);
                    command.Parameters.AddWithValue("Price", Price);
                    return command.ExecuteNonQuery();
                }
            }
        }
    }
}