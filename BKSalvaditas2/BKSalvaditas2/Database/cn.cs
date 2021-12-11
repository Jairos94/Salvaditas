using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BKSalvaditas2.Database
{
    public class cn
    {
        private string DataSource = "DESKTOP-4FJOI9V";
        private string BaseDatos = "Salvaditas";


        public void conexcion( string x) 
        {

            x="Data Source="+ DataSource + ";Initial Catalog="+ BaseDatos + ";Integrated Security=True";
            
        }
    }
}
