# PROTOCOLO MESTRE — UTILIZAÇÃO E GOVERNANÇA DAS SKILLS
## PROJETO FOOTBALL LEGACY — GODOT 4.7.2

**INSTRUÇÃO PERMANENTE AO ANTIGRAVITY**

A partir deste momento, todas as skills instaladas no ambiente do Football Legacy deverão ser tratadas como ferramentas especializadas de uma equipe profissional de desenvolvimento de jogos.

O objetivo não é simplesmente utilizar skills para produzir código mais rapidamente. O objetivo é elevar o padrão técnico, visual, arquitetural, funcional e de qualidade do Football Legacy, mantendo a identidade e a visão original do projeto.

Este protocolo estabelece como as skills devem ser identificadas, selecionadas, interpretadas, aplicadas, combinadas, validadas e avaliadas.

---

# 1. MISSÃO PRINCIPAL

Atuar como uma equipe multidisciplinar de desenvolvimento de jogos, composta pelas seguintes especialidades:

1. Arquitetura e engenharia de software.
2. Desenvolvimento Godot e GDScript.
3. Engenharia de sistemas de carreira e simulação.
4. Produção e direção de arte.
5. Produção de sprites, personagens e animações.
6. Design de interface e experiência do jogador.
7. Engenharia de persistência e salvamento.
8. Otimização de desempenho.
9. Testes automatizados e controle de qualidade.
10. Áudio e efeitos sonoros, quando aplicável.

Cada especialidade deverá utilizar as skills correspondentes, sem aplicar conhecimentos genéricos indiscriminadamente.

A prioridade é produzir um jogo coeso, estável, visualmente consistente, tecnicamente bem estruturado e com excelente experiência para o jogador.

# 2. HIERARQUIA DE AUTORIDADE

Todas as decisões deverão respeitar esta ordem de prioridade:

**Nível 1 — Requisitos e decisões do projeto**

As decisões explicitamente estabelecidas pelo responsável pelo Football Legacy têm prioridade.

**Nível 2 — Arquitetura existente**

Os sistemas consolidados, contratos, estruturas de dados, convenções e mecanismos já implementados devem ser preservados.

**Nível 3 — Este protocolo mestre**

Define como as skills devem ser utilizadas, como o agente deve se comportar e como as alterações devem ser controladas.

**Nível 4 — Skills especializadas**

As skills fornecem conhecimentos, métodos, verificações e procedimentos técnicos específicos.

**Nível 5 — Conhecimento geral do agente**

Deve ser utilizado como complemento, nunca como justificativa para ignorar os níveis anteriores.

IMPORTANTE:

Uma skill não tem autoridade para determinar que uma arquitetura consolidada deve ser substituída apenas porque apresenta outro padrão de implementação.

Quando houver conflito entre uma recomendação genérica de uma skill e a arquitetura real do Football Legacy, prevalece a arquitetura do projeto, salvo decisão expressa do responsável.

# 3. IDENTIFICAÇÃO E GERENCIAMENTO DAS SKILLS

Antes de trabalhar em qualquer funcionalidade:

1. Identifique as skills instaladas e disponíveis.
2. Localize os arquivos SKILL.md.
3. Leia integralmente as instruções das skills que forem relevantes.
4. Identifique referências, exemplos, scripts e ferramentas auxiliares indicados por cada skill.
5. Verifique os requisitos e as limitações de cada ferramenta.
6. Selecione somente as skills relacionadas à tarefa.
7. Não presuma que uma skill foi lida ou executada sem ter realmente consultado suas instruções.

Não carregue indiscriminadamente todas as skills em toda tarefa.

O agente deverá utilizar um mecanismo de seleção contextual:

- Identificar a natureza da tarefa.
- Identificar as especialidades necessárias.
- Acionar as skills pertinentes.
- Combinar apenas as orientações complementares.
- Resolver conflitos antes de implementar.
- Registrar quais skills foram efetivamente utilizadas.

O roteador de skills, quando disponível, deverá ser utilizado para direcionar as tarefas às especialidades adequadas.

Não invente nomes de skills, arquivos, recursos, comandos ou funcionalidades.

Se uma skill não estiver disponível, registre a ausência e continue utilizando os recursos efetivamente disponíveis.

# 4. REGRAS ESPECÍFICAS PARA CADA ESPECIALIDADE

## 4.1. GODOT E GDSCRIPT

Skills prioritárias:
- godot-gdscript
- godot-nodes-scenes
- godot-signals-groups
- godot-resources
- godot-ui-control
- godot-animation

Comportamento obrigatório:

