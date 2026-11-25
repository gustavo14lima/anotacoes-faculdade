public List<String> getNomesAlunosOrdenados() {
    List<String> nomesOrdenados = new ArrayList<>();

    for (Aluno aluno : alunos) {
        nomesOrdenados.add(aluno.getNome());
    }

    for (int i = 0; i < nomesOrdenados.size() - 1; i++) {
        Integer indiceMenorNome = i;

        for (Integer j = i + 1; j < nomesOrdenados.size(); j++) {
            String nomeAtual = nomesOrdenados.get(j);
            String menorNome = nomesOrdenados.get(indiceMenorNome);

            if (nomeAtual.compareTo(menorNome) < 0) {
                indiceMenorNome = j;
            }
        }

        String auxiliar = nomesOrdenados.get(indiceMenorNome);
        nomesOrdenados.set(indiceMenorNome, nomesOrdenados.get(i));
        nomesOrdenados.set(i, auxiliar);
    }

    return nomesOrdenados;
}