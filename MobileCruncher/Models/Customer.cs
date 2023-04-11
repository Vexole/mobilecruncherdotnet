﻿namespace MobileCruncher.Models
{
    public class Customer
    {
        /* POCO class for holidng customer information for session cart */
        public string Email { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string PhoneNumber { get; set; }

        public string Address { get; set; }

        public string City { get; set; }

        public string State { get; set; }

        public string ZipCode { get; set; }

    }
}