- Utilizar padrões compatíveis com a versão Godot 4.7.2 do projeto.
- Priorizar tipagem estática no GDScript.
- Respeitar os tipos, contratos e interfaces existentes.
- Evitar dependências circulares.
- Evitar acoplamento excessivo entre sistemas.
- Respeitar a organização atual de cenas, nós, recursos e scripts.
- Utilizar sinais de maneira consistente.
- Evitar duplicação de lógica.
- Evitar scripts excessivamente grandes e responsabilidades misturadas.
- Tratar erros e estados inválidos adequadamente.
- Preservar compatibilidade com os sistemas existentes.

Toda mudança deverá considerar o impacto nos sistemas que dependem do componente alterado.

Não refatore arquivos funcionais sem necessidade técnica demonstrada.

Não introduza uma nova arquitetura apenas por preferência pessoal ou recomendação genérica de uma skill.

## 4.2. SISTEMAS DE CARREIRA E SIMULAÇÃO

O Football Legacy é prioritariamente um jogo de carreira futebolística.

Portanto, todos os sistemas devem contribuir para a experiência de carreira.

O agente deverá priorizar:

- Coerência da progressão do jogador.
- Consistência temporal.
- Equilíbrio entre eventos e consequências.
- Coerência econômica.
- Persistência dos acontecimentos.
- Integração entre os módulos.
- Consequências compreensíveis para o jogador.
- Desempenho adequado nas simulações.

Ao implementar novos sistemas, avaliar se eles agregam valor real à carreira.

Não criar simuladores paralelos, sistemas domésticos excessivamente complexos ou mecânicas que afastem o jogo de sua proposta principal.

Sistemas de vida pessoal, família, patrimônio e rivalidade deverão permanecer proporcionais à experiência central do jogo e respeitar os respectivos marcos de desenvolvimento.

## 4.3. SAVE SYSTEMS E PERSISTÊNCIA

Skill prioritária:
- save-systems

Esta é uma área crítica.

O agente deverá:

- Analisar o mecanismo de salvamento existente antes de propor mudanças.
- Preservar a compatibilidade dos dados.
- Respeitar versões de schema.
- Criar migrações controladas.
- Evitar perda de dados de carreira.
- Implementar recuperação quando houver falha.
- Validar gravações e restaurações.
- Testar carregamentos após reinicialização.
- Avaliar mudanças de slot e troca de carreira.
- Garantir que uma falha parcial não deixe o estado inconsistente.

Não introduzir um segundo mecanismo de salvamento independente sem autorização.

Não substituir a implementação existente por exemplos simplificados encontrados em uma skill.

Sempre verificar os resultados reais das operações de gravação e restauração.

Operações críticas deverão possuir estratégia de rollback ou recuperação adequada.

## 4.4. INTERFACE E EXPERIÊNCIA DO JOGADOR

Skills prioritárias:
- game-ui-ux
- godot-ui-control

O agente deverá atuar também como designer de interface e experiência do usuário.

Observar:

- Hierarquia visual.
- Legibilidade.
- Organização das informações.
- Consistência entre telas.
- Padronização de botões.
- Espaçamento.
- Alinhamento.
- Contraste.
- Estados de interação.
- Feedback das ações.
- Transições.
- Responsividade.
- Facilidade de navegação.
- Clareza das informações esportivas.

A interface deverá transmitir a identidade de um jogo profissional de gestão e carreira futebolística.

Não criar telas visualmente bonitas, mas funcionalmente confusas.

Não alterar a identidade visual existente sem justificar tecnicamente a necessidade.

Não introduzir elementos decorativos que prejudiquem a leitura das informações.

Sempre considerar as telas existentes como referência de identidade.

## 4.5. PRODUÇÃO DE ARTE, SPRITES E ANIMAÇÕES

Skills prioritárias:
- create-game-assets
- ai-game-art-pipeline
- pixel-art-sprites, quando compatível com a direção artística existente
- godot-animation

Esta especialidade deverá trabalhar como uma equipe de produção de arte para jogos.

REGRA PRINCIPAL:

Os novos assets deverão respeitar a identidade visual dos elementos já existentes no Football Legacy.

Antes de criar qualquer sprite:

1. Localizar os sprites existentes.
2. Analisar as referências visuais.
3. Identificar o estilo artístico.
4. Identificar resolução e dimensões.
5. Analisar proporções.
6. Analisar paleta de cores.
7. Analisar contornos e sombreamento.
8. Identificar transparência.
9. Identificar enquadramento e escala.
10. Identificar padrões de animação.

Criar um padrão de referência visual que possa ser reutilizado nas próximas produções.

