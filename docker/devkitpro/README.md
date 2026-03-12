# devkitPro Docker environment

Questo ambiente Docker crea un'immagine Ubuntu con devkitPro installato e i pacchetti `devkitARM` e `libgba`.

Costruire e avviare il container (dal workspace root):

```bash
docker build -t gba-devkitpro -f docker/devkitpro/Dockerfile .
docker run --rm -it -v "$PWD":/workspaces/gba_games -w /workspaces/gba_games gba-devkitpro
```

Oppure usa lo script helper:

```bash
chmod +x docker/devkitpro/run.sh
docker/devkitpro/run.sh
```

All'interno del container puoi eseguire `dkp-pacman -S devkitARM libgba` se non è stato già installato, e poi buildare con `cd game02 && make`.
