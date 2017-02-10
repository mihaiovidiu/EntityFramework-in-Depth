using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vidzy
{
    class Program
    {
        static void Main(string[] args)
        {
            Modify_DataDirectory_Property();

            using (var context = new VidzyEntities())
            {
                
                // Add videos to database
                context.AddVideo("Hot Shots", new DateTime(2003, 1,1), "Comedy", Classification.Gold);
                context.AddVideo("American Gangster", new DateTime(1997, 1, 1), "Action", Classification.Platinum);

                // Save changes
                context.SaveChanges();
                
                // Display the videos
                foreach (var video in context.Videos)
                    Console.WriteLine(video.Name);
            }
        }

        static void Modify_DataDirectory_Property()
        {
            string executable = System.Reflection.Assembly.GetExecutingAssembly().Location;
            string path = (System.IO.Path.GetDirectoryName(executable));
            path = path.Split(new string[] { "\\bin\\Debug" }, StringSplitOptions.None)[0];
            AppDomain.CurrentDomain.SetData("DataDirectory", path);
        }
    }
}
