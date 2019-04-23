package br.ufscar.dc.dsw.model;

public class Usuario {
    
    private int id;
    private String email;
    private String senha;
    private int ativo;

    public Usuario(String senha, String email, int ativo){
        this.senha = senha;
        this.email = email;
        this.ativo = ativo;
    }
    
    public Usuario(String email, int ativo){
        this.email = email;
        this.ativo = ativo;
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

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public int getAtivo() {
        return ativo;
    }

    public void setAtivo(int ativo) {
        this.ativo = ativo;
    }
}
