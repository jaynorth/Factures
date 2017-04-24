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
            Console.WriteLine("test");

            Console.ReadKey();

            Client cl = new Client
            {
                Id = 3,
                Nom = "Rochat",
                Prenom = "Roger",
                DateNaissance = DateTime.Now,
                Rue = "hjkvadhkjghkjadhg",
                Npa = 1234,
                Localite = "Pully"
            }
            ;

            using (FactIDECEntities context = new FactIDECEntities())
            {
                context.Database.Log = Console.WriteLine;
                context.Clients.Add(cl);
                context.SaveChanges();
                
            };
        }
    }
}
