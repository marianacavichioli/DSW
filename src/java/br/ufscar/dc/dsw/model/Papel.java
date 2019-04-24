/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.model;

/**
 *
 * @author rafaelsaito
 */
public class Papel {
    
    private int id;
    private String email;
    private String nome;
    
    public Papel(int id, String email, String nome) {
        this.id = id;
        this.email = email;
        this.nome = nome;
    }
    
    public Papel(String email, String nome) {
        this.email = email;
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
