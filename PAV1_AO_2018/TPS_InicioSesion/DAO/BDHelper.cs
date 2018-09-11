using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

// Se debe usar todo bajo el mismo namespace
//namespace Clase4_Bugs.Data
namespace PAV1_AO_2018
{
    public class BDHelper
    {
        // Atributos
        private string cadenaConexion;
        private SqlConnection conexion;
        private SqlCommand comando;

        // Metodos
        // Cuando el metodo (debajo) no tiene parentesis, el lenguaje lo interpreta como una property (get or set)
        public string CadenaConexion
        {
            get { return cadenaConexion; }
            set { cadenaConexion = value; }
        }

        public SqlConnection Conexion
        {
            get { return conexion; }
            set { conexion = value; }
        }

        public SqlCommand Comando
        {
            get { return comando; }
            set { comando = value; }
        }

        // Metodo constructor
        // Se llama de la misma forma de la clase, es un metodo especial que no retorna nada
        public BDHelper()
        {
            cadenaConexion = "";
            conexion = null;
            comando = null;

        }
        public BDHelper(string cadenaConexion)
        {
            // el this indica que el primero es el atributo de la calse
            // luego del igual, se esta referenciando el parametro ingresado
            this.cadenaConexion = cadenaConexion;
            conexion = new SqlConnection();
            comando = new SqlCommand();
        }

        private void conectar()
        {
            conexion = new SqlConnection();
            conexion.ConnectionString = this.cadenaConexion;
            conexion.Open();
            comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandType = CommandType.Text;
        }

        private void desconectar()
        {
            conexion.Close();
        }

        public DataTable consultarTabla(string nombreTabla)
        {
            DataTable tabla = new DataTable();
            conectar();
            comando.CommandText = "SELECT * FROM " + nombreTabla;
            tabla.Load(comando.ExecuteReader());
            desconectar();

            return tabla;
        }

        public DataTable consultarSql(string ConsultaSql)
        {
            DataTable tabla = new DataTable();
            conectar();
            comando.CommandText = ConsultaSql;
            tabla.Load(comando.ExecuteReader());
            desconectar();

            return tabla;
        }

        public void actualizarBD(string sql)
        {
            conectar();
            comando.CommandText = sql;
            comando.ExecuteNonQuery();
            desconectar();

        }
    }
}
