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
            int i=0;
            string wyraz = "";

                using (StreamReader sr = new StreamReader("C:/windows/restart_counter.txt"))
                {
                    richTextBox1.Text = sr.ReadToEnd();
                }


            string[] tab = richTextBox1.Lines;
            //MessageBox.Show("Len: " + tab.Length.ToString());

            for(int j=0; j<tab.Length; j++){
                if ((tab[j].Contains("[")) && (tab[j].Contains("]")))
                {
                    wyraz = tab[j].Substring(1,tab[j].Length-2);
                    i = Int32.Parse(wyraz);
                }

            }

            i = i + 1;
            //MessageBox.Show(i.ToString());

            richTextBox1.AppendText("\n");
            richTextBox1.AppendText("\n");
            richTextBox1.AppendText("[" +  i.ToString() + "]");
            richTextBox1.AppendText("\n");
            richTextBox1.AppendText(DateTime.Now.Day + "." + DateTime.Now.Month + "." + DateTime.Now.Year + "    " + DateTime.Now.Hour + ":" + DateTime.Now.Minute);


            /*
            //string s = richTextBox1.Text;
            byte[] data = Encoding.UTF8.GetBytes(richTextBox1.Text);
            string path = @"C:/windows/restart_counter.txt";
            FileStream fs = new System.IO.FileStream(path, FileMode.Create);
            fs.Write(data, 0, data.Length);
            fs.Close();
             * */

            richTextBox1.SaveFile("C:/windows/restart_counter.txt", RichTextBoxStreamType.PlainText);

            this.Close();
            
        }
    }

}