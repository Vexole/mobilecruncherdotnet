namespace MobileCruncher.Models
{
    /* POCO class for items in the cart */
    public class CartItem
    {
        public int SN { get; set; }
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
}