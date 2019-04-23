package br.ufscar.dc.dsw.model;

public class Administrador extends Usuario {
    
    private int id;
    
    public Administrador(String senha, String email, int ativo) {
        super(senha, email, ativo);
        this.id = super.getId();
    }
    
}
