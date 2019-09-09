package com.natame.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class Producto {
	@Column(name="IDPRODUCTO")
	@Id
	private int IDPRODUCTO;
	
	@Column(name="NOMBREPRODUCTO", nullable = false, length= 50)
	private String NOMBREPRODUCTO;

	//LEFT
	@JoinColumn(name = "IDIMPUESTO", referencedColumnName = "IDIMPUESTO")
	private Impuesto IDIMPUESTO;
}