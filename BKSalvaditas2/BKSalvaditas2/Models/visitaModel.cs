using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BKSalvaditas2.Models
{
    public class visitaModel
    {
        public int id { get; set; }
        public int idCedula { get; set; }
        public int IdDepartamento { get; set; }
        public int IdEmpleado { get; set; }
        public string motivo { get; set; }
        public DateTime horaIngreso { get; set; }
        public DateTime horaSalida { get; set; }
        public DateTime fecha { get; set; }
    }
}
