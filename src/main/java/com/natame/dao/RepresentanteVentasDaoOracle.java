package com.natame.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.natame.auth.Usuario;
import com.natame.model.RepresentanteVentas;
import com.natame.util.RHException;
import com.natame.util.ServiceLocator;

public class RepresentanteVentasDaoOracle implements IRepresentanteVentasDao{

	@Override
	public void registrarRepresentanteVentas(RepresentanteVentas rp, Usuario user) throws RHException {
	      try {
	          String strSQL = "INSERT INTO NATAME.REPRESENTANTEVENTAS VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	          Connection conexion = ServiceLocator.getInstance().tomarConexion(user);
	          PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	          prepStmt.setInt(1, rp.getIDENTIFICACION()); 
	          prepStmt.setString(2, rp.getNOMBRE());
	          prepStmt.setString(3, rp.getCORREOELECTRONICO()); 
	          prepStmt.setString(4, rp.getGENERO()); 
	          prepStmt.setString(5, rp.getFECHANACIMIENTO()); 
	          prepStmt.setString(6, rp.getFECHACONTRATO()); 
	          prepStmt.setString(7, rp.getTELEFONOCONTACTO()); 
	          prepStmt.setString(8, rp.getDIRECCION());
	          prepStmt.setString(9, rp.getESDIRECTOR());
	          prepStmt.setInt(10, rp.getGRADO());
	          prepStmt.setInt(11, rp.getREGION());
	          prepStmt.executeUpdate();
	          prepStmt.close();
	          ServiceLocator.getInstance().commit();
	        } catch (Exception e) {
	        	throw new RHException( this.getClass().getName(), " Error en registrarRepresentanteVentas() "+ e.getMessage());
			}  finally {
	           ServiceLocator.getInstance().liberarConexion();
	        }
	}
	
	@Override
	public RepresentanteVentas buscarRepresentanteVentas(int identificacion, Usuario user) throws RHException {
		RepresentanteVentas resultado = new RepresentanteVentas();
		try {
			String strSQL = "SELECT * FROM NATAME.REPRESENTANTEVENTAS WHERE PK_N_IDENTIFICACION=?";
			Connection conexion = ServiceLocator.getInstance().tomarConexion(user);
			PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        prepStmt.setInt(1, identificacion); 
	        ResultSet rs = prepStmt.executeQuery();
	        rs.next();
	        resultado.setNOMBRE(rs.getString("V_NOMBRE"));
	        resultado.setCORREOELECTRONICO(rs.getString("V_CORREOELECTRONICO"));
	        resultado.setGENERO(rs.getString("V_GENERO"));
	        resultado.setFECHANACIMIENTO(rs.getString("D_FECHANACIMIENTO"));
	        resultado.setFECHACONTRATO(rs.getString("D_FECHACONTRATO"));
	        resultado.setTELEFONOCONTACTO(rs.getString("V_TELEFONOCONTACTO"));
	        resultado.setDIRECCION(rs.getString("V_DIRECCION"));
	        resultado.setESDIRECTOR(rs.getString("V_ESDIRECTOR"));
	        resultado.setGRADO(rs.getInt("FK_N_IDGRADO"));
	        resultado.setREGION(rs.getInt("FK_N_IDREGION"));
	        prepStmt.close();
	        return resultado;
			}catch (Exception e) {
	    	   throw new RHException( this.getClass().getName(), "Error en buscarRepresentanteVentas "+ e.getMessage());
			}  finally {
	          ServiceLocator.getInstance().liberarConexion();
	       }
		
	}

}