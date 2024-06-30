using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alam_BookStore_929.Model
{
    public class Book
    {
        public string Id { get; set; }
        public string BookName { get; set; }
        public string AuthorName { get; set; }
        public string Description { get; set; }
        public int GenreId { get; set; }
        public string image { get; set; }
        public decimal price { get; set; }
       
    }
}