# projeto-simpat

Sistema para gerenciar bens patrimoniais do HUB.

> SIMPAT - Sistema de Gerenciamento e Movimentação Patrimoniais

Desde quando entrei na Unidade de Patrimônio detectei a necessidade de um sistema de gerenciamento dos bens do HUB, fora do SIADS, pois o HUB não possui apenas bens SIADS. E com o inventário do ano de 2024 pude perceber qual rápido precisamos de um sistema para gerenciar não somente as movimentações, mas principalmente o inventário.

# Composição de bens patrimoniados do HUB

1. SIADS
2. FUB
3. GDF
4. Bens S/P

Isso dificulta muito o gerenciamento das movimentações da UPAT e consequentemente o inventário anual.

Checklist para o SIMAPT

- [ ] - Detecção do risco do atual sistema de inventário
- [ ] - Levantamento de requisitos
- [ ] - Gerar relatório
- [ ] - Gerar um página para bens não localizado. Assim que o bem for encontrado sai e vai para encontrados


# APP Movimentação de bens da UPAT

O app Movimentação de bens da UPAT abrange, cadastro de bens, cadastro de número de série, cadastro de UORGs e pode ser expandido para outros cadastros.
Não funciona somente no celular, funciona e muito bem via navegador.

## Tabelas existentes no aplicativo

| Movimentacao      | Inventário         | Nº serie      | Bens               | UOROGS      |
| :-------          | :-------           | :-------      | :-------           | :-------    |
| id_movimentacao   | id_inventario      | id_serial     | id_bem             | uorg        |
| data              | num_patrim         | num_serie     | siads              | Descricao   |
| hora              | data               | data          | descricao_bem      | Localizacao | 
| num_patrim_fub    | hora               | num_patrim    | estado_conservacao |             |
| num_patrim_ebserh | descricao_bem      | descricao_bem |
| num_siads         | estado_conservacao |
| bem               | local              |

Essas colunas atualmente atende praticamente toda o gerenciamento de bens do HUB, é possível gerar gráficos e até relatórios, mas ainda não conta com a 
exportação para outros softwares, como pdf e xlxs.

## Base de dados do aplicativo

A base de dados foi gerada a partir da extração de dados pela planilha de extração disponibilizada pela **Ebserh SEDE** (Ebserh e SIADS) e também de planilhas de inventários anteriores.
Os números de patrimônio da FUB foram extraídos de planilha contendo os números de patrimônio fub vinculados ao número de patrimÔnio Ebserh.





### Importante

O aplicativo foi desenvolvido com o `APPSHEET` do Google e a fonte de dados é armazenada no `Google Sheets - Planilhas Google`. 

**AppSheet**
> É uma plataforma de desenvolvimento de aplicativos sem código, que permite aos usuários criar e implantar aplicativos mobile e web a partir de dados armazenados em planilhas ou bancos de dados.

Porém o AppSheet é uma ferramenta paga após a implantação do aplicativo, enquanto está somente em teste é grátis até 10 usuários.

Agora o AppSheet faz parte do pacote `Office 365 da Microsoft` e como a Ebserh tem a licença empresarial ficou mais fácil para expandir o app.

![image](https://github.com/user-attachments/assets/01790586-66e0-48a8-bd01-6de711a7b55d)

### Lembretes

- [ ] - Criar relatório de inventário
- [ ] - Criar algo para bem baixado
