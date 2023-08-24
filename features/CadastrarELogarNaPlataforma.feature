Feature: Cadastrar e logar na plataforma

  Como usuário
  Quero poder cadastrar na plataforma por autenticação Google e a comum
  Para que possa utilizar a aplicação após realizar o cadastro/login

Scenarios: Cadastro com autenticação Google
  Given que estou na página de cadastro
  When seleciono a opção de autenticar com o Google
  Then sou redirecionado para a página de autenticação do Google
  And após autenticar com sucesso, sou redirecionado de volta para a aplicação
  And vejo um formulário de perfil para preencher

Scenarios: Cadastro com e-mail e senha
  Given que estou na página de cadastro
  When seleciono a opção padrão de autenticação
  And preencho meu e-mail e senha corretamente
  And confirmo a senha
  Then sou redirecionado para um formulário de perfil
  And os campos obrigatórios são exibidos

Scenarios: Preenchimento do perfil de educador
  Given que estou no formulário de perfil
  When escolho "Educador" como tipo de usuário
  And preencho os campos obrigatórios: Nome, Sobrenome, Data de nascimento
  And escolho "Faculdade (Curso)" como Bacharelado
  And informo a Universidade de formação
  And escolho "Formado" como "Sim"
  And informo a Data de entrada e formação
  And escolho "Pós-Graduado" como "Sim"
  And escolho "Mestrado" como opção
  And informo a Universidade de formação do Mestrado
  And informo a Data de entrada e formação do Mestrado
  And escolho "Doutorado" como opção
  And informo a Universidade de formação do Doutorado
  And informo a Data de entrada e formação do Doutorado
  And envio o formulário
  Then sou redirecionado para a página principal da aplicação

Scenarios: Preenchimento do perfil de estudante
  Given que estou no formulário de perfil
  When escolho "Estudante" como tipo de usuário
  And preencho os campos obrigatórios: Nome, Sobrenome, Data de nascimento
  And escolho "Faculdade (Curso)" como Bacharelado
  And informo a Universidade de formação
  And escolho "Formado" como "Não"
  And informo a Data de entrada
  And envio o formulário
  Then sou redirecionado para a página principal da aplicação

Feature: Publicar artigo

  Como usuário
  Quero poder publicar meus artigos na plataforma
  Para que outras pessoas possam ler e adicionar no meu perfil e no ranqueamento +1 artigo publicado

Scenarios: Publicar um artigo com campos obrigatórios preenchidos
  Given que estou logado na plataforma
  And estou na página principal
  When clico no botão "Publicar"
  Then um modal é aberto
  And vejo um campo obrigatório para o título do artigo
  And vejo um campo obrigatório para o link do artigo
  And clico em "Publicar"
  Then o modal é fechado
  And vejo o novo post no feed
  And o contador de artigos publicados no meu perfil é incrementado em 1

Scenarios: Publicar um artigo com campos obrigatórios e opcionais preenchidos
  Given que estou logado na plataforma
  And estou na página principal
  When clico no botão "Publicar"
  Then um modal é aberto
  And preencho o título do artigo
  And preencho o link do artigo
  And preencho a descrição do post
  And avalio o artigo mencionado
  And clico em "Publicar"
  Then o modal é fechado
  And vejo o novo post no feed
  And o contador de artigos publicados no meu perfil é incrementado em 1

Scenarios: Cancelar a publicação de um artigo
  Given que estou logado na plataforma
  And estou na página principal
  When clico no botão "Publicar"
  Then um modal é aberto
  And preencho o título do artigo
  And preencho o link do artigo
  And clico em "Cancelar"
  Then o modal é fechado
  And não vejo o novo post no feed
  And o contador de artigos publicados no meu perfil não é incrementado

Scenarios: Marcar artigo como lido ao publicar
  Given que estou logado na plataforma
  And estou na página principal
  And há um artigo que já li
  When clico no botão "Publicar"
  Then um modal é aberto
  And preencho o título do artigo
  And preencho o link do artigo
  And marco a checkbox de "Já li esse artigo"
  And clico em "Publicar"
  Then o modal é fechado
  And vejo o novo post no feed
  And o contador de artigos publicados no meu perfil é incrementado em 1
  And o contador de artigos lidos no meu perfil é incrementado em 1
  And o botão de "Artigo Lido" no post está ativado

