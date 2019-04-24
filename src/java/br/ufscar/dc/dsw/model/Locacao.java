package br.ufscar.dc.dsw.model;

import java.sql.Date;
import java.sql.Time;

public class Locacao {

    private int id;
    private String cpf_cliente;
    private String cnpj_locadora;
    private String dia;
    private String hora;
    
    public Locacao(int id, String cpf_cliente, String cnpj_locadora, String dia, String hora) {
        this.id = id;
        this.cpf_cliente = cpf_cliente;
        this.cnpj_locadora = cnpj_locadora;
        this.dia = dia;
        this.hora = hora;
    } 

    public Locacao(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpf_cliente() {
        return cpf_cliente;
    }

    public void setCpf_cliente(String cpf_cliente) {
        this.cpf_cliente = cpf_cliente;
    }

    public String getCnpj_locadora() {
        return cnpj_locadora;
    }

    public void setCnpj_locadora(String cnpj_locadora) {
        this.cnpj_locadora = cnpj_locadora;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
}
