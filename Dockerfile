# Usa l'immagine di base python:3.10-buster
FROM python:3.10-buster

# Aggiungi un utente chiamato worker senza password e senza informazioni aggiuntive.
RUN adduser --disabled-password --gecos "" worker

# Imposta l'utente worker come utente corrente
USER worker

# Imposta la directory di lavoro per l'utente worker
WORKDIR /home/worker

# Copia i file nella directory /NOME_SERVIZIO con i permessi appropriati
COPY --chown=worker:worker . /hello-python

# Imposta la directory di lavoro per il servizio
WORKDIR /hello-python

# Installa le dipendenze Python (ad esempio, requirements.txt)
RUN pip install --upgrade pip
RUN pip install --user -r requirements.txt
