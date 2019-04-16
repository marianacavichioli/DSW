/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author mariana
 */
public class Locacao {

    private int id;
    private int id_cliente;
    private int id_locadora;
    private Date dia;
    private Time hora;
    
    public Locacao(int id, int id_cliente, int id_locadora, Date dia, Time hora) {
        this.id = id;
        this.id_cliente = id_cliente;
        this.id_locadora = id_locadora;
        this.dia = dia;
        this.hora = hora;
    } 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_locadora() {
        return id_locadora;
    }

    public void setId_locadora(int id_locadora) {
        this.id_locadora = id_locadora;
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }
    
}
