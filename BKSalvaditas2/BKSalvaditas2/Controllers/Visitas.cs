using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BKSalvaditas2.Database;
using BKSalvaditas2.Models;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BKSalvaditas2.Controllers

{



    [Route("api/[controller]")]
    [ApiController]


    public class Visitas : ControllerBase
    {



        // GET: api/<Visitas>
        [HttpGet]
        public IEnumerable<string> Get()
        {

            return new string[] { "value1", "value2" };
        }

        // GET api/<Visitas>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {

            return "value";



        }

        // POST api/<Visitas>
        [HttpPost]
        public IActionResult Post([FromBody] visitaModel x)
        {
            try
            {
                Visita visitaDB = new Visita();
                visitaDB.IngresarVisita(x);
                return Ok(visitaDB);
            }
            catch (Exception ex)
            {

                return BadRequest(ex);
            }
     
        }

        // PUT api/<Visitas>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {

        }

        // DELETE api/<Visitas>/5
        [HttpDelete("{id}")] 
        public void Delete(int id)
        {
        }
    }
}
