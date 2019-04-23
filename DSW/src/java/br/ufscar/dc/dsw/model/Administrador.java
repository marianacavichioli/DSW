package br.ufscar.dc.dsw.model;

public class Administrador extends Usuario {
    
    private int id;
    
    public Administrador(String senha, String email, String nome, int ativo) {
        super(senha, email, nome, ativo);
        this.id = super.getId();
    }
    
}
