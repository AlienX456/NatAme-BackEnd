package com.natame.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Producto {
	@Column(name="PK_N_IDPRODUCTO")
	@Id
	private int IDPRODUCTO;
	
	@Column(name="V_NOMBREPRODUCTO", nullable = false, length= 50)
	private String NOMBREPRODUCTO;

}
