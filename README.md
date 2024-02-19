# Teste de Montague

Este é um repositório de estudo cuja intenção é implementar em Agda, utilizando da modalidade Flat, um framework de semântica computacional da linguagem natural através do arcabouço teórico da Semântica de Montague. Em específico, o repositório trata de fornecer formas lógicas para a interpretação das sentenças do Teste de Montague.

Em termos simples, a modalidade Flat é uma característica da linguagem Agda que permite que a Teoria de Tipos de Homotopia sejam aplicados computacionalmente para os fins do Teste de Montague. Para ler mais sobre essa modalidade, acesse o endereço a seguir: <https://agda.readthedocs.io/en/latest/language/flat.html>.

## Sentenças do Teste de Montague

![image](https://github.com/Lisanju/Montague-Test/assets/106002045/8812cd3d-fe33-4c57-b6ee-d40959d6262f)
- Fonte: Zwanzinger (2019) - Tabela 4.

## Arquivos do Repositório:

### Operador Comonádico ♭ - [flat.agda]

O arquivo flat.agda formaliza a teoria do operador comonádico ♭ para que o Teste de Montague possa ser executado.

É possível ler sobre comônadas em: <https://ncatlab.org/nlab/show/comonad#definition>.

### Lógica na Teoria dos Tipos de Homotopia - [logic.agda]

O arquivo logic.agda contém uma formalização da lógica na Teoria dos Tipos de Homotopia para que as proposições da linguagem natural possam ser interpretadas nos termos de tipos homotópicos.

É possível ler sobre a Teoria de Homotopia em: <https://pt.wikipedia.org/wiki/Teoria_da_homotopia>.

### Formalização Simplificada - [montaguetest_simple.agda]

O arquivo motanguetest_simple.agda contém uma formalização simplificada para as formas lógicas da sentenças do Teste de Montague. A ideia é que a formalização aqui seja de mais fácil leitura do que as que estão presentes no artigo de Zwanziger (2019). A diferença na versão simplificada está em que as proposições da linguagem natural não são necessariamente interpretadas como proposições em termos de tipos homotópicos.

### Formalização Oficial - [montaguetest_official.agda]

Por fim, o arquivo montaguetest_official.agda apresenta a formalização oficial de Zwanziger (2019), contendo a interpretação das formas lógicas das sentenças do Teste de Montague como estão presentes no artigo.

## Referências

MORRILL, G. & VALENTÍN, J. Computational coverage of type logical grammar: The Montague test. Colloque de Syntaxe et Sémantique à Paris, "Empirical issues in syntax and semantics 11". Paris: 2016.

ZWANZIGER, C. Dependently-Typed Montague Semantics in the Proof Assistant Agda-flat. In Proceedings of the 16th Meeting on the Mathematics of Language. Philippe de Groote, Frank Drewes, and Gerald Penn, Ed. Association for Computational Linguistics Anthology. 2019. Disponível em <https://www.aclweb.org/anthology/papers/W/W19/W19-5704/>.
