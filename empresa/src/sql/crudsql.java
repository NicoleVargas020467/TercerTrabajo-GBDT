package sql;
import getset.variables;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

public class crudsql {
    conexionsql con=new conexionsql();
    java.sql.Statement st;
    ResultSet rs;
    variables var = new variables();
    public void insertar(String id_entrenamiento, String Fecha_inicio, String Fecha_final, String Duracion, String Costo){
        try {
            Connection conexion=con.conectar();
            java.sql.Statement st=conexion.createStatement();
            String sql="insert into Entrenamiento(id_entrenamiento,Fecha_inicio,Fecha_final,Duracion,Costo)" + 
                    " values('"+id_entrenamiento+"','"+Fecha_inicio+"','"+Fecha_final+"','"+Duracion+"','"+Costo+"');";
            st.execute(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null,"El registro se guardo correctamente", "Mensaje", JOptionPane.INFORMATION_MESSAGE);        
        } catch (Exception e) {
             JOptionPane.showMessageDialog(null,"El registro no se guardo "+e, "Mensaje", JOptionPane.ERROR_MESSAGE);
        }   
    }    
    public void buscar(String id_entrenamiento){
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "select * from entrenamiento where id_entrenamiento ='" + id_entrenamiento + "';";
            rs = st.executeQuery(sql);
            if (rs.next()) {
                var.setId_entrenamiento(rs.getString("id_entrenamiento"));
                var.setFecha_inicio(rs.getString("fecha_inicio"));
                var.setFecha_final(rs.getString("fecha_final"));
                var.setDuracion(rs.getString("duracion"));
                var.setCosto(rs.getString("costo"));
            } else {
                var.setId_entrenamiento("");
                var.setFecha_inicio("");
                var.setFecha_final("");
                var.setDuracion("");
                var.setCosto("");
                JOptionPane.showMessageDialog(null, "No se encontro registro", "Sin registro", JOptionPane.INFORMATION_MESSAGE);
            }
            st.close();
            conexion.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el sistema de busqueda", "Error busqueda", JOptionPane.ERROR_MESSAGE);
        }
    }
    public void actualizar(String id_entrenamiento, String Fecha_inicio, String Fecha_final, String Duracion, String Costo) {
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "update entrenamiento set id_entrenamiento='" + id_entrenamiento + "',fecha_inicio='" + Fecha_inicio + 
                    "',fecha_final='" + Fecha_final + "',duracion='" + Duracion + "',costo='" + Costo + "' where id_entrenamiento = '"
                    +id_entrenamiento+"'; ";
            st.executeUpdate(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "El registro se actualizo", "Exito", JOptionPane.INFORMATION_MESSAGE);
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al actualizar " + e, "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    public void eliminar(String id_entrenamiento) {
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "delete from entrenamiento where id_entrenamiento='" + id_entrenamiento + "';";
            st.executeUpdate(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Registro eliminado correctamente", "Eliminado", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al eliminar registro" + e, "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void insertar1(String id_empresa, String Nombre_empresa, String Ruc, String Pagina_Web, String Contacto){
        try {
            Connection conexion=con.conectar();
            java.sql.Statement st=conexion.createStatement();
            String sql="insert into empresa(id_empresa,nombre_empresa,ruc,pagina_web,contacto)" + " values('"+id_empresa+"','"
                    +Nombre_empresa+"','"+Ruc+"','"+Pagina_Web+"','"+Contacto+"');";
            st.execute(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null,"El registro se guardo correctamente", "Mensaje", JOptionPane.INFORMATION_MESSAGE);        
        } catch (Exception e) {
             JOptionPane.showMessageDialog(null,"El registro no se guardo "+e, "Mensaje", JOptionPane.ERROR_MESSAGE);
        }   
    }    
    public void buscar1(String id_empresa){
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "select * from empresa where id_empresa ='" + id_empresa + "';";
            rs = st.executeQuery(sql);
            if (rs.next()) {
                var.setId_empresa(rs.getString("id_empresa"));
                var.setNombre_empresa(rs.getString("nombre_empresa"));
                var.setRuc(rs.getString("ruc"));
                var.setPagina_web(rs.getString("pagina_web"));
                var.setContacto(rs.getString("contacto"));
            } else {
                var.setId_empresa("");
                var.setNombre_empresa("");
                var.setRuc("");
                var.setPagina_web("");
                var.setContacto("");
                JOptionPane.showMessageDialog(null, "No se encontro registro", "Sin registro", JOptionPane.INFORMATION_MESSAGE);
            }
            st.close();
            conexion.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en el sistema de busqueda", "Error busqueda", JOptionPane.ERROR_MESSAGE);
        }
    }
     public void actualizar1(String id_empresa, String Nombre_empresa, String Ruc, String Pagina_Web, String Contacto) {
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "update empresa set id_empresa='" + id_empresa + "',nombre_empresa='" + Nombre_empresa + "',ruc='" + Ruc + 
                    "',pagina_web='" + Pagina_Web + "',contacto='" + Contacto + "' where id_empresa = '"+id_empresa+"'; ";
            st.executeUpdate(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "El registro se actualizo", "Exito", JOptionPane.INFORMATION_MESSAGE);
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al actualizar " + e, "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
     public void eliminar1(String id_empresa) {
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "delete from empresa where id_empresa='" + id_empresa + "';";
            st.executeUpdate(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Registro eliminado correctamente", "Eliminado", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al eliminar registro" + e, "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
     public void transaccion_contrato(String id_contrato, String id_horario, String id_empresa, String nombre_contrato,
            String costo_contrato) {
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "CALL contrato('"+id_contrato+"','"+id_horario+"','"+id_empresa+"','"+nombre_contrato+"','"
                    +costo_contrato+"');";
            st.execute(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Transacción Exitosa", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la transacción " + e, "Mensaje", JOptionPane.ERROR_MESSAGE);
        }
    }
     public void transaccion_facturacion(String id_factura, String id_contrato, String fecha_fact,
            String total_fact) {
        try {
            Connection conexion=con.conectar();
            st = conexion.createStatement();
            String sql = "CALL facturacion('"+id_factura+"','"+id_contrato+"','"+fecha_fact+"','"+total_fact+"');";
            st.execute(sql);
            st.close();
            conexion.close();
            JOptionPane.showMessageDialog(null, "Transacción Exitosa", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error en la transacción " + e, "Mensaje", JOptionPane.ERROR_MESSAGE);
        }
    }
}
