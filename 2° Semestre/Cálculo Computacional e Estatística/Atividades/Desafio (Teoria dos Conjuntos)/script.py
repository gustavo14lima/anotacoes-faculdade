# Criando os portfólios para cada corretora

agora = ['ITSA4', 'ECOR3' ,'TAEE11', 'B3SA3', 'VALE3']
ativa = ['B3SA3', 'BBDC4', 'BBSE3', 'BRDT3', 'TAEE11', 'TRPL4', 'VALE3', 'VIVT3']
genial = ['CPFE3', 'BEEF3', 'CYRE3', 'SAPT4', 'TRPL4']
easynvest = ['B3SA3', 'AGRO3', 'COCA34', 'TAEE11', 'VALE3', 'ITSA4', 'ABEV3']
elite = ['BBDC4', 'BBSE3', 'BRSR6', 'EGIE3', 'ITSA4', 'SAPR11', 'TAEE11', 'TRPL4', 'VIVT3', 'VALE3']
guide = ['ALUP11', 'BBAS3', 'CYRE3', 'CPFE3', 'KLBN11', 'PSSA3', 'TIMS3', 'VALE3']
nova_futura = ['B3SA3', 'CYRE3', 'GGBR4', 'VIVT3', 'TRPL4']
orama = ['ABCB4', 'BBDC4', 'BEEF3', 'CESP6', 'EGIE3']

# Convertendo os portfólios em conjuntos

conjunto_agora = set(agora) 
conjunto_ativa = set(ativa) 
conjunto_genial = set(genial) 
conjunto_easynvest = set(easynvest) 
conjunto_elite = set(elite) 
conjunto_guide = set(guide) 
conjunto_nova_futura = set(nova_futura) 
conjunto_orama = set(orama) 

# Procurando se há uma ação em comum em todas as corretoras

acoes_comuns = conjunto_agora & conjunto_ativa & conjunto_genial & conjunto_easynvest & conjunto_elite & conjunto_guide & conjunto_nova_futura & conjunto_orama

print('-------------------------------------------------------------------')
print(f'Ações comuns em todas as corretoras: {"não possuem ações em comum" if not acoes_comuns else acoes_comuns}')
print('-------------------------------------------------------------------')

