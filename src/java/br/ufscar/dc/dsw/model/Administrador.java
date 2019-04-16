/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.model;

/**
 *
 * @author mariana
 */
public class Administrador extends Usuario {
    
    private int id;
    
    public Administrador(String senha, String email, String nome, String ativo) {
        super(senha, email, nome, ativo);
        this.id = super.getId();
    }
    
}
