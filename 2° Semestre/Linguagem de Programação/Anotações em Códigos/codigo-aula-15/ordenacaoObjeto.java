public List<Plano> ordenarPlanosPorMensalidade() {
    List<Plano> listaPlanos = new ArrayList<>(this.planos);

    for (Integer i = 0; i < listaPlanos.size() - 1; i++) {
        Integer menorMensalidade = i;

        for (Integer j = i + 1; j < listaPlanos.size(); j++) {
            double mensalidadeAtual = listaPlanos.get(j).calcularMensalidade();
            double menorAtual = listaPlanos.get(menorMensalidade).calcularMensalidade();

            if (listaPlanos.get(j).calcularMensalidade() < listaPlanos.get(menorMensalidade).calcularMensalidade()) {
                menorMensalidade = j;
            }
        }

        Plano auxiliar = listaPlanos.get(menorMensalidade);
        listaPlanos.set(menorMensalidade, listaPlanos.get(i));
        listaPlanos.set(i, auxiliar);
    }

    return listaPlanos;
}
