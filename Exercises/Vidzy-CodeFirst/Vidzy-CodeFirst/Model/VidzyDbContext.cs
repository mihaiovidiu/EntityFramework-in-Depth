using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vidzy_CodeFirst.Model
{
    public class VidzyDbContext: DbContext
    {
        public DbSet<Video> Videos { get; set; }
        public DbSet<Genre> Genres { get; set; }

        public VidzyDbContext() : base("DefaultConnection")
        {

        }
    }
}
