1) Jaka jest różnica między `ENTRYPOINT` a `CMD`?

**Odpowiedź:**
- `ENTRYPOINT` - program uruchamiany zawsze p rzy starcie kontenera
- `CMD` - domyślne argumenty dla `ENTRYPOINT` - jak `ENTRYPOINT` nie ma - `CMD` jest  domyślnym poleceniem kontenera.

2) Jak każdą z powyższych opcji nadpisać podczas uruchamiania kontenera?

**Odpowiedź:** 
- `CMD` - podajemy argumenty po nazwie obrazu
```
docker run --rm ascii-banner /app/inny_plik.txt
```
- `ENTRYPOINT` - trzeba dodać flagę `--entrypoint` -  przyjmuje tylko  program - 

3) Jaka jest różnica między `ADD` a `COPY`?

**Odpowiedź:**
- `COPY` - kopiuje pliki (i katalogi) - z kontekstu budowania do obrazu. 
- `ADD` - robi to samo + automatycznie rozpakowuje archiwa (`.tar`, `.tar.gz`) + potrafi pobierać pliki z URL

4) Czy tylko jedno słowo kluczowe `FROM` może występować w pojedynczym pliku Dockerfile?

**Odpowiedź:**

- Można używać wielu `FROM` - budowanie wieloetapowe. Każde `FROM` zaczyna  nowy etap z własnym obrazem. Z wcześniejszych etapów kopiuje się artefakty przez `COPY --from=<etap>`.
- Końcowy obraz powstaje z ostatniego etapu (chyba że wskaże się inny przez `--target`). Finalny obraz nie ma narzędzi potrzebnych tylko do budowania. 
- Można dodać `ARG` przed pierwszym `FROM`.