# Procurando se há uma ação em comum entre quatro corretoras
try: 
    corretoras_escolhidas = []

    while(len(corretoras_escolhidas) < 4):
        escolha_usuario = int(input(f"\nInsira uma corretora entre as abaixo\n1.Ágora \n2.Ativa \n3.Genial \n4. Easynvest \n5. Elite \n6.Guide \n7. Nova Futura \n8. Órama \nInsira a sua {len(corretoras_escolhidas) + 1}° opção: "))

        match escolha_usuario:
            case 1:
                corretoras_escolhidas.append(conjunto_agora)
            case 2:
                corretoras_escolhidas.append(conjunto_ativa) 
            case 3:
                corretoras_escolhidas.append(conjunto_genial) 
            case 4:
                corretoras_escolhidas.append(conjunto_easynvest) 
            case 5:
                corretoras_escolhidas.append(conjunto_elite) 
            case 6:
                corretoras_escolhidas.append(conjunto_guide) 
            case 7:
                corretoras_escolhidas.append(conjunto_nova_futura) 
            case 8:
                corretoras_escolhidas.append(conjunto_orama) 
            case _:
                print("Escolha uma opção válida!")

    acoes_comuns_usuario = corretoras_escolhidas[0] & corretoras_escolhidas[1] & corretoras_escolhidas[2] & corretoras_escolhidas[3]
    print('-------------------------------------------------------------------')
    print(f'As ações em comuns das corretoras que você escolheu foram: {"não possuem ações em comum" if not acoes_comuns_usuario else acoes_comuns_usuario}')

    # Indicando se há ações únicas para cada corretora e criando um conjunto de ações únicos de cada corretora
    acao_unica_corretora_1 = corretoras_escolhidas[0].difference(corretoras_escolhidas[1],  corretoras_escolhidas[2],  corretoras_escolhidas[3])
    acao_unica_corretora_2 = corretoras_escolhidas[1].difference(corretoras_escolhidas[0],  corretoras_escolhidas[2],  corretoras_escolhidas[3])
    acao_unica_corretora_3 = corretoras_escolhidas[2].difference(corretoras_escolhidas[1],  corretoras_escolhidas[0],  corretoras_escolhidas[3])
    acao_unica_corretora_4 = corretoras_escolhidas[3].difference(corretoras_escolhidas[1],  corretoras_escolhidas[2],  corretoras_escolhidas[0])

    print('-------------------------------------------------------------------')

    print(f'As ações únicas da 1° corretora escolhida são: {acao_unica_corretora_1}')
    print(f'As ações únicas da 2° corretora escolhida são: {acao_unica_corretora_2}')
    print(f'As ações únicas da 3° corretora escolhida são: {acao_unica_corretora_3}')
    print(f'As ações únicas da 4° corretora escolhida são: {acao_unica_corretora_4}')

    # Determinando as relações entre os portfólios das corretoras (subset ou superset)
    print('-------------------------------------------------------------------')

    primeiro_contem_segundo = corretoras_escolhidas[0].issuperset(corretoras_escolhidas[1])
    primeiro_contem_terceiro = corretoras_escolhidas[0].issuperset(corretoras_escolhidas[2])
    primeiro_contem_quarta = corretoras_escolhidas[0].issuperset(corretoras_escolhidas[3])

    segundo_contem_primeiro = corretoras_escolhidas[1].issuperset(corretoras_escolhidas[0])
    segundo_contem_terceiro = corretoras_escolhidas[1].issuperset(corretoras_escolhidas[2])
    segundo_contem_quarta = corretoras_escolhidas[1].issuperset(corretoras_escolhidas[3])

    terceiro_contem_primeiro = corretoras_escolhidas[2].issuperset(corretoras_escolhidas[0])
    terceiro_contem_segundo = corretoras_escolhidas[2].issuperset(corretoras_escolhidas[1])
    terceiro_contem_quarta = corretoras_escolhidas[2].issuperset(corretoras_escolhidas[3])

    quarto_contem_primeiro = corretoras_escolhidas[3].issuperset(corretoras_escolhidas[0])
    quarto_contem_segundo = corretoras_escolhidas[3].issuperset(corretoras_escolhidas[1])
    quarto_contem_terceiro = corretoras_escolhidas[3].issuperset(corretoras_escolhidas[2])

    print(f'A primeira corretora: {"contém o portfólio da segunda" if primeiro_contem_segundo else "não contém o portfólio da segunda"}, {"contém o portfólio da terceira" if primeiro_contem_terceiro else "não contém o portfólio da terceira"}, {"contém o portfólio da quarta" if primeiro_contem_quarta else "não contém o portfólio da quarta"}')

    print(f'A segunda corretora: {"contém o portfólio da primeira" if segundo_contem_primeiro else "não contém o portfólio da primeira"}, {"contém o portfólio da terceira" if segundo_contem_terceiro else "não contém o portfólio da terceira"}, {"contém o portfólio da quarta" if segundo_contem_quarta else "não contém o portfólio da quarta"}')

    print(f'A terceira corretora: {"contém o portfólio da primeira" if terceiro_contem_primeiro else "não contém o portfólio da primeira"}, {"contém o portfólio da segunda" if terceiro_contem_segundo else "não contém o portfólio da segunda"}, {"contém o portfólio da quarta" if terceiro_contem_quarta else "não contém o portfólio da quarta"}')

    print(f'A quarta corretora: {"contém o portfólio da primeira" if quarto_contem_primeiro else "não contém o portfólio da primeira"}, {"contém o portfólio da segunda" if quarto_contem_segundo else "não contém o portfólio da segunda"}, {"contém o portfólio da terceira" if quarto_contem_terceiro else "não contém o portfólio da terceira"}')

except ValueError:
    print('Insira um valor correto!')