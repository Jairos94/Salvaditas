using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BKSalvaditas2.Models;
using BKSalvaditas2.Database;

namespace BKSalvaditas2.Database
{
    public class Visita
    {
        //Se crea una variable para capurar la conexcion de la base de datos
        private string CadenaString;
        private cn cadena = new cn();
    

        //Ingreso de la visita
        #region Ingreso de visitas
        public void IngresarVisita(visitaModel x)
        {
            CadenaString=cadena.conexcion();
            SqlConnection Con = new SqlConnection(CadenaString);
            
            try
            {

                SqlCommand comandos = new SqlCommand("sp_IngresoVisita", Con);
                comandos.CommandType = CommandType.StoredProcedure;


                Con.Open();

                comandos.Parameters.AddWithValue("@IDCEDULA",x.idCedula);
                comandos.Parameters.AddWithValue("@IdEmpleado", x.IdEmpleado);
                comandos.Parameters.AddWithValue("@Motivo", x.motivo);
                comandos.Parameters.AddWithValue("@IdDepartamento", x.IdDepartamento);

                SqlDataReader leer = comandos.ExecuteReader();

                
                
                
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
            }
            finally { Con.Close(); }
        }

        #endregion


    }
}
