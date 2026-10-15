df_grupo = rbind(dados.arthur,
                 dados.emanuelly,
                 dados.enzo,
                 dados.gustavo,
                 dados.maria,
                 dados.rafael)

boxplot(df_grupo$cpu[df_grupo$usuario == "arthur"],
        df_grupo$cpu[df_grupo$usuario == "emanuelly"],
        df_grupo$cpu[df_grupo$usuario == "enzo"],
        df_grupo$cpu[df_grupo$usuario == "gustavo"],
        df_grupo$cpu[df_grupo$usuario == "maria"],
        df_grupo$cpu[df_grupo$usuario == "rafael"],
        names = c("Arthur", "Emanuelly", "Enzo", "Gustavo", "Maria", "Rafael"),
        xlab = "Nome Integrantes",
        ylab = "Porcentagem Uso - CPU")

boxplot(df_grupo$ram[df_grupo$usuario == "arthur"],
        df_grupo$ram[df_grupo$usuario == "emanuelly"],
        df_grupo$ram[df_grupo$usuario == "enzo"],
        df_grupo$ram[df_grupo$usuario == "gustavo"],
        df_grupo$ram[df_grupo$usuario == "maria"],
        df_grupo$ram[df_grupo$usuario == "rafael"],
        names = c("Arthur", "Emanuelly", "Enzo", "Gustavo", "Maria", "Rafael"),
        xlab = "Nome Integrantes",
        ylab = "Porcentagem Uso - RAM")

boxplot(df_grupo$disco[df_grupo$usuario == "arthur"],
        df_grupo$disco[df_grupo$usuario == "emanuelly"],
        df_grupo$disco[df_grupo$usuario == "enzo"],
        df_grupo$disco[df_grupo$usuario == "gustavo"],
        df_grupo$disco[df_grupo$usuario == "maria"],
        df_grupo$disco[df_grupo$usuario == "rafael"],
        names = c("Arthur", "Emanuelly", "Enzo", "Gustavo", "Maria", "Rafael"),
        xlab = "Nome Integrantes",
        ylab = "Porcentagem Uso")