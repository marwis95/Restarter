using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace Restarter
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            int i;

                using (StreamReader sr = new StreamReader("C:/windows/restart_counter.txt"))
                {
                    // Read the stream to a string, and write the string to the console.
                    String line = sr.ReadToEnd();
                    i = Int32.Parse(line);
                    Console.WriteLine(line);
                }

            //MessageBox.Show(i.ToString());
            i = i + 1;


            string s = i.ToString();
            byte[] data = Encoding.UTF8.GetBytes(s);
            string path = @"C:/windows/restart_counter.txt";
            FileStream fs = new System.IO.FileStream(path, FileMode.Create);
            fs.Write(data, 0, data.Length);
            fs.Close();
            this.Close();
        }
    }

}