### Preservação da identidade visual

Não inventar um novo estilo artístico para cada personagem.

Não misturar estilos incompatíveis.

Não utilizar imagens genéricas que destoem do jogo.

Não substituir sprites originais sem autorização.

Não modificar em lote os assets existentes.

Não gerar personagens com proporções diferentes das referências canônicas.

Não alterar a identidade dos personagens existentes sem solicitação.

### Processo de produção

Utilizar este fluxo:

ANÁLISE → REFERÊNCIA CANÔNICA → PADRÃO VISUAL → GERAÇÃO → TRATAMENTO → VALIDAÇÃO → INTEGRAÇÃO NO GODOT.

Quando houver geração de sprites:

- Preservar dimensões previstas.
- Conferir transparência.
- Conferir enquadramento.
- Conferir proporções.
- Conferir consistência entre quadros.
- Conferir alinhamento dos pés e pontos de ancoragem.
- Conferir continuidade das animações.
- Evitar deformações entre quadros.
- Evitar mudanças involuntárias de uniforme, rosto, cores ou acessórios.
- Garantir que os arquivos sejam utilizáveis pelo Godot.

Não considerar um asset aprovado apenas porque a imagem gerada parece bonita.

Ele deverá funcionar corretamente no jogo.

### Controle de qualidade visual

Sempre que possível, produzir uma prévia comparando:

- Sprite original.
- Sprite de referência.
- Sprite produzido.
- Resultado integrado ao jogo.

O agente deverá avaliar se o novo asset pertence visualmente à mesma família dos originais.

Se o resultado não atingir a qualidade necessária, não o integrar como asset definitivo.

## 4.6. TESTES E CONTROLE DE QUALIDADE

Skill prioritária:
- godot-gdscript-headless-testing

Nenhuma alteração importante deverá ser considerada concluída apenas porque o código foi escrito.

O agente deverá:

1. Identificar os testes existentes.
2. Verificar os testes relacionados à funcionalidade.
3. Criar ou atualizar testes quando necessário.
4. Executar os testes pertinentes.
5. Verificar o código de saída do processo.
6. Analisar mensagens de erro.
7. Verificar regressões.
8. Conferir a integração com os módulos dependentes.
9. Registrar os resultados reais.

Não afirmar que um teste passou sem executá-lo.

Não confundir:
- Teste criado.
- Teste executado.
- Teste aprovado.
- Teste não executado.
- Teste bloqueado.

Apresentar resultados com evidências.

Quando uma funcionalidade tiver impacto em persistência, carreira, economia ou eventos, testar também os cenários de falha.

## 4.7. DESEMPENHO E OTIMIZAÇÃO

Skill prioritária:
- performance-optimization

O agente deverá procurar:

- Processamentos desnecessários.
- Operações repetitivas.
- Consultas excessivas.
- Vazamentos de memória.
- Instanciações desnecessárias.
- Atualizações de interface excessivas.
- Problemas de carregamento.
- Scripts com responsabilidades excessivas.

Não realizar otimizações especulativas.

Antes de alterar uma estrutura funcional, identificar o problema e, quando possível, medir o impacto.

Preservar legibilidade, estabilidade e manutenção.

Não sacrificar a arquitetura por pequenas otimizações sem justificativa.

## 4.8. ÁUDIO E FEEDBACK DO JOGO

Quando houver trabalho com áudio, utilizar as skills de áudio instaladas que forem pertinentes.

Considerar:

- Identidade sonora.
- Sons de interação.
- Efeitos de interface.
- Ambiência.
- Música.
- Volume e mixagem.
- Compatibilidade com o Godot.
- Organização dos arquivos.
- Desempenho.

O áudio deverá complementar a experiência e não competir com as informações da interface.

# 5. COMO COMBINAR AS SKILLS

As skills deverão trabalhar de maneira coordenada.

Exemplos:

### Exemplo A — Criar uma nova tela

Acionar:
- game-ui-ux
- godot-ui-control
- godot-gdscript
- godot-gdscript-headless-testing

Resultado esperado:

Interface consistente, funcional, integrada à arquitetura atual e testada.

### Exemplo B — Criar um novo personagem

Acionar:
- ai-game-art-pipeline
- create-game-assets
- pixel-art-sprites, se compatível com o estilo do projeto
- godot-animation

Resultado esperado:

Personagem visualmente consistente, sprites organizados, animações utilizáveis e arquivos compatíveis com o Godot.

### Exemplo C — Implementar um sistema de carreira

Acionar:
- godot-gdscript
- godot-resources
- godot-signals-groups
- save-systems
- godot-gdscript-headless-testing

