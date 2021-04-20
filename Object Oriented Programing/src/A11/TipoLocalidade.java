package A11;

public enum TipoLocalidade {
	
	Vila("Vila ") , Aldeia("Aldeia "), Cidade("Cidade ") , Indefinido("");
	
	
	
	//Codigo para o Indefinido("") funcionar
private final String TipoLocalidade;
TipoLocalidade(String TipoLocalidade){
    this.TipoLocalidade = TipoLocalidade;
}

@Override
public String toString(){
	return this.TipoLocalidade;
}
}