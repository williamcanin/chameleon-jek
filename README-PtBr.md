[Read in English](https://github.com/williamcanin/chameleon-jek/blob/master/README-en_US.md)

# Chameleon Jek - Blog & Portfolio para Jekyll <img src="https://raw.githubusercontent.com/williamcanin/chameleon-jek/raw/dev/assets/images/avatar/out.png" alt="jekyll cv creator image" width="7%" height="7%"/>

## Introdução

Chameleon Jek, é o template para [Jekyll](http://jekyllrb.com) construído especialmente para quem deseja ter um blog e um portfólio com rapidez e leveza e com maior possibilidade de customização em cores.

[![Demo Chameleon Jeky Colors](https://raw.githubusercontent.com/williamcanin/chameleon-jek/raw/dev/assets/images/preview/animation-no-border.gif)](https://raw.githubusercontent.com/williamcanin/chameleon-jek/raw/dev/assets/images/preview/animation-no-border.gif)

**Chameleon Jek** usa com [Twitter Bootstrap](http://getbootstrap.com), que lhe da maiores praticidades ao abrir sua página em um dispositivo Mobile em modo responsivo.

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

* 1 - Faça o clone do **Chameleon Jek** e entre na pasta do mesmo:

```
$ git clone https://github.com/williamcanin/chameleon-jek.git "chameleon-jek"
$ cd "chameleon-jek"
```

* 2 - Para os usuários Windows e Mac OS X, não existe um script configurador e instalador para o **Chameleon Jek**. Os Usuários terão que instalar manualmente os requerimentos (tabela de requerimentos no topo) de acordo com os instaladores dos Sistema Operativo

Após instalar os requerimentos, continue com os passos abaixo:

> IMPORTANTE: É recomendável que se use o terminal do Git, pois o Git contém
> programas Linux, como 'sed', 'cat', ...etc, que são necessários para a
> manipulação do **Chameleon Jek**.

* 3 - Instalando o Bundler:

```
$ gem install bundler  
```

* 4 - Instalando Gems necessárias para o **Chameleon Jek**:

```
$ bundle install
```

* 5 - Instalando as dependências do **Chameleon Jek** (Bower), compactando e minificando "stylesheets" e "javascripts", compilando **Chameleon Jek**:

```
$ npm install
```

* 6 - Iniciando o servidor Jekyll (com Livereload) no **Chameleon Jek**:

```
$ rake gulp:serve
```

## Configurações

As configurações estão no arquivo **"_config.yml"**. 

Esse arquivo é repartido por duas seções que contém variáveis, onde os seus valores serão impostos no template **Chameleon Jek**. Essas seções são:

* *SECTION CONFIG PUBLIC*: Nessa seção você deve configurar o valor de cada uma delas variáveis de acordo com sua necessidade.
* *SECTION CONFIG PRIVATE*: Nessa seção você não deve alterar nada, exeto que saiba o que está fazendo. Ela contém variáveis que serão manipuladas pelo **Chameleon Jek**, se fazer uma alteração sem saber, pode aparecer erros ou tirar a performace do **Chameleon Jek**.

> IMPORTANTE: Não modifique as variáveis de lugar em nenhuma das seções, 
> apenas os valores (em amarelo).

## Deploy para o GitHub

## DEMO 

Veja uma demonstração de como o **Chameleon Jek** irá se comportar no navegador.

[Chameleon Jek- Demo](http://williamcanin.github.io/chameleon-jek/)


## Issues

Faça as suas opiniões sobre o **Chameleon Jek**, em:

## [Leave your suggestions, compliments, criticisms or whatever suits you.](https://github.com/williamcanin/chameleon-jek/issues/1)

## Licença 

[MIT License (MIT)](https://opensource.org/licenses/MIT)
[Direitos autorais](http://github.com/williamcanin)

> Você pode alterar a estrutura do **Chameleon Jek** como desejar, desde que 
> não manipule os direitos autorais do projeto.