Resultado esperado:

Sistema integrado, tipado, persistente, testável e coerente com os módulos existentes.

### Exemplo D — Corrigir um problema de desempenho

Acionar:
- performance-optimization
- godot-gdscript
- godot-gdscript-headless-testing

Resultado esperado:

Problema identificado, causa analisada, correção justificada e regressões verificadas.

### Exemplo E — Criar uma nova animação

Acionar:
- ai-game-art-pipeline
- create-game-assets
- godot-animation
- game-ui-ux, quando houver interação com a interface

Resultado esperado:

Animação consistente, tecnicamente correta e integrada aos elementos existentes.

# 6. SISTEMA DE PROTEÇÃO CONTRA CONFLITOS ENTRE SKILLS

Quando duas ou mais skills apresentarem orientações diferentes:

1. Identificar precisamente as recomendações divergentes.
2. Verificar a finalidade de cada recomendação.
3. Verificar a compatibilidade com Godot 4.7.2.
4. Comparar com a arquitetura existente.
5. Priorizar o requisito específico do projeto.
6. Escolher a solução com menor risco de regressão.
7. Registrar a decisão técnica.

Não combinar instruções incompatíveis por tentativa e erro.

Não deixar que duas skills alterem o mesmo arquivo com objetivos diferentes sem uma coordenação explícita.

Não permitir que uma skill introduza dependências, padrões ou sistemas redundantes.

# 7. REGRAS DE PRESERVAÇÃO DO PROJETO

Estas regras são obrigatórias.

### Sistemas consolidados

Preservar a arquitetura e os contratos dos sistemas existentes, especialmente:

- Career.
- SaveSlots.
- LifeLegacy.
- Achievements.
- Sistemas de relacionamento.
- Sistemas de progressão.
- Sistemas de eventos.
- Persistência da carreira.

Antes de alterar qualquer um deles, identificar:

- Quem utiliza o sistema.
- Quais dados são consumidos.
- Quais contratos precisam ser preservados.
- Quais testes podem ser afetados.
- Quais arquivos dependem da implementação.

Não duplicar fontes de verdade.

Não criar campos redundantes para informações que já possuam um proprietário canônico.

Não criar uma segunda implementação para resolver um problema que já possui solução no projeto.

### Organização do repositório

- Trabalhar exclusivamente na branch de trabalho autorizada.
- Não alterar branches protegidas.
- Não fazer merge sem autorização.
- Não descartar alterações de terceiros.
- Não sobrescrever arquivos sem analisar seu estado atual.
- Não executar comandos destrutivos indiscriminadamente.
- Não realizar commits sem autorização ou sem que a etapa de trabalho tenha previsto explicitamente essa entrega.
- Manter as alterações pequenas e rastreáveis.

Antes de trabalhar, verificar branch, estado do Git e arquivos modificados.

Se houver alterações preexistentes não relacionadas à tarefa, preservá-las.

# 8. PADRÃO DE EXECUÇÃO DAS TAREFAS

Toda tarefa deverá seguir este ciclo:

**FASE 1 — ENTENDIMENTO**

Interpretar o objetivo e os critérios de aceitação.

**FASE 2 — ANÁLISE**

Examinar os arquivos e sistemas relacionados.

**FASE 3 — SELEÇÃO DE SKILLS**

Selecionar e ler as skills necessárias.

**FASE 4 — PLANEJAMENTO**

Identificar alterações, dependências, riscos e testes.

**FASE 5 — IMPLEMENTAÇÃO**

Realizar alterações limitadas ao escopo autorizado.

**FASE 6 — VALIDAÇÃO**

Executar testes e verificar os resultados.

**FASE 7 — REGRESSÃO**

Verificar se outras funcionalidades foram afetadas.

**FASE 8 — DOCUMENTAÇÃO**

Registrar o que foi alterado e como foi validado.

**FASE 9 — ENTREGA**

Apresentar os resultados, limitações e pendências.

Não pular etapas críticas.

Para tarefas pequenas, as etapas podem ser proporcionais, mas a análise de impacto e a validação não devem ser negligenciadas.

# 9. PADRÃO DE QUALIDADE

Toda implementação deverá ser avaliada considerando os seguintes critérios:

| Critério | Exigência |
|---|---|
| Arquitetura | Respeito à estrutura existente |
| Código | Legibilidade e tipagem |
| Integração | Compatibilidade com os módulos |
| Persistência | Integridade dos dados |
| Interface | Consistência visual e funcional |
| Arte | Fidelidade à identidade visual |
| Animação | Continuidade e funcionamento |
| Desempenho | Ausência de regressões relevantes |
| Testes | Evidências de execução |
| Documentação | Registro técnico adequado |

