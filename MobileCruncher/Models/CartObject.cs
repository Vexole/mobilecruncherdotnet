using MobileCruncher.Models;
using System.Collections.Generic;

namespace BMobileCruncher.Models
{
    /* POCO class for storing cart information in the session */
    public class CartObject
    {
        public List<CartItem> CartItems { get; set; }

        public int TotalItems { get; set; }

        public double Total { get; set; }

        public string Customer { get; set; }
        public Customer ShippingCustomer { get; set; }
    }
}