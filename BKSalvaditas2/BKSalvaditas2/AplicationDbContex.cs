using BKSalvaditas2.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BKSalvaditas2
{
    public class AplicationDbContex:DbContext
 
    {
        public DbSet<visitaModel> visita { get; set; }

        public AplicationDbContex(DbContextOptions<AplicationDbContex> options) : base(options)
        {

        }
    }
}