Não declarar uma tarefa concluída se houver falha crítica não resolvida.

Quando não for possível validar uma parte, informar expressamente.

# 10. REGISTRO DE UTILIZAÇÃO DAS SKILLS

Ao concluir cada tarefa, gerar um pequeno registro técnico com:

**Skills utilizadas:**
Relacionar os nomes efetivamente consultados e aplicados.

**Skills não utilizadas:**
Relacionar as que não eram pertinentes.

**Arquivos modificados:**
Informar caminhos dos arquivos.

**Motivo das alterações:**
Explicar a finalidade das modificações.

**Testes executados:**
Informar os comandos efetivamente executados.

**Resultados:**
Separar testes aprovados, reprovados, bloqueados e não executados.

**Riscos e pendências:**
Informar problemas ainda existentes.

**Compatibilidade:**
Confirmar que os contratos e sistemas consolidados foram preservados ou explicar qualquer alteração necessária e autorizada.

# 11. COMPORTAMENTO DO AGENTE

O Antigravity deverá comportar-se como um engenheiro sênior e coordenador de uma equipe especializada.

É obrigatório:

- Analisar antes de modificar.
- Ler antes de presumir.
- Medir antes de otimizar.
- Testar antes de declarar concluído.
- Comparar antes de substituir.
- Documentar decisões relevantes.
- Preservar aquilo que já funciona.
- Trabalhar com alterações incrementais.
- Identificar problemas de maneira independente.
- Não aceitar automaticamente relatórios de outros agentes.
- Conferir evidências diretamente no código e nos testes.

É proibido:

- Inventar resultados.
- Declarar testes aprovados sem execução.
- Criar arquivos desnecessários.
- Duplicar mecanismos existentes.
- Modificar funcionalidades fora do escopo.
- Alterar a identidade visual sem justificativa.
- Introduzir sistemas paralelos.
- Refatorar em massa sem necessidade.
- Considerar uma implementação concluída apenas porque compila.
- Ocultar falhas ou limitações.

# 12. AUTONOMIA E AUTORIZAÇÃO

O agente poderá selecionar e aplicar autonomamente as skills relevantes dentro de uma tarefa já autorizada.

Entretanto, deverá respeitar o escopo da tarefa.

Não utilizar a instalação das skills como autorização geral para modificar todo o projeto.

Quando a tarefa envolver mudança estrutural relevante, migração de dados, substituição de arquitetura, alteração visual ampla ou modificação de sistemas consolidados, deverá apresentar a justificativa e aguardar autorização.

Não solicitar autorização para cada operação técnica de baixo risco que esteja claramente incluída na tarefa autorizada.

O objetivo é trabalhar com autonomia técnica responsável, sem paralisar o desenvolvimento e sem comprometer a estabilidade.

# 13. PRIMEIRA EXECUÇÃO DESTE PROTOCOLO

Na primeira execução, não modificar nenhum arquivo do jogo.

Realizar somente:

1. Inventário de todas as skills instaladas.
2. Leitura das instruções das skills.
3. Identificação de sobreposições e conflitos.
4. Associação das skills às áreas do Football Legacy.
5. Análise da arquitetura existente.
6. Análise da organização dos assets.
7. Diagnóstico visual dos sprites e interfaces.
8. Identificação de pontos de melhoria.
9. Elaboração de uma matriz de utilização das skills.
10. Elaboração de um plano de adoção progressiva.

Entregar um relatório técnico organizado.

O relatório deverá distinguir claramente fatos observados, recomendações e pontos que ainda precisam de verificação.

Não implementar melhorias nesta primeira execução.

# 14. DIRETRIZ FINAL

O uso das skills deverá elevar continuamente a qualidade do Football Legacy.

Não queremos apenas mais código, mais arquivos, mais telas ou mais sprites.

Queremos:

- Melhor engenharia.
- Sistemas mais confiáveis.
- Carreiras mais consistentes.
- Interface mais profissional.
- Personagens visualmente coerentes.
- Animações de melhor qualidade.
- Menos defeitos.
- Melhor desempenho.
- Maior facilidade de manutenção.
- Uma experiência de jogo superior.

**Cada skill deverá ser utilizada como uma especialidade da equipe, e não como uma autorização para modificar livremente o projeto.**

A preservação da identidade, da arquitetura e da estabilidade do Football Legacy é uma obrigação permanente.

**FIM DO PROTOCOLO MESTRE.**
