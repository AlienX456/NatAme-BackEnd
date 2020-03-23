package com.natame.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.natame.auth.Usuario;
import com.natame.model.Pedido;
import com.natame.util.RHException;
import com.natame.util.ServiceLocator;

public class PedidoDaoOracle implements IPedidoDao{

	@Override
	public Pedido[] obtenerListaPedidos(Usuario user) throws RHException {
		ArrayList<Pedido> lista = new ArrayList<Pedido>();
		try {
			String strSQL = "SELECT * FROM PEDIDO WHERE K_ASOCIACION IN " + 
							"(SELECT K_SECUENCIA FROM ASOCIACION WHERE (K_TIPOIDCLIENTE, K_IDCLIENTE) " + 
							"IN (SELECT K_TIPOIDCLIENTE, K_IDCLIENTE FROM CLIENTE " + 
							"WHERE C_USUARIO='testnomcliente2'))";
			Connection conexion = ServiceLocator.getInstance().tomarConexion(user);
			PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        ResultSet rs = prepStmt.executeQuery();
	        while(rs.next()) {
	        	lista.add(new Pedido(rs.getInt("K_PEDIDO"), rs.getString("I_ESTADOPEDIDO"), rs.getInt("K_CALIFICACION"), rs.getString("F_PEDIDO"), 
	        			rs.getString("I_MODOPAGO"), rs.getInt("T_VALOR"), rs.getInt("K_ASOCIACION")));
	        }
	        prepStmt.close();
			}catch (Exception e) {
	    	   throw new RHException( this.getClass().getName(), "Error en verPedidoes() "+ e.getMessage());
			}finally {
			  ServiceLocator.getInstance().liberarConexion(); 
	       }
			return lista.toArray(new Pedido[lista.size()]);
	}


	@Override
	public void calificarPedido(int calificacion, Usuario user) throws RHException {
		// TODO Auto-generated method stub
		
	}
		
	
}
