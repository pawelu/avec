# Avec

Ponieważ nauka z innymi to tyle frajdy! :sunny:

### Instalacja

Do uruchomienia aplikacji należy wykonać następujące kroki

1. Sklonować repozytorium na dysk: `git clone git@github.com:szemek/avec.git`
2. Zainstalować wszystkie zależności: `bundle`
3. Zainstalować MongoDB:
  * Ubuntu `sudo apt-get install mongodb`
  * OS X `brew install mongodb`
  * Windows lub ręczna instalacja [Downloads - MongoDB](http://www.mongodb.org/downloads)
4. Zarejestrować nową aplikację poprzez [New OAuth Application](https://github.com/settings/applications/new) podając następujące dane:
  * Homepage URL `http://localhost:3000/`
  * Authorization callback URL `http://localhost:3000/auth/github/callback`
5. Po zarejestrowaniu nowej aplikacji należy skopiować `Client ID, Client Secret`, następnie stworzyć plik `.env` w katalogu projektu i dodać do niego konfigurację zamieniając `Client ID, Client Secret` na skopiowane ciągi znaków.
  
  ```
    GITHUB_KEY="Client ID"
    GITHUB_SECRET="Client Secret"
  ```
6. Uruchomić i cieszyć się z działającej aplikacji :smile:
