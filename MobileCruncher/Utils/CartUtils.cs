using BMobileCruncher.Models;
using Microsoft.AspNet.Identity;
using MobileCruncher.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMobileCruncher.Utils
{
    public static class CartUtils
    {
        public static CartObject GetCart()
        {
            CartObject cart = (CartObject)HttpContext.Current.Session[GetCartName()];
            return cart;
        }

        public static string GetCartName()
        {
            return HttpContext.Current.User.Identity.GetUserId();
        }

        public static string GetUserId()
        {
            return HttpContext.Current.User.Identity.GetUserId();
        }

        /* 
         * Get cart from the session and return the product items. 
         * If cart is not present in the session, create a new one.
         */
        public static List<CartItem> GetCartItems()
        {
            CartObject cart = GetCart();
            if (cart == null)
            {
                cart = new CartObject();
                cart.CartItems = new List<CartItem>();
                cart.Customer = GetUserId();
                HttpContext.Current.Session[GetCartName()] = cart;
            }
            return cart.CartItems;
        }

        public static int GetCartItemsCount()
        {
            return GetCart()?.TotalItems ?? 0;
        }

        public static void UpdateCartItemsCount(int quantity)
        {
            int total = GetCartItemsCount();
            total += quantity;
        }

        /* 
         * Save the selected book in the session cart.
         * If the book is already present in the cart, increase the qty, else
         * add the book as new item.
         */
        public static void AddItemsToCart(CartItem cartItem)
        {
            List<CartItem> cartItems = GetCartItems();
            CartItem existingCartItem = cartItems?.FirstOrDefault(
                argCartItem => argCartItem.Product.Id == cartItem.Product.Id);

            if (existingCartItem == null)
            {
                cartItems.Add(cartItem);
            }
            else
            {
                existingCartItem.Quantity = existingCartItem.Quantity + cartItem.Quantity;
            }

            CartObject cart = GetCart();
            cart.Total += cartItem.Quantity * cartItem.Product.Price;
        }

        /*
         * Clear the items from the cart
         */
        public static void ClearCart()
        {
            CartObject cart = GetCart();
            cart.Total = 0;
            cart.Customer = string.Empty;
            cart.ShippingCustomer = null;
            GetCartItems().Clear();
        }

        /* 
         * Get the customer information from the cart stored in the session 
         */
        public static string GetCustomer()
        {
            CartObject cart = GetCart();
            return cart?.Customer ?? string.Empty;
        }

        public static void RemoveItemFromCart(int productId)
        {
            List<CartItem> cartItems = GetCartItems();
            CartItem cartItem = cartItems.Where(item => item.Product.Id == productId).FirstOrDefault();
            if (cartItem != null)
            {
                CartObject cart = GetCart();
                cart.Total -= cartItem.Quantity * cartItem.Product.Price;
                cartItems = cartItems.Where(item => item.Product.Id != productId).ToList();
            }
        }

        /*
         * Save provided customer information in the session cart
         */
        public static void SetCustomer()
        {
            CartObject cart = GetCart();
            cart.Customer = GetUserId();
        }

        /* 
         * Get the customer information from the cart stored in the session 
         */
        public static Customer GetShippingCustomer()
        {
            CartObject cart = GetCart();
            return cart?.ShippingCustomer ?? new Customer();
        }

        public static void SetShippingCustomer(Customer customer)
        {
            CartObject cart = GetCart();
            cart.ShippingCustomer = customer;
        }
    }
}