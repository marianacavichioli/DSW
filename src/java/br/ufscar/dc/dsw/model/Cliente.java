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
public class Cliente extends Usuario{
    
    private int id;
    private String data_nascimento;
    private String sexo;
    private String cpf;
    private String telefone;

    public Cliente(int id, String sexo, String cpf, String telefone, String data_nascimento){
        super(null, null, null, null);
        this.id = id;
        this.data_nascimento = data_nascimento;
        this.sexo = sexo;
        this.cpf = cpf;
        this.telefone = telefone;
    }
    
    public Cliente(int id, String data_nascimento, String sexo, String cpf, String telefone, String senha, String email, String nome, String ativo) {
        super(senha, email, nome, ativo);
        this.id = id;
        this.data_nascimento = data_nascimento;
        this.sexo = sexo;
        this.cpf = cpf;
        this.telefone = telefone;
    }
       
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(String data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }    
}
