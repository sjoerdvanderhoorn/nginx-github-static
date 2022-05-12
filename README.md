# nginx-github-static
Docker container that clones a Git repository and hosts its static content using nginx. It can connect to both public and private repositories, will perform a `git clone` followed by `npm install` and places the files in the `/usr/share/nginx/html/` directory which is exposed through port `80`.

# Usage

To pull and run `nginx-github-static`, simply provide the `REPOSITORY_URL` environmental variable and map the port:
`docker run --e REPOSITORY_URL=https://github.com/twbs/bootstrap -p 8080:80 --restart=unless-stopped nginx-github-static`

Private repositories can be access by providing a username and access token.

* Open https://github.com/settings/tokens/new
* Select `public_repo` and add a description.
* Save the settings and copy the access token.

`docker run --e REPOSITORY_URL=https://USERNAME:ACCESSTOKEN@github.com/twbs/bootstrap -p 8080:80 --restart=unless-stopped nginx-github-static`

Every time the container is restarted, it will clone the latest content from the Git repository.