Feature: Ler artigo

  Como usuário
  Quero poder ler artigos na plataforma, seja meu ou de outras pessoas
  Para que seja adicionado +1 artigo lido no meu perfil e no ranqueamento

Scenarios: Marcar um artigo como lido
  Given que estou logado na plataforma
  And estou na página de um artigo que quero ler
  When leio o artigo até o final
  And clico no botão "Marcar como Lido"
  Then o botão indica que o artigo foi lido
  And o contador de artigos lidos no meu perfil é incrementado em 1

Feature: Avaliar artigo

  Como usuário
  Posso avaliar o artigo que eu li
  Para que eu possa deixar minha opinião sobre o artigo

Scenarios: Avaliar um artigo
  Given que estou logado na plataforma
  And estou na página de um artigo que quero avaliar
  When clico no botão "Avaliar"
  Then um modal é aberto
  And vejo uma sequência de 5 estrelas
  When clico em uma estrela para definir a nota do artigo
  And clico em "Avaliar" dentro do modal
  Then os dados da avaliação são enviados para o banco
  And a nota do artigo no post é atualizada com a nota escolhida

Feature: Ranqueamento de Perfil

  Como usuário
  Quero que o meu contador do perfil seja incrementado ao ler ou publicar um artigo
  Para estar mais à frente no ranqueamento daqueles que leram e publicaram mais artigos

Scenarios: Visualizar ranqueamento de publicações
  Given que estou logado na plataforma
  When acesso a página de ranqueamento
  Then vejo uma lista dividida em duas categorias: publicações e leitura
  And a lista de publicações exibe os usuários ordenados pelo número de artigos publicados
  And o meu nome aparece na lista de publicações com a posição correspondente ao meu número de artigos publicados

Scenarios: Visualizar ranqueamento de leitura
  Given que estou logado na plataforma
  When acesso a página de ranqueamento
  Then vejo uma lista dividida em duas categorias: publicações e leitura
  And a lista de leitura exibe os usuários ordenados pelo número de artigos lidos
  And o meu nome aparece na lista de leitura com a posição correspondente ao meu número de artigos lidos

Scenarios: Incrementar contador de artigos publicados
  Given que estou logado na plataforma
  And estou na página de publicação de um artigo
  When publico um artigo
  Then o contador de artigos publicados no meu perfil é incrementado em 1
  And o número de artigos publicados é registrado no banco

Scenarios: Incrementar contador de artigos lidos
  Given que estou logado na plataforma
  And estou na página de um artigo que quero ler
  When leio o artigo até o final
  And clico no botão "Marcar como Lido"
  Then o contador de artigos lidos no meu perfil é incrementado em 1
  And o número de artigos lidos é registrado no banco

Feature: Compartilhamento do artigo

  Como usuário
  Quero poder compartilhar externamente qualquer artigo
  Para que possa mostrar a outras pessoas algum artigo

Scenarios: Gerar link de compartilhamento
  Given que estou logado na plataforma
  And estou na página de um artigo que quero compartilhar
  When clico no botão "Compartilhar"
  Then um modal é aberto
  And vejo um link gerado para compartilhamento externo
  And vejo uma opção para compartilhar pelo WhatsApp

Scenarios: Acessar artigo pelo link compartilhado
  Given que um usuário acessa o link de compartilhamento
  When abre o link no navegador
  Then é direcionado para uma página estática do artigo
  And vê a imagem do usuário que publicou o artigo
  And vê o nome do usuário
  And vê a descrição do post
  And vê a avaliação do artigo
  And vê o conteúdo completo do artigo

Scenarios: Compartilhar artigo pelo WhatsApp
  Given que estou logado na plataforma
  And estou na página de um artigo que quero compartilhar
  When clico no botão "Compartilhar"
  And seleciono a opção de compartilhar pelo WhatsApp
  Then o WhatsApp é aberto com uma mensagem que inclui o link de compartilhamento do artigo

