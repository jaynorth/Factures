using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factures
{
    class Program
    {
        public static void Main(string[] args)
        {
                   
              Client cl = new Client
            {
                
                Nom = "ZUFFERES",
                Prenom = "Jean",
                DateNaissance = DateTime.Now,
                Rue = "hjkvadhkjghkjadhg",
                Npa = 1234,
                Localite = "Lausanne"
            }
            ;

           


            using (FactIDECEntities context = new FactIDECEntities())
            {
                context.Database.Log = Console.WriteLine;
                //context.Clients.Add(cl);
                //context.SaveChanges();

                List<Client> listeClients = new List<Client>(context.Clients);

            foreach(Client c in listeClients)
                {
                    Console.WriteLine(c.Nom);
                }



            };

            

            

            Console.ReadKey();
        }
    }
}
