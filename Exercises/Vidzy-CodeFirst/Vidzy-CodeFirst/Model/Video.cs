﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vidzy_CodeFirst.Model
{
    public class Video
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime ReleaseDate { get; set;}
        public Classification Classification { get; set; }

        public Genre Genre { get; set; }
        public int GenreId { get; set; }
    }

    public enum Classification : byte
    {
        Silver,
        Gold,
        Platinum
    }
}
