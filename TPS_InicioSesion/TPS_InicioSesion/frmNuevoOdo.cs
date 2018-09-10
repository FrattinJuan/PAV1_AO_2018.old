using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPS_InicioSesion
{
    public partial class frmNuevoOdo : Form
    {
        BDHelper oDatos = new BDHelper();//caddena de conexion
        bool nuevo = false;
        public frmNuevoOdo()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmNuevoOdo_Load(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void txtMatricula_TextChanged(object sender, EventArgs e)
        {

        }

        private void cmbTipodoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable tabla = oDatos.consultarTabla("tipodocumento");
            cmbTipodoc.DataSource = tabla;
            cmbTipodoc.ValueMember = tabla.Columns[0].ColumnName;
            cmbTipodoc.DisplayMember = tabla.Columns[1].ColumnName;
        }
    }
}
