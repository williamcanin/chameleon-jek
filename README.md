[Read in English](https://github.com/williamcanin/chameleon-jek/blob/dev/README-en_US.md)

# Chameleon Jek - Blog & Portfólio para Jekyll <img src="https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/avatar/out.png" alt="Chameleon Jek Logotype" width="7%" height="7%"/>

<img src="https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/preview/cj-logo.png" alt="Chameleon Jek Logotype" width="55%" height="55%"/>

## Indíce

* [Introdução](https://github.com/williamcanin/chameleon-jek/blob/dev/README-PtBr.md#introdu%C3%A7%C3%A3o)
* [Requerimentos](https://github.com/williamcanin/chameleon-jek/blob/dev/README-PtBr.md#requerimentos)
* [Usando - Linux](https://github.com/williamcanin/chameleon-jek/tree/dev#usando)
* [Usando - Windows ou Mac OS X](https://github.com/williamcanin/chameleon-jek/blob/dev/README-PtBr.md#usu%C3%A1rios-windows-e-mac-os-x)
* [Configurações do Chameleon Jek](https://github.com/williamcanin/chameleon-jek/blob/dev/README-PtBr.md#configura%C3%A7%C3%B5es)
* [Deploy - GitHub](https://github.com/williamcanin/chameleon-jek/tree/dev#deploy---github)
* [Demo](https://github.com/williamcanin/chameleon-jek/tree/dev#demo)
* [Questões](https://github.com/williamcanin/chameleon-jek/tree/dev#quest%C3%B5es---issues)
* [Versões](https://github.com/williamcanin/chameleon-jek/tree/dev#vers%C3%B5es)
* [Licença & Direitos Autorais](https://github.com/williamcanin/chameleon-jek/tree/dev#licen%C3%A7a--direitos-autorais)
* [Créditos](https://github.com/williamcanin/chameleon-jek/tree/dev#cr%C3%89ditos)


## Introdução

**Chameleon Jek**, é o template para [Jekyll](http://jekyllrb.com) construído especialmente para quem deseja ter um blog e um portfólio com rapidez e leveza e com maior possibilidade de customização em cores.

O **Chameleon Jek** possui até 7(sete) cores diferentes para customizar:

[![Demo Chameleon Jeky Colors](https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/preview/animation-no-border.gif)](https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/preview/animation-no-border.gif)

**Chameleon Jek** usa [Twitter Bootstrap](http://getbootstrap.com), que lhe da maiores praticidades ao abrir sua página em um dispositivo Mobile em modo responsivo.

Usando ferramentas como Gulp, Bower e Rake para seu gerenciamento, criação de dependências, e configuração do **Chameleon Jek**, os usuários e praticantes de desenvolvimento, terão maior facilidade em manipular seu projeto. 

O **Chameleon Jek** faz o deploy do código compilado (pasta gh-pages) para GitHub na branch "gh-pages". Também faz deploy da branch "master". Caso o usuário queira implementar mais o **Chameleon Jek**, também é possível fazer o deploy para uma branch de desenvolvimento (dev). 

Essas funcionalidades e outros, estão presente através do Rakefile.
Para saber mais quais comandos os **Chameleon Jek** dispoe, execute:

```
$ rake help
```

## Requerimentos

| Requerido       | Como verificar      | Como instalar  |
| --------------- | ------------------- | -------------- | 
| Git             | `git --version`     | [Git](http://git-scm.com/) |
| Ruby            | `ruby -v`           | [Ruby](https://www.ruby-lang.org) |
| Gem             | `gem -v`            | **Ruby** contains **Gem** |
| Python          | `python --version`  | [Python](https://www.python.org/) |
| NodeJS          | `node -v`           | [Nodejs](http://nodejs.org/) |
| Npm             | `npm --version`     | **Nodejs** contains **Npm** |
| Gulp            | `gulp -v`           | `npm install -g gulp` |
| Bower           | `bower -v`          | `npm install -g bower` |
| Bundler         | `bundler -v`        | `gem install bundler` |


## Usando

### Usuários Linux

Se você é usuário Linux, terá mais facilidade em instalar o **Chameleon Jek** e todas as dependências do mesmo. O mínimo que você precisa ter instalado em sua máquina Linux é o [Git para Linux](https://git-scm.com/download/linux).

Com o Git instalado, siga as etapas abaixo:

* 1 - Faça o clone do **Chameleon Jek** e entre na pasta do mesmo:

```
$ git clone https://github.com/williamcanin/chameleon-jek.git "chameleon-jek"
$ cd "chameleon-jek"
```


* 2 - Agora, simplismente execute os 3(três) comandos abaixo (ordenadamente):

> NOTA: Aguarde o final de cada comando!


```
# bash linux.sh requirements
$ bash linux.sh init
$ bash linux.sh install
```

**Perguntas importantes:**

*O que os comandos acima faz?*

O primeiro comando: Deve ser executado com root (superusuário). Ele é responsável por instalar os Requerimentos (tabela acima) exigidos para rodar um projeto Jekyll.

O segundo comando: Deve ser executado com usuário normal, e não root.
Ele é responsavel por configurar o ambiente RubyGems para o usuário local e adicionar PATH para as Gems que serão instaladas com o terceiro comando.

O terceiro comando: Deve ser executado com usuário normal, e não root.
É o comando final, que irá instalar as Gems necessárias para o **Chameleon Jek**, as dependências (Bower), as compactação e minificação de "stylesheets" e "javascripts" e compilação do **Chameleon Jek**. 

> NOTA: Após executar os 3(três) comandos acima, o script "linux.sh" será 
> bloquedo, impedindo que usuário executa os comandos novamente. 
> SE QUISER EXECUTAR OS COMANDOS NOVAMENTE, EXECUTE O COMANDO: 
> "$ bash linux.sh reconfigure" PARA DESBLOQUEAR.

* 3 - Iniciando o servidor Jekyll (com Livereload) no **Chameleon Jek**:

```
$ rake gulp:serve
```

### Usuários Windows e Mac OS X

O mínimo que você precisa ter instalado em sua máquina Windows ou Mac OS X é o Git.

[Git - Windows](https://git-scm.com/download/win)

[Git - Mac OS X](https://git-scm.com/download/mac)

Com o Git instalado, siga as etapas abaixo:

> IMPORTANTE: É recomendável que se use o terminal do Git no Windows, pois o 
> Git contém programas Linux, como 'sed', 'cat', ...etc, que são necessários 
> para a manipulação do **Chameleon Jek**.

* 1 - Faça o clone do **Chameleon Jek** e entre na pasta do mesmo:

```
$ git clone https://github.com/williamcanin/chameleon-jek.git "chameleon-jek"
$ cd "chameleon-jek"
```

* 2 - Para os usuários Windows e Mac OS X, não existe um script configurador e instalador para o **Chameleon Jek**. Os Usuários terão que instalar manualmente os requerimentos (tabela de requerimentos no topo) de acordo com os instaladores dos Sistema Operativo

Após instalar os requerimentos, continue com os passos abaixo:

* 3 - Instalando o Bundler:

```
$ gem install bundler  
```

* 4 - Instalando Gems necessárias para o **Chameleon Jek**:

```
$ bundle install
```

* 5 - Instalando as dependências do **Chameleon Jek** (Bower), compactando e minificando "stylesheets" e "javascripts", e compilando **Chameleon Jek**:

```
$ npm install
```

* 6 - Iniciando o servidor Jekyll (com Livereload) no **Chameleon Jek**:

```
$ rake gulp:serve
```

## Configurações

**Texto**

As configurações de textos estão no arquivo **"_config.yml"**. 

Esse arquivo é repartido por duas seções que contém variáveis, onde os seus valores serão impostos no template **Chameleon Jek**. Essas seções são:

* *SECTION CONFIG PUBLIC*: Nessa seção você deve configurar o valor de cada uma dessas variáveis de acordo com sua necessidade.
* *SECTION CONFIG PRIVATE*: Nessa seção você **NÃO** deve alterar nenhuma variável (exeto que saiba o que está fazendo). Essa seção contém variáveis que serão manipuladas pelo **Chameleon Jek**, se fazer uma alteração sem saber, pode aparecer erros ou tirar a performace do **Chameleon Jek**.

> IMPORTANTE: Não modifique as variáveis de lugar em nenhuma das seções.

**Aparência de cores**

As configurações de cores na aparência do **Chameleon Jek**, é aplicada por comando Rake.

Para alterar a cor do **Chameleon Jek**, faça:

Exemplo:

```
$ rake theme:color:dark
```

Use `$ rake help` e veja como se aplica outras diferentes cores.



## Deploy - GitHub

Como **Chameleon Jek** você pode fazer deploy para o GitHub com apenas uma linha de comando. Siga os passos abaixo:

* 1 - Preparando ambiente de deploy.
 
Antes de fazer o deploy, entre na pasta do **Chameleon Jek** e remova a pasta **".git"** que foi gerada pelo clone do **Chameleon Jek**.

[ Se não sabe pra serve a pasta ".git", leia mais sobre o Git [Aqui](https://git-scm.com/book/pt-br/v1) ]

* 2 - Inicie um novo ambiente para o Git com o comando:

```
$ git init
```


* 3 - Adicione o endereço remoto do seu repositório no GiHub, exemplo:

```
$ git add remote origin <url do repositório>
```


* 4 - Agora o seu **Chameleon Jek** já está pronto para ser enviado para o seu repositório no GitHub.

Vamos entender mais quais recursos de deploy que o **Chameleon Jek** dispoe:

-> O recurso de deploy do **Chameleon Jek**, são para 3(três) tipos de branch:

* master
* dev
* gh-pages

* 4.1 - Para fazer deploy para a branch **master**, use o comando:

```
$ rake deploy:master
```

* 4.2 - Para fazer deploy para a branch **dev**, use o comando:

```
$ rake deploy:dev
```

*Caso queira utilizar um nome diferente em vez de **dev**, execute o comando:*

```
$ rake deploy:dev BRANCH="name_branch"
```

> NOTA: Essa branch **dev** (development) é especialmente para desenvolver o 
> projeto, para poder fazer um *merge* futuramente na branch **master**.

* 4.3 - Para fazer deploy para a branch **gh-pages**, use o comando:

```
$ rake deploy:ghpages
```

A branch **gh-pages** é uma branch no qual o seu site será visível, ou seja, já será possivel ver o **Chameleon Jek** funcionar na web através do navegador (com o seu endereço claro). 

## DEMO 

Veja uma demonstração de como o **Chameleon Jek** irá se comportar no navegador.

[Chameleon Jek- Demo](http://williamcanin.github.io/chameleon-jek/)

## Questões - (Issues)

Faça as suas opiniões sobre o **Chameleon Jek**, em:

## [Leave your suggestions, compliments, criticisms or whatever suits you.](https://github.com/williamcanin/chameleon-jek/issues/1)

## Versões

| Lançamento    | Versão    | Atualização relizada? |  Tipo
| --------------| ----------| --------------------|---------
| 2015/08/10    | 1.0.4     |  Sim                | Beta
| 2016/01/15    | 1.0.7     |  Sim                | Stable


## Licença & Direitos Autorais

Licença: [MIT License (MIT)](https://opensource.org/licenses/MIT)

Direitos Autorais: William C. Canin

*Você pode alterar a estrutura do Chameleon Jek como desejar, desde que não manipule os direitos autorais de William C.Canin no projeto*

## CRÉDITOS:

* Name: William C.Canin 
* Country: Brazil - SP
* EMail: william.costa.canin@gmail.com    
* GitHub: [williamcanin](http://github.com/williamcanin)
* Home page: [http://williamcanin.com](http://williamcanin.com)

---

[Voltar para topo](https://github.com/williamcanin/chameleon-jek/blob/dev/README-PtBr.md